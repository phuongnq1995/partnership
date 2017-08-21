<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>

<div id="titlebar" class="resume">
	<div class="container">
		<div class="ten columns">
			<div class="resume-titlebar photo-rounded">
				<c:choose>
					<c:when test="${empty company.getLogo()}">
						<td><img alt="Photo" width="100px" height="100px"
							src="<c:url value="/resources/images/company.png"/>" /></td>
					</c:when>
					<c:otherwise>
						<img width="100px" height="100px"
							src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
							alt="Photo" />
					</c:otherwise>
				</c:choose>

				<div class="resumes-content">
					<h4>${company.getName()}</h4>
					<c:if test="${not empty company.getAddress()}">
						<span class="icons"><i class="fa fa-map-marker"></i><a
							class="google_map_link candidate-location"
							href="http://maps.google.com/maps?q=${company.getAddress()}&zoom=14&size=512x512&maptype=roadmap&sensor=false">
								${company.getAddress()}</a></span>
					</c:if>
					<span class="icons"> <c:if
							test="${not empty company.getWebsite()}">
							<a rel="nofollow" onclick="Redirect();"
								href="${company.getWebsite()}"><i class="fa fa-link"></i>Website</a>
						</c:if>
					</span>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="six columns">
			<div class="two-buttons">
				<div class="resume_contact">
					<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE','ROLE_COMPANY','ROLE_ADMIN')">
						<sec:authentication var="principal" property="principal" />
						<c:choose>
						<c:when test="${principal.id != company.getUserId()}">
							
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
									<form:form action="${pageContext.request.contextPath}/company/sendMessage" method="post" 
										id="contactForm" modelAttribute="contact">
										<div style="display: none;">
											<form:hidden path="userReceive" value="${company.getUserId()}"/>
											<form:hidden path="userSend" id="sender" value="${principal.id}"/>
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
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/company/edit" 
								class="button"> Update profile</a>
						</c:otherwise>
						</c:choose>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container ">
	<div class="eight columns">
		<div class="padding-right resume_description">
			<h3>About Me</h3>
			<p>&nbsp;</p>
			<p>${company.getTagline()}.</p>
		</div>
	</div>
	<c:if test="${not empty company.getVideo()}">
		<div class="eight columns">
			<h3 class="margin-bottom-20">Video</h3>
			<iframe width="420" height="345" src="${company.getVideo()}">
			</iframe>
		</div>
	</c:if>
</div>