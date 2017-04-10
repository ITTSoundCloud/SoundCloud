<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="<c:url value="/static/css/indexCss.css" />" rel="stylesheet" type="text/css">
	 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/parallax1.js" />"  type ="text/javascript"></script>
  	<script src="<c:url value="/static/js/parallax2.js" />"  type ="text/javascript"></script>
  	<script src="<c:url value="/static/js/buttonPopup.js" />" type ="text/javascript"></script>
	<script src="<c:url value="/static/js/buttonPopupReal.js" />" type ="text/javascript"></script>
    <script src="<c:url value="/static/js/parallaxReal.js" />"  type ="text/javascript"></script>
     <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
<title>Insert title here</title>
</head>
<body>
﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿
 <div class="container">
  <section class="background">
    <div class="content-wrapper">
     <section class="wrapper" id="background">
  <section class="container">
    <div class="header">
      <div class="logo"><img src="https://a-v2.sndcdn.com/assets/images/header/cloud-e365a4.png" alt="soundcloud logo" height="20px" width="auto" /><img src="https://a-v2.sndcdn.com/assets/images/header/wordmark-d95b0a.png" alt="" /></div>
      <div class="login">
        <button class="btn-1" id="buttonLogin">Sign in</button>
         <button class="btn-2" id="buttonReg">Create account</button>
        <div class="overlay">
        </div>
      
      </div>
    </div>
    <section class="hero-container">
      
      <div class="text-block">
         <div class="main-popup">
  <div class="popup-header">
    <div id="popup-close-button"><a href="#"></a></div>
    <ul>
      <header><a href="#" id="sign-in">Sign In</a></header>
      <header><a href="#" id="register">Register</a></header>
    </ul>
  </div><!--.popup-header-->
  <div class="popup-content">
    <form action="#" class="sign-in">
      <label for="email">Email:</label>
      <input type="text" id="email">
      <label for="password">Password:</label>
      <input type="password" id="password">
      <p class="check-mark">
        <input type="checkbox" id="remember-me">
        <label for="remember-me">Remember me</label>
      </p>
      <input type="submit" id="submit" value="Submit">
      <input type="submit" id="submitFB" value="Log in with Facebook">
      <input type="submit" id="submitGP" value="Sign in with Google+">
    </form>
    
    <form action="/SoundCloud/register" class="register" method="post">

						<c:set var="ErrorRegMessage" scope="request" value="${ErrorRegMessage}"/>
						<c:if test="${ErrorRegMessage != null && ErrorRegMessage != ' '}">
							<font size="1" color="red"><c:out value="${ErrorRegMessage}"/></font>
						</c:if>
		<br>
      <label for="email-register" >Email: </label>
      <input type="text" id="email-register" name="email">
      <label for="username">Username:</label>
      <input type="text" id="username-register" name="username">
      <label for="password-register">Password:</label>
      <input type="password" id="password" name="password">
      <p class="check-mark">
        <input type="checkbox" id="accept-terms">
        <label for="accept-terms">I agree to the <a href="#">Terms</a></label>
      </p>
      <input type="submit" id="submit" value="Create Account">
    </form>
  </div><!--.popup-content-->
</div><!--.main-popup-->
        <h1>SoundCloud</h1>
        <h3>From dubstep to stand-up.<br/>When you’re bumper-to-bumper.</h3>
        <p></p>
      </div>
      <div class="call-to-action">
        <button class="btn-2">Try it free for 30-days</button>
        <button class="btn-1">Learn more</button>
      </div>
      </section>
    </div>
  </section>
  <section class="background">
    <div class="content-wrapper">
      <div class="login">
      <button class="btn-3" id="buttonReg">Browse SoundCloud</button>
    </div>
      <form class="search-container">
    <input type="text" id="search-bar" placeholder="Search for your favourite music now!">
    <a href="#"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
  </form>

      <h5>Hear what’s trending for free in the SoundCloud community</h5>
      <div class="main">
  <ul>
    <li class="track">
      <div class="cover">
        <img src="https://geo-media.beatport.com/image/8105032.jpg" alt="" />
      </div>
      <div class="info">
        <span class="titleSong">Wake Me Up</span>
        <span class="artist">Avicii</span>
      </div>
      <audio src="https://geo-samples.beatport.com/lofi/4702236.LOFI.mp3"></audio>
    </li>
    <li class="track">
       <div class="cover">
        <img src="https://geo-media.beatport.com/image/10708239.jpg" alt="" />
      </div>
      <div class="info">
        <span class="titleSong">Levels</span>
        <span class="artist">Avicii</span>
      </div>
      <audio src="http://a805.phobos.apple.com/us/r1000/071/Music/3b/2d/ac/mzm.wtdviygy.aac.p.m4a"></audio>
      
    </li>
  </ul>
</div>
    </div>
     </section>
  <section class="background">
    <div class="content-wrapper">
      <p class="content-title"></p>
      <p class="content-subtitle"></p>
    </div>
  </section>
</div>

</body>
</html>