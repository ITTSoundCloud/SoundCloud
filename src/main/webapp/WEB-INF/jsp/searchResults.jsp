<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/side-menu.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/loginPop.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/buttonPopup.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/buttonPopupReal.js" />"  type ="text/javascript"></script>
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayer.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/searchResults.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>  
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>

<style type="text/css">
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 15px;
    line-height: 1.42857143;
    vertical-align: top;
    border:none;
    
  }
  
  ol, ul {
    margin-top: 0;
    margin-bottom: -15px;
}


.play {
   
    top: 113%;
    left: 54%;
  
}


.cover svg {
    
    top: 105%;  
    left: 55%;
  
}
</style>

</head>
<body>


<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>


<input type="hidden" id="refresh" value="no">

	  <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		           <a class="navbar-brand" href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=52px /></a>
		    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="http://localhost:8080/SoundCloud/home">Explore</a></li>
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
							<button type="button" class="btn btn-success">Sign In</button>
							<button type="submit" class="btn btn-warning">Create account</button>
						</c:when>
						<c:otherwise>
							<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
							<li class="dropdown">
						         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						          <form action="updateCurrentProfile_${sessionScope.username}" method="POST">
						            <button class="update" style= "border:none;margin-left:20px;color:black;margin-top:6px;margin-bottom:10px;background:transparent;color:#0000000;">Update Profile</button>
						            </form>
						            <li><a href="#">My Profile</a></li>
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
  	<div class="overlay" style="margin-top:-26px;height:1000px;">
        </div>

	  <div class="row">
	    <!-- Menu -->
	    <div class="side-menu">

	    <nav class="navbar navbar-default" role="navigation">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	        <div class="brand-wrapper">
	            <div class="brand-name-wrapper">
	                <a class="navbar-brand" href="#">
	                    SoundCloud
	                </a>
	            </div>
	        </div>
	    </div></br>
	    <!-- Main Menu -->
	    <div class="side-menu-container">
	        <ul class="nav navbar-nav">
	            <li><a onclick="myFunctionChange()" href="#" style="color:#f50" id="first"><span class="fa fa-search"></span> Everything</a></li></br>
	            <li><a onclick="myFunctionChange1()" href="#" id="second"><span class="fa fa-music"></span> Tracks</a></li></br>
	            <li><a onclick="myFunctionChange2()" href="#" id="third"><span class="fa fa-user"></span> People</a></li>
	            <li><a onclick="myFunctionChange3()" href="#" id="forth"><span class="fa fa-signal"></span> Playlists</a></li>
	        </ul>
	    </div><!-- /.navbar-collapse -->
	</nav>
</div>

	<c:set var="searchedSongs" scope="request" value="${searchedSongs}"/>
	<c:set var="searchedUsers" scope="request" value="${searchedUsers}"/>	
	<c:set var="searchedPlaylists" scope="request" value="${searchedPlaylists}"/>
	
<!--LOGIN POP-->

<div class="main-popup">
  <div class="popup-header">
    <div id="popup-close-button"><a href="#"></a></div>
    <ul> 
	  <header><a href="#" id="sign-in">Sign In</a></header>
      <header><a href="#" id="register">Register</a></header> 
    </ul>
  </div><!--.popup-header-->
  <div class="popup-content" style="height:370px;margin-top:20px;">

    <form action="/SoundCloud/login" class="sign-in" method="post" name="myLoginForm" id="myLoginForm" onsubmit = "return validateRequestLogin()">

    <div id="errorMsg" size="1" color="red">
    </div>
      <label for="username">Username:</label>
      <input type="text" id="username-login" name="username-login" style="height:40px;width:90%;margin-left:32px;" required maxlength="35">
      <label for="password">Password:</label>
      <input type="password" id="password-login" name="password-login" style="height:40px;width:90%;margin-left:32px;" required maxlength="35">
      <input type="submit" style="width:89%;height:40px;background:rgba(255,82,0,0.7);margin-top:20px;color:#fff;font-size:17px;margin-left:30px;width:91%;" id="submit-login" value="Submit-login" onclick="validateLogin()">      
    </form>
	    <form action="/SoundCloud/register" class="register" method="post" name="myForm" id="myForm"  onsubmit="return validateRequest()">
	    <font id="error" size="1" color="red">
	</font>
      <label for="email-register" >Email: </label>
      <input type="text" id="email" name="email" required maxlength="45" style="height:38px;width:90%;margin-left:32px;" onblur="myFunction2()">
      <label for="username-register">Username:</label>
      <input type="text" id="username" name="username" required maxlength="35" style="height:38px;width:90%;margin-left:32px;" onblur="myFunction1()">
      <label for="password-register">Password:</label>
      <input type="password" id="password" name="password" required maxlength="35" style="height:38px;width:90%;margin-left:32px;" onblur="myFunction3()">
      <p class="check-mark">
        <input type="checkbox" id="accept-terms" required>
        <label for="accept-terms">I agree to the <a href="#">Terms</a></label>
      </p>
      <input class="register-input" type="submit" style="width:89%;height:40px;background:rgba(255,82,0,0.7);margin-top:20px;color:#fff;font-size:17px;margin-left:30px;width:91%;" id="lll" value="Create Account">
    </form>
  </div><!--.popup-content-->
</div><!--.main-popup-->


	    <!-- Main Content -->
	    <div class="container-fluid">
	        <div class="side-body">
	        <div id="showFirst" style="display:block">
	           <div class="col-md-9">
	           <h3> You searched for ' <c:out value="${word}"/> '</h3>
	       </br>
				<table class="table table-list-search">
					<thead style="color:#909090;">
						<h5 style="color:rgba(0,0,0,0.5);">Found <c:out value="${searchedUsers.size()}"/> users, <c:out value="${searchedSongs.size()}"/> songs and <c:out value="${searchedPlaylists.size()}"/> playlists</h5>
					</thead>
					
						 <c:if test="${empty searchedUsers and empty searchedSongs and empty searchedPlylists}">
							<h5>No results</h5>
						</c:if>
					<tbody style="border:none;">
					<c:forEach items="${searchedUsers}" var="entry">
						<tr>
						<td><c:choose>
							<c:when test ="${empty entry.key.profilePic}">
								<a href="profile_${entry.key.username }"><img class=""  style="border-radius:80px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="140" height="140"></a>
									<b><h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.username}" /> ,</h5></b></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.username}" /></h5>					
							</c:when>
							<c:otherwise>
							
									<a href="profile_${entry.key.username }"><img class=""  style="border-radius:80px;" src="http://localhost:8080/scUploads/pics/${entry.key.username }.jpg" alt="" width="140" height="140"></a>
									<b><h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.username}" /> ,</h5></b></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.username}" /></h5>								
							</c:otherwise>
							</c:choose>
							</br></br></br></br>
							</td>
							<td>
							<c:choose>
							<c:when test ="${empty entry.key.bio}">
								<h6 style="margin-top:55px;"><i>This user has no description</i></h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${entry.key.username}"></a>																	
								</c:otherwise>
							</c:choose>							
							</td>
							<c:set var="listedUser" scope="session" value="${entry.key.username}"/>
							<td>	
							<c:if test="${not empty sessionScope.username and !sessionScope.username.equals(entry.key.username)}">
			  					<c:choose>		
							        <c:when test="${!entry.value}">
										<button class="btn followButton" rel="6" target="${entry.key.username }"><i class = "fa fa-soundcloud"></i> Follow</button>
									</c:when>
									<c:otherwise>
									 	<button class="btn followButton following" target="${entry.key.username }" rel="6"><i class = "fa fa-soundcloud"></i> Following</button>
									</c:otherwise>
								</c:choose>
							</c:if>
							</td>
						</tr>
						</c:forEach>				
						<c:forEach items="${searchedSongs}" var="entry">
						<tr>
						<div class="main" style="margin-top:10px;">
						<td>
						  <ul>
						    <li class="track" id="tracka" style="margin:1rem 10rem 8rem 1rem;margin-left:-35px;">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty entry.key.title}">
									</br>	
											<a href="song_${entry.key.title }"><img class="song-image" style="border-radius:80px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="120" height="120"></a></br>
									<h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.title}" /> ,</h5></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.title}" /></h5>					
							
											
									</c:when>
									<c:otherwise>
	
											<a href="song_${entry.key.title }"><img class="" src="<c:url value="/static/playlist/default.png" />" alt="" width="120" height="120"></a>
											<div class="info" style="margin-left:140px;margin-top:-110px;width:100px">
						        <span class="titleSong" style=";color:#606060;font-size:15px;font-weight: bold;"><i class= "fa fa-headphones"> </i> <c:out value="${entry.key.title}"/> , </span>
						        <span class="artist" style="font-size:13px;color:#909090;margin-left:20px;"><c:out value="${entry.key.artist}"/></span>
						      </div>
																	</c:otherwise>
									</c:choose>
									 <button target="${entry.key.songId}" class="play" id="button6"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z" stroke-dasharray="295.9578552246094" stroke-dashoffset="295.94758849933095"></path></svg>
						      </div>
						     
						      <audio src="http://localhost:8080/scUploads/songs/${entry.key.title}.mp3"></audio>
						    </li>
						  </ul>
						  </td>	  
						</div>				
							<td><c:choose>
							<c:when test ="${empty entry.key.about}">
								<h6 style="margin-top:55px;"><i>No description</i></h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${entry.key.about}"/></h6>
									<a href="#"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:if test="${not empty sessionScope.username}">
							<c:choose>
								  <c:when test="${!entry.value}">
										<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart" ></i> Like</button>
									</c:when>
									<c:otherwise>
										<button class="btn likeButton liked" target="${entry.key.title }" rel="6"><i class="fa fa-heart"></i> Unlike</button>
									</c:otherwise>
								</c:choose>
							</c:if>
							</td>
						</tr>
						</c:forEach>
						<c:forEach items="${searchedPlaylists}" var="playlist">
						<tr>
						<td>
								<a href="profile_${playlist.username}"><img class="" src="<c:url value="/static/playlist/photo.png" />" style="margin:1rem 2rem 7rem 1rem;" alt="" width="140" height="140"></a>
								<div class="oh" style="margin-top:-90px;"><h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-play" style="margin-right:5px;color:#909090;"></i><c:out value="${playlist.title}" /> ,</h5></b></br></br>
								
								<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;">Playlist of <c:out value="${playlist.username}" /></h5>								
						</div>
							</td>
							<td><c:choose>
							<c:when test ="${empty playlist.description}">
								<h6 style="margin-top:55px;" ><i>No description</i></h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><i><c:out value="${playlist.description}"/></i></h6>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		<div id = "showSecond"  style="display:none">
			   <div class="col-md-9">
			     <h3> You searched for ' ${word } '</h3></br>
				<table class="table table-list-search">
					<thead>
						<tr>
							<h5 style="color:rgba(0,0,0,0.5);"><c:out value="${searchedSongs.size()}"/> songs</h5>

						</tr>
					</thead>
					<c:if test="${empty searchedSongs}">
						<h1 id="showSecond">No results</h1>
					</c:if>
				<tbody>
				
				
				
				
				<c:forEach items="${searchedSongs}" var="entry">
						<tr>
						<div class="main" style="margin-top:10px;">
						<td>
						  <ul>
						    <li class="track" id="tracka" style="margin:1rem 10rem 8rem 1rem;margin-left:-35px;">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty entry.key.title}">
									</br>	
											<a href="song_${entry.key.title }"><img class="song-image" style="border-radius:80px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="120" height="120"></a></br>
									<h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.title}" /> ,</h5></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.title}" /></h5>					
							
											
									</c:when>
									<c:otherwise>
	
								<a href="song_${entry.key.title }"><img class="" src="<c:url value="/static/playlist/default.png" />" alt="" width="120" height="120"></a>
								<div class="info" style="margin-left:140px;margin-top:-110px;width:100px">
						        <span class="titleSong" style=";color:#606060;font-size:15px;font-weight: bold;"><i class= "fa fa-headphones"> </i> <c:out value="${entry.key.title}"/> , </span>
						        <span class="artist" style="font-size:13px;color:#909090;margin-left:20px;"><c:out value="${entry.key.artist}"/></span>
						      </div>
																	</c:otherwise>
									</c:choose>
									 <button target="${entry.key.songId}" class="play" id="button6"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z" stroke-dasharray="295.9578552246094" stroke-dashoffset="295.94758849933095"></path></svg>
						      </div>
						     
						      <audio src="http://localhost:8080/scUploads/songs/${entry.key.title}.mp3"></audio>
						    </li>
						  </ul>
						  </td>	  
						</div>				
							<td><c:choose>
							<c:when test ="${empty entry.key.about}">
								<h6 style="margin-top:55px;"><i>No description</i></h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${entry.key.about}"/></h6>
									<a href="#"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:if test="${not empty sessionScope.username}">
							<c:choose>
								  <c:when test="${!entry.value}">
										<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart" ></i> Like</button>
									</c:when>
									<c:otherwise>
										<button class="btn likeButton liked" target="${entry.key.title }" rel="6"><i class="fa fa-heart"></i> Unlike</button>
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
			
			<div class="col-md-9" id="showThird"  style="display:none">
				<table class="table table-list-search">
					<thead>
						<tr>
							
						</tr>
					</thead>
						 <c:if test="${empty searchedUsers}">
							<h1>No results</h1>
						</c:if>
					<tbody>
					<c:forEach items="${searchedUsers}" var="entry">
						<tr>
						<td><c:choose>
							<c:when test ="${empty entry.key.profilePic}">
								<a href="profile_${entry.key.username }"><img class=""  style="border-radius:80px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="140" height="140"></a>
									<b><h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.username}" /> ,</h5></b></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.username}" /></h5>					
							</c:when>
							<c:otherwise>
							
									<a href="profile_${entry.key.username }"><img class=""  style="border-radius:80px;" src="http://localhost:8080/scUploads/pics/${entry.key.username }.jpg" alt="" width="140" height="140"></a>
									<b><h5  style="margin-left: 160px;margin-top: -120px;color:#606060;font-size:15px;font-weight: bold;"><i class = "fa fa-user" style="margin-right:5px;color:#909090;"></i><c:out value="${entry.key.username}" /> ,</h5></b></br></br>
									<h5  style="margin-left: 178px;margin-top: -45px;color:#909090;font-size:13px;"><c:out value="${entry.key.username}" /></h5>								
							</c:otherwise>
							</c:choose>
							</br></br></br></br>
							</td>
							<td>
							<c:choose>
							<c:when test ="${empty entry.key.bio}">
								<h6 style="margin-top:55px;"><i>This user has no description</i></h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${entry.key.username}"></a>																	
								</c:otherwise>
							</c:choose>							
							</td>
							<c:set var="listedUser" scope="session" value="${entry.key.username}"/>
							<td>	
							<c:if test="${not empty sessionScope.username and !sessionScope.username.equals(entry.key.username)}">
			  					<c:choose>		
							        <c:when test="${!entry.value}">
										<button class="btn followButton" rel="6" target="${entry.key.username }"><i class = "fa fa-soundcloud"></i> Follow</button>
									</c:when>
									<c:otherwise>
									 	<button class="btn followButton following" target="${entry.key.username }" rel="6"><i class = "fa fa-soundcloud"></i> Following</button>
									</c:otherwise>
								</c:choose>
							</c:if>
							</td>
						</tr>
						</c:forEach>			
					</tbody>
				</table>
			</div>
			<div id="showForth"  style="display:none">
			<div class="col-md-9">
				<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Playlist</i></th>
							<th><i>Some info here</i></th>
							<th><i>...</i></th>
						</tr>
					</thead>
						 <c:if test="${empty searchedPlaylists}">
							<h1>No results</h1>
						</c:if>
					<tbody>
						<c:forEach items="${searchedPlaylists}" var="playlist">
						<tr>
						<td>
								<a href="profile_${playlist.username}"><img class="" src="<c:url value="/static/playlist/photo.png" />" alt="" width="120" height="120"></a>
								<h6 style="font-size:15px;"><c:out value="${playlist.title}"/></h6>
								<h6 style="color:#707070;"> playlist of <c:out value="${playlist.username}"/></h6>
							</td>
							<td><c:choose>
							<c:when test ="${empty playlist.description}">
								<h6 style="margin-top:55px;" >No description</h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${playlist.description}"/></h6>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			
	        </div>
	    </div>
	</div>

  <!-- change paths later -->
  
  	<script src="./js/side-menu.js"></script>
    <script src="./js/index.js"></script>
    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="./javascript.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>

	<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>

   
<script type="text/javascript">
$('button.followButton').live('click', function(e){

    e.preventDefault();   
    $button = $(this);
    var x = $(this).attr("target");
    if($button.hasClass('following')){

    	$.post("unFollowSearch", 
				{
					username: x,
					
				});
        $button.removeClass('following');
        $button.text('Follow');
    } else {
    	$.post("followSearch", 
				{ 
					username: x,
					
				});
        $button.addClass('following');
        $button.text('Following');
    }
});

</script>


<script type="text/javascript">
$('button.play').live('click', function(e){
	
    e.preventDefault();   
    $button = $(this);
    var x = $(this).attr("target");
    alert(x),
    	 $.post("timesPlayed",
    		  {
    		    	songId:x,
    		  });
  
});

</script>


<script type="text/javascript">
$('button.likeButton').live('click', function(e){

    e.preventDefault();   
    
    $button = $(this);
    var x = $(this).attr("target");
    
    if($button.hasClass('liked')){
    	 $.post("unlikeSearch",
    		  {
    		    	title:x,
    		  });
        $button.removeClass('liked');  
        $button.text('Like');
    } else {
        $.post("likeSearch",
        {
    		title:x,
    	});
        $button.addClass('liked');
        $button.innerHTML = `<i class="fa fa-heart"></i>`,
        $button.text('Unlike');
    }
});

</script>
   
    
 <script type = "text/javascript">

function myFunctionChange() {
				$('#showSecond').hide();
				$('#showThird').hide();
				$('#showFirst').show();
				$('#showForth').hide();
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("first").style="color:#f50";
				document.getElementById("forth").style="color:#777";
};

function myFunctionChange1() {
				$('#showSecond').show();
				$('#showThird').hide();
				$('#showFirst').hide();
				$('#showForth').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("second").style="color:#f50";
				document.getElementById("forth").style="color:#777";
};

function myFunctionChange2() {
				$('#showSecond').hide();
				$('#showThird').show();
				$('#showFirst').hide();
				$('#showForth').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#f50";;
				document.getElementById("forth").style="color:#777";
};


function myFunctionChange3() {
				$('#showFirst').hide();
				$('#showSecond').hide();
				$('#showForth').show();
				$('#showThird').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#777";
				document.getElementById("forth").style="color:#f50";
};
	
</script>


<script type="text/javascript">
	function validateRequest(){

			var x = document.getElementById("username");
		    var y = document.getElementById("email");
		    var z = document.getElementById("password");
		    
		$.post("validateEverything", 
				{ 
					username: x.value,
					email: y.value,
					password: z.value
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myForm').submit();
       			}
	    });
		
		return false;

	}
	</script>
	
		<script type="text/javascript">
	function validateRequestLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myLoginForm').submit();
       			}
       			else{
       				document.getElementById('errorMsg').style.display = 'block';
    				document.getElementById('errorMsg').innerHTML = "<h4 style="margin-left:50px;color:red;">Wrong data.</h4>"

       			}
	    });
		
		return false;

	}
	</script>
	
	
	
	<script type="text/javascript">
	function validateRequest(){

			var x = document.getElementById("username");
		    var y = document.getElementById("email");
		    var z = document.getElementById("password");
		    
		$.post("validateEverything", 
				{ 
					username: x.value,
					email: y.value,
					password: z.value
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myForm').submit();
       			}
	    });
		
		return false;

	}
	</script>
	
		<script type="text/javascript">
	function validateRequestLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myLoginForm').submit();
       			}
       			else{
       				document.getElementById('errorMsg').style.display = 'block';
    				document.getElementById('errorMsg').innerHTML = "<h class='errorMsg' style="margin-left:40px;color:red;">Wrong data.</h>"

       			}
	    });
		
		return false;

	}
	</script>
	
<script type="text/javascript">
	function validateLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==false){
       				var z = document.getElementById('errorMsg');
       				if(z.style.display === 'none'){
       					z.style.display = 'block';
       				}
       			}
       			
	    });
		
		return false;

	}
</script>
	

	
<script type="text/javascript">
	function validateLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==false){
       				var z = document.getElementById('errorMsg');
       				if(z.style.display === 'none'){
       					z.style.display = 'block';
       				}
       			}
       			
	    });
		
		return false;

	}
</script>
	
	
	

</body>
</html>
