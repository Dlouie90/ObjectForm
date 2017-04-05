<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Edit Multiple Choice</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item"><a href="generatenewform.html">Generate
				New Form</a></li>
		<li class="breadcrumb-item">Page List View</li>
		<li class="breadcrumb-item">Form Element View List</li>
		<li class="breadcrumb-item active">Add Multiple Choice</li>
	</ol>
	<form:form modelAttribute="element" class="form-horizontal"
		method="post">
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Form
				Element Title:</label>
			<div class="col-sm-10">
				<form:input path="title" class="form-control" id="elementTitle"
					placeholder="Enter Form Element Title" name="elementTitle" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Form Element Question:</label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control"
					placeholder="Enter Form Element Name" name="elementTitle" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Number of Selections:</label>
			<div class="col-sm-10">
				<form:input path="numberOfAllowedSelect" type="text"
					class="form-control" placeholder="Enter Form Element Name"
					name="elementTitle" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Is The Form Element
				Required:</label>
			<div class="radio">
				<label><input type="radio" name="optradio">Required</label>
			</div>
			<div class="radio">
				<label><input type="radio" name="optradio">Not
					Required</label>
			</div>
		</div>
		<div class="form-group">
			<label for="elementType" class="col-sm-2 control-label">Select
				Multiple Choice Type:</label>
			<div class="col-sm-10">
				<form:select path="choiceType" class="form-control">
					<form:option value="1">Check Box</form:option>
					<form:option value="2">Radio Button</form:option>
					<form:option value="3">Drop Down</form:option>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="edit" value="Edit" class="btn btn-info">
			</div>
		</div>
	</form:form>
</body>
</html>