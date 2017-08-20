<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<header class="default sticky-header">
	<div class="container">
		<div class="sixteen columns">
			<!-- Logo -->
			<div id="logo">
				<a href="${pageContext.request.contextPath}/" title="Partnership"
					rel="home"><img
					src="<c:url value="/resources/images/logo_homepage.png"/>"
					data-rjs="<c:url value="/resources/images/logo_homepage.png"/>"
					alt="Partnership" /></a>
			</div>

			<!-- Menu -->
			<nav id="navigation" class="menu">
				
				<ul id="responsive" class="menu">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="#">For Candidates</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/post/index">Browse Jobs</a></li>
							<li><a href="${pageContext.request.contextPath}/company/index">Browse Companies</a></li>
							<li><security:authorize access="hasRole('ROLE_EMPLOYEE')">
									<a href="${pageContext.request.contextPath}/employee">
										Submit Resume</a>
								</security:authorize> <security:authorize access="hasRole('ROLE_COMPANY')">
									<a href="${pageContext.request.contextPath}/company">
										Submit Resume</a>
								</security:authorize></li>
						</ul></li>
					<li><a href="#">For Employers</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/employee/index">Browse Candidates</a></li>
							<li><a href="${pageContext.request.contextPath}/post/new">Post a Job</a></li>
							<security:authorize access="hasRole('ROLE_COMPANY')">
								<li><a href="${pageContext.request.contextPath}/post/applylists">Apply post</a></li>
							</security:authorize>
						</ul>
					</li>
					<li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
									<a href="${pageContext.request.contextPath}/admin/companies">Admin</a>
					</security:authorize>
					
					</li>
					<c:if test="${pageContext.request.userPrincipal != null}">
						<li>
							<a href="${pageContext.request.contextPath}/showContact">My Contact
								<c:if test="${notseensize != 0}">
									<span class="badge" id="notseensize"><c:out value="${notseensize}" /></span>
								</c:if>
							</a>
						</li>
					</c:if>
					
				</ul>
				<ul class="float-right">
					<c:choose>
						<c:when test="${pageContext.request.userPrincipal == null}">
							<li><a href="#signup-dialog"
								class="small-dialog popup-with-zoom-anim"><i
									class="fa fa-user"></i> Sign Up</a></li>
							<li><a href="#login-dialog"
								class="small-dialog popup-with-zoom-anim"><i
									class="fa fa-lock"></i> Log In</a></li>
							<div id="signup-dialog"
								class="small-dialog zoom-anim-dialog mfp-hide apply-popup woocommerce-signup-popup">
								<div class="small-dialog-headline">
									<h2>Sign Up</h2>
								</div>
								<div class="small-dialog-content woo-reg-box">
									<form:form method="POST" modelAttribute="user"
										action="${pageContext.request.contextPath}/registration"
										class="register workscout_form">
										<p class="form-row form-row-wide${status.error ? 'has-error' : ''}">
											<label for="reg_email">Email address <span
												class="required">*</span> <i class="ln ln-icon-Mail"></i> <form:input
													type="email" class="input-text" path="email" />
											</label><span class="error text-danger" style="color: red;"><form:errors
													path="email"></form:errors></span>
										</p>
										<spring:bind path="password">
											<p
												class="form-row form-row-wide${status.error ? 'has-error' : ''}">

												<label for="reg_email">Password <span
													class="required">*</span> <i class="fa fa-lock"></i> <form:input
														type="password" class="input-text" path="password" />
												</label> <span class="error text-danger" style="color: red;"><form:errors
														path="password"></form:errors></span>
											</p>
										</spring:bind>
										<spring:bind path="passwordConfirm">
											<p
												class="form-row form-row-wide${status.error ? 'has-error' : ''}">

												<label for="reg_email">Password Confirm<span
													class="required">*</span> <i class="fa fa-key"></i> <form:input
														type="password" class="input-text" path="passwordConfirm" />
												</label><span class="error text-danger" style="color: red;"><form:errors
														path="passwordConfirm"></form:errors></span>
											</p>
										</spring:bind>

										<label for="user_email">I&#039;m looking..</label>
										<select name="role" class="input chosen-select">
											<option value="ROLE_EMPLOYEE">.. for a job</option>
											<option value="ROLE_COMPANY">..to hire</option>
										</select>
										<p class="form-row">
											<input type="submit" class="button" />
										</p>
									</form:form>
								</div>
							</div>
							<div id="login-dialog"
								class="small-dialog zoom-anim-dialog mfp-hide apply-popup woocommerce-login-popup">
								<div class="small-dialog-headline">
									<h2>Login</h2>
								</div>
								<div class="small-dialog-content woo-reg-box">
									<form method="POST" 
										class="login workscout_form" id="form-login">
										<div class="form-group">
											<span id="login-error" class="required"></span>
										</div>
										<p class="form-row form-row-wide">
											<label for="username">Email address <span
												class="required">*</span> <i class="ln ln-icon-Male"></i><input
												type="text" class="input-text" name="email" />
											</label>
										</p>
										<p class="form-row form-row-wide">
											<label for="password">Password <span class="required">*</span>
												<i class="ln ln-icon-Lock-2"></i><input class="input-text"
												type="password" name="password" id="password" />
											</label>
										</p>
										<p class="form-row">
											<input type="hidden" name="${_csrf.parameterName}" 
												value="${_csrf.token}" /><input
												type="submit" class="button" value="Login" />
										</p>
										<p class="lost_password">
											<a href="#">Lost your
												password?</a>
										</p>
									</form>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<li><security:authorize access="hasRole('ROLE_EMPLOYEE')">
									<a href="${pageContext.request.contextPath}/employee"><i
										class="fa fa-user"></i> User page</a>
								</security:authorize> <security:authorize access="hasRole('ROLE_COMPANY')">
									<a href="${pageContext.request.contextPath}/company"><i
										class="fa fa-user"></i> User page</a>
								</security:authorize></li>
							<li><a onclick="document.forms['logoutForm'].submit()"
								role="button" class="small-dialog popup-with-zoom-anim"><i
									class="fa fa-sign-out"></i>Log out</a>
								<form id="logoutForm" method="POST"
									action="${pageContext.request.contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<!-- Navigation -->
			<div id="mobile-navigation">
				<a href="#menu" class="menu-trigger"><i class="fa fa-reorder"></i>Menu</a>
			</div>
		</div>
	</div>
</header>
<script type="text/javascript">

$("#form-login").submit(function(e) {
	    $.ajax({
	        url:"${pageContext.request.contextPath}/login",
	        type: "POST",
	        data: $("#form-login").serialize(),
	        cache: false,
	        async: false,
	        success: function(data, status) {
	            if(data != "false"){
	                if(data != "isAdmin"){
	                	location.reload();
	                }else{
	                	var url = "${pageContext.request.contextPath}/admin/companies";
	                		window.location.replace(url);
	                }
	            }else{
	            	$("#login-error").html("Your email and password is invalid.");
	            }
	        },
	   	});
	    e.preventDefault();
});

</script>