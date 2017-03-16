<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Form Editor Version 1.337</title>
</head>
<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item">Generated Forms</li>
		<li class="breadcrumb-item">Form Creation</li>
		<li class="breadcrumb-item active">Edit Form</li>
	</ol>
<body>
	<form:form modelAttribute="form">
	Form Title: <form:input path="title"/> <br />
	Description: <form:textarea cols="50" rows="5" path="description"/> <br />
	<input type="submit" name="edit" value="Edit" />
	</form:form>
	
</body>
</html>