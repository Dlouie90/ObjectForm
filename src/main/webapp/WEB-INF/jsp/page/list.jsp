<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Page No.</th>
				<th>Description</th>
				<th>Manage</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pages}" var="page">
				<tr>
					<td>${page.id}</td>
					<td>${page.number}</td>
					<td>${page.description}</td>
					<td>
						<a href="../element/list.html?formId=${formId }&pageId=${page.id}"><button
								type="button" class="btn btn-info">Elements</button></a> <a
						href="edit.html?pageId=${page.id}&formId=${formId }"><button
								type="button" class="btn btn-warning">Edit</button></a> <a
						href="delete.html?pageId=${page.id}&formId=${formId }"><button
								type="button" class="btn btn-danger">Delete</button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br /> &nbsp;&nbsp;
	<a href="add.html?formId=${formId }">Add new page</a>