<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">


<div class="form-horizontal">
	<div class="center-block">
		
		<c:if test="${empty forms}">
			<div class="jumbotron">
				<h1>
					Uh-Oh! <small>There are no Forms to Assign. Publish Form First</small>
				</h1>
			</div>
		</c:if>
		<c:if test="${not empty forms}">			
						    
		    	<form:form modelAttribute="assignForm" class="form-horizontal" method="post">
		    	
		    		<div class="form-group required">
					    <label for=user class="col-sm-2 control-label">Select Member: </label>
					    <div class="col-sm-5">
					      	<form:select path="member.id"  class="selectpicker form-control show-tick" data-width="auto" name="user" autofocus="autofocus">
							    <form:options items="${members}" itemLabel="username" itemValue="id"/>
							</form:select>				
					   </div>
					</div>
					
					<div class="form-group required">
					    <label for=assign class="col-sm-2 control-label">Select Form:  </label>
					    <div class="col-sm-5">
					      	<form:select path="form.id" class="selectpicker form-control show-tick" data-width="auto" name="assign">
							    <form:options items="${forms}" itemLabel="title" itemValue="id"/>
							</form:select>			
					   </div>
					</div>
					
					<div class="form-group required">
					<label for=user class="col-sm-2 control-label"></label>					    
					    <div class="col-sm-5">
					      	<button type="submit" class="btn btn-primary" >
								<span class="glyphicon"></span> Assign This Form!
							</button>			
					   </div>
					</div>
					
			</form:form>						    			    
		  			
		</c:if>
	</div>
</div>