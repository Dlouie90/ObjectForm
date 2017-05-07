
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<form:form modelAttribute="assignForm" class="form-horizontal" method="post">		
	Select Member: <form:select path="member.id">
	    <form:options items="${members}" itemLabel="username" itemValue="id"/>
	</form:select>
	<br>
	Select Form: <form:select path="form.id">
	    <form:options items="${forms}" itemLabel="title" itemValue="id"/>
	</form:select>			
 		<input type="submit" class="btn btn-success" name="add" value="Assign Form">
</form:form>