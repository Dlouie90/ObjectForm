<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Generate New Form</title>
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
					<li><a href="generatedforms.html">Form List</a></li>
					<li class="active"><a href="generatenewforms.html">Add New
							Form</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<form:form modelAttribute="form">
		<div class="form-group">
			<label for="formTitle" class="col-sm-2 control-label">Form
				Title:</label>
			<div class="col-sm-10">
				<form:input path="title" type="text" class="form-control"
					id="formTitle" placeholder="Enter The Form Title" name="formTitle" />
			</div>
		</div>
		<div class="form-group">
			<label for="formName" class="col-sm-2 control-label">Description:</label>
			<div class="col-sm-10">
				<form:input path="description" type="text" class="form-control"
					id="formName" placeholder="Enter The Form Description"
					name="formName" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="Add Form" value="Add Form"
					class="btn btn-primary">
			</div>
		</div>
	</form:form>
</body>
</html>