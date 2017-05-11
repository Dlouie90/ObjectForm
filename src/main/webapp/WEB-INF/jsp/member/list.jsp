
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();
  });
</script>
<style>
	.user-row {
	    margin-bottom: 14px;
	}
	
	.user-row:last-child {
	    margin-bottom: 0;
	}
	
	.dropdown-user {
	    margin: 13px 0;
	    padding: 5px;
	    height: 100%;
	}
	
	.dropdown-user:hover {
	    cursor: pointer;
	}
	
	.table-user-information > tbody > tr {
	    border-top: 1px solid rgb(221, 221, 221);
	}
	
	.table-user-information > tbody > tr:first-child {
	    border-top: 0;
	}
	
	
	.table-user-information > tbody > tr > td {
	    border-top: 0;
	}
</style>

<div >
	<div class="well">
 		
 		<c:forEach items="${members}" var="member">
 			<div class="row user-row">
	            <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
	                <img class="img-circle"
	                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
	                     alt="User Pic">
	            </div>
	            <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
	                <strong>${member.username}</strong><br>
	                 <strong><span class="text-muted">User level: ${member.roles.name}</span></strong>
	            </div>
	            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".${member.username}">
	                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
	            </div>
	        </div>
	        <div class="row user-infos ${member.username}">
	            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
	                <div class="panel panel-primary">
	                    <div class="panel-heading">
	                        <h3 class="panel-title">User information</h3>
	                    </div>
	                    <div class="panel-body">
	                        <div class="row">
	                            <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
	                                <img class="img-circle"
	                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
	                                     alt="User Pic">
	                            </div>	
	                                                        
	                            <div >
	                                <strong>${member.username}</strong><br>
	                                <table class="table table-user-information">
	                                    <tbody>
	                                    <tr>
	                                        <td>User level:</td>
	                                        <td>${member.roles.name}</td>
	                                    </tr>
	                                    <tr>
	                                        <td>Name:</td>
	                                        <td>${member.lastName}, ${member.lastName}</td>
	                                    </tr>
	                                    <tr>
	                                        <td>Email:</td>
	                                        <td>${member.email}</td>
	                                    </tr>
	                                    <tr>
	                                        <td>Assigned Forms:</td>
	                                        <td>
	                                        	<dl>
	                                        		<c:forEach items="${member.assignedForm}" var="assign">
				                                    	<dt>${assign.form.title}</dt>
				                                    	<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
				                                    		<dd>
						                                    	<a href="unassign.html?assignmentId=${assign.id}">
						                                    		<button class="btn btn-sm btn-danger" type="button" data-toggle="tooltip"
																		data-original-title="Unassign Form">
																		<i class="glyphicon glyphicon-remove"></i>
																	</button>
																</a>
															</dd>
				                                    	</sec:authorize>				                                    				                                    							                                    		
				                                    </c:forEach>
	                                        	</dl>
	                                        </td>
	                                    </tr>
	                                    
	                                    </tbody>
	                                </table>    
	                            </div>	                           
	                        </div>
	                    </div>
	                    <div class="panel-footer">
	                        <button class="btn btn-sm btn-primary" type="button"
	                                data-toggle="tooltip"
	                                data-original-title="Send message to user"><i class="glyphicon glyphicon-envelope"></i></button>
	                        <span class="pull-right">
	                            <a href="edit.html?id=${member.id}">
	                            	<button class="btn btn-sm btn-warning" data-toggle="tooltip"
	                                    data-original-title="Edit this user"><i class="glyphicon glyphicon-edit"></i>
	                                </button>
	                            </a>
	                            <sec:authorize access="hasAuthority('Admin')">
	                            	<a href="delete.html?memberId=${member.id}">
		                            	<button class="btn btn-sm btn-danger" data-toggle="tooltip"
		                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i>
		                                </button>
		                            </a>
	                            </sec:authorize>	                            	                            
	                        </span>
	                    </div>
	                </div>
	            </div>
	        </div>
 	
 		</c:forEach>              
    </div>
</div>