    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/static/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/static/css/style1.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/css1.css" />" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js" type ="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/plugin/wavesurfer.timeline.min.js" type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.min.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/wavesurfer.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/playerSecond.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/jquery.js" />"  type ="text/javascript"></script>
<script src="<c:url value="/static/js/bootstrap.js" />"  type ="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.0.js" type = "text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.0.52/wavesurfer.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>


<style type="text/css">
.list-group-item {
    position: relative;
    display: block;
    padding: 10px 15px;
    width: 800px;
    /* margin-top: 40px; */
    margin-left: 340px;
    margin-bottom: -1px;
    background: transparent;
    border: 1px solid rgba(255, 85, 0, 0.79);
}

.list-group {
    padding-left: 0;
    margin-top: 45px;
    margin-bottom: 20px;
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    z-index: 2;
    color: #fff;
    background-color: rgba(255, 85, 0, 0.72);
    border-color: rgba(51, 122, 183, 0);
}


.btn-warning {
    color: #fff;
    background-color: rgba(255, 85, 0, 0.86);
    /* border-color: #f50; */
}

</style>

<script>
$(document).ready(function(e) {
    var $input = $('#refresh');

    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>


<title>Insert title here</title>
</head>

    <body style="background:url(http://4.bp.blogspot.com/-V35Ll67C3ag/TpC9Rf8ejwI/AAAAAAAAAqI/DZWM-PoPCYA/s1600/002+Italy+232+Pompeii+Landscape++18x24+.jpg);">
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
			        <c:choose>
						 <c:when test="${empty sessionScope.username}">
						 	<span class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true"></span>						
							<button type="button" class="btn btn-success" onclick="location.href='http://localhost:8080/SoundCloud';">Go Back to Sign In</button>
						</c:when>
						<c:otherwise>
							<li><a href="http://localhost:8080/SoundCloud/songUpload">Upload</a></li>
							<li class="dropdown">
						         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
						          <ul class="dropdown-menu">
						          <form action="updateCurrentProfile_${sessionScope.username}" method="POST">
						            <button class="update" style= "border:none;margin-left:20px;color:black;margin-top:6px;margin-bottom:10px;background:transparent;color:#0000000;">Update Profile</button>
						            </form>
						            <li><a href="#">My Profile</a></li>
						            <li role="separator" class="divider"></li>
						            <li><a href="/SoundCloud/logout">Log out</a></li>    
						          </ul>		       				 
						</c:otherwise>
					</c:choose>
			       </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
		</nav>
            
			<h3 style="margin-left:120px;margin-bottom:-33px;margin-top:50px;"><i class="fa fa-play"></i> <c:out value="${playlist.title}"></c:out>Playlist by</h3>
			<h3 style="margin-left:180px;margin-bottom:-33px;font-size:16px;margin-top:40px;color:#707070;"><b>${playlist.username}borko123</b></h3>
           <div class="container" style="background:url(http://59.160.153.185/iyff/iyff2014/iyff/sites/default/files/banner-text-bg_1.png) no-repeat;margin-top:20px;width:1900px;height:190px;">

        <!-- Song Name & Song Title-->
      
        	<button type="button" class="btn btn-warning btn-circle btn-xl" id="playPause" >
              <span><i class="fa fa-play" id="play" style="font-size: 25px; margin-right: -1rem"></i></span>
              <span><i class="fa fa-pause" id="pause" style="display: none" style="font-size: 25px; margin-right: -1rem"></i></span>
              
              </button>
            
        <div id="waveform">
        </div>
             <img class="song-image" src="https://images.genius.com/1264a0304746875bdcbb1cfcdd5712cd.360x360x1.jpg
                            " alt="" style="margin-left:70px;" width="180" height="180">
 		   </div>
		
           <h5 style="margin-left:370px;font-size:17px;margin-top:30px;color:#707070"><i class="fa fa-headphones"></i> ${songsInPlaylist.size()} Tracks</h5>
           <hr>
           <div class="description" style="width:240px;float:left;margin-left:130px;">
            <h4 style="margin-top:20px;">Desciption</h4>
            <c:choose>
	            <c:when test="${not empty playlist.description}">
	          	 	<h5><c:out value="${playlist.description}" /></h5>
	           	</c:when>
	           	<c:otherwise>
	           	  <h5>No description.</h5>      	
	           	</c:otherwise>
           	</c:choose>
           </div>
           <div class="list-group" id="playlist" style="margin-left:60px;">
          
          	 <c:if test="${songsInPlaylist.size()>0}">
                <c:forEach items="${songsInPlaylist}" var="song">
	                <a href="http://localhost:8080/scUploads/songs/${song.title}.mp3" class="list-group-item">
				        <c:choose>
				    	<c:when test="${not empty song.photo}">
				            <img class="song-image" src="<c:url value="http://localhost:8080/scUploads/songsphotos/${song.title}.jpg"/>" alt="" width="30" height="30">
				    	</c:when>
				        <c:otherwise>
				        	   <img src="<c:url value="/static/playlist/music.jpg"/>"  width=200px; height = 200px; alt="" />	        
				        </c:otherwise>
				        </c:choose>        
	                   <c:out value="${song.title}"></c:out> - <c:out value="${song.artist}"></c:out>
	                 </a>
                 </c:forEach>
              </c:if>
       	  </div>


        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-50026819-1', 'wavesurfer.fm');
            ga('send', 'pageview');
        </script>
        
        <script type="text/javascript">
        
        var wavesurfer = Object.create(WaveSurfer);

        document.addEventListener('DOMContentLoaded', function () {
            wavesurfer.init({
                container: '#waveform',
                waveColor: '#505050',
                progressColor: 'rgba(255,88,6,0.9)',
                height: 120,
                barWidth: 1,
                cursorWidth: 0
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            var playPause = document.querySelector('#playPause');
            playPause.addEventListener('click', function () {
                wavesurfer.playPause();
            });

            wavesurfer.on('play', function () {
                document.querySelector('#play').style.display = 'none';
                document.querySelector('#pause').style.display = '';
            });
            wavesurfer.on('pause', function () {
                document.querySelector('#play').style.display = '';
                document.querySelector('#pause').style.display = 'none';
            });

            var links = document.querySelectorAll('#playlist a');
            var currentTrack = 0;
            
            var setCurrentSong = function (index) {
                links[currentTrack].classList.remove('active');
                currentTrack = index;
                links[currentTrack].classList.add('active');
                wavesurfer.load(links[currentTrack].href);
            };

            Array.prototype.forEach.call(links, function (link, index) {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    setCurrentSong(index);
                });
            });

            wavesurfer.on('ready', function () {
                wavesurfer.play();
            });

            wavesurfer.on('finish', function () {
                setCurrentSong((currentTrack + 1) % links.length);
            });

            setCurrentSong(currentTrack);
        });

        </script>   

</body>
</html>