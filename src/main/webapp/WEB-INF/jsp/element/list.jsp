
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

	<form:form action="list.html" method="post">
		<input type="hidden" name="pageId" value="${pageId }">
		<input type="hidden" name="formId" value="${formId }"> 
    	<select name="elementType" class="selectpicker  form-control show-tick" data-width="auto">
			<option value="0">Textbox</option>
			<option value="1">Checkbox</option>
		</select>
		<button type="submit" class="btn btn-primary">Add Me</button>
	</form:form>
	<br>
	<hr>
	<table class="table">
		<thead>
			<tr>				
				<th>Title</th>				
				<th>is Required</th>
				<th>is Enabled</th>
				<th>has Multiple Answer</th>
				<th>Manage</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${elements}" var="element">
				<tr>					
					<td>${element.title }</td>					
					<td>${element.isRequired }</td>
					<td>${element.isEnabled }</td>
					<td>${element.isMultipleAnswerAllowed}</td>
					<td>
			       <c:choose>
							<c:when test="${element.type =='MultipleChoice' }">								
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