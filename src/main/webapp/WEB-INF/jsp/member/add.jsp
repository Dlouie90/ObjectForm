<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="member">
<h3>Enter Your Details:</h3>
  <div class="form-group row">
    <label for="firstName" class="col-sm-2 col-form-label">First Name:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="firstName" placeholder="Enter Your First Name"
             path="firstName" />
             <form:errors path="firstName" />
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="lastName" placeholder="Enter Your Last Name"
             path="lastName" />
             <form:errors path="lastName" />
    </div>
  </div>
  <div class="form-group row">
    <label for="middleName" class="col-sm-2 col-form-label">Middle Name:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="middleName" placeholder="Enter Your Middle Name"
             path="middleName" />
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email Id:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="email" placeholder="Enter Your Email Id"
             path="email" /> 
             <form:errors path="email" />
    </div>
  </div>
  <div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password:</label>
    <div class="col-sm-10">
      <form:password class="form-control" 
             id="password" placeholder="Enter Your Password"
             path="password" /> <form:errors path="password" />
    </div>
  </div>
  <div class="form-group row">
    <label for="confirmPasscode" class="col-sm-2 col-form-label">Confirm Password:</label>
    <div class="col-sm-10">
      <form:password class="form-control" 
             id="confirmPasscode" placeholder="Confirm Your Entered Password"
             path="confirmPasscode" />
    </div>
  </div>
  <form:hidden path="roles.name" />
  <h4><small>Enter Your Address:</small></h4>
  <div class="form-group row">
    <label for="house" class="col-sm-2 col-form-label">House Number:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="house" placeholder="Enter Your House Number"
             path="address.house" />
    </div>
  </div>
  <div class="form-group row">
    <label for="street" class="col-sm-2 col-form-label">Street Number:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="street" placeholder="Enter Your Street Number"
             path="address.street" />
    </div>
  </div>
  <div class="form-group row">
    <label for="area" class="col-sm-2 col-form-label">Area:</label>
    <div class="col-sm-10">
      <form:input class="form-control" 
             id="area" placeholder="Enter Your Area"
             path="address.area" />
    </div>
  </div>
  <div class="form-group row">
    <label for="city" class="col-sm-2 col-form-label">City:</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" 
             id="city" placeholder="Enter Your City"
             path="address.city" />
    </div>
  </div>
  <div class="form-group row">
    <label for="state" class="col-sm-2 col-form-label">State:</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" 
             id="state" placeholder="Enter Your State"
             path="address.state" />
    </div>
  </div>
  <div class="form-group row">
    <label for="country" class="col-sm-2 col-form-label">Country:</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" 
             id="country" placeholder="Enter Your Country"
             path="address.country" />
    </div>
  </div>
  <div class="form-group row">
    <label for="zip" class="col-sm-2 col-form-label">Zip Code:</label>
    <div class="col-sm-10">
      <form:input type="text" class="form-control" 
             id="zip" placeholder="Enter Your Zip Code"
             path="address.zip" />
    </div>
  </div>
  <div class="form-group row">
    <label for="role" class="col-sm-2 col-form-label">Member Role:</label>
    <div class="col-sm-10">
	    <form:select path="roles.name" class="form-control">
			<form:options items="${roles}" />
	    </form:select>
    </div>
  </div>
  <div class="form-group row">
    <label for="isEnabled" class="col-sm-2 col-form-label">Is Enabled:</label>
    <div class="col-sm-10">
	    <form:checkbox path="enabled" />
    </div>
  </div>
  <input type="submit" class="btn btn-success" 
         name="register" value="Register" />  
</form:form>