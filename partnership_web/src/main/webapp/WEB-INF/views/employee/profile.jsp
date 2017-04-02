<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="titlebar" class="resume">
	<div class="container">
		<div class="ten columns">
			<div class="resume-titlebar photo-rounded">
				<c:choose>
					<c:when test="${empty employee.getAvatar()}">
						<td><img src="<c:url value="/resources/images/user.png"/>"
							width="100px" height="100px" /></td>
					</c:when>
					<c:otherwise>
						<img class="candidate_photo"
							src="${pageContext.request.contextPath}/imageEmployee/${employee.getId()}"
							alt="Photo" />
					</c:otherwise>
				</c:choose>

				<div class="resumes-content">
					<h4>
						${employee.getFullname()} <span>UX/UI Graphic Designer</span>
					</h4>
					<span class="icons"><i class="fa fa-map-marker"></i><a
						class="google_map_link candidate-location"
						href="http://maps.google.com/maps?q=${employee.getLocation().getName()}&zoom=14&size=512x512&maptype=roadmap&sensor=false">
							${employee.getLocation().getName()}</a></span> <span class="icons"><i
						class="fa fa-birthday-cake"></i> &#36;${employee.getBirthday()}</span> <span
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

					<a href="#resume-dialog"
						class="small-dialog popup-with-zoom-anim button"><i
						class="fa fa-envelope"></i> Contact</a>
					<div id="resume-dialog"
						class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
						<div class="small-dialog-headline">
							<h2>Send Message</h2>
						</div>
						<div class="small-dialog-content">
							<div role="form" class="wpcf7" id="wpcf7-f2896-p2403-o1"
								lang="en-US" dir="ltr">
								<div class="screen-reader-response"></div>
								<form action="/resume/albert-smith/#wpcf7-f2896-p2403-o1"
									method="post" class="wpcf7-form" novalidate="novalidate">
									<div style="display: none;">
										<input type="hidden" name="_wpcf7" value="2896" /> <input
											type="hidden" name="_wpcf7_version" value="4.7" /> <input
											type="hidden" name="_wpcf7_locale" value="en_US" /> <input
											type="hidden" name="_wpcf7_unit_tag"
											value="wpcf7-f2896-p2403-o1" /> <input type="hidden"
											name="_wpnonce" value="ab5e5c8866" />
									</div>
									<fieldset>
										<label for="full-name">Full name</label>
										<div class="field required-field">
											<span class="wpcf7-form-control-wrap full-name"><input
												type="text" name="full-name" value="" size="40"
												class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
												aria-required="true" aria-invalid="false" /></span>
										</div>
									</fieldset>
									<fieldset>
										<label for="full-name">Email</label>
										<div class="field required-field">
											<span class="wpcf7-form-control-wrap your-email"><input
												type="email" name="your-email" value="" size="40"
												class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email"
												aria-required="true" aria-invalid="false" /></span>
										</div>
									</fieldset>
									<fieldset class="fieldset-message">
										<label for="message">Message</label>
										<div class="field required-field">
											<span class="wpcf7-form-control-wrap your-message"><textarea
													name="your-message" cols="40" rows="10"
													class="wpcf7-form-control wpcf7-textarea"
													aria-invalid="false"></textarea></span>
										</div>
									</fieldset>
									<p class="send-app-btn">
										<input type="submit" value="Send"
											class="wpcf7-form-control wpcf7-submit" />
									</p>
									<div class="wpcf7-response-output wpcf7-display-none"></div>
								</form>
							</div>
						</div>
					</div>
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