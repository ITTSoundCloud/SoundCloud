<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
			        <li><a href="#">Upload</a></li>
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
		

<form method="POST" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">Song Tittle</label>
    <input type="text" class="form-control" id="InputTitle" name = "songTitle" placeholder="Enter Song Title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Artist</label>
    <input type="text" class="form-control" id="Artist" name="artist" placeholder="Artist">
  </div>
  <div class="form-group">
    <label for="exampleSelect1">Genre</label>
    <select class="form-control" id="exampleSelect1" name="genre">
    <c:forEach items="${genres}" var="genre">
    	<option> <c:out value="${genre}"/></option>
	</c:forEach>
 <!--   <c:forEach var="genre" begin="${genres.size() }" end="0">
   	  <c:out value="${genre}"/>
	</c:forEach>  --> 
    </select>
  </div>
  <div class="form-group">
    <label for="exampleTextarea">Description</label>
    <textarea class="form-control" id="exampleTextarea" rows="3" name="description"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
  
      <input class="file-upload" type="file" id="file" name="songFile"  accept="music/*"/>
      <input type="submit" class = "idiotButton" value="Upload now">
  </div>
</form>
</body>
</html>
