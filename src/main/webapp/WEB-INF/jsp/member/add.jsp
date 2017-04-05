<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Add Member</title>
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
					<li class="active"><a href="add.html">Add Member</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div
		style="margin-left: 80px; margin-top: 50px; margin-buttom: 50px; width: 800px;">
		<form:form modelAttribute="member">
			<div class="form-group row">
				<label for="emailId" class="col-sm-2 col-form-label">Email
					Address:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="emailId"
						placeholder="Enter Your Email Address" path="email" />
				</div>
			</div>
			<div class="form-group row">
				<label for="firstName" class="col-sm-2 col-form-label">First
					Name:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="firstName"
						placeholder="Enter Your First Name" path="firstName" />
				</div>
			</div>
			<div class="form-group row">
				<label for="middleName" class="col-sm-2 col-form-label">Middle
					Name:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="middleName"
						placeholder="Enter Your Middle Name" path="middleName" />
				</div>
			</div>
			<div class="form-group row">
				<label for="lastName" class="col-sm-2 col-form-label">Last
					Name:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="lastName"
						placeholder="Enter Your Last Name" path="lastName" />
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label">Password:</label>
				<div class="col-sm-6">
					<form:password class="form-control" id="password"
						placeholder="Enter Your Password" path="passcode" />
				</div>
			</div>
			<div class="form-group row">
				<label for="role" class="col-sm-2 col-form-label">Role:</label>
				<div class="col-sm-6">
					<form:select path="roles[0].name">
						<form:option value="MEMBER">MEMBER</form:option>
						<form:option value="ADMIN">ADMIN</form:option>
					</form:select>
				</div>
			</div>
			<h4>
				<small>Enter Your Address:</small>
			</h4>
			<div class="form-group row">
				<label for="house" class="col-sm-2 col-form-label">House
					Number:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="house"
						placeholder="Enter Your House Number" path="address.house" />
				</div>
			</div>
			<div class="form-group row">
				<label for="street" class="col-sm-2 col-form-label">Street
					Name:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="street"
						placeholder="Enter Your Street Name" path="address.street" />
				</div>
			</div>
			<div class="form-group row">
				<label for="area" class="col-sm-2 col-form-label">Area:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="area"
						placeholder="Enter Your Area" path="address.area" />
				</div>
			</div>
			<div class="form-group row">
				<label for="city" class="col-sm-2 col-form-label">City:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="city"
						placeholder="Enter Your City" path="address.city" />
				</div>
			</div>
			<div class="form-group row">
				<label for="zipCode" class="col-sm-2 col-form-label">Zip
					Code:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="zipCode"
						placeholder="Enter Your Zip Code" path="address.zip" />
				</div>
			</div>
			<div class="form-group row">
				<label for="state" class="col-sm-2 col-form-label">State:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="state"
						placeholder="Enter Your State" path="address.state" />
				</div>
			</div>
			<div class="form-group row">
				<label for="country" class="col-sm-2 col-form-label">Country:</label>
				<div class="col-sm-6">
					<form:input class="form-control" id="country"
						placeholder="Enter Your Country" path="address.country" />
				</div>
			</div>
			<input type="submit" class="btn btn-success" name="add" value="Save">
		</form:form>
	</div>
	<br>
	<br>
</body>
</html>