<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="member">
	<table class="table">
		<tr>
			<th>Email Id:</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th>First Name:</th>
			<td><form:input path="firstName" /></td>
		</tr>
		<tr>
			<th>Middle Name:</th>
			<td><form:input path="middleName" /></td>
		</tr>
		<tr>
			<th>Last Name:</th>
			<td><form:input path="lastName" /></td>
		</tr>
		
		<tr>
			<th>Password:</th>
			<td><form:password path="password" /></td>
		</tr>
		<tr>
			<th colspan="2">Enter Your Address:</th>
		</tr>
		<tr>
			<th>House Number:</th>
			<td><form:input path="address.house" /></td>
		</tr>
		<tr>
			<th>Street Number:</th>
			<td><form:input path="address.street" /></td>
		</tr>
		<tr>
			<th>Area:</th>
			<td><form:input path="address.area" /></td>
		</tr>
		<tr>
			<th>City:</th>
			<td><form:input path="address.city" /></td>
		</tr>
		<tr>
			<th>Zip Code:</th>
			<td><form:input path="address.zip" /></td>
		</tr>
		<tr>
			<th>State:</th>
			<td><form:input path="address.state" /></td>
		</tr>
		<tr>
			<th>Country:</th>
			<td><form:input path="address.country" /></td>
		</tr>
		<sec:authorize access="hasAuthority('Admin') && principal.username != #member.username">
			<tr>
				<th>User name:</th>
				<td><form:password path="username" /></td>
			</tr>
			<tr>
				<th>Role</th>
				<td><form:select path="roles.name">
						<form:options items="${roles}" />
					</form:select></td>
			</tr>
			<tr>
				<th>Is Enabled:</th>
				<td><form:checkbox path="enabled" /></td>
			</tr>
		</sec:authorize>
	</table>
 	<input type="submit" class="btn btn-success" name="save" value="Update">
</form:form>