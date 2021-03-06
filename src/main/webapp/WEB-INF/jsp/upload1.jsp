<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/side-menu.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style1.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/css1.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/css3.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/css4.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/css2.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <style type="text/css">
       body {
  background: #ececec;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
}


img {
  max-width: 100%;
}

header {
  background-image: url("http://cdn1.theodysseyonline.com/files/2015/09/26/635788310823382605300244932_6803052-model-wallpaper.jpg");
  background-position: center;
  background-size: 100% auto;
  height: 400px;
  color: #fff;
}
header .container {
  position: relative;
  height: 100%;
}
header .container .navigation {
  padding-top: 15px;
  padding-bottom: 5px;
}
header .container .navigation h3 {
  margin-top: 0;
}
header .container .navigation .input-group button {
  border-right: transparent;
}
header .container .navigation .input-group button i {
  font-size: 1.6em;
  font-weight: 400;
  margin-top: -5px;
}
header .container .navigation .input-group .form-control {
  border-color: #fff;
  border-left: transparent;
  background: transparent;
  border-top-right-radius: 30px;
  border-bottom-right-radius: 30px;
  color: #fff;
  text-decoration: italic;
}
header .container .navigation i {
  font-size: 2em;
}
header .container .info {
  position: absolute;
  left: 15px;
  right: 15px;
  bottom: 15px;
  padding-left: 15px;
  padding-right: 15px;
}
header .container .info h1 {
  margin-top: 0;
}
header .container .info h1 sup {
  font-size: .4em;
  top: -1.3em;
}

.sidebar {
  background: #fff;
  padding-bottom: 15px;
  margin-left: -15px;
border-radius:10px;
width:300px;
  margin-right: -15px;
  -webkit-box-shadow: 0px 10px 10px 0px rgba(50, 50, 50, 0.35);
  -moz-box-shadow: 0px 10px 10px 0px rgba(50, 50, 50, 0.35);
  box-shadow: 0px 10px 10px 0px rgba(50, 50, 50, 0.35);
}
.sidebar .image {
border-radius:10px;
  background-position: center;
  background-size: auto 100%;
  width: 100%;
  height: 300px;
  margin-top: -300px;
  position: relative;
}

.p-image {
  position: absolute;
  top: 167px;
  right: 30px;
  color: #666666;
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.p-image:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.upload-button {
  font-size: 1.2em;
}

.upload-button:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
  color: #999;
}
.sidebar .image .profile-action {
  position: absolute;
  left: 15px;
  right: 15px;
  bottom: 15px;
  padding-left: 15px;
  padding-right: 15px;
}
.sidebar .content {
  padding-left: 15px;
  padding-right: 15px;
}
.sidebar .content p {
  color: #666;
}
.sidebar .content .stats {
  padding-left: 0;
  list-style-type: none;
  font-weight: 400;
  font-size: 1.2em;
  color: #666;
}
.sidebar .content .stats span {
  color: #222;
}

.main-content {
  padding-top: 50px;
}
.main-content .panel {
  -webkit-box-shadow: 0px 5px 5px 0px rgba(50, 50, 50, 0.35);
  -moz-box-shadow: 0px 5px 5px 0px rgba(50, 50, 50, 0.35);
  box-shadow: 0px 5px 5px 0px rgba(50, 50, 50, 0.35);
}
.main-content .panel a {
  font-size: 0.9em;
}
.main-content .panel a i {
  color: #777;
}
.main-content .posts .post {
  margin-bottom: 20px;
}
.main-content .posts .post img {
  max-width: 80%;
}
.main-content .posts .post .content {
  border-bottom: 1px solid #ddd;
  padding-bottom: 20px;
}
.main-content .posts .post .content .date {
  display: block;
  margin-top: 15px;
  color: #777;
}

.btn {
  border-radius: 30px;
}
.btn.btn-hollow {
  border-color: #fff;
  background: transparent;
  color: #fff;
}
.btn i {
  vertical-align: middle;
}
.btn.btn-circle {
  border: 1px solid #fff;
  border-radius: 50%;
  padding-left: 12px;
  padding-right: 12px;
  color: #fff;
}
.btn.btn-white {
  background: #fff;
  color: #aa1537;
}

  
  
  
  
.btn {
    cursor:pointer;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    
    border:1px solid #a6a6a6;
    border-top-color:#bdbdbd;
    border-bottom-color:#8b8a8b;
    
    padding:9px 14px 9px;
    
    color:#666666;
    font-size:11px;
    background-position:0px 0px;
    
    text-shadow: 0 1px 0 #fff;
    font-weight:bold;
    
    background-color: #ffffff;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#e8e8e8)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #ffffff, #e8e8e8); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #ffffff, #e8e8e8); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #ffffff, #e8e8e8); /* IE10 */
    background-image:      -o-linear-gradient(top, #ffffff, #e8e8e8); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #ffffff, #e8e8e8);
    
    -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    
    
}

.btn:hover {
    color:#333;
    border-color:#999;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#f6f6f6)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #ffffff, #f6f6f6); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #ffffff, #f6f6f6); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #ffffff, #f6f6f6); /* IE10 */
    background-image:      -o-linear-gradient(top, #ffffff, #f6f6f6); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #ffffff, #f6f6f6);
}
.btn:active{
    background-image: -webkit-gradient(linear, left top, left bottom, from(#e8e8e8), to(#ffffff)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #e8e8e8, #ffffff); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #e8e8e8, #ffffff); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #e8e8e8, #ffffff); /* IE10 */
    background-image:      -o-linear-gradient(top, #e8e8e8, #ffffff); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #e8e8e8, #ffffff);
}
.btn:focus {
    outline: none;
    border-color:#BD4A39;
}


/* Follow Button Styles */

button.followButton{
    width:160px;
}
button.followButton.following{
    background-color: #57A957;
    background-repeat: repeat-x;
    background-image: -khtml-gradient(linear, left top, left bottom, from(#62c462), to(#57a957));
    background-image: -moz-linear-gradient(top, #62c462, #57a957);
    background-image: -ms-linear-gradient(top, #62c462, #57a957);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #62c462), color-stop(100%, #57a957));
    background-image: -webkit-linear-gradient(top, #62c462, #57a957);
    background-image: -o-linear-gradient(top, #62c462, #57a957);
    background-image: linear-gradient(top, #62c462, #57a957);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#62c462', endColorstr='#57a957', GradientType=0);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
    border-color: #57A957 #57A957 #3D773D;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    color:#fff;
}

  
  
    </style>

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
						            <li><a href="/SoundCloud/logout">Log out</a></li>
						          </ul>
		       				 </li>
						</c:otherwise>
					</c:choose>
			       </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		</nav>


<c:set var="user" scope="request" value="${user}"/>	
				<c:if test="${empty user}">
					<h1>No user.</h1>
				</c:if>	

    <header>
  <div class="container">
    <div class="row navigation">
      <div class="col-sm-4">
        <h3><c:out value="${user.username }"/></h3>
      </div>
      <div class="col-sm-4">
        <div class="input-group">
          <span class="input-group-btn">
        <button class="btn btn-default btn-hollow" type="button"><i class="material-icons">search</i></button>
      </span>
          <input type="text" class="form-control" placeholder="Search for artists">
        </div>
      </div>
      <div class="col-sm-4 text-right">

      </div>
    </div>
    <div class="info">
      <div class="row">
        <div class="col-sm-5 col-sm-offset-4">
          <h1>Oscar Mwanandimai <sup><span class="label label-warning">PRO</label></sup></h1>
          <p>Johannesburg, South Africa</p>
        </div>
        <div class="col-sm-3 text-right">
          <a href="javascript:void(0)" class="btn btn-default btn-hollow"><i class="material-icons">share</i> SHARE PROFILE</a>
        </div>
      </div>
    </div>
  </div>
</header>
<div class="container">
  <div class="col-sm-4">
    <div class="sidebar">
        <div class="image"  style="background-image:url(file:///E:/scUploads/pics/berlu.jpg);">
 <div class="p-image">
 <form method="POST" enctype="multipart/form-data">

      	<button class="btn btn-sm btn-default">Change Picture<i class="fa fa-camera upload-button"></button>
        <input type="button"class="file-upload" type="file" id="file" name="imageFile"  accept="image/*"/>
        <input type="submit" class = "idiotButton" value="Upload now">
       </form>
       
       <c:choose>
			        	<c:when test="${!isFollowing}">
							      		 <button class="btn followButton" rel="6">Follow</button>
						</c:when>
						<c:otherwise>
					 <button class="btn followButton" rel="6">Following</button>
						</c:otherwise>
					</c:choose>

       <!--  <h2>File uploaded with name = ${filename}</h2>
		<img src="music/${filename}">  -->
     </div>
     <div class="profile-action">
          <div class="row">
            <div class="col-sm-9"><a href="javascript:void(0)" class="btn btn-block btn-white btn-lg">FOLLOW OSCAR</a></div>
            <div class="col-sm-3"><a href="javascript:void(0)" class="btn btn-circle btn-lg"><i class="material-icons">more_horiz</i></a></div>
          </div>
        </div>
      </div>
      <div class="content">

        <h4>BIO</h4>
        <p>I am all about the beauty of nothingness. Nothing is more useless that spending time reading nothing. I write nothing, you read nothing and what do we have between us at the end? Nothing.</p>
        <hr />
        <ul class="stats text-uppercase">
          <a>followers <span class="pull-right">234</span></a></br>
          <a>following <span class="pull-right">23</span></a>
          <li>songs <span class="pull-right">234</span></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-sm-8 main-content">
    <div class="panel panel-default">
        <iframe width="100%" height="150" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/213936205&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>
    </div>
    <div class="row">
      <div class="col-sm-10 col-sm-offset-1 posts">

        <div class="post">
          <div class="row">
            <div class="col-sm-3 text-center">
              <img src="https://avatars3.githubusercontent.com/u/6069839?v=3&s=460" class="img-circle" alt="" />
              <br />
              <h4>Oscar M.</h4>
            </div>
            <div class="col-sm-9 content">
              My fascination with nothing goes beyond nothing you have ever read or seen or done or ever thought possible. If there is one topic I am well versed in, then it is that of nothing. Absolute nothingness. I can sit here, do nothing, type nothing, look at
              nothing, think of nothing and still get up at the end of the day and say 'Aha, today I have accomplished nothing'.
              <span class="date">27 October 2015</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>


<script type="text/javascript">
$('button.followButton').live('click', function(e){

    e.preventDefault();   
    $button = $(this);
    if($button.hasClass('following')){

    	$.post("unFollow");
        $button.removeClass('following');
        $button.text('Follow');
    } else {
        // $.ajax(); Do Follow
        $.post("follow");
        $button.addClass('following');
        $button.text('Following');
    }
});


</script>


		</body>
		</html>
