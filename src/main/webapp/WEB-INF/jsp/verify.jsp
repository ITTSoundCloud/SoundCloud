<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

<link href="<c:url value="/static/css/styleError.css" />" rel="stylesheet" type="text/css">
</head>

<body id="errorpage" class="error404">
        <div id="pagewrap">
            <!--Header Start-->
            <div id="header" class="header">
                <div class="container">
                    <img class="logo" src="<c:url value="/static/errorPage/images/logo.png" />" />
					<a href="#" title="logo" class="link">SoundCloud</a>
                </div>
            </div><!--Header End-->
			<!-- Plane -->
			<div id="main-content">
			</div>
			<!--page content-->
            <div id="wrapper" class="clearfix">
                <div id="parallax_wrapper">
                    <div id="content" style="margin-top:-130px;">
                    <h1 style="margin-top:-260px;">Welcome to SoundCloud</h1>
                       <p>Please, enter your verification code.</p></br>
                     	<form action="verify" method="post">
                                <input type="text" style="border-radius:16px;width:265px;height:30px;padding:0px 16px;" placeholder="Please enter code" name="code"/>
                                <br>
                                <br>
                                <button style="border-radius:16px;width:300px;height:34px;color:#707070">Verify Email</button>
                                <span class="scene scene_3" style="margin-left:-900px;top:50px;z-index: -999;"></span>        
                       </form>
                    </div>			
                </div>
            </div>
        </div>
		<!--page footer-->
        <div id="footer" style="margin-top:600px;">
            <div class="container">
                <ul class="copyright_info">
                    <li>&copy; 2017 SoundCloud</li>
					<li>&middot;</li>
					<li>Made with love in It Talents.</li>
                </ul>
            </div>
        </div>
       
</body>
</html>





                 