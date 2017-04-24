<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="choice">
<table class="table">
		<tr>
			<th style="text-align:right">Choice Id : </th>
			<td>${choice.id}</td>
		</tr>
		<tr>
			<th style="text-align:right">Choice Text : </th>
			<td><form:input path="text"/></td>
		</tr>	           					           
	</table>	
	<input type="hidden" name="formId" value="${formId} "/>
	<input type="hidden" name="pageId" value="${pageId} "/>
	<input type="hidden" name="elementId" value="${elementId} "/>
  	<input type="submit" name="edit" value="Save">           
</form:form>