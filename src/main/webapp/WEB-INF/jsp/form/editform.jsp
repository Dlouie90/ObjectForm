<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Form Editor Version 1.337</title>
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
					<li><a href="../generatedforms.html">Form List</a></li>
					<li class="active"><a href="editform.html">Edit Form</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<form:form modelAttribute="form">
		<div class="form-group">
			<label for="formTitle" class="col-sm-2 control-label">Form
				Title:</label>
			<div class="col-sm-10">
				<form:input path="title" type="text" class="form-control" id="formTitle"
					placeholder="Enter The Form Title" name="formTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label for="formName" class="col-sm-2 control-label">Description:</label>
			<div class="col-sm-10">
				<form:input path="description" type="text" class="form-control" id="formName"
					placeholder="Enter The Form Description" name="formName"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="Add Form"
					value="Edit Form" class="btn btn-warning">
			</div>
		</div>
	</form:form>
	
</body>
</html>