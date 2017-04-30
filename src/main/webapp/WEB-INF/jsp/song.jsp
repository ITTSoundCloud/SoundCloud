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
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.0.52/wavesurfer.min.js"></script>



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
  width:790px;
  margin-left:100px;
}
.message .avatar{
  margin-top:5px;
}
.message p{
  float:left;
  font-family:calibri;
  color:#333;
  width:580px;
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
 border-radius: 0;
    margin-left: 20px;
    position: relative;
    float: left;
    margin-top:27px;
    padding: 3px 7px;
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

.btn-group {
    margin-top: 30px;
    margin-left: 100px;
    margin-bottom:20px;
}


.fb_iframe_widget span {
    margin-top: -80px;
 }
   	

</style>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Song</title>

<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body style="background:url(http://www.rmweb.co.uk/community/uploads/monthly_03_2015/post-3717-0-28910200-1427235972.jpg);">

<input type="hidden" id="refresh" value="no">

   <nav class="navbar navbar-inverse" style="margin-bottom:-22px;">
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
							<button type="button" class="btn btn-success">Sign In</button>
							<button type="submit" class="btn btn-warning">Create account</button>
						</c:when>
					<c:otherwise>
						<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
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
  
    <header></header>
     
    <!-- Player -->
    <div class="container">

        <!-- Song Name & Song Title-->
        <ul class="song-info">
            <li>
                <div class="song-artist"><a href="#">&nbsp <c:out value="${song.artist }"/> &nbsp</a></div>
            </li>
            <li>
                <div class="song-title">&nbsp<c:out value="${song.title }"/> &nbsp</div>
            </li>
        </ul>
<h4 style="margin-bottom:-100px;margin-left:100px;margin-top:40px;color:#fff;background:rgba(0,0,0,0.6);height:25px;width:120px;font-size:24px;">Arabella</h4></br>
<h4 style="margin-bottom:-100px;margin-left:100px;margin-top:80px;color:#ccc;background:rgba(0,0,0,0.6);height:25px;width:160px;font-size:18px;">Arctic Monkeys</h4>
<h4 style="margin-bottom:-100px;margin-left:520px;margin-top:40px;color:#fff;background:#909090;height:25px;width:130px;padding:3px 18px;border-radius:20px;font-size:17px;">#<c:out value="${song.genre}"/></h4>

        <button type="button" style="margin-top:35px;margin-left:13px;" class="btn btn-warning btn-circle btn-xl" onclick="wavesurfer.playPause()">
              <i class="fa fa-play" style="font-size: 38px; margin-right: -1rem"></i>
              </button>
        <div id="waveform" style="margin-top:120px;">
        </div> <img src="<c:url value="http://localhost:8080/scUploads/pics/imagination.jpg" />" style="width:240px;height:240px;margin-left:80px;margin-top:-13px;" >
    </div>
    <br>

    <!--Comment Box -->
<c:set var="song" scope="request" value="${song}"/>
    <!--Button group -->
    <div class="btn-group" style="text-align: center">
     
       <c:choose>
			  <c:when test="${!isLiked}">
					<button class="btn likeButton" rel="6" style="padding:5px 14px;font-size:12px;"><i class="fa fa-heart" ></i> Like</button>
				</c:when>
				<c:otherwise>
				<button class="btn likeButton liked" rel="6" style="padding:5px 14px;font-size:12px;"><i class="fa fa-heart"></i> Unlike</button>
					</c:otherwise>
		</c:choose>
			
        <button type="button" class="btn btn-default btn-xs btn-space" style="padding:5px 14px;font-size:12px;"><i class="fa fa-share-square-o"></i> Share</button>
   
        <c:choose>
			        	<c:when test="${empty sessionScope.username}">
							
						</c:when>
						<c:otherwise>
						<div class="dropdown btn-space">
			            	<button class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" style="padding:5px 14px;font-size:12px;"><i class="fa fa-plus-circle"></i> Add to playlist <span class="caret"></span></button>
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

		<div>
			<ul class="buttons-right pull-left" style="margin-left:600px;margin-top:-25px;font-size:15px;">
                <li><i class="fa fa-play"></i> 55</li>
                <li><a href="#" ><i class="fa fa-heart"> </i> <c:out value="${song.likes }"/> </a></li>
          </ul>
     	</div>
        
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
	      <input type="text" class="playlist-name" id="playlist" name="playlist" required maxlength="45"></br>
	      <label for="description">Description:</label></br>
	      <textarea class="playlist-desc" id="description" name="description" required maxlength="45"></textarea>
	      <input type="submit" class="button-playlist" id="create-playlist" value="Create Playlist" onclick="validateLogin()">  
	    </form>
	  </div><!--.popup-content-->
	</div>
    </div>
    
    <div id="textbox" class="input-group">
        <textarea class="form-control custom-control" id = "comment" rows="1" placeholder="Write your comment..."></textarea>
        <button id="submitCom" class="btn btn-default btn-xs btn-space" style="width:60px;height:30px;">Send</button>
    </div>
    <h5 style="margin-left:120px;font-size:16px;color:#707070;"><i class="fa fa-comment"></i>  <c:out value="${allComments.size()}"></c:out> Comments</h5>
    <hr>
 <div id="global">
  <div class="messages">
	  <c:choose>
		  <c:when test="${empty allComments }">
		  <div class="message" id="comments">
				<p>No comments.</p>
			</div>
			  
		</c:when>
		<c:otherwise>
			<c:forEach items="${allComments}" var="entry">
					<div class="message" style="margin-left:1px;"id="comments">
					</div>
					<div class="message" id="comments">
						 <img src="<c:url value="http://localhost:8080/scUploads/pics/${entry.key.username }.jpg" />" class="avatar">
						 <p><strong>${entry.key.username}  <em><c:out value="${entry.key.commentTime}"/></em></strong>
						 <c:out value="${entry.key.content}"/></p>
						<c:if test="${not empty sessionScope.username}">
						<c:choose>
						<c:when test="${!entry.value}">
							 <button class="btn likeCommentButton" id="likeCom" target="${entry.key.commentId }" rel="6"><i class="fa fa-heart" ></i> Like</button>
						</c:when>
						<c:otherwise>
							<button class="btn likeCommentButton liked" id="likeCom" target="${entry.key.commentId }" rel="6"><i class="fa fa-heart" ></i> Unlike</button>
						</c:otherwise>
						 </c:choose>
						 </c:if>		 
					</div>	
			</c:forEach>
		</c:otherwise>
	</c:choose>
  </div>
</div>
	
<script src="https://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>
	
<script type="text/javascript">
$('a.playlist').live('click', function(e){
	
    e.preventDefault();   
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
    cursorWidth: 0,
    

});

wavesurfer.load('${sessionScope.songToPlay}');

var slider = document.querySelector('#slider');

slider.oninput = function() {
    var zoomLevel = Number(slider.value);
    wavesurfer.zoom(zoomLevel);
};

</script>


<script type="text/javascript">

$(function(){
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
	 
	 $.ajax({
		 
		type: 'POST',
		url:'comment',
		data: {
		    "comment" : cm.value,
	    },
		success: function(newComment){
			var h = document.getElementById("comment");
			document.getElementById('comments').innerHTML += `<div class="message" id="comments"><img src="<c:url value="http://localhost:8080/scUploads/pics/${user.username }.jpg" />" class="avatar">
				  <p><strong>${user.username} <em>${timeStamp}</em></strong>`+h.value+`</p></div>`,
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
    	$.post("removeLike");
        $button.removeClass('liked');  
        $button.text('Like');
    } else {
        $.post("like");
        $button.addClass('liked');
        $(this).append($("<i class='fa fa-heart'></i>")).button();

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

        $button.text('Like');
    } else {
    	alert("likevame"),
    	  $.post("likeComment", 
    				{ 
    					commentId: x,
    					
    				});
        $button.addClass('liked');
        document.getElementById("likeCom").innerHTML+= `<i class="fa fa-heart"></i>`;
          
        $button.text('Unlike');
    }
});



</script>


</body>
</html>
