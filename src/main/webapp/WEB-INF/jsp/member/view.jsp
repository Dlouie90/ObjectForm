<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<table class="table">
	<tr>		
		<th>Email : </th> <td>${member.email}</td>	
	</tr>
	<tr>	
		<th>First Name : </th> <td>${member.firstName}</td>		
	</tr>
	<tr>		
		<th>Middle Name : </th> <td>${member.middleName}</td>	
	</tr>
	<tr>	
		<th>Last Name : </th> <td>${member.lastName}</td>		
	</tr>
	<tr>	
		<th>User Name : </th> <td>${member.username}</td>	
	</tr>
	<tr>
		<td colspan=2> Address Information </td>
	</tr>
	<tr>	
		<th>House : </th> <td>${member.address.house}</td>		
	</tr> 
	<tr>		
		<th>Street : </th> <td>${member.address.street}</td>	
	</tr>
	<tr>	
		<th>Area : </th> <td>${member.address.area}</td>	
	</tr>		
	<tr>		
		<th>City : </th> <td>${member.address.city}</td>		
	</tr>
	<tr>		
		<th>Zip Code : </th> <td>${member.address.zip}</td>	
	</tr>
	<tr>	
		<th>State : </th> <td>${member.address.state}</td>
	</tr>
	<tr>
		<th>Country : </th> <td>${member.address.country}</td>
	</tr>
	<tr>
		<th>Role : </th> <td>${member.roles.name}</td>
	</tr>							
</table>