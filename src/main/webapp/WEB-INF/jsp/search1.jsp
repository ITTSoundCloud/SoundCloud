<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- TODO -->


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
			      	<li><a href="#"> Explore </a></li>
			      </ul>
			      <form class="navbar-form navbar-left">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Search">
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
	    <!-- Main Content -->
	    <div class="container-fluid" id="showFirst">
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
					<c:set var="allUsers" scope="request" value="${allUsers}"/>

						<c:if test="${empty allUsers}">
						<h1>ok</h1>
						</c:if>
					<tbody>
					<c:forEach items="${allUsers}" var="user">
						<tr>
						<td><c:choose>
							<c:when test ="${empty user.profilePic}">
								<a href="profile_${user.username }"><img class="" src="http://www.lorealparis.com.au/_en/_au/caps/Cap_120402_Spokes/img/main/Doutzen-Kroes-main-visual.jpg" alt="" width="100" height="100"></a>
								<c:out value="${user.username}"/>
							</c:when>
							<c:otherwise>
									<a href="profile_${user.username }"><img class="" src="" alt="" width="100" height="100"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td><c:choose>
							<c:when test ="${empty user.bio}">
								<h6>No description</h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${user.username}"><img class="" src="" alt="" width="100" height="100"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td><button type="button"
									href="http://localhost:8080/SoundCloud/login"
									><i class="fa fa-soundcloud""> Follow</i></button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			
			
			 <div class="col-md-9" id="showSecond">
				<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Track</i></th>
							<th><i>Some info here</i></th>

							<th><i>Like or smth...</i></th>
						</tr>
					</thead>
					<c:set var="allUsers" scope="request" value="${allUsers}"/>

						<c:if test="${empty allUsers}">
						<h1>ok</h1>
						</c:if>
					<tbody>
					<c:forEach items="${allUsers}" var="user">
						<tr>
						<td><c:choose>
							<c:when test ="${empty user.profilePic}">
								<a href="profile_${user.username }"><img class="" src="http://www.lorealparis.com.au/_en/_au/caps/Cap_120402_Spokes/img/main/Doutzen-Kroes-main-visual.jpg" alt="" width="100" height="100"></a>
								<c:out value="${user.username}"/>
							</c:when>
							<c:otherwise>
									<a href="profile_${user.username }"><img class="" src="" alt="" width="100" height="100"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td><c:choose>
							<c:when test ="${empty user.bio}">
								<h6>No description</h6>
							</c:when>
							<c:otherwise>
									<a href="uploadNewProfile-${user.username}"><img class="" src="" alt="" width="100" height="100"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td><button type="button"
									href="http://localhost:8080/SoundCloud/login"
									><i class="fa fa-soundcloud""> Follow</i></button>
							</td>
						</tr>
						</c:forEach>
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
				$('#showFirst').hide();
				document.getElementById("first").style="color:#777";
				document.getElementById("second").style="color:#777";
				document.getElementById("third").style="color:#777";
				document.getElementById("forth").style="color:#f50";
};
	
</script>
    


</body>
</html>
