<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Main Page</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="login.html">Form Builder</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="login.html">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<form class="form-horizontal" action="adminpage.html" method="post">
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email Id:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="email"
					placeholder="Email" name="email">
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label">Password:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password"
					placeholder="Password" name="password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<!-- <input type="submit" name="login" value="Login"
					class="btn btn-primary"> -->
				<a href="#"><button type="button"
						class="btn btn-info">Login</button></a>
				<a href="adminpage.html"><button type="button"
						class="btn btn-info">Admin Login</button></a>
			</div>
		</div>
	</form>
</body>
</html>