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
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Explore SoundCloud</title>
</head>
<body>

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
			        <li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
			        <c:choose>
			        	<c:when test="${empty sessionScope.username}">
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
		
	<ul class="nav2">
		<li id="settings"><a href="#"><img src="settings.png" /></a></li>
		<li><a onclick="myFunction()" href="#">By Likes</a></li>
		<li><a onclick="myFunction1()" href="#">By Upload</a></li>
		<li><a onclick="myFunction2()" href="#">By Genres</a></li>
	</ul>
		
<div id="likes" style="display:none">
	<div class="main">
	  <ul>
	    <li class="track">
	       <div class="cover">
	        <img src="https://geo-media.beatport.com/image/10708239.jpg"  width=200px; height = 200px;alt="" />
	      </div>
	      <div class="info">
	        <span class="titleSong">Levels</span>
	        <span class="artist">Avicii</span>
	      </div>
	      <audio src="http://a805.phobos.apple.com/us/r1000/071/Music/3b/2d/ac/mzm.wtdviygy.aac.p.m4a"></audio>
	    </li>
	  </ul>
	</div>
</div>
		
	<div id="date" style="display:none">
		
		
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
		          <li class="box"><a href="genres_POP" class="magnifier"><img src="<c:url value="/static/genres/POP.jpg" />" /></a></li>
		          <li class="box"><a href="genres_R&B" class="magnifier"><img src="<c:url value="/static/genres/R&B.jpg" />" Width=320px; height = 220px; /></a></li>
		          <li class="box"><a href="genres_Jazz" class="magnifier"><img alt="" src="http://cdn01.cdn.justjared.com/wp-content/uploads/headlines/2015/10/adele-hello.jpg" width=320px; height = 190px;></a></li>
		          <li class="box"><a href="genres_Chillout" class="magnifier"><img alt="" src="http://www.covermesongs.com/wp-content/uploads/2011/06/KanyeWest.jpg" width=320px; height = 220px;></a></li>
		          <li class="box"><a href="genres_Country" class="magnifier"><img alt="" src="img/page3-img4.jpg"></a></li>
		          <li class="box"><a href="genres_Alternative" class="magnifier"><img alt="" src="img/page3-img5.jpg"></a></li>
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
				$('#date').show();
				$('#likes').hide();
				$('#genres').hide();
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("first").style="color:#f50";
};

function myFunction1() {
				$('#likes').show();
				$('#genres').hide();
				$('#date').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("third").style="color:#777";;
				document.getElementById("second").style="color:#f50";
};

function myFunction2() {
				$('#likes').hide();
				$('#genres').show();
				$('#date').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#f50";;
};

</script>

</body>
</html>