<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Form Editor Version 1.337</title>
</head>
<body>
	<h3>${page.form.title}</h3>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="../adminpage.html">Admin</a></li>
		<li class="breadcrumb-item">Generated Forms</li>
		<li class="breadcrumb-item">Page List View</li>
		<li class="breadcrumb-item active">Form Element View List</li>
	</ol>
	<c:if test="${empty elements}">
		<h3>There are no form elements to display</h3>
	</c:if>
	<table class="table">
		<thead>
			<tr>
				<th>Form Element ID</th>
				<th>Form Element Question</th>
				<th>Form Element Type</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
		<thead>
			<c:forEach items="${elements}" var="element">
				<tr>
					<td>${element.id}</td>
					<td>${element.name}</td>
					<td>${element.type}</td>
					<td><c:if test="${element.type == 'checkbox'}">
							<a
								href="../choice/choicelist.html?id=${element.id}&pid=${page.id}"><button
									type="button" class="btn btn-info">Add Options</button></a>
						</c:if> <a
						href="edit${element.type}.html?id=${element.id}&pid=${page.id}"><button
								type="button" class="btn btn-warning">Edit</button></a> <a
						href="deleteelement.html?id=${element.id}&pid=${page.id}"><button
								type="button" class="btn btn-danger">Delete</button></a></td>

				</tr>
			</c:forEach>
		</thead>
		</tbody>
	</table>
	<a href="textbox.html?id=${page.id}"><button type="button"
			class="btn btn-info">Add Text Box</button></a>
	<a href="#"><button type="button" class="btn btn-info">Add
			Text Area</button></a>
	<a href="multiplechoice.html?id=${page.id}"><button type="button"
			class="btn btn-info">Add Check Box</button></a>
	<a href="#"><button type="button" class="btn btn-info">Add
			Date Text</button></a>
	<br/>
	<br/>
	<a href="viewform.html?id=${page.id}"><button type="button" class="btn btn-info">View Form</button></a>


</body>
</html>