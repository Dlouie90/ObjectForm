<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.dn {
	display:none!important;
}

td {
	height: 40px;
}
</style>
<script type="text/javascript">
$(function(){
	var option_tpl;
	var index = 0;
	$('.add').on('click', function(){
		if(!option_tpl){
			option_tpl = $('#tr_tpl').clone(true);
		}
		var $tr = option_tpl.clone(true);;
		$tr.find('.del').removeClass('dn');
		$tr.find('.option_content').val('');
		$tr.removeAttr('id');
		$('#js_choices').append($tr);
	});
	$('#sbmt').click(function(){
		var $inputs = $('.option_content');
		$.each($inputs, function(i, v){
			$(v).prop('name','choices[' + i + '].text');
		});
		$('#multiplechoice').submit();
	});
	$('.del').on('click', function(){
		$(this).parents('tr').remove();
	});
});
</script>

	<form:form modelAttribute="multiplechoice" class="form-horizontal"	method="post">
	
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" />
			</div>
		</div>		
		
		<div class="form-group">
			<label class="col-sm-2 control-label">Choices:</label>
			<div class="col-sm-10">
				<table id="js_choices">
					<c:forEach items="${choices}" var="choice" varStatus="status">
					<tr class="option" id="tr_tpl">					
						<td>
							<input type="text" class="option_content" value="${choice.text}">
							<i class="glyphicon glyphicon-plus add" ></i>
							<i class="glyphicon glyphicon-trash del ${status.index == 0?'dn':''}" ></i>
						</td>
					</tr>
					</c:forEach>
				</table>
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
				<input type="submit" name="add" value="Update Element"	class="btn btn-primary" id="sbmt">
			</div>
		</div>
	</form:form>