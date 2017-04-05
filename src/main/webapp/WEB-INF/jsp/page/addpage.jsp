<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Page</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item">Generate New Form</li>
		<li class="breadcrumb-item">Page List View</li>
		<li class="breadcrumb-item active">Add Page</li>
	</ol>
	<form:form modelAttribute="page">
		<div class="page-group">
			<label for="pageNumber" class="col-sm-2 control-label">Page
				Number:</label>
			<div class="col-sm-10">
				<form:input path="number" type="text" class="page-control"
					id="pageNumber" name="pageNumber" />
			</div>
		</div>
		<div class="page-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="Add Page" value="Add Page"
					class="btn btn-primary">
			</div>
		</div>
	</form:form>

</body>
</html>