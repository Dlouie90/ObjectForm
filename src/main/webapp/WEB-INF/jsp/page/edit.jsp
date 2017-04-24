<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="page">
<table class="table">
	<tr>
		<th>Page Number</th>
		<td>
	      <form:input path="number" size="20"/>
	     </td>
	</tr>
	<tr>
		<th>Description:</th>
		<td>
	      <form:input path="description" size="100"/>
	  	</td>
	 </tr>
</table>  
<br/>
<input type="hidden" name="${formId}">     
<input type="submit" class="btn btn-success" name="add" value="Save" />      
</form:form>