<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>View Member</title>
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
				<li><a href="list.html">Member List</a></li>
				<li class="active"><a href="#">View Member</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<table>
		<tr>
			<th>Email :</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th>Firstname :</th>
			<td>${member.firstName  }</td>
		</tr>
		<tr>
			<th>Middlename :</th>
			<td>${member.middleName }</td>
		</tr>
		<tr>
			<th>Lastname :</th>
			<td>${member.lastName }</td>
		</tr>
		<tr>
			<th>Email :</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td><br/></td>
		</tr>
		<tr>
			<td colspan=2>Address Information</td>
		</tr>
		<tr>
			<th>House :</th>
			<td>${member.address.house }</td>
		</tr>
		<tr>
			<th>Street :</th>
			<td>${member.address.street }</td>
		</tr>
		<tr>
			<th>Area :</th>
			<td>${member.address.area }</td>
		</tr>
		<tr>
			<th>City :</th>
			<td>${member.address.city }</td>
		</tr>
		<tr>
			<th>Zip Code :</th>
			<td>${member.address.zip }</td>
		</tr>
		<tr>
			<th>State :</th>
			<td>${member.address.state }</td>
		</tr>
		<tr>
			<th>Country :</th>
			<td>${member.address.country }</td>
		</tr>
	</table>
</body>
</html>