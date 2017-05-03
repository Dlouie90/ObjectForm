<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="member">
<h3>Update Your Password:</h3>
<form:hidden path="id"/>
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password:</label>
    <div class="col-sm-10">
      <form:password class="form-control" 
             id="password" placeholder="Enter Your Password"
             path="password" /> 
             <form:errors path="password" />
    </div>
</div>
<div class="form-group row">
    <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password:</label>
    <div class="col-sm-10">
      <form:password class="form-control" 
             id="confirmPassword" placeholder="Confirm Your Entered Password"
             path="confirmPassword" /> 
             <form:errors path="confirmPassword" />
    </div>
</div>
 	<input type="submit" class="btn btn-success" name="save" value="Update Password">
 	<a href="../form/list.html"><button type="button" class="btn btn-warning">Cancel</button></a>
</form:form>