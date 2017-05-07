<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">


<div class="form-horizontal">
	<div class="center-block">
		<c:if test="${not empty updateFlag}">
			<div class="jumbotron">
				<h4>
					<mark>The "${FormTitle}" has been published</mark>
				</h4>
			</div>
		</c:if>
		<c:if test="${empty forms}">
			<div class="jumbotron">
				<h1>
					Uh-Oh! <small>There are no Forms to Publish.</small>
				</h1>
			</div>
		</c:if>
		<c:if test="${not empty forms}">
			<div class="form-group required">
			    <label for="formID" class="col-sm-2 control-label">Select Form: </label>
			    <div class="col-sm-5">
			    	<form action="../form/publish.html" method="post">
			    		<select class="selectpicker form-control show-tick" data-width="auto" name="formID" >
			    			<c:forEach items="${forms}" var="form">
			    				<option value="${form.id}"> ${form.title}</option>
			    			</c:forEach>						
					    </select>
					    <input  type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>					    
					  							
						<button type="submit" class="btn btn-primary" >
							<span class="glyphicon"></span> Publish Form!
						</button>											   
			    	</form>			    
			    </div>
			</div>
		</c:if>
	</div>
</div>