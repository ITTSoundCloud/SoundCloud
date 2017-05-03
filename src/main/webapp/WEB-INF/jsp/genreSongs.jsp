<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayer.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/static/css/miniPlayerLikes.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Songs in Playlist</title>

<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body style="background:url(http://localhost:8080/scUploads/genres/${genre}.jpg);background-size:1400px 950px;">
<input type="hidden" id="refresh" value="no">
	  <nav class="navbar navbar-inverse" >
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
							<button type="button" href="http://localhost:8080/SoundCloud" class="btn btn-success">Go Back to Sign In</button>
						</c:when>
						<c:otherwise>
							<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
							<li class="dropdown">
						         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						          <form action="updateCurrentProfile_${sessionScope.username}" method="POST">
						            <button class="update" style= "border:none;margin-left:0px;color:black;margin-top:6px;margin-bottom:10px;background:transparent;color:#0000000;">Update Profile</button>
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

  	<header></header>
  	
  	<div class="container-fluid" style="vertical-align:middle;">
	  <div class="side-body">
			   <div class="col-md-9">

	<tr>
	<h3 style="font-size:26px;color:#fff;margin-left:60px;margin-bottom:-10px;"><i class="fa fa-cloud" style="color:#fff"></i> <c:out value="${genre}"/></h3>
	<hr>
				   
					<c:if test="${empty songsGenre}">
						<h5>No songs for this genre.</h5>
					</c:if>
			
	<div class="main">
	<c:if test="${not empty songsGenre}">	
	  <ul>
	  <c:forEach items="${songsGenre}" var="song">
	    <li class="track">
	       <div class="cover">
	          <span class="artist" style="font-size:15px;color:#fff;margin-left:25px;"><c:out value="${song.artist }"/></span></br>
	         <span class="titleSong" style="font-size:18px;margin-left:25px;color:#ccc"><c:out value="${song.title }"/></span>
	    	<c:choose>
	    	<c:when test="${not empty song.photo}">
	    		 <img src="<c:url value="http://localhost:8080/scUploads/songsphotos/${song.title}.jpg"/>"  width=200px; height = 200px; alt="" />
	    	</c:when>
	        <c:otherwise>
	        	  <img src="<c:url value="/static/playlist/music.jpg"/>"  width=200px; height = 200px; alt="" />	        
	        </c:otherwise>
	        </c:choose>
	        <button target="${song.songId}" class="play" id="button6"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z" stroke-dasharray="295.9578552246094" stroke-dashoffset="295.94758849933095"></path></svg>        
	      </div>
	      <div class="info" style="margin-top:10px;">
	       	<i class="fa fa-heart" style="color:#ccc;" id="inLikes"></i> <c:out value="${song.likes }"/>
	      </div>
	      <audio src="http://localhost:8080/scUploads/songs/${song.title}.mp3"></audio>
	    </li> 
	     </c:forEach>
	     <hr>
	  </ul>
	  </c:if>
	</div>
</div>
						
								
				  </div>
				</div>
	       
  	
  	
  	</body>
  	</html>