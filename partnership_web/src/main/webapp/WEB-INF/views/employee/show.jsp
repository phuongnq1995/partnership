<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<c:set var="principalId"><sec:authentication property="principal.id" /></c:set>
<div id="titlebar" class="resume">
	<div class="container">
		<div class="ten columns">
			<div class="resume-titlebar photo-rounded">
				<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
				<c:choose>
					<c:when test="${empty employee.getAvatar()}">
						<td><img src="<c:url value="/resources/images/user.png"/>"
							width="100px" height="100px" /></td>
					</c:when>
					<c:otherwise>
						<img width="100px" height="100px"
							src="${pageContext.request.contextPath}/imageEmployee/${employee.getId()}"
							alt="Photo" />
					</c:otherwise>
				</c:choose>
	

				<div class="resumes-content">
					<h4>
						${employee.getFullname()} <span>${employee.getJobName()}</span>
					</h4>
					<span class="icons"><i class="fa fa-map-marker"></i><a
						class="google_map_link candidate-location"
						href="http://maps.google.com/maps?q=${employee.getLocation().getName()}&zoom=14&size=512x512&maptype=roadmap&sensor=false">
							${employee.getLocation().getName()}</a></span>
							<span class="icons"><i class="fa fa-birthday-cake"></i>
								 <fmt:formatDate value="${employee.getBirthday()}" pattern="dd/MM/yyyy" /></span>  <span
						class="icons"> <c:if test="${not empty employee.getCv()}">
							<a rel="nofollow"
								href="${pageContext.request.contextPath}/cvEmployee/${employee.getId()}"><i
								class="fa fa-link"></i>Curriculum Vitae(CV)</a>
						</c:if>
					</span>
					<div class="skills">
						<c:forEach items="${employee.getCategories()}" var="category">
							<span>${category.getName()}</span>
						</c:forEach>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>

		<div class="six columns">
			<div class="two-buttons">
			
				<div class="resume_contact">
					<c:if test="${employee.getUserId() != principalId && principalId != ''}">
					<a href="#resume-dialog" id="link-resume-dialog"
						class="small-dialog popup-with-zoom-anim button"><i
						class="fa fa-envelope"></i> Contact</a>
					<div id="resume-dialog"
						class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
						<div class="small-dialog-headline">
							<h2>Send Message</h2>
						</div>
						<div class="small-dialog-content">
							<div >
								<div class="screen-reader-response"></div>
								<form:form action="${pageContext.request.contextPath}/employee/sendMessage" method="post" 
									id="contactForm" modelAttribute="contact">
									<div style="display: none;">
										<sec:authentication var="principal" property="principal" />
										<form:hidden path="userReceive" value="${userReceive.getId()}"/>
										<form:hidden path="userSend" id="sender" value="${principalId}"/>
									</div>
									<fieldset>
										<label for="full-name">Full name</label>
										<div class="field required-field">
											<span class="wpcf7-form-control-wrap full-name"><form:input
												type="text" path="senderName" size="40" value="${pageContext.request.userPrincipal.name}"
												class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" id="senderName"/></span>
										</div>
									</fieldset>
									<fieldset class="fieldset-message">
										<label for="message">Message</label>
										<div class="field required-field">
											<span class="wpcf7-form-control-wrap your-message"><form:textarea
													path="message" cols="40" rows="10"
													class="wpcf7-form-control wpcf7-textarea"></form:textarea>
											</span>
										</div>
									</fieldset>
									<p class="send-app-btn">
										<input type="submit" value="Send"
											class="wpcf7-form-control wpcf7-submit" />
									</p>
									<div class="wpcf7-response-output wpcf7-display-none"></div>
								</form:form>
							</div>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container ">
	<h3>About Me</h3>
	<p>&nbsp;</p>
	<p>${employee.getDescription()}.</p>
</div>

    
    