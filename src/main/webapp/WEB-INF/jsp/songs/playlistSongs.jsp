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
<script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>

  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Songs in Playlist</title>

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
					<c:if test="${empty searchedSongs}">
						<h1>No results</h1>
					</c:if>
					<tbody>
					<c:forEach items="${searchedSongs}" var="song">
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
										<a href="song_${song.title}"><img class="" src="" alt="" width="100" height="100"></a>
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
  	
  	
  	</body>
  	</html>