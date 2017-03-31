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
						class="icons"> <a rel="nofollow" href="${pageContext.request.contextPath}/cvEmployee/${employee.getId()}"><i
							class="fa fa-link"></i>Curriculum Vitae(CV)</a>
							
					</span>
					<div class="skills">
						<span>javascript</span><span>wordpress</span>
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

				<div class="job-manager-form wp-job-manager-bookmarks-form">
					<div>
						<a class="bookmark-notice button dark bookmark-notice"
							href="https://workscout.in/my-account/">Login to bookmark
							this Resume</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<div class="container ">

	<!-- Recent Jobs -->
	<div class="eight columns">
		<div class="padding-right resume_description">
			<h3>About Me</h3>
			<p>&nbsp;</p>
			<p>Ut sodales arcu sagittis metus molestie molestie. Nulla
				maximus volutpat dui. Etiam luctus lobortis massa in pulvinar.
				Maecenas nunc odio, faucibus in malesuada a, dignissim at odio.
				Aenean eleifend urna.</p>
			<p>Duis ac augue sit amet ex blandit facilisis sit amet ut dui.
				Nulla pharetra fermentum mollis. Duis in tempor tortor. Suspendisse
				vitae nisl diam. Proin eu erat vestibulum, suscipit quam et, cursus
				ante.</p>
			<div class="margin-top-30"></div>
			<p>&nbsp;</p>
			<p>
				<strong>Personal Characteristics:</strong>
			</p>
			<ul class="list-1">
				<li>Excellent customer service skills, communication skills,
					and a happy, smiling attitude are essential.</li>
				<li>Available to work required shifts including weekends,
					evenings and holidays.</li>
				<li>I have great time management skills.</li>
				<li>I take constructive criticism well and I am comfortable
					voicing opinions.</li>
			</ul>
		</div>
	</div>

	<!-- Widgets -->
	<div class="eight columns">
		<h3 class="margin-bottom-20">Education</h3>
		<dl class="resume-table resume-manager-education">

			<dt>
				<small class="date">2012-2015</small> <strong><span
					class="qualification">School of Arts &amp; Sciences</span> at <span
					class="location">Stanford University</span></strong>
			</dt>
			<dd>
				<p>Maximus faucibus non non nibh. Cras luctus velit et ante
					vehicula, sit amet commodo magna eleifend. Fusce congue ante id
					urna porttitor luctus.</p>
			</dd>


			<dt>
				<small class="date">2010-2012</small> <strong><span
					class="qualification">School of Design</span> at <span
					class="location">University of Pennsylvania</span></strong>
			</dt>
			<dd>
				<p>Phasellus vestibulum metus orci, ut facilisis dolor interdum
					eget. Pellentesque magna sem, hendrerit nec elit sit amet, ornare
					efficitur est.</p>
			</dd>


			<dt>
				<small class="date">2006-2010</small> <strong><span
					class="qualification"></span> at <span class="location">Massachusetts
						Institute of Technology</span></strong>
			</dt>
			<dd>
				<p>Suspendisse lorem lorem, aliquet at lectus quis, porttitor
					porta sapien. Etiam ut turpis tempor, vulputate risus at, elementum
					dui. Etiam faucibus.</p>
			</dd>

		</dl>


	</div>


</div>