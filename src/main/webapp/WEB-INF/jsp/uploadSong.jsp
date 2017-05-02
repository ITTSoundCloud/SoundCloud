<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body>

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
		
<h3 style="margin-left:50px;color:#505050;"><i class="fa fa-cloud"></i> Upload</h3>
<hr>
<form method="POST" enctype="multipart/form-data">
  <div class="form-group" style="margin-left:440px;width:36%;margin-top:30px;" >
    <label for="exampleInputEmail1">Song Tittle</label>
    <input type="text" class="form-control" id="InputTitle" name = "songTitle" placeholder="Enter Song Title" required maxlength="45">
  </div>
  <div class="form-group" style="margin-left:440px;width:36%;">
    <label for="exampleInputPassword1">Artist</label>
    <input type="text" class="form-control" id="Artist" name="artist" placeholder="Artist" required maxlength="45">
  </div>
  <div class="form-group" style="margin-left:440px;width:36%;">
    <label for="exampleSelect1">Genre</label>
    <select class="form-control" id="exampleSelect1" name="genre">
	    <c:forEach items="${genres}" var="genre">
	    	<option> <c:out value="${genre}"/></option>
		</c:forEach> 
    </select>
  </div>
  <div class="form-group" style="margin-left:440px;width:36%;">
    <label for="exampleTextarea">Description</label>
    <textarea class="form-control" id="exampleTextarea" rows="3" name="description" maxlength="300"></textarea>
  </div>
  <div class="form-group" style="margin-left:440px;width:36%;">
    <label for="exampleInputFile">Choose track</label></br>
      <input class="file-upload" type="file" id="file" name="songFile" accept=".mp3" required/>
      <label id="file-label" for="file">Browse</label>
      <input type="submit"  class = "btn btn-warning" style="margin-left:270px;margin-top:-13px;" value="Upload now">
  </div>
</form>

</body>
</html>
