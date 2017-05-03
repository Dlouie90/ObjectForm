<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<form:form modelAttribute="textbox" class="form-horizontal"	method="post">
	
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" autofocus="autofocus"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxLength" class="col-sm-2 control-label">Maximum Character Allowed:</label>
			<div class="col-md-3">
				<form:input path="maxLength" type="text" class="col-md-3 form-control" id="maxLength" name="elementTitle" value="100"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="size" class="col-sm-2 control-label">Rows:</label>
			<div class="col-md-3">
				<form:input path="size" type="text" class="col-md-3 form-control" id="size" name="elementTitle" value="1"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Is Required:</label>
			<div class="col-sm-10">
				<form:checkbox class="checkbox" path="isRequired" checked="checked"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Is Enabled:</label>
			<div class="col-sm-10">
				<form:checkbox class="checkbox" path="isEnabled" checked="checked"/>
			</div>
		</div>
		
		<form:hidden path="isMultipleAnswerAllowed"/>
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="formId" value="${formId} " />
				<input type="hidden" name="pageId" value="${pageId} " />
				<input type="submit" name="add" value="Add Text Box"	class="btn btn-primary" id="sbmt">
			</div>
		</div>
	</form:form>
