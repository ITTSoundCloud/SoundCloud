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
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.0.js" type = "text/javascript"></script>
<link href="<c:url value="/static/css/playlistCss.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/playlistPopup.js" />" type ="text/javascript"></script>
<script src="<c:url value="/static/js/buttonPopupReal.js" />" type ="text/javascript"></script>


<style type="text/css">

.avatar{
  border-radius:100px;
  width:70px;
  height:70px;
  float:left;
}
.message{
  font-family:calibri;
  position:relative;
  clear:both;
  width:590px;
}
.message .avatar{
  margin-top:5px;
}
.message p{
  float:left;
  font-family:calibri;
  color:#333;
  width:450px;
  margin:0;
  margin-left:20px;
  margin-top:5px;
  padding:10px;
  background-color:#fafafa;
  border:1px solid #eee;
  border-radius:5px;
  margin-bottom:10px;
  word-spacing:3px;
  line-height:22px;
}
.message p em.info{
  display:block;
  text-align:right;
  margin-top:10px;
  font-size:12px;
  font-weight:bold;
  color:#666px;
}
.message p strong{
  display:block;
  color:#428bca;
  border-bottom:1px solid #ddd;
  margin-bottom:10px;
}
.message p strong em{
  font-weigh:normal;
  color:#333;
  font-size:10pt;
}

.inverse .avatar{float:left;}
.inverse p{float:none;background-color:#eee;}
.inverse .triangle{
  display:block;
  position:absolute;
  left:600px;
width: 0;
height: 0;
border-style: solid;
border-width: 10px 0 10px 15px;
border-color: transparent transparent transparent #eeeeee;
}

#global{
  width:1140px;
}
.messages{float:left;}

.btn{
}

button.likeCommentButton{
}

button.likeCommentButton.liked{

}

button.likeButton{
    border-radius: 0;
    margin-left: -1px;
    position: relative;
    float: left;
    margin-right: 5px;
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    color: #333;
    background-color: #fff;
    border-color: #ccc;
    display: inline-block;
    padding: px 12px;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid #ccc;
  
}

button.likeButton:hover{
    color: #000000;
    background-color: rgba(0,0,0,0.1);
    border-color: rgba(0,0,0,0.2);
  
}
button.likeButton.liked{
       
  
}

.playlist{

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
<c:set var="song" scope="request" value="${song}"/>	
<c:out value="${song.title}"/>
    <!--Button group -->
    <div class="btn-group" style="text-align: center">
     
       <c:choose>
			  <c:when test="${!isLiked}">
					<button class="btn likeButton" rel="6"><i class="fa fa-heart" ></i> Like</button>
				</c:when>
				<c:otherwise>
				<button class="btn likeButton" rel="6"><i class="fa fa-heart"></i> Unlike</button>
					</c:otherwise>
		</c:choose>
			
        <button type="button" class="btn btn-default btn-xs btn-space"><i class="fa fa-retweet"></i> Repost</button>
        <button type="button" class="btn btn-default btn-xs btn-space"><i class="fa fa-share-square-o"></i> Share</button>
   
        <c:choose>
			        	<c:when test="${empty sessionScope.username}">
							
						</c:when>
						<c:otherwise>
						<div class="dropdown btn-space">
			            	<button class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown"><i class="fa fa-plus-circle"></i> Add to playlist <span class="caret"></span></button>
			            	<ul class="dropdown-menu">        
			                <li><a id="buttonLogin"><i class="fa fa-plus-circle"></i> New Playlist</a></li>
			                
			                <c:forEach items="${currentUserPlaylists}" var="playlist">

								<li><a class="playlist" target="${playlist.playlistId }"><i class="fa fa-plus-circle"></i>${playlist.title}</a></li>
								
							</c:forEach>
			                   
			            </ul>
			             <div class="overlay"></div>
			        </div>
						</c:otherwise>
					</c:choose>


        
 	<div class="main-popup">
	  <div class="popup-header">
	    <div id="popup-close-button"><a href="#"></a></div>
	    <ul>
	  
	    </ul>
	  </div><!--.popup-header-->
	  <div class="popup-content">
	<form action="/SoundCloud/addPlaylist" class="add-playlist" method="post" name="addPlaylistForm" id="addPlaylistForm" onsubmit="return validateRequestPlaylist()">
	<div id="errorMsg" size="1" color="red"></div>
	      <label for="playlist">Playlist name:</label></br>
	      <input type="text" class="playlist-name" id="playlist" name="playlist" required=""></br>
	      <label for="description">Description:</label></br>
	      <textarea class="playlist-desc" id="description" name="description" required=""></textarea>
	      <input type="submit" class="button-playlist" id="create-playlist" value="Create Playlist" onclick="validateLogin()">  
	    </form>
	  </div><!--.popup-content-->
	</div>

        <div class="btn-container-right">
            <ul class="buttons-right pull-left">
                <li><i class="fa fa-play"></i> 55</li>
                <li><a href="#" ><i class="fa fa-comment"></i> Comment</a></li>
            </ul>
        </div>
    </div>
    
    <div id="textbox" class="input-group">
        <textarea class="form-control custom-control" id = "comment" rows="1" placeholder="Write your comment..."></textarea>
        <button id="submitCom" class="input-group-addon btn btn-default">Send</button>
    </div>
    
 <div id="global">
  <div class="messages">
  <c:choose>
	  <c:when test="${not empty allComments }">
		  <c:forEach items="${allComments}" var="comment">
		  
				<div class="message" id="comments">
					 <img src="https://www.google.com" class="avatar">
					 <p><strong>${comment.username}  <em><c:out value="${comment.commentTime}"/></em></strong>
					 <c:out value="${comment.content}"/></p>
					
					 <button class="btn likeCommentButton" id="likeCom" target="${comment.commentId }" rel="6"><i class="fa fa-heart" ></i> LikeComment</button>		 
				</div>
				
			
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="message" id="comments">
			<p>No comments.</p>
		</div>
	</c:otherwise>
</c:choose>
</div>
</div>

    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
	
<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>
	
	
<script type="text/javascript">
$('a.playlist').live('click', function(e){
	
    e.preventDefault();   
    alert("hello"),
    $button = $(this);
   	var x = $(this).attr("target");

    	 $.post("addSongToPlaylist", 
 				{ 
 					playlistId: x,
 					
 				});
});
</script>	

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
	 
	 const timeStamp = () => {
		  let options = {
		    month: '2-digit',
		    day: '2-digit',
		    year: '2-digit',
		    hour: '2-digit',
		    minute:'2-digit'
		  };
		  let now = new Date().toLocaleString('en-US', options);
		  return now;
		};
	 
	 
	 $('#submitCom').on('click', function(){
		 comment: cm.value,
	 alert("hello?"),
	 
	 
	 $.ajax({
		 
		type: 'POST',
		url:'comment',
		data: {
		    "comment" : cm.value,
	    },
		success: function(newComment){
			var h = document.getElementById("comment");
			document.getElementById('comments').innerHTML = `<img src="https://randomuser.me/api/portraits/med/men/23.jpg" class="avatar">
				  <p><strong>George,<em>+${timeStamp}+</em></strong>`+h.value+`</p>`,
				  $comments.append(timeStamp),
			cm.value="";
		}
		
	 });
});
	 
});

</script>


<script type="text/javascript">
$('button.likeButton').live('click', function(e){

    e.preventDefault();   
    
    $button = $(this);
    
    if($button.hasClass('liked')){
    	alert("unlikevame"),
    	$.post("removeLike");
        $button.removeClass('liked');  
        $button.text('Like');
    } else {
    	alert("likevame"),
        $.post("like");
        $button.addClass('liked');
        $button.innerHTML = `<i class="fa fa-heart"></i>`,
        $button.text('Unlike');
    }
});


</script>


<script type="text/javascript">
$('button.likeCommentButton').live('click', function(e){
	
    e.preventDefault();   
    
    $button = $(this);
   	var x = $(this).attr("target");
   	
    if($button.hasClass('liked')){
    	alert("unlikevameCommenta"),
    	 $.post("removeLikeComment", 
 				{ 
 					commentId: x,
 					
 				});
        $button.removeClass('liked');  
        $button.text('Like Comment');
    } else {
    	alert("likevame"),
    	  $.post("likeComment", 
    				{ 
    					commentId: x,
    					
    				});
        $button.addClass('liked');
        $button.text('Unlike Comment');
    }
});



</script>


</body>
</html>
