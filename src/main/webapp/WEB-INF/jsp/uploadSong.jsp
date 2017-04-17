<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-ng-app="enterprise">
<head>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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

						<c:choose>
							<c:when test="${empty sessionScope.username}">
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

	<form form method="POST" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">Song Tittle</label>
    <input type="songTitle" class="form-control" id="InputTitle" placeholder="Enter Song Title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Artist</label>
    <input type="artist" class="form-control" id="Artist" placeholder="Artist">
  </div>
  <div class="form-group">
    <label for="exampleSelect1">Genre</label>
    <select class="form-control" id="exampleSelect1">
      <option>Pop</option>
      <option>Rock</option>
      <option>NonStop Disco Hitove</option>
      <option>Avto hits</option>
      <option>Muzika za dushata</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleTextarea">Description</label>
    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <form method="POST" enctype="multipart/form-data">

      <input class="file-upload" type="file" id="file" name="songFile"  accept="audio/*"/>
      <input type="submit" class = "idiotButton" value="Upload now">
  </form>

  </div>

</form>
</body>
</html>
