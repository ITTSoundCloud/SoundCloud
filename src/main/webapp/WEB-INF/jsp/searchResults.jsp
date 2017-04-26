<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/side-menu.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayer.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
     <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
     
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
     
     
     <style type="text/css">
     
  ol, ul {
    margin-top: 0;
    margin-bottom: -30px;
}

.h6,h6{
margin-left:25px;}
     
     
    button.followButton{
    margin-top:50px;
     border-radius: 0;
    margin-left: 30px;
    position: relative;
    float: left;
    margin-right: 5px;
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    display: inline-block;
    padding: 4px 15px;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid #ccc;
}
button.followButton.following{
}

button.likeButton{
margin-top:50px;
    border-radius: 0;
    margin-left: 30px;
    position: relative;
    float: left;
    margin-right: 5px;
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    display: inline-block;
   padding: 4px 15px;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid #ccc;
  
}

button.likeButton:hover{
    color: #000000;
    background-color: rgba(0,0,0,0.1);
    border-color: rgba(0,0,0,0.2);
  
}

button.followButton:hover{
 color: #000000;
    background-color: rgba(0,0,0,0.1);
    border-color: rgba(0,0,0,0.2);
}
button.likeButton.liked{
       
  
}

     </style>
     


  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>
<body>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '229011207576478',
      xfbml      : true,
      version    : 'v2.9'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.9&appId=229011207576478";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

	  <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		           <a class="navbar-brand" href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=52px /></a>
		    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="http://localhost:8080/SoundCloud/home"> Home </a></li>
			      </ul>
			      <form class="navbar-form navbar-left" action="/SoundCloud/search" method = "get">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search" id="search-bar" name="search_text">
			        </div>
			        <button type="submit" class="btn btn-warning">Search</button>
			      </form>
			      <ul class="nav navbar-nav navbar-right">
			      	<li><a href="http://localhost:8080/SoundCloud/songUpload">Explore</a></li>
			        <li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
			        <c:choose>
			        	<c:when test="${empty sessionScope.username}">
					  	<span class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true"></span>						
							<button type="button" class="btn btn-success">Sign In</button>
							  <button type="submit" class="btn btn-warning">Create account</button>
						</c:when>
						<c:otherwise>
							<li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						            <li><a href="#">Profile</a></li>
						            <li><a href="#">Followers</a></li>
						            <li role="separator" class="divider"></li>
						            <li><a href="#">Log out</a></li>
						          </ul>
		       				 </li>
						</c:otherwise>
					</c:choose>
			       </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		</nav>

  	<header></header>

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
	            <li><a onclick="myFunction()" href="#" style="color:#f50" id="first"><span class="fa fa-search"></span> Everything</a></li></br>
	            <li><a onclick="myFunction1()" href="#" id="second"><span class="fa fa-music"></span> Tracks</a></li></br>
	            <li><a onclick="myFunction2()" href="#" id="third"><span class="fa fa-user"></span> People</a></li>
	            <li><a onclick="myFunction3()" href="#" id="forth"><span class="fa fa-signal"></span> Playlists</a></li>
	        </ul>
	    </div><!-- /.navbar-collapse -->
	</nav>
</div>

	<c:set var="searchedSongs" scope="request" value="${searchedSongs}"/>
	<c:set var="searchedUsers" scope="request" value="${searchedUsers}"/>	
	<c:set var="searchedPlaylists" scope="request" value="${searchedPlaylists}"/>
	
	
	    <!-- Main Content -->
	    <div class="container-fluid">
	        <div class="side-body">
	        <div id="showFirst" style="display:block">
	           <div class="col-md-9">
	           <h3> You searched for </h3>
				<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Results</i></th>
							<th><i>Some info here</i></th>
							<th><i>Profile</i></th>
						</tr>
					</thead>
						 <c:if test="${empty searchedUsers and empty searchedSongs and empty searchedPlylists}">
							<h1>No results</h1>
						</c:if>
					<tbody>
					<c:forEach items="${searchedUsers}" var="entry">
						<tr>
						<td><c:choose>
							<c:when test ="${empty entry.key.profilePic}">
								<a href="profile_${entry.key.username}"><img style="border-radius:60px;" src="<c:url value="/static/playlist/default.png" />" alt="" width="120" height="120"></a>
								<h6>&nbsp;<c:out value="${entry.key.username}"></c:out></h6>
						
							</c:when>
							<c:otherwise>
									<a href="profile_${entry.key.username }"><img class=""  style="border-radius:60px;" src="http://localhost:8080/scUploads/pics/${entry.key.username }.jpg" alt="" width="120" height="120"></a>
									<h6><c:out value="${entry.key.username}" > </c:out><i class = "fa fa-user" style="margin-left:5px;color:#707070;"></i></h6>
								</c:otherwise>
							</c:choose>
							
							</td>
							<td>
							<c:choose>
							<c:when test ="${empty entry.key.bio}">
								<h6 style="margin-top:55px;">No description</h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${entry.key.username}"></a>																	
								</c:otherwise>
							</c:choose>							
							</td>
							<c:set var="listedUser" scope="session" value="${entry.key.username}"/>
							<td>	
							<c:if test="${empty user}">
								<h1>No user.</h1>
							</c:if>	
							<c:if test="${not empty sessionScope.username and !sessionScope.username.equals(entry.key.username)}">
			  					<c:choose>		
							        <c:when test="${entry.value}">
										<button class="btn followButton" rel="6" target="${entry.key.username }"><i class = "fa fa-soundcloud"></i> Follow</button>
									</c:when>
									<c:otherwise>
									 	<button class="btn followButton" target="${entry.key.username }" rel="6"><i class = "fa fa-soundcloud"></i> Following</button>
									</c:otherwise>
								</c:choose>
							</c:if>
							</td>
						</tr>
						</c:forEach>
						
						<c:forEach items="${searchedSongs}" var="entry">
						<tr>
						<div class="main">
						<td>
						  <ul>
						    <li class="track">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty entry.key.photo}">
											<a href="song_${song.title}"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
											<c:out value="${entry.key.title}"/>
									</c:when>
									<c:otherwise>
											<a href="song_${song.title}"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
										</c:otherwise>
									</c:choose>
						      </div>
						      <div class="info">
						         <span class="titleSong"><c:out value="${entry.key.title}"/></span>
						        <span class="artist" style="font-size:11px;"><c:out value="${entry.key.artist}"/></span>
						      </div>
						      <audio src="http://localhost:8080/scUploads/songs/${entry.key.title}.mp3"></audio>
						    </li>
						  </ul>
						  </td>	  
						</div>
						
							<td><c:choose>
							<c:when test ="${empty entry.key.about}">
								<h6 style="margin-top:55px;">No description</h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${entry.key.about}"/></h6>
									<a href="#"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
								  <c:when test="${!entry.value}">
										<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart" ></i> Like</button>
									</c:when>
									<c:otherwise>
									<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart"></i> Unlike</button>
										</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
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
		<div id = "showSecond"  style="display:none">
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
					<c:if test="${empty searchedSongs}">
						<h1 id="showSecond">No results</h1>
					</c:if>
				<tbody>
					
					<c:forEach items="${searchedSongs}" var="entry">
						<tr>
						<div class="main">
						<td>
						  <ul>
						    <li class="track">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty entry.key.photo}">
											<a href="www.google.com"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
											<c:out value="${entry.key.title}"/>
									</c:when>
									<c:otherwise>
											<a href="#"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
										</c:otherwise>
									</c:choose>
						      </div>
						      <div class="info">
						        <span class="titleSong"><c:out value="${entry.key.title}"/></span>
						        <span class="artist" style="font-size:12px;"><c:out value="${entry.key.artist}"/></span>
						      </div>
						      <audio src="http://localhost:8080/scUploads/songs/${entry.key.title}.mp3"></audio>
						    </li>
						  </ul>
						  </td>	  
						</div>
						
							<td><c:choose>
							<c:when test ="${empty entry.key.about}">
								<h6 style="margin-top:55px;">No description</h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${entry.key.about}"/></h6>
									<a href="#"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
								  <c:when test="${!entry.value}">
										<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart" ></i> Like</button>
									</c:when>
									<c:otherwise>
									<button class="btn likeButton" target="${entry.key.title }" rel="6"><i class="fa fa-heart"></i> Unlike</button>
										</c:otherwise>
								</c:choose>
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
							<th><i>Username</i></th>
							<th><i>Some info here</i></th>
							<th><i>Open Profile</i></th>
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
								<a href="profile_${entry.key.username}"><img style="border-radius:60px;" src="<c:url value="/static/playlist/default.png" />"alt="" width="120" height="120"></a>
								<h6>&nbsp;<c:out value="${entry.key.username}"></c:out></h6>
						
							</c:when>
							<c:otherwise>
									<a href="profile_${entry.key.username }"><img class=""  style="border-radius:60px;" src="http://localhost:8080/scUploads/pics/${entry.key.username }.jpg" alt="" width="120" height="120"></a>
									<h6><c:out value="${entry.key.username}" > </c:out><i class = "fa fa-user" style="margin-left:5px;color:#707070;"></i></h6>
								</c:otherwise>
							</c:choose>
							
							</td>
							<td>
							<c:choose>
							<c:when test ="${empty entry.key.bio}">
								<h6 style="margin-top:55px;">No description</h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${entry.key.username}"></a>																	
								</c:otherwise>
							</c:choose>							
							</td>
							<c:set var="listedUser" scope="session" value="${entry.key.username}"/>
							<td>	
							<c:if test="${empty user}">
								<h1>No user.</h1>
							</c:if>	
							<c:if test="${not empty sessionScope.username and !sessionScope.username.equals(entry.key.username)}">
			  					<c:choose>		
							        <c:when test="${entry.value}">
										<button class="btn followButton" rel="6" target="${entry.key.username }"><i class = "fa fa-soundcloud"></i> Follow</button>
									</c:when>
									<c:otherwise>
									 	<button class="btn followButton" target="${entry.key.username }" rel="6"><i class = "fa fa-soundcloud"></i> Following</button>
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

    	alert("tuk sme"),
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
$('button.likeButton').live('click', function(e){

    e.preventDefault();   
    
    $button = $(this);
    var x = $(this).attr("target");
    
    if($button.hasClass('liked')){
    	alert("unlikevame"),
    	 $.post("unlikeSearch",
    		  {
    		    	title:x,
    		  });
        $button.removeClass('liked');  
        $button.text('Like');
    } else {
    	alert("likevame"),
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

function myFunction() {
				$('#showSecond').hide();
				$('#showThird').hide();
				$('#showFirst').show();
				$('#showForth').hide();
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("first").style="color:#f50";
				document.getElementById("forth").style="color:#777";
};

function myFunction1() {
				$('#showSecond').show();
				$('#showThird').hide();
				$('#showFirst').hide();
				$('#showForth').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("second").style="color:#f50";
				document.getElementById("forth").style="color:#777";
};

function myFunction2() {
				$('#showSecond').hide();
				$('#showThird').show();
				$('#showFirst').hide();
				$('#showForth').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#f50";;
				document.getElementById("forth").style="color:#777";
};


function myFunction3() {
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

</body>
</html>
