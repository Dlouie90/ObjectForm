<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
	<form:form action="list.html" method="post">
		<input type="hidden" name="pageId" value="${pageId }">
		<input type="hidden" name="formId" value="${formId }"> 
    	<select name="elementType">
			<option value="0">Textbox</option>
			<option value="1">Checkbox</option>
		</select>
		<button type="submit" class="btn btn-primary">Add</button>
	</form:form>
	<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Name</th>
				<th>is Required</th>
				<th>is Enabled</th>
				<th>has Multiple Answer</th>
				<th>Manage</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${elements}" var="element">
				<tr>
					<td>${element.id }</td>
					<td>${element.title }</td>
					<td>${element.name }</td>
					<td>${element.isRequired }</td>
					<td>${element.isEnabled }</td>
					<td>${element.isMultipleAnswerAllowed}</td>
					<td>
			       <c:choose>
							<c:when test="${element.type =='MultipleChoice' }">
								<a
									href="../choice/list.html?elementId=${element.id}&formId=${formId }&pageId=${pageId }"><button
										type="button" class="btn btn-info">Choices</button></a>
								<a
									href="editCheckbox.html?elementId=${element.id}&formId=${formId }&pageId=${pageId }"><button
										type="button" class="btn btn-info">edit</button></a>
							</c:when>
							<c:when test="${element.type =='Textbox' }">
								<a
									href="editTextbox.html?elementId=${element.id}&formId=${formId }&pageId=${pageId }"><button
										type="button" class="btn btn-info">edit</button></a>
							</c:when>
							<c:when test="${element.type =='DateText' }">
								<a href="edit.html"><button type="button"
										class="btn btn-warning">edit</button></a>
							</c:when>
						</c:choose> <a href="delete.html?elementId=${element.id}&formId=${formId }&pageId=${pageId }"><button
								type="button" class="btn btn-danger">delete</button></a> 
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>