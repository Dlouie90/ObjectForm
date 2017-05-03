<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="page" class="form-horizontal" method="post">
	
		<div class="form-group">
			<label for="number" class="col-sm-2 control-label">Page Number:</label>
			<div class="col-md-3">
				<form:input path="number" type="text" class="col-md-3 form-control" id="number" readonly="true"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-sm-2 control-label">Description: </label>
			<div class="col-md-3">
				<form:textarea path="description" type="text" class="col-md-3 form-control" id="description" name="description"  autofocus="autofocus"/>
			</div>
		</div>		
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="formId" value="${formId} " />				
				<input type="submit" name="add" value="Update Page"	class="btn btn-primary" id="sbmt">
			</div>
		</div>
</form:form>