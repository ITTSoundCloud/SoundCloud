<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/static/css/menu.css" />" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<ul class="nav">
    	<li id="settings">
			<a href="#"><img src="https://www.wired.com/wp-content/uploads/2016/02/Soundcloud-icon-2-1200x630.jpg" width=100px height=58px /></a>
		</li>
    	<li>
			<a href="#">Home</a>
		</li>
		<li id="search">
			<form action="/search_text" method="get">
				<input type="text" name="search_text" id="search_text" placeholder="Search for songs, users and more"/>
				<input type="button" name="search_button" id="search_button"></a>
			</form>
		</li>
		<li>
			<a href="#">Upload</a>
		</li>
		<c:choose>
			<c:when test= "${empty sessionScope.username}">
				<div class="login">
	      			<button class="btn-3" id="buttonReg">Sign In</button>
	    		</div>
				<div class="login">
	      			<button class="btn-2" id="buttonReg">Create account</button>
	    		</div>
	    	</c:when>
	    	
	    	<c:otherwise>
	    		<li>
					<a href="#">Explore</a>
				</li>
				<li id="options">
					<a href="#">Profile username</a>
					<ul class="subnav">
						<li><a href="#">Update Profile</a></li>
						<li><a href="#">Log out</a></li>
					</ul>
				</li>
	    	</c:otherwise>
	    </c:choose>
	</ul>
</body>
</html>