
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

<form:form modelAttribute="form" class="form-horizontal">
  
  <div class="form-group">
    <label for="formTitle" class="col-sm-2 control-label">Title:</label>
    <div class="col-sm-5">
    	<form:input path="title" id="formTitle" placeholder="Enter Form Title" class="form-control" />
    </div>    
  </div>
  
  <div class="form-group">
    <label for="formDescription" class="col-sm-2 control-label">Description:</label>
    <div class="col-sm-5">
    	<form:textarea path="description" rows="3" id="formDescription" placeholder="Enter Form Description" class="form-control" name="formName" />
    </div>    
  </div>
  
  <div class="form-group">
    <label for="numberOfPages" class="col-sm-2 control-label">Number of Pages:</label>
    <div class="col-sm-5 ">    	
   		<select name="numofpages" class="selectpicker  form-control show-tick" id="numberOfPages" data-width="100px">
	    	<option value="1">1</option>
			<c:forEach begin="2" end="15" varStatus="loop">
				<option value="${loop.index}">${loop.index}</option>
			</c:forEach>
		</select>    	 	
    </div>    
  </div>
  <br>
  	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">							
			<input type="submit" name="Add Form" value="Save" class="btn btn-primary btn-lg">
		</div>
	</div>
</form:form>