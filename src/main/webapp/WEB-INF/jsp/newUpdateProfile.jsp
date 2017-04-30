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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

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
						            <li><a href="http://localhost:8080/SoundCloud/updateCurrentProfile_${sessionScope.username}">Update Profile</a></li>
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
		

<form method="POST" action="updateProfile">
  <div class="form-group">
    <label for="exampleInputEmail1">Full name</label>
    <input type="text" value="${sessionScope.user.name}" class="form-control" id="name" name = "name" required maxlength="45" >
  </div>
  <div class="form-group">
    <label for="exampleSelect1">Country</label>
    <select class="form-control" id="country" name="country" >
    <c:forEach items="${countries}" var="country">
    	<option> <c:out value="${country}"/></option>
	</c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleTextarea">About me</label>
    <textarea class="form-control"  id="about" rows="3" name="about" required maxlength="300">${sessionScope.user.bio}</textarea>
  </div>
  <input type="submit" class = "idiotButton" value="Update info"><br>
</form>
<form action="changePassword" method="POST" name="changePassForm" id="changePassForm"  onsubmit="return validateRequest()">
<div class="form-group">
    <label for="exampleInputFile">Change Password</label><br><br>
  	<label for="exampleInputEmail1">Your current password</label>
  	<font id="errorMsg" size="1" color="red"></font>
    <input type="password" class="form-control" id="currentPassword" name ="currentPassword" placeholder="Your current password" required maxlength="35" onblur="myFunction1()">
    <label for="exampleInputEmail1">Your new password</label>
    <font id="error" size="1" color="red"></font>
    <input type="password" class="form-control" id="newPassword" name ="newPassword" placeholder="Your new password" required maxlength="35" onblur="myFunction2()">
    <input type="submit" class = "idiotButton" value="Change password">
  </div>
  </form>
  
  	<script type="text/javascript">
	function validateRequest(){

			var x = document.getElementById("currentPassword");
		    var y = document.getElementById("newPassword");
		    
		$.post("validateChangePassword", 
				{ 
					currentPass: x.value,
					newPass: y.value,
				}
				, function(result){
       			if(result==true){
       				document.getElementById('changePassForm').submit();
       			}
	    });
		
		return false;

	}
	</script>
	
	<script>

function myFunction1() {
    var x = document.getElementById("currentPassword");
  
    $.post("validatePassword", 
			{ 
				password: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('errorMsg').innerHTML = "<h4 class='error'>Password not match.</h4>"
			}
			else{
				document.getElementById('errorMsg').innerHTML = "<h4 class='error'></h4>"	
			}	
   		
    });
}
</script>
  
  <script>

function myFunction2() {
    var x = document.getElementById("newPassword");
  
    $.post("validatePassword", 
			{ 
				password: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('error').innerHTML = "<h4 class='error'>The password must contains upper letter, symbol and number</h4>"
			}
			else{
				document.getElementById('error').innerHTML = "<h4 class='error'></h4>"	
			}	
   		
    });
}
</script> 

</body>
</html>
