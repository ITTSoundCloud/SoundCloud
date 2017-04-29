<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/static/css/flatnav2.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/styleGenres.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayer.css" />" rel="stylesheet" type="text/css">
 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Explore SoundCloud</title>

<style type="text/css">
.row {
    margin-left: 45px;
}
h3 {
    margin: 25px 0 15px;
   
}
</style>


<script>
$(document).ready(function(e) {
    var $input = $('#refresh');

    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body style="background:rgba(0,0,0,0.1);">

<input type="hidden" id="refresh" value="no">

 	<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		           <a class="navbar-brand" href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=52px /></a>
		    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="http://localhost:8080/SoundCloud/home"> Explore </a></li>
			      </ul>
		      
			      <form class="navbar-form navbar-left" action="/SoundCloud/search" method = "get">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search" id="search-bar" name="search_text">
			        </div>
			        <button type="submit" class="btn btn-warning">Search</button>
			      </form>
			      <ul class="nav navbar-nav navbar-right">
			       <c:choose>
			        <c:when test="${empty sessionScope.username}">
							<button type="button" class="btn btn-success">Sign In</button>
							<button type="submit" class="btn btn-warning">Create account</button>
						</c:when>
						<c:otherwise>
							<li class="dropdown">
								<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						            <li><a href="#">Profile</a></li>
						            <li><a href="#">Followers</a></li>
						            <li role="separator" class="divider"></li>
						            <li><a href="/SoundCloud/logout">Log out</a></li>
						            
						          </ul>
		       				 </li>
		       				 
						</c:otherwise>
					</c:choose>
			       </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		</nav>
		
	<ul class="nav2" style="background:rgba(0,0,0,0.6);">
		<li><a onclick="#" href="#" style="background:rgba(0,0,0,0.4);">EXPLORE</a></li>
		<li><a onclick="#" href="#">By Likes</a></li>
		<li><a onclick="myFunction()" href="#">By Upload</a></li>
		<li><a onclick="myFunction2()" href="#">By Genres</a></li>
	</ul>
	
		
<div id="likes" style="display:none">
	<div class="main">
	  <ul>
	  <c:forEach items="${sessionScope.songs}" var="song">
	    <li class="track">
	       <div class="cover">
	        <img src="https://geo-media.beatport.com/image/10708239.jpg"  width=200px; height = 200px; alt="" />
	      </div>
	      <div class="info">
	        <span class="titleSong"><c:out value="${song.title }"/></span>Likes<c:out value="${song.likes }"/>
	        <span class="artist">Avicii</span>
	      </div>
	      <audio src="http://a805.phobos.apple.com/us/r1000/071/Music/3b/2d/ac/mzm.wtdviygy.aac.p.m4a"></audio>
	    </li>
	     </c:forEach>
	  </ul>
	</div>
</div>

	<div id="date" style="display:none">
	   <div class="container-fluid">
	        <div class="side-body">
			   <div class="col-md-9">
			     <h3> You searched for </h3>
					<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Songs</i></th>
							<th><i>Some info here</i></th>
							<th><i>Open Song</i></th>
						</tr>
					</thead>
					<c:if test="${empty songs}">
						<h1>No uploaded songs.</h1>
					</c:if>
				<tbody>
					<c:forEach items="${sessionScope.songs}" var="song">
						<tr>
						<div class="main">
						<td>
						  <ul>
						    <li class="track">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty song.photo}">
										<a href="www.google.com"><img class="" src="http://a10.gaanacdn.com/images/artists/21/140721/crop_175x175_140721.jpg" alt="" width="100" height="100"></a>
										<c:out value="${song.title}"/>
									</c:when>
									<c:otherwise>
										<a href="song_${song.title}"><img class="" src="http://a10.gaanacdn.com/images/artists/21/140721/crop_175x175_140721.jpg" alt="" width="100" height="100"></a>
									</c:otherwise>
								</c:choose>
							</div>
							</li>
							</ul>
								</td>
								</div>
								<td>
								<c:choose>
									<c:when test ="${empty song.about}">
										<h6>No description</h6>
									</c:when>
									<c:otherwise>
										<c:out value="${song.about}"/>
										<a href="song_${song.title}"></a></br><h6>Uploaded <c:out value="${ song.uploadingTime}" /></h6>
									</c:otherwise>
								</c:choose>
								</td>
								<td>
								<button type="button"
										href="http://localhost:8080/SoundCloud/login">
										<i class="fa fa-soundcloud"> Like</i>
								</button>
								</td>	
							</tr>	
							</c:forEach>
						</tbody>
					</table>		
				</div>
			</div>
			
			</div>
			
	       </div>
	  
	<!-- TODO -->
	
<c:set var="genres" scope="request" value="${genres}"/>
	<div id="genres" style="display:block">
		<div class="bg-content">
		  <div id="content">
		    <div class="container">
		      <div class="row">
		        <article class="span12">
		          <h3>Explore by Genres</h3>
		        </article>
		        <div class="clear"></div>				
		        <ul class="portfolio clearfix">
		          <li class="box"><a href="genres_POP" class="magnifier"><img src="<c:url value="/static/genres/POP.jpg" />" Width=430px; height = 430px; /></a></li>
		          <li class="box"><a href="genres_R&B" class="magnifier"><img src="<c:url value="/static/genres/R&B.jpg" />" Width=330px; height = 220px; /></a></li>
		          <li class="box"><a href="genres_Chillout" class="magnifier"><img src="<c:url value="http://static.idolator.com/uploads/2014/10/Gorgon-City-Sirens-album-cover-artwork-600x426.jpg" />" Width=330px; height = 230px; /></a></li>
		          <li class="box"><a href="#" class="magnifier"><img alt=""  style="margin-top:-40px;" src="http://keeprockingit.com/wp-content/uploads/2015/06/taylor-swift.jpg" width=330px; height = 210px;></a></li>
		          <li class="box"><a href="#" class="magnifier"><img style="margin-top:-30px;" alt="" src="https://s-media-cache-ak0.pinimg.com/564x/0e/65/7e/0e657ef934f2260888ab3016f8c7f09f.jpg"  height=360px; width=330px;></a></li>
		          <li class="box"><a href="#" class="magnifier"><img src="<c:url value="http://localhost:8080/scUploads/pics/vjaza.jpg" />" style="margin-top:-190px;" width=760px; height = 160px; />
		          </a></li>
		         </ul>
		      </div>
		    </div>
		  </div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
     <script src="./js/index.js"></script>
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="./javascript.js"></script>



<script type = "text/javascript">


function myFunction() {
				$('#likes').hide();
				$('#genres').hide();
				$('#date').show();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#f50";
			
				
};

/* function myFunction1() {

				$.get("sortLikes");
				$('#likes').hide();
				$('#genres').hide();
				$('#date').show();
			
			
}; */

function myFunction2() {

				$('#likes').hide();
				$('#genres').show();
				$('#date').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#f50";
				
			
};

</script>

</body>
</html>