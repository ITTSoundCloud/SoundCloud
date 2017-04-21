<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js" type ="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/plugin/wavesurfer.timeline.min.js" type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.min.js" />"  type ="text/javascript"></script>
<script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js" type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/jsComment.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerSecond.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/jquery.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.0.js" type = "text/javascript"></script>

<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Roboto:400,600);
h4 {
  margin: 5px 20px;
}

span {
  float: right;
  margin-right: 10px;
  font-size: 12px;
  font-weight: 300;
}

hr {
  border: 0;
  height: 0;
  border-top: 1px solid rgba(0, 0, 0, 0.1);
  border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}

.container {
  display: flex;
  justify-content: center;
}

.comment-box {
  width: 85%;
  margin-top: 50px;
  background: #fff;
  padding: 5px;
  display: flex;
  justify-content: center;
  flex-direction: column;
}
.comment-box p {
  margin: 0 30px 15px;
  font-weight: 300;
  color: #333;
  word-wrap: break-word;
  background: #EEE;
  padding: 5px 10px;
}

.header {
  margin: 15px 20px;
  font-size: 27px;
  font-weight: 600;
}

form {
  margin: 10px 10px 30px 10px;
}
form ::-webkit-input-placeholder {
  color: #CCC;
  font-weight: 300;
}

input[type="text"], textarea {
  margin: 5px 10px;
  outline: none;
  background: #efefef;
  border: 0;
  padding: 10px;
}

textarea {
  resize: none;
  width: 85%;
}

input[type="text"] {
  width: 50%;
  margin-bottom: 15px;
}

button {
  font-weight: 400;
  margin: 12px 0 0 10px;
  border: 0;
  color: #fff;
  font-size: 15px;
  background: #D3775D;
  padding: 12px 20px 12px 20px;
  text-decoration: none;
  transition: all 0.2s ease;
}
button:hover {
  background: #C15322;
}

.footer p {
  float: right;
  font-size: 13px;
  margin-bottom: 10px;
  background: #FFF;
}


</style>


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
                <li><a href="#" ><i class="fa fa-comment"></i> Comment</a></li>
            </ul>
        </div>
    </div>
    
 
    <body>
  <div class="container">
    <div class="comment-box">
      <div class="comment-form">
        <div class="header">Add Your Comment</div>

          <div>
            <textarea id="comment" rows="3" cols="30" placeholder="Comment"></textarea>
          </div>
          <button id="submitComment">COMMENT</button>
      </div>
      <div>
        <h4 class="header">Comments</h4>
        <div id="comments"></div>
        <c:forEach items="${allComments}" var="comment">
        <tr> <td> 
        <c:out value="${comment.content}"/>
        </td></tr>
        </c:forEach>
        
      </div>
    </div>
  </div>
</body>

    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->



<script type="text/javascript">
var wavesurfer = Object.create(WaveSurfer);

wavesurfer.init({
    container: '#waveform',
    barWidth: 1,
    waveColor: 'white',
    progressColor: 'orange',
    cursorWidth: 0

});

wavesurfer.load('https://wavesurfer-js.org/example/split-channels/stereo.mp3');

var slider = document.querySelector('#slider');

slider.oninput = function() {
    var zoomLevel = Number(slider.value);
    wavesurfer.zoom(zoomLevel);
};

</script>


<script type="text/javascript">

$(function(){
	alert('wtf');
	 var $comments = $('#comments');
	 var cm = document.getElementById("comment");
	 var cms = document.getElementById("comments").value;
	 var $comment = $('#comment');
	 
	 
	 $('#submitComment').on('click', function(){
		 comment: cm.value,
	 alert("hello?"),
	 
	 
	 $.ajax({
		 
		type: 'POST',
		url:'comment',
		data: {
		    "comment" : cm.value,
	    },
		success: function(newComment){
			$comments.append(cm.value),
			cm.value="";
		}
		
	 });
});
	 
});

</script>


<script type="text/javascript">

</script>
</body>
</html>
