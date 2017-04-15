<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Users List</title>
</head>
<body
	style="margin-top: 0px; margin-bottom: 0px; margin-right: 0px; margin-left: 0px; font-family: -apple-system, system-ui, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif">
	<div
		style="width: 100%; height: 100px; background-color: #6f5499; margin-left: 0; background-image: linear-gradient(to bottom, #563d7c 0, #6f5499 100%); font-color: red;">
		<div
			style="top: 25px; left: 20px; position: relative; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 30px; color: white;">Form
			Generator Project</div>
		<div
			style="top: 50px; left: 20px; position: relative; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 12px; color: white;">${menu}
		</div>
	</div>
	<table border="1" cellspacing=0 cellpadding=5 bordercolor="#D3D3D3"
		style="margin-top: 20px; margin-bottom: 0px; margin-right: 10px; margin-left: 10px;">
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
									class="btn btn-warning">Edit</button></a> <sec:authorize
								access="hasAuthority('Admin')">
								<a href="delete.html?memberId=${member.id}">
									<button type="button" class="btn btn-danger">Delete</button>
								</a>
							</sec:authorize></td>
					</tr>
				</sec:authorize>

			</c:forEach>
		</tbody>
	</table>
	<br /> &nbsp;&nbsp;
</body>
</html>