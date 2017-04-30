<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style1.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/static/css/profile.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<link href="<c:url value="/static/css/side-menu.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/buttonPopup.js" />" type ="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.0.js" type = "text/javascript"></script>
<script src="<c:url value="/static/js/playlistPopup.js" />"  type ="text/javascript"></script>
<link href="<c:url value="/static/css/playlistCss.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayerProfile.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
     <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>



<title>Insert title here</title>

<style type="text/css">

.container {
    width: 1470px;
}
</style>

<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body style="background:#fff;">

<input type="hidden" id="refresh" value="no">

 <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		           <a class="navbar-brand" href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=52px /></a>
		    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="http://localhost:8080/SoundCloud/home" > Explore </a></li>
			      </ul>
			      <form class="navbar-form navbar-left" action="/SoundCloud/search" method = "get">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search">
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
		<div class="overlay"></div>
		
				<c:set var="user" scope="request" value="${user}"/>	
				<c:if test="${empty user}">
					<h1>No user.</h1>
				</c:if>	
				<c:if test="${!user.username.equals(sessionScope.username) and !(empty sessionScope.username)}">
  					<c:choose>
			        	<c:when test="${!isFollowing}">
							  <button class="btn followButton" style="color:#f50" rel="6">Follow</button>
						</c:when>
						<c:otherwise>
							<button class="btn followButton" style="color:#f50" rel="6">Following</button>
						</c:otherwise>
					</c:choose>
				</c:if>
<!--<input  type="submit" class= "follow-btn" value="Follow">  -->
<div class="container">
  <div class="cover row">
	   	<h1><c:out value="${user.username }"/></h1>
	    <c:choose>
		    <c:when test="${empty user.country}">
		    	<h4> No conutry </h4>
		    </c:when>
		    <c:otherwise>
				<h4><c:out value="${user.country}"/></h4>
			</c:otherwise>
		</c:choose>
    </div>
     <div class="profile-img"> 
  		<c:choose>
			<c:when test ="${empty user.profilePic}">
				<img class="img-thumbnail" src="<c:url value="/static/playlist/default.png" />"/>
			</c:when>
			<c:otherwise>
				<img class="img-thumbnail" src="<c:url value="http://localhost:8080/scUploads/pics/${user.username }.jpg" />"/>									
			</c:otherwise>
		</c:choose>
		
    <c:if test="${sessionScope.username.equals(user.username)}">
    
	    <form method="POST" enctype="multipart/form-data">
	    <button class="btn btn-sm btn-default">Change Picture<i class="fa fa-camera upload-button"></i>
	        <input class="file-upload" type="file" name="imageFile" id="file" accept=".jpg" required/>
	        <input type="submit" value="change">

	      </form>
     </c:if>
   </div>
  <div class="row content">
    <div class="profile col-md-3 col-xs-12">
		<ul class="profile-links">
			<li><i class="glyphicon glyphicon-envelope"></i> <a><i class=""></i><c:out value="${user.email}"/></a></li>
			<li><a id="buttonLogin"><i class="fa fa-plus-circle"></i> Followers <c:out value="${followers.size()}"></c:out></a></li>

			 <li><a href="updateCurrentProfile_${sessionScope.username}" id="updateCurrentProfile"> Update Profile </a></li>
			
			<hr>
			 <c:choose>     
		  	    <c:when test="${empty user.bio}">
		  	    	<p> This user has no description. </p>
		  	    </c:when>
		  	    <c:otherwise>
		  			<p><c:out value="${user.bio}"/></p>
		  		</c:otherwise>
  			</c:choose>
  			<hr>
			<li><table>
				<thead><h5 style="font-size:16px;color:#fff;background: rgba(255, 85, 0, 0.8);padding:10px 10px;">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-headphones"></i>  &nbsp;Uploads by <c:out value="${user.username}"></c:out></h5></thead></br>
				<tbody>
				<c:forEach items="${songsUploaded}" var="entry">
					<tr>
						<div class="main">
							<td>
								<ul>
										<form action="deleteSong" method="POST">
								  <li class="track" style="margin-bottom:-10px;" id="tracka">
									      <div class="cover-c">	       
												<a href="song_${entry.key}"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="60" height="60"></a>					
										         <span class="titleSong"  style="font-size:13px;"> <c:out value="${entry.key}"/> - </span>
										        <span class="artist" style="font-size:12px;color:#707070;"> <c:out value="${entry.value}"/></span>
										  		<button><i class="fa fa-trash-o" style="margin-left:0px;"></i>delete</button>  
												<button class="play" id="button6"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z" stroke-dasharray="295.9578552246094" stroke-dashoffset="295.94758849933095"></path></svg>
												
									     	</div>
									     	      
									      <audio src="http://localhost:8080/scUploads/songs/${entry.key}.mp3"></audio>
									     
									      <hr>
									    </li>
									    </form>
									    								    
									  </ul>
									  </td>	  
									  
									</div>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</li>
		</ul>
	<hr>

<c:set var="followers" scope="request" value="${followers}"/>	
	
<div class="main-popup">
<div class="popup-header">
	<div id="popup-close-button" style="margin-top:0px;"><a href="#"></a></div> 
	</div><!--.popup-header-->
	  	 <h4 style="margin-left:160px;color:#f50;font-size:18px;margin-top:-10px;">Followers</h4>
	<div class="popup-content">
		<table class="table table-list-search">	
			<tbody>
				<c:forEach items="${followers}" var = "follower">
				<tr><td>
					<img style="border-radius:60px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="50" height="50">&nbsp; 
					&nbsp;<c:out value=" ${follower}"/>
				</td></tr>
				</c:forEach>
			</tbody>
		</table>
	  </div><!--.popup-content-->
	</div>
	   
    </div></br>
    <h3> Playlists</h3></br>
    <c:if test="${empty currentPlaylists }">
    	<h6>This user has no playlists yet.</h6>
    </c:if>
    <div class="feed col-md-9 col-xs-12">
    <c:forEach items="${currentPlaylists}" var="playlist">
	      <div class="media feed-item">
	        <div class="media-left">
	          <a href="playlist_${playlist.playlistId }">
	          <img src="<c:url value="/static/playlist/photo.png" />" class="media-object feed-image" />
	          </a>
	        </div>
	        <div class="media-body">
	          <h4 class="media-heading"><c:out value="${playlist.title }"/></h4>
	          <p><c:out value="${playlist.description }"/></p>
	          <ul class="item-opts"></br>
	            <li><a href="playlist_${playlist.playlistId }">Checkout Playlist</a></li>
	          </ul>
	        </div>
	      </div>
      </c:forEach>
    </div>
  </div>
</div>

    <script src="./js/index.js"></script>
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
    <script src="./js/index.js"></script>
    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
  <script src="./js/menu-js.js"></script>


<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>


<script type="text/javascript">
$('button.followButton').live('click', function(e){

    e.preventDefault();   
    $button = $(this);
    if($button.hasClass('following')){

    	$.post("unFollow");
        $button.removeClass('following');
        $button.text('Follow');
    } else {
        // $.ajax(); Do Follow
        $.post("follow");
        $button.addClass('following');
        $button.text('Following');
    }
});


</script>


</body>
</html>