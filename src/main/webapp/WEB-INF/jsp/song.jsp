<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js" type ="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/plugin/wavesurfer.timeline.min.js" type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.min.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerSecond.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/jquery.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/index.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Wavesurfer</title>

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
    <!-- Player -->
    <div class="container">

        <!-- Song Name & Song Title-->
        <ul class="song-info">
            <li>
                <div class="song-artist"><a href="#">&nbsp Artist &nbsp</a></div>
            </li>
            <li>
                <div class="song-title">&nbsp Song Title &nbsp</div>
            </li>
        </ul>

        <button type="button" class="btn btn-warning btn-circle btn-xl" onclick="wavesurfer.playPause()">
              <i class="fa fa-play" style="font-size: 38px; margin-right: -1rem"></i>
              </button>
        <div id="waveform"></div>
    </div>

    <br>

    <!--Comment Box -->
    <div id="textbox" class="input-group">
        <textarea class="form-control custom-control" rows="1" placeholder="Write your comment..."></textarea>
        <span class="input-group-addon btn btn-default">Send</span>
    </div>

    <!--Button group -->
    <div class="btn-group" style="text-align: center">
        <button type="button" class="btn btn-default btn-xs btn-space "><i class="fa fa-heart"></i> Like</button>

        <button type="button" class="btn btn-default btn-xs btn-space"><i class="fa fa-retweet"></i> Repost</button>

        <button type="button" class="btn btn-default btn-xs btn-space"><i class="fa fa-share-square-o"></i> Share</button>

        <div class="dropdown btn-space">
            <button class="btn btn-default dropdown-toggle btn-xs" type="button" data-toggle="dropdown"><i class="fa fa-bars"></i> More <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><a href="#"><i class="fa fa-plus-circle"></i> Add to playlist</a></li>
                <li><a href="#"><i class="fa fa-dot-circle-o"></i> Station</a></li>
            </ul>
        </div>

        <div class="btn-container-right">
            <ul class="buttons-right pull-left">
                <li><i class="fa fa-play"></i> 55</li>
                <li><a href="#"><i class="fa fa-comment"></i> Comment</a></li>
            </ul>
        </div>
    </div>

    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
</body>

</html>
