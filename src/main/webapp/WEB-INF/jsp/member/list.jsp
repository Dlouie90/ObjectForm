<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Email</th>
			<th>Firstname</th>
			<th>Middlename</th>
			<th>Lastname</th>
			<th>Operations</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${members}" var="member">

			<sec:authorize
				access="hasAuthority('Admin') || principal.username == #member.username">
				<tr>
					<td>${member.id }</td>
					<td>${member.email }</td>
					<td>${member.firstName }</td>
					<td>${member.middleName }</td>
					<td>${member.lastName }</td>
					<td><a href="view.html?id=${member.id}"><button
								type="button" class="btn btn-info">View</button></a> <a
						href="edit.html?id=${member.id}"><button type="button"
								class="btn btn-warning">Edit</button></a> 
							<sec:authorize access="hasAuthority('Admin')">
								<a href="delete.html?memberId=${member.id}">							
									<button	type="button" class="btn btn-danger">Delete</button>
								</a>
							</sec:authorize>
						</td>
				</tr>
			</sec:authorize>
		</c:forEach>
	</tbody>
</table>