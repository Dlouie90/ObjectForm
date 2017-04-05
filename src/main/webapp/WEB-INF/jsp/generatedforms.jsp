<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Generated Forms</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../login.html">Form Builder</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="login.html">Login</a></li>
					<li class="active"><a href="generatedforms.html">Form List</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h3>List Of Generated Forms</h3>
	<table class="table">
		<thead class="thead-default">
			<tr>
				<th>Form ID</th>
				<th>Form Name</th>
				<th>Creation Date</th>
				<th>Modified Date</th>
				<th>Owner</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${forms}" var="form">

				<tr>
					<td>${form.id}</td>
					<td>${form.title}</td>
					<td>${form.createdDate}</td>
					<td>${form.modifiedDate}</td>
					<td>${form.ownedBy}</td>
					<td><a href="page/pageview.html?id=${form.id}"><button
								type="button" class="btn btn-info">View</button></a> <a
						href="form/editform.html?id=${form.id}"><button type="button"
								class="btn btn-warning">Edit</button></a> <a
						href="removeform.html?id=${form.id}"><button type="button"
								class="btn btn-danger">Delete</button></a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="generatenewform.html"><button type="button"
			class="btn btn-info">Add Form</button></a>
	<a href="page/pagelistview.html"><button type="button"
			class="btn btn-info">View All Pages</button></a>
</body>
</html>