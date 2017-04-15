<%@ page language="java" contentType="text/html; charset=windows-1256"	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1256">
<title>Assign Form</title>
</head>
<body>

	<form:form modelAttribute="assignForm" class="form-horizontal" method="post">		
		
		Select Member: <form:select path="member.id">
		    <form:options items="${members}" itemLabel="username" itemValue="id"/>
		</form:select>
		<br>
		
		Select Form: <form:select path="form.id">
		    <form:options items="${forms}" itemLabel="title" itemValue="id"/>
		</form:select>			
		
  		<input type="submit" class="btn btn-success" name="add" value="Assign Form">
	</form:form>

</body>
</html>