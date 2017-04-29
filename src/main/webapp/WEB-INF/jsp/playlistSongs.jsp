<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/miniPlayer.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.min.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.js" />"  type ="text/javascript"></script>
<link href="<c:url value="/static/css/css1.css" />" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.0.52/wavesurfer.min.js"></script>

  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Songs in Playlist</title>



<script>
$(document).ready(function(e) {
    var $input = $('#refresh');
    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

</head>
<body>



<div class="row" style="margin: 30px 0">
                    <div class="col-sm-10">
                        <div id="waveform">
                            <!-- Here be waveform -->
                        <wave style="display: block; position: relative; user-select: none; height: 120px; overflow-x: auto; overflow-y: hidden;"><canvas width="695" height="120" style="position: absolute; z-index: 1; left: 0px; top: 0px; bottom: 0px; width: 695px;"></canvas><wave style="position: absolute; z-index: 2; left: 0px; top: 0px; bottom: 0px; overflow: hidden; width: 511px; display: block; box-sizing: border-box; border-right: 1px solid rgb(51, 51, 51);"><canvas width="695" height="120" style="width: 695px;"></canvas></wave></wave></div>
                    </div>

                    <div class="col-sm-2">
                        <button class="btn btn-success btn-block" id="playPause">
                            <span id="play" style="display: none;">
                                <i class="glyphicon glyphicon-play"></i>
                                Play
                            </span>

                            <span id="pause">
                                <i class="glyphicon glyphicon-pause"></i>
                                Pause
                            </span>
                        </button>
                    </div>
                </div>
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
			          <input type="text" class="form-control" placeholder="Search" id="search-bar" name="search_text">
			        </div>
			        <button type="submit" class="btn btn-warning">Search</button>
			      </form>
			      <ul class="nav navbar-nav navbar-right">
			        <c:choose>
			        	<c:when test="${empty sessionScope.username}">
					  	<span class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true"></span>						
							<button type="button" class="btn btn-success">Sign In</button>
							  <button type="submit" class="btn btn-warning">Create account</button>
						</c:when>
						<c:otherwise>
						<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
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

  	<header></header>
  	
  	<div class="container-fluid">
	  <div class="side-body">
			   <div class="col-md-9">
			     <h3> Playlist </h3>
				<table class="table table-list-search">
					<thead>
						<tr>
							<th><i>Songs</i></th>
							<th><i>Some info here</i></th>
							<th><i>Open Song</i></th>
						</tr>
					</thead>
					<c:if test="${empty songsInPlaylist}">
						<h3>No songs in playlist</h3>
					</c:if>
					<tbody>
						<c:forEach items="${songsInPlaylist}" var="song">
						<tr>
						<div class="main">
						<td>
						  <ul>
						    <li class="track">
						      <div class="cover">
						        <c:choose>
									<c:when test ="${empty song.title}">
											<a href="song_${song.title}"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
											<c:out value="${song.title}"/>
									</c:when>
									<c:otherwise>
											<a href="song_${song.title}"><img class="song-image" src="http://www.taxileeds.co.uk/wp-content/uploads/2012/09/orange-fade.gif" alt="" width="110" height="110"></a>
										</c:otherwise>
									</c:choose>
						      </div>
						      <div class="info">
						         <span class="titleSong"><c:out value="${song.title}"/></span>
						        <span class="artist" style="font-size:11px;"><c:out value="${song.artist}"/></span>
						      </div>
						      <audio src="http://localhost:8080/scUploads/songs/${song.title}.mp3"></audio>
						    </li>
						  </ul>
						  </td>	  
						</div>
						
							<td><c:choose>
							<c:when test ="${empty song.about}">
								<h6 style="margin-top:55px;">No description</h6>
							</c:when>
							<c:otherwise>
									<h6 style="margin-top:55px;"><c:out value="${song.about}"/></h6>
									<a href="#"></a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							</td>
						</tr>
						</c:forEach>
						
						
            
						</tbody>
					</table>	
					
					 <div class="col-sm-2">
                        <button class="btn btn-success btn-block" id="playPause">
                            <span id="play" style="display: none;">
                                <i class="glyphicon glyphicon-play"></i>
                                Play
                            </span>

                            <span id="pause">
                                <i class="glyphicon glyphicon-pause"></i>
                                Pause
                            </span>
                        </button>
                    </div>	
                    
                    
                     <div class="col-sm-2">
                        <button class="btn btn-success btn-block" id="playPause">
                            <span id="play" style="display: none;">
                                <i class="glyphicon glyphicon-play"></i>
                                Play
                            </span>

                            <span id="pause">
                                <i class="glyphicon glyphicon-pause"></i>
                                Pause
                            </span>
                        </button>
                    </div>	
				  </div>
				</div>
	        </div>
	        
	        
	        <script type="text/javascript">
	        var wavesurfer = Object.create(WaveSurfer);


	     // Init on DOM ready
	     document.addEventListener('DOMContentLoaded', function () {
	         wavesurfer.init({
	             container: '#waveform',
	             waveColor: '#428bca',
	             progressColor: '#31708f',
	             height: 120,
	             barWidth: 3
	         });
	     });


	     // Bind controls
	     document.addEventListener('DOMContentLoaded', function () {
	         var playPause = document.querySelector('#playPause');
	         playPause.addEventListener('click', function () {
	             wavesurfer.playPause();
	         });

	         // Toggle play/pause text
	         wavesurfer.on('play', function () {
	             document.querySelector('#play').style.display = 'none';
	             document.querySelector('#pause').style.display = '';
	         });
	         wavesurfer.on('pause', function () {
	             document.querySelector('#play').style.display = '';
	             document.querySelector('#pause').style.display = 'none';
	         });


	         // The playlist links
	         var links = document.querySelectorAll('#playlist a');
	         var currentTrack = 0;

	         // Load a track by index and highlight the corresponding link
	         var setCurrentSong = function (index) {
	             links[currentTrack].classList.remove('active');
	             currentTrack = index;
	             links[currentTrack].classList.add('active');
	             wavesurfer.load(links[currentTrack].href);
	         };

	         // Load the track on click
	         Array.prototype.forEach.call(links, function (link, index) {
	             link.addEventListener('click', function (e) {
	                 e.preventDefault();
	                 setCurrentSong(index);
	             });
	         });

	         // Play on audio load
	         wavesurfer.on('ready', function () {
	             wavesurfer.play();
	         });

	         // Go to the next track on finish
	         wavesurfer.on('finish', function () {
	             setCurrentSong((currentTrack + 1) % links.length);
	         });

	         // Load the first track
	         setCurrentSong(currentTrack);
	     });

	        
	        </script>
  	
  	
  	</body>
  	</html>