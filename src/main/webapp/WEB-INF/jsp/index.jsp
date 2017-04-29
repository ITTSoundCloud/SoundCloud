<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link href="<c:url value="/static/css/indexCss.css" />" rel="stylesheet" type="text/css">
	 <script src="<c:url value="/static/js/player1.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/player2.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/parallax1.js" />"  type ="text/javascript"></script>
  	<script src="<c:url value="/static/js/parallax2.js" />"  type ="text/javascript"></script>
  	<script src="<c:url value="/static/js/buttonPopup.js" />" type ="text/javascript"></script>
	<script src="<c:url value="/static/js/buttonPopupReal.js" />" type ="text/javascript"></script>
    <script src="<c:url value="/static/js/parallaxReal.js" />"  type ="text/javascript"></script>
     <script src="<c:url value="/static/js/playerReal.js" />"  type ="text/javascript"></script>
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>


	<script type="text/javascript">
	function validateRequest(){

			var x = document.getElementById("username");
		    var y = document.getElementById("email");
		    var z = document.getElementById("password");
		    
		$.post("validateEverything", 
				{ 
					username: x.value,
					email: y.value,
					password: z.value
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myForm').submit();
       			}
	    });
		
		return false;

	}
	</script>
	
		<script type="text/javascript">
	function validateRequestLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==true){
       				document.getElementById('myLoginForm').submit();
       			}
       			else{
       				document.getElementById('errorMsg').style.display = 'block';
    				document.getElementById('errorMsg').innerHTML = "<h4 class='errorMsg'>Wrong data.</h4>"

       			}
	    });
		
		return false;

	}
	</script>
	
			<script type="text/javascript">
	function validateLogin(){
		
			var x = document.getElementById("username-login");
		    var y = document.getElementById("password-login");
		    
		$.post("validateAllLogin", 
				{ 
					username: x.value,
					password: y.value
					
				}
				, function(result){
       			if(result==false){
       				var z = document.getElementById('errorMsg');
       				if(z.style.display === 'none'){
       					z.style.display = 'block';
       				}
       			}
       			
	    });
		
		return false;

	}
	</script>
	


	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>Insert title here</title>
</head>
<body>

<div id="fb-root"></div>

<script>

  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      testAPI();
      console.log("<br>Connected to Facebook");
      FB.api('/me', {
			fields : 'first_name,last_name,email'
		}, function(response) {		
			$.post("loginFB", {
				first_name : response.first_name,
				last_name : response.last_name,
				email : response.email,
			
			});
			$('#faceb').click(function() {
			    location.reload(true);
			});
		});
      
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '229011207576478',
    cookie     : true,  
                        
    xfbml      : true,  
    version    : 'v2.9' 
  });


  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };
  
  function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

  (function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.9&appId=229011207576478";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
  function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}


  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      
    });
  }
</script>
﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿
 <div class="container">
  <section class="background">
    <div class="content-wrapper">
     <section class="wrapper" id="background">
  <section class="container">
    <div class="header">
      <div class="logo"><img src="https://a-v2.sndcdn.com/assets/images/header/cloud-e365a4.png" alt="soundcloud logo" height="20px" width="auto" /><img src="https://a-v2.sndcdn.com/assets/images/header/wordmark-d95b0a.png" alt="" /></div>
      <div class="login">
         <span class="fb-login-button" id="faceb" data-max-rows="1" data-size=large data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"></span> 
             
             <c:choose>
			        	<c:when test="${empty sessionScope.user}">
							<button class="btn-1" id="buttonLogin">Sign in</button>     
         					<button class="btn-2" id="buttonReg">Create account</button>
						</c:when>
						<c:otherwise>			
						</c:otherwise>
					</c:choose>
             
        
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

    <form action="/SoundCloud/login" class="sign-in" method="post" name="myLoginForm" id="myLoginForm" onsubmit = "return validateRequestLogin()">

    <div id="errorMsg" size="1" color="red">
    </div>
      <label for="username">Username:</label>
      <input type="text" id="username-login" name="username-login" required >
      <label for="password">Password:</label>
      <input type="password" id="password-login" name="password-login" required>
      <p class="check-mark">
        <input type="checkbox" id="remember-me">
        <label for="remember-me">Remember me</label>
      </p>
      <input type="submit" id="submit-login" value="Submit-login" onclick="validateLogin()">      
    </form>
    <form action="/SoundCloud/register" class="register" method="post" name="myForm" id="myForm"  onsubmit="return validateRequest()">
    <font id="error" size="1" color="red">
</font>
      <label for="email-register" >Email: </label>
      <input type="text" id="email" name="email" required onblur="myFunction2()">
      <label for="username-register">Username:</label>
      <input type="text" id="username" name="username" required onblur="myFunction1()">
      <label for="password-register">Password:</label>
      <input type="password" id="password" name="password" required onblur="myFunction3()">
      <p class="check-mark">
        <input type="checkbox" id="accept-terms">
        <label for="accept-terms">I agree to the <a href="#">Terms</a></label>
      </p>
      <input class="register-input" type="submit" id="lll" value="Create Account">
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
      <form class="search-container" action="/SoundCloud/search" method = "get">
    <input type="text" id="search-bar" name="search_text" placeholder="Search for your favourite music now!">
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


<script>
function myLoginFunction1() {
    var x = document.getElementById("username-login");
    
    $.post("validateUser", 
			{ 
				username: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('error').innerHTML = "<h4 class='error'>Ok.</h4>"
			}
			else{
				document.getElementById('error').innerHTML = "<h4 class='error'>There is no such username</h4>"
			
			}
    });
}
</script>



<script>
function myFunction1() {
    var x = document.getElementById("username");
    
    $.post("validateUser", 
			{ 
				username: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('error').innerHTML = "<h4 class='error'>Already taken username.</h4>"
			}
			else{
				document.getElementById('error').innerHTML = "<h4 class='error'>Ok.</h4>"
			
			}
    });
}
</script>

<script>

function myFunction3() {
    var x = document.getElementById("password");
  
    $.post("validatePassword", 
			{ 
				password: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('error').innerHTML = "<h4 class='error'>Invalid password.</h4>"
			}
			else{
				document.getElementById('error').innerHTML = "<h4 class='error'></h4>"	
			}	
   		
    });
}
</script> 

<script>
function myFunction2() {
    var x = document.getElementById("email");
    $.post("validateEmail", 
			{ 
				email: x.value
			}
			, function(result){
			if(!result){
				document.getElementById('error').innerHTML = "<h4 class='error'>Invalid email.</h4>"
			}
			else{
				document.getElementById('error').innerHTML = "<h4 class='error'></h4>"
				
			}	
   		
    });
}
</script>

<script>
function myFunction() {
    var x = document.getElementById('errorMsg');
    if (x.style.display === 'none') {
        x.style.display = 'block';
     }
}
</script>


</body>
</html>