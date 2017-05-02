<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/static/css/flatnav2.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/styleGenres.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/static/css/miniPlayerLikes.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayerDate.css" />" rel="stylesheet" type="text/css">
 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
 <script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Explore SoundCloud</title>
<style>
.magnifier h{
display:none;
}

.magnifier:hover h{
display:block;
}

.update{
}

.update:hover{
background:rgba(0,0,0,0.4);
decoration:none;
}
</style>

<script>
$(document).ready(function(e) {
    var $input = $('#refresh');

    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body style="background:url(http://www.rmweb.co.uk/community/uploads/monthly_03_2015/post-3717-0-28910200-1427235972.jpg);">

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
			          <input type="text" class="form-control" placeholder="Search" id="search-bar" name="search_text" maxlength="45">
			        </div>
			        <button type="submit" class="btn btn-warning">Search</button>
			      </form>
			      <ul class="nav navbar-nav navbar-right">
			       <c:choose>
			        <c:when test="${empty sessionScope.username}">
							<button type="button" class="btn btn-success">Go Back to Sign In</button>
						</c:when>
						<c:otherwise>
							<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
							<li class="dropdown">
						         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						          <form action="updateCurrentProfile_${sessionScope.username}" method="POST">
						            <button class="update" style= "border:none;margin-left:20px;color:black;margin-top:6px;margin-bottom:10px;background:transparent;color:#0000000;">Update Profile</button>
						            </form>
						            <li><a href="#">Check profile</a></li>
						            <li role="separator" class="divider"></li>
						            <li><a href="/SoundCloud/logout">Log out</a></li>
						            
						          </ul>
		       				 
						</c:otherwise>
					</c:choose>
			       </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		</nav>
			

	<ul class="nav2" style="background:rgba(0,0,0,0.6);">
		<li><a onclick="#" href="#" style="background:rgba(0,0,0,0.4);">EXPLORE</a></li>
		<c:choose>
		<c:when test="${type.equals('likes')}">
			<li><form action="sortLikes"  method="get"><button class="explore-btn" style="color:#ccc;background:#404040;">By Likes</button></form></li>
		</c:when>
		<c:otherwise>
			<li><form action="sortLikes" method="get"><button class="explore-btn">By Likes</button></form></li>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${type.equals('date')}">
			<li><form action="sortDate" method="get"><button class="explore-btn" style="color:#ccc;background:#404040;">By Upload</button></form></li>
		</c:when>
		<c:otherwise>
				<li><form action="sortDate" method="get"><button class="explore-btn">By Upload</button></form></li>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${!type.equals('date') and !type.equals('likes')}">
			<li><form action="sortGenres"  method="get"><button class="explore-btn" style="color:#ccc;background:#404040;">By Genres</button></form></li>
		</c:when>
		<c:otherwise>
			<li><form action="sortGenres" method="get"><button class="explore-btn">By Genres</button></form></li>
		</c:otherwise>
		</c:choose>
	</ul>
	
<c:choose >
	<c:when test="${!type.equals('likes') or empty type}">
		<div style="display:none"></div>
		</c:when>
	<c:otherwise>
	<div style="display:block">
		<h3 style="font-size:26px;color:rgba(0,0,0,0.8);margin-left:60px;margin-bottom:-30px;"><i class="fa fa-cloud" style="color:#707070"></i> Enjoy our most listened</h3>
		<hr>
	<div class="main">
	  <ul>
	  <c:forEach items="${sessionScope.songs}" var="song">
	    <li class="track">
	       <div class="cover">
	          <span class="artist" style="font-size:15px;color:#707070;margin-left:25px;"><c:out value="${song.artist }"/></span></br>
	         <span class="titleSong" style="font-size:18px;margin-left:25px;"><c:out value="${song.title }"/></span>
	    
	        <img src="https://images.genius.com/1264a0304746875bdcbb1cfcdd5712cd.360x360x1.jpg"  width=200px; height = 200px; alt="" />
	        <button target="${song.songId}" class="play" id="button6"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z" stroke-dasharray="295.9578552246094" stroke-dashoffset="295.94758849933095"></path></svg>        
	      </div>
	      <div class="info" style="margin-top:10px;">
	       	<i class="fa fa-heart" id="inLikes"></i> <c:out value="${song.likes }"/>
	      </div>
	      <audio src="http://localhost:8080/scUploads/songs/${song.title}.mp3"></audio>
	    </li> 
	     </c:forEach>
	     <hr>
	  </ul>
	</div>
</div>
</c:otherwise>
</c:choose>
	<c:choose>
	<c:when test="${!type.equals('date') or empty type}">
		<div style="display:none"></div>
	</c:when>
	<c:otherwise>
		<div style="display:block">
	   <div class="container-fluid">
	        <div class="side-body">
			   <div class="col-md-9">
				<h3 style="font-size:26px;color:rgba(0,0,0,0.8);margin-left:60px;margin-bottom:-30px;"><i class="fa fa-cloud" style="color:#707070"></i> Latest tunes</h3>
					<table class="table table-list-search"  style="margin-top:30px;margin-left:60px;" >
					<thead>
						<tr>
							<th><i></i></th>
							<th><i></i></th>
							<th><i></i></th>
						</tr>
					</thead>
					<c:if test="${empty songs}">
						<h5>No uploaded songs.</h5>
					</c:if>
				<tbody>
					<c:forEach items="${sessionScope.songs}" var="song">
						<tr>
						<div class="main-d">
						<td>
						  <ul>
						    <li class="track-d">
						      <div class="cover-d">
						        <c:choose>
									<c:when test ="${empty song.photo}">
										<a href="www.google.com"><img class="" src="http://a10.gaanacdn.com/images/artists/21/140721/crop_175x175_140721.jpg" alt="" width="80" height="80"></a>
										 <span class="titleSong" style="font-size:15px;margin-left:25px;"><c:out value="${song.title }"/> - </span>				
										 <span class="artist" style="font-size:15px;color:#707070;margin-left:5px;"><c:out value="${song.artist }"/></span>
										<c:out value="${song.title}"/>
									</c:when>
									<c:otherwise>
										<a href="song_${song.title}"><img class="" src="http://a10.gaanacdn.com/images/artists/21/140721/crop_175x175_140721.jpg" alt="" width="80" height="80"></a>
									<span class="titleSong" style="font-size:15px;margin-left:25px;"><c:out value="${song.title }"/> - </span>
										 <span class="artist" style="font-size:15px;color:#707070;margin-left:5px;"><c:out value="${song.artist }"/></span>
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
										<h5 style= "font-style: italic;"> No description</h5>
									</c:when>
									<c:otherwise>
										<h5 style= "font-style: italic;margin-bottom:-10px;"><c:out value="${song.about}"/></h5>
										<a href="song_${song.title}"></a></br>
										<h5> Uploaded on
										<fmt:parseDate value="${song.uploadingTime}" pattern="yyyy-MM-dd" 
                          				var="parsedDate" type="date" />
                          				<fmt:formatDate value="${parsedDate}" var="lastDate" 
                           				type="date" pattern="dd.MM.yyyy" />
                          				<h5 style="color:#707070;"><c:out value="${lastDate}"></c:out></h5>	
										</h5>
									</c:otherwise>
								</c:choose>
								</td>
								<td>
								<!-- TODO -->
								<c:if test="${not empty sessionScope.username}">
									<c:choose>
									
									  <c:when test="${!entry.value}">
											<button class="btn likeButton" target="${song.title }" rel="6"><i class="fa fa-heart"></i> Like</button>
										</c:when>
										<c:otherwise>
											<button class="btn likeButton liked" target="${song.title }" rel="6"><i class="fa fa-heart"></i> Unlike</button>
										</c:otherwise>
									</c:choose>
								</c:if>
								</td>	
							</tr>	
						  </c:forEach>
						</tbody>
					</table>		
				</div>
			</div>
			</div>
			</div>
			
	       </c:otherwise>
	       </c:choose>
	 
	<!-- TODO map! -->
<c:set var="genres" scope="request" value="${genres}"/>
	<c:if test="${!type.equals('likes') and !type.equals('date') or empty type}">
	<div id="genres" style="display:block">
		<div class="bg-content">
		  <div id="content">
		    <div class="container">
		      <div class="row">
		        <article class="span12">
		          <h3><i class="fa fa-cloud" style="color:#707070;margin-left:-60px;"></i> Explore by Genres</h3>
		          <hr>
		        </article>
		        
	        <div class="clear"></div>				
		        <ul class="portfolio clearfix">
		         <li class="box"><a href="genres_POP" class="magnifier"><img src="<c:url value="/static/genres/POP.jpg" />" Width=430px; height = 430px; /> <h style="position:absolute;margin-left:50px;font-size:32px;margin-top:-370px;color:#fff;z-index:100;">POP</h></a></li>
		          <li class="box"><a href="genres_R&B" class="magnifier"><img src="<c:url value="/static/genres/R&B.jpg" />" Width=330px; height = 220px; /><h style="position:absolute;margin-left:30px;font-size:27px;margin-top:-160px;color:#fff;z-index:100;">R&B</h></a></li>
		          <li class="box"><a href="genres_Chillout" class="magnifier"><img src="<c:url value="/static/genres/chillout.jpg" />"  Width=330px; height = 230px; /><h style="position:absolute;margin-left:30px;font-size:25px;margin-top:-160px;color:#fff;z-index:100;">Chillout</h></a></li>
		          <li class="box"><a href="genres_Country" class="magnifier"><img alt=""  style="margin-top:-40px;" src="<c:url value="/static/genres/country.jpg" />"  width=330px; height = 210px;><h style="position:absolute;margin-left:20px;font-size:25px;margin-top:-160px;color:#fff;z-index:100;">Country</h></a></li>
		          <li class="box"><a href="genres_Alternative" class="magnifier"><img style="margin-top:-30px;" alt="" src="<c:url value="/static/genres/alternative.jpg" />"   height=360px; width=330px;><h style="position:absolute;margin-left:30px;font-size:26px;margin-top:-320px;color:#fff;z-index:100;">Alternative</h></a></li>
		          <li class="box"><a href="genres_Jazz" class="magnifier"><img src="<c:url value="/static/genres/vjaza.jpg" />" style="margin-top:-190px;" width=760px; height = 160px; /><h style="position:absolute;margin-left:40px;font-size:31px;color:#fff;margin-top:-160px;z-index:100;">Jazz</h>
		          </a></li>
		         </ul>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</c:if>

<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
     <script src="./js/index.js"></script>
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="./javascript.js"></script>
<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>

</body>
</html>