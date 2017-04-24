<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<table class="table">
<thead >
	<tr>
		<th>ID</th>
		<th>Text</th>
		<th>Manage</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${choices}" var="choice">
		<tr>
			<td>${choice.id}</td>
			<td>${choice.text}</td>
			<td>
				<a href="edit.html?formId=${formId }&pageId=${pageId}&elementId=${elementId}&choiceId=${choice.id}"><button type="button" class="btn btn-warning">Edit</button></a>
				<a href="delete.html?formId=${formId }&pageId=${pageId}&elementId=${elementId}&choiceId=${choice.id}"><button type="button" class="btn btn-danger">Delete</button></a>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<br/>
<a href="./add.html?formId=${formId }&pageId=${pageId}&elementId=${elementId}">Add new choice</a></body>