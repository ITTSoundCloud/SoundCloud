<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

<link href="<c:url value="/static/errorPage/css/ie.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/static/css/styleError.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/static/js/error1.js" />"  type ="text/javascript"></script>
    <script src="<c:url value="/static/js/error2.js" />"  type ="text/javascript"></script>
  	<script src="https://code.jquery.com/jquery-1.8.3.js" type = "text/javascript"></script>
  	
  	<script src="<c:url value="/static/js/error3.js" />" type ="text/javascript"></script>



    <meta charset="utf-8"/>
    <title>Lost Cloud - Error page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="squirrellabs"/>
    <meta name="keywords" content="squirrellabs"/>
    <meta name="description" content="Lost Cloud - Error page"/>

    <!-- Stylesheets -->
   <link rel="stylesheet" type="text/css" media="all" href="/static/errorPage/css/style.css">

    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" media="all" href="css/ie.css" />
    <script type="text/javascript" src="js/html5.js" ></script>
    <![endif]-->

	<!-- Javascripts -->
	
</head>
	<body id="errorpage" class="error404" background="https://www.xmple.com/wallpaper/linear-yellow-brown-gradient-1920x1080-c2-f4a460-fafad2-a-60-f-14.svg">
        <div id="pagewrap">
            <!--Header Start-->
            <div id="header" class="header">
                <div class="container">
                    <img class="logo" src="<c:url value="/static/errorPage/images/logo.png" />" />
					<a href="#" title="logo" class="link">Lost SoundCloud</a>
                </div>
            </div><!--Header End-->
			<!-- Plane -->
			<div id="main-content">
				<div class="duck-animation" style="background-image:url(http://localhost:8080/scUploads/pics/bg.jpg)"></div>
				<!-- mg src="<c:url value="/static/genres/POP.jpg" />" />-->
			</div>
			<!--page content-->
            <div id="wrapper" class="clearfix">
                <div id="parallax_wrapper">
                    <div id="content">
                        <h1>Lost in the Clouds<br />Cloud not Found</h1>
                        <p>The page you're looking for is not here.</p>
                        <a href="http://localhost:8080/SoundCloud/home" title="" class="button">Go Home</a>
                    </div>
					<!--parallax-->
                    <span class="scene scene_1"></span>
                    <span class="scene scene_2"></span>
                    <span class="scene scene_3"></span>
                </div>
            </div>

        </div><!-- end pagewrap -->

		<!--page footer-->
        <div id="footer">
            <div class="container">
                <ul class="copyright_info">
                    <li>&copy; 2017 SoundCloud</li>
					<li>&middot;</li>
					<li>Made with love in It Tallents.</li>
                </ul>
				<!--social links-->

            </div>
        </div><!--end page footer-->
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43553901-1', 'squirrellabs.net');
  ga('send', 'pageview');

</script>
    </body>
</html>
