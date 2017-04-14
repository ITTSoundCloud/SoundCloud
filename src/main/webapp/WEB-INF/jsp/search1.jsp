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
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	            <li><a href="#"><span class="fa fa-search"></span> Everything</a></li></br>  
	            <li><a href="#"><span class="fa fa-music"></span> Tracks</a></li></br>
	            <li><a href="#"><span class="fa fa-user"></span> People</a></li>
	        </ul>
	    </div><!-- /.navbar-collapse -->
	</nav> 
	    </div>
	    <!-- Main Content -->
	    <div class="container-fluid">
	        <div class="side-body">
	           <h1> Main Content here </h1>
	           <div class="col-md-9">
				<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Username</i></th>
							<th><i>Some info here</i></th>

							<th><i>Open Profile</i></th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
						<td></td>
							<td></td>

							<td><button type="button"
									href="http://localhost:8080/SoundCloud/login"
									><i class="fa fa-soundcloud""></i></button></td>

						</tr>
						
					</tbody>
				</table>
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

	
</body>
</html>