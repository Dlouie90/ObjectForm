<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
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

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav nav-tabs navbar-right">
				<li><a href="../form/list.html" class="glyphicon glyphicon-home"><span
						class="sr-only">(current)</span></a></li>
				<li>
					<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
						<a href="add.html">Create New Form</a><span	class="sr-only">(current)</span></a>
					</sec:authorize>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">User Management<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/list.html">Edit profile</a></li>
						<li><a href="#">Update Password</a></li>
						<li></li>												
						
						<sec:authorize access="hasAuthority('Admin')">
							<li role="separator" class="divider"></li>
							<li><a href="../member/add.html">Create Profile</a></li>
							<li><a href="../member/assign.html">Assign Form</a></li>
						</sec:authorize>
						
						<li role="separator" class="divider"></li>
						<li><a href="#">Users</a></li>
					</ul>
				</li>					
			</ul>
			<form action = "../logout" method="POST">
				<input name="_csrf" type="hidden" value="${_csrf.token}" /> 
				<input name="submit" type="submit" value="Signout" class="btn btn-danger"/>
			</form>
		</div>
	</div>
</nav>