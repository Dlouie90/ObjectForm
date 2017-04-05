<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Member's List</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../login.html">Form Builder</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="../login.html">Login</a></li>
					<li class="active"><a href="list.html">Member List</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<table class="table">
		<thead class="thead-default">
			<tr>
				<th>Email</th>
				<th>Firstname</th>
				<th>Middlename</th>
				<th>Lastname</th>
				<th>Role</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${members}" var="member">
				<tr>
					<td>${member.email }</td>
					<td>${member.firstName }</td>
					<td>${member.middleName }</td>
					<td>${member.lastName }</td>
					<td>${member.roles[0].name}</td>
					<td><a href="view.html?id=${member.id}"><button
								type="button" class="btn btn-info">View</button></a> <a
						href="edit.html?id=${member.id}"><button type="button"
								class="btn btn-warning">Edit</button></a> <a
						href="delete.html?id=${member.id}"><button type="button"
								class="btn btn-danger">Delete</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<a href="add.html"><button type="button" class="btn btn-info">Add
			New Member</button></a>
</body>
</html>