<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		var option_tpl;
		var index = 0;
		$('.add').on('click', function() {
			if (!option_tpl) {
				option_tpl = $('#tr_tpl').clone(true);
			}
			var $tr = option_tpl.clone(true);
			;
			$tr.find('.del').removeClass('dn');
			$tr.find('.option_content').val('');
			$tr.removeAttr('id');
			$('#js_choices').append($tr);
		});
		$('#sbmt').click(function() {
			var $inputs = $('.option_content');
			$.each($inputs, function(i, v) {
				$(v).prop('name', 'choices[' + i + '].text');				
			});
			$('#checkbox').submit();
		});
		$('.del').on('click', function() {
			$(this).parents('tr').remove();
		});
	});
</script>

	<form:form modelAttribute="checkbox" class="form-horizontal"	method="post">
	
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" required="required" autofocus="autofocus"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Name:</label>
			<div class="col-sm-5">
				<form:input path="name" type="text" class="form-control" id="elementName" placeholder="Enter Element Name" name="elementName" required="required"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Choices:</label>
			<div class="col-sm-10">
				<table id="js_choices">
					<tr class="option" id="tr_tpl">					
						<td><form:input path="choices[0].text"	cssClass="option_content" required="required"/> 
							<i class="glyphicon glyphicon-plus add" ></i>
							<i class="glyphicon glyphicon-trash del dn"></i>
						</td>
					</tr>
				</table>
			</div>
		</div>		
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Is Multiple Answer:</label>
			<div class="col-sm-10">
				<form:checkbox class="checkbox" path="isMultipleAnswerAllowed" checked="checked"/>
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
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="formId" value="${formId} " />
				<input type="hidden" name="pageId" value="${pageId} " />
				<input type="submit" name="add" value="Add Check Box"	class="btn btn-primary" id="sbmt">
			</div>
		</div>
	</form:form>