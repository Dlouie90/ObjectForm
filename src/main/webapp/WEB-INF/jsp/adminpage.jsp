<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="login.html">Form Builder</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="login.html">Login</a></li>
					<li class="active"><a href="admin.html">Admin Page</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="panel panel-default">
		<div class="panel-body">Welcome Administrator</div>
	</div>
	<div class="list-group">
		<a href="generatedforms.html" class="list-group-item">View
			Generated Forms</a> <a href="member/list.html" class="list-group-item">View
			Users</a>
	</div>
	<a href="login.html"><button type="button" class="btn btn-warning">Logout</button></a>
</body>
</html>