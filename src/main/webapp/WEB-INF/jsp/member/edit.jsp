<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<style>
	.form-group.required .control-label:after { 
	   content:"*";
	   color:red;
	}
	.error{
		color:red;
	}
</style>

<form:form modelAttribute="member" class="form-horizontal">
	<h3>Login Information:</h3>
	<hr>				
		
		<div class="form-group required">
		    <label for="firstName" class="col-sm-2 control-label">Email:</label>
		    <div class="col-sm-5">
		      	<form:input class="form-control" id="email" placeholder="Enter Your Email Id" path="email" required="required"/> 
      			<form:errors path="email" class="error"/>
		   </div>
		</div>
		
		<sec:authorize access="hasAuthority('Admin') && principal.username != #member.username">
			<div class="form-group required">
		    <label for="role" class="col-sm-2 control-label">Member Role:</label>
		    <div class="col-sm-5">
			    <form:select path="roles.name" class="selectpicker  form-control show-tick" data-width="auto">
					<form:options items="${roles}" />
			    </form:select>
		    </div>
		</div>
		</sec:authorize>		
		
		
		<hr>
		<h3>Contact Information:</h3>
		<hr>
	
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">First Name:</label>
		    <div class="col-sm-5">
		      	<form:input class="form-control" id="firstName" placeholder="Enter Your First Name" path="firstName" />
				<form:errors path="firstName" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Last Name:</label>
		    <div class="col-sm-5">
		      	<form:input class="form-control" id="lastName" placeholder="Enter Your Last Name" path="lastName" />
		      	<form:errors path="lastName" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Middle Name:</label>
		    <div class="col-sm-5">
		      	<form:input class="form-control" id="middleName" placeholder="Enter Your Middle Name" path="middleName" />
		   </div>
		</div>	
		
		<form:hidden path="roles.name" />	
 		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Apartment:</label>
		    <div class="col-sm-5">
		      	<form:input class="form-control" id="house" placeholder="Enter Your House Number" path="address.house" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Street/Area:</label>
		    <div class="col-sm-5">
		      	 <form:input class="form-control" id="street" placeholder="Enter Your Street Number" path="address.street" />
		   </div>
		</div>
		
		 
  		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">City:</label>
		    <div class="col-sm-5">
		      	 <form:input type="text" class="form-control" id="city" placeholder="Enter Your City"  path="address.city" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">State:</label>
		    <div class="col-md-3">
		      	 <form:input type="text" class="col-md-3 form-control" id="state" placeholder="Enter Your State" path="address.state" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Country:</label>
		    <div class="col-md-3">
		      	 <form:input type="text" class="col-md-3 form-control" id="country" placeholder="Enter Your Country" path="address.country" />
		   </div>
		</div>
		
		<div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">Zip:</label>
		    <div class="col-md-3">
		      	 <form:input type="text" class="col-md-3 form-control" id="zip" placeholder="Enter Your Zip Code"  path="address.zip"/>
		   </div>
		</div> 		
  		
		<sec:authorize access="hasAuthority('Admin') && principal.username != #member.username">
			<div class="form-group">
				<label class="col-sm-2 control-label">Is Enabled:</label>
				<div class="col-sm-5">
					<form:checkbox class="checkbox" path="enabled"/>
				</div>
			</div>
		</sec:authorize>
				
		<br>
	  	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">							
				<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-star"></span> Update it!
				</button>
			</div>
		</div>

</form:form>