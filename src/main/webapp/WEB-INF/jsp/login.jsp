<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="col-sm-6 col-md-4 col-md-offset-4">
	<h1 class="text-center login-title">Welcome Back! Please Sign In</h1>
	<div class="account-wall">					
		<img src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="" class="profile-img"/>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="error">${msg}</div>
		</c:if>	
		<form class="form-signin"  action="j_spring_security_check" method="post">
			<input type="text" name="username" class="form-control" placeholder="Username"  required="required" autofocus/>
			<input type="password" name="password" class="form-control" placeholder="Password" required="required" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" name="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>	
			
            <input class="pull-left checkbox" type="checkbox" id="rememberme" name="remember-me" checked="checked">Remember me
            				
			<a href="#" class="pull-right need-help">Need help? </a>
			<span class="clearfix"></span>
		</form>
	</div>				
</div>
		
