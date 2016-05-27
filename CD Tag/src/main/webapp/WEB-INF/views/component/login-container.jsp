<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<c:choose>
	
	
	<c:when test="${user == null || user.anonymous}">
		<div id="user-menu" class="top-menu">
			<div id="login-error" class="error">Bad credentials</div>
		
			<f:form commandName="loginForm" action="/inloggen" method="post" id="user-login" >
			    <label for="username">E-mail address</label>
			    <f:input path="emailaddress" type="email" id="username" required="required" />
			
			    <label for="password">Password</label>
			    <f:input path="password" type="password" id="password" required="required" />
			
			    <button id="login" type="submit">Login</button>
			    <button id="forgot-password" type="button">Forgot password</button>
			    <a id="signup">Sign up</a>
			</f:form>
		</div>
		
		
		<f:form commandName="form" action="/registreren" autocomplete="off" id="user-register" method="post">
			<div id="register-error" class="error">Bad credentials</div>
		
		    <label for="email">E-mail address</label>
		    <f:input path="email" type="email" id="email" required="required" />
		
		    <label for="password">Password</label>
		    <f:password path="auth.password" type="password" id="password" required="required" />
		
		    <label for="re-password">Repeat Password</label>
		    <f:password path="auth.repeatPassword" type="password" id="re-password" required="required" />
		
		    <label for="username">Username</label>
		    <f:input path="auth.name" type="text" id="username" required="required" />
		    
		    <f:checkbox value="" path="agreeTos" id="agree_tos" required="required" />
		    <span>I agree with the <a class="terms" href="/termsandconditions" target="_blank">terms and conditions</a></span>
		
		    <button id="register" type="submit">Sign Up</button>
		</f:form>
		
		
		<f:form commandName="forgotPasswordForm" action="/wachtwoord-vergeten" autocomplete="off" id="user-forgot-password" method="post">
			<div id="register-error" class="error">Bad credentials</div>
		
		    <label for="email">E-mail address</label>
		    <f:input path="email" type="email" id="email" required="required" />
		    
		    <button id="request-password" type="submit">Request new password</button>
		</f:form>
	</c:when>
	
	
	<c:when test="${user != null && !user.anonymous}">
		<div id="user-menu" class="top-menu">
			<span>Hello ${user.name}, do you want to <a class="logout" href="/uitloggen">log-out</a>?</span>
		</div>
	</c:when>
	
</c:choose>
