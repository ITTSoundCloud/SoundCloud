<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/side-menu.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style1.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/profile.css" />" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

 <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		           <a class="navbar-brand" href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=52px /></a>
		    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			      	<li><a href="#"> Home </a></li>
			      </ul>
			      <form class="navbar-form navbar-left">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search">
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
		

<input  type="submit" class= "follow-btn" value="Follow">
<div class="container">
  <div class="cover row">
    <h1>Jordan Foreman</h1>
<h4>Bulgaria</h4>
     </div>
     <div class="profile-img">
    <img class="img-thumbnail" src="https://themostbeautifulwomen.net/wp-content/uploads/adriana-lima-love-magazine-advent-0.jpg?s=200"/>
    <form method="POST" enctype="multipart/form-data">
    <button class="btn btn-sm btn-default">Change Picture   <i class="fa fa-camera upload-button"></i>
        <input class="file-upload" type="file" name="failche" id="file" accept="image/*"/>
        <input type="submit" value="change"/></button>
      </form>
   </div>
  <div class="row content">
    <div class="profile col-md-3 col-xs-12">
		<ul class="profile-links">
			<li><i class="glyphicon glyphicon-envelope"></i> <a href="mailto:me@example.com"><i class=""></i>thejordanforeman@gmail.com</a></li>
		</ul>
      <hr>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus blanditiis illo repellendus consequuntur laborum obcaecati molestiae necessitatibus recusandae delectus vero amet, tenetur? Ex vitae sint temporibus. Ducimus rerum, eius impedit.</p>
    </div>
    <div class="feed col-md-9 col-xs-12">
      <div class="media feed-item">
        <div class="media-left">
          <a href="#">
            <img class="media-object feed-image" src="https://s3-us-west-2.amazonaws.com/jf-sillygoose/DGIT_Cover.jpg" alt="...">
          </a>
        </div>
        <div class="media-body">
          <h4 class="media-heading">Don't Go In There</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo pariatur dolore animi eius doloremque assumenda!</p>
          <ul class="item-opts">
            <li><a href="">Edit Details</a></li>
            <li><a href="">New Episode</a></li>
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
    

  
    <script src="./js/index.js"></script>
    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
  <script src="./js/menu-js.js"></script>


</body>
</html>