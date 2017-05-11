<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
 <nav class="navbar navbar-default">
 	<div class="container-fluid">
 		<div class="navbar-header">
 			<button type="button" class="navbar-toggle collapsed"
 				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
 				aria-expanded="false">
 				<span class="sr-only">Toggle navigation</span> <span
 					class="icon-bar"></span> <span class="icon-bar"></span> <span
 					class="icon-bar"></span>
 			</button>
 			<a class="navbar-brand" href="#">Object Form</a>
 		</div>
 		<div class="collapse navbar-collapse"
 			id="bs-example-navbar-collapse-1">
 			<ul class="nav nav-tabs navbar-right">
 				<li><a href="../form/list.html" class="glyphicon glyphicon-home"><span
 						class="sr-only">(current)</span></a>
 				</li> 				
 				
 				<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')"> 				
 					<li class="dropdown"><a href="#" class="dropdown-toggle"
	 					data-toggle="dropdown" role="button" aria-haspopup="true"
	 					aria-expanded="false">Forms<span class="caret"></span></a>
	 					<ul class="dropdown-menu">
	 						<li><a href="../form/add.html">Create New Form</a></li>
	 						<li><a href="../member/assign.html">Assign Form</a></li>								
	 						
	 						<li role="separator" class="divider"></li>	 						
	 						<li><a href="../form/publish.html">Publish Form</a></li>
	 					</ul>
	 				</li>
	 				
	 				<li> 					
	 					<a href="../pdffile/list.html">Manage PDF Files</a><span class="sr-only">(current)</span> 					
	 				</li>				
 				</sec:authorize> 				
 				
 				
 				
 				<li class="dropdown"><a href="#" class="dropdown-toggle"
 					data-toggle="dropdown" role="button" aria-haspopup="true"
 					aria-expanded="false">User Management<span class="caret"></span></a>
 					<ul class="dropdown-menu">
 						<sec:authorize access="hasAuthority('Admin')">
 							<li role="separator" class="divider"></li>
 							<li><a href="../member/add.html">Create Profile</a></li> 							
 						</sec:authorize>
 						
 						<li><a href="../member/list.html">Edit profile</a></li>
 						<li><a href="../member/updatepassword.html">Update Password</a></li> 																	
 						
 						<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
 							<li role="separator" class="divider"></li>
 							<li><a href="../member/list.html">Users</a></li>	
 						</sec:authorize> 						
 					</ul>
 				</li>					
 			</ul>
 			<form action="<c:url value='/logout'/>" method="POST" id="logout">
 				<input name="_csrf" type="hidden" value="${_csrf.token}" /> 
 				<input name="submit" type="submit" value="Signout" class="btn btn-danger"/>
 			</form>
 		</div>
 	</div>
 </nav> 