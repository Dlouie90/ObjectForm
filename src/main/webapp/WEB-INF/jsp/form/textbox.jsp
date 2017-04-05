<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Add Form Elements</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item"><a href="generatenewform.html">Generate New Form</a></li>
		<li class="breadcrumb-item active">Page List View</li>
		<li class="breadcrumb-item active">Add Form Elements</li>
	</ol>
	<form:form modelAttribute="element" class="form-horizontal" method="post">
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Form Element
				Title:</label>
			<div class="col-sm-10">
				<form:input path="title" type="text" class="form-control" id="elementTitle"
					placeholder="Enter Form Element Title" name="elementTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Form Element
				Name:</label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control"
					placeholder="Enter Form Element Name" name="elementTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Is The Form Element Required:</label>
			<div class="radio">
			  <label><input type="radio">Required</label>
			</div>
			<div class="radio">
			  <label><input type="radio">Not Required</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="add" value="Add" class="btn btn-info">
			</div>
		</div>
	</form:form>
</body>
</html>