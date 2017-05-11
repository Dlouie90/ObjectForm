<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

	<form:form modelAttribute="formFile" class="form-horizontal"	method="post">
	
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" autofocus="autofocus"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxLength" class="col-sm-2 control-label">Maximum Length Allowed(MB):</label>
			<div class="col-md-3">
				<form:input path="fileLength" type="text" class="col-md-3 form-control" id="maxLength" name="elementTitle" value="10"/>
			</div>
		</div>
		
		<div class="form-group required">
		    <label for="role" class="col-sm-2 control-label">File Type:</label>
		    <div class="col-sm-5">
			    <form:select path="fileType" class="selectpicker  form-control show-tick" data-width="auto" name="role">
					<form:options items="${types}" />
			    </form:select>
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
				<input type="hidden" name="pageId" value="${pageId} " />
				<input type="hidden" name="formId" value="${formId} " />
				<input type="hidden" name="elementId" value="${formFile.id} " />			
				<input type="submit" name="add" value="Update File Type" class="btn btn-primary" id="sbmt">
			</div>
		</div>
	</form:form>
