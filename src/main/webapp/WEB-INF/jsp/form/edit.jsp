<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="form">
	 <div class="form-group">
	   <label for="formTitle">Title:</label>
	   <form:input path="title" id="formTitle" placeholder="Form Title" class="form-control" />
	 </div>
	 <div class="form-group">
	   <label for="formDescription">Description:</label>
	   <form:input path="description" id="formDescription" placeholder="Form Description" class="form-control" />
	 </div>
	 <input type="submit" class="btn btn-success" name="add" value="Save">
</form:form>