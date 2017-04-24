<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Object Form</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li>
        	<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
				<a href="add.html">Create New Form</a><span	class="sr-only">(current)</span></a>
		    </sec:authorize>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User Management <span class="caret"></span></a>
          <ul class="dropdown-menu">
			  <li><a href="../member/list.html">Manage Existing Members</a></li>											
			  <sec:authorize access="hasAuthority('Admin')">
				  <li><a href="../member/add.html">Create New Member</a></li>
				  <li><a href="../member/assign.html">Assign Form</a></li>
			  </sec:authorize>
		  </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-right" action = "../logout" method="POST">
        <input name="_csrf" type="hidden" value="${_csrf.token}" /> 
		<input name="submit" type="submit" value="Sign Out" class="btn btn-warning"/>
      </form>
    </div>
  </div>
</nav>