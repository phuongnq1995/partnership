<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="titlebar">
	<div class="container">
		<div class="ten columns">
			<span><a
				href="../../job-category/restaurant-food-service/restaurant-food-service.html">Restaurant
					/ Food Service</a></span>
			<h1>
				${post.getTitle()}
				<c:forEach items="${post.getTypes()}" var="type">
					<span class="job-type ${type.getName()}">${type.getName()}</span>
				</c:forEach>
			</h1>

		</div>
		<div class="six columns">
			<div class="job-manager-form wp-job-manager-bookmarks-form">
				<div>
					<a class="bookmark-notice button dark bookmark-notice"
						href="https://workscout.in/my-account/">Contact</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Content
================================================== -->
<div class="container right-sidebar">
	<div class="sixteen columns"></div>
	<!-- Recent Jobs -->
	<div class="eleven columns ">
		<div class="padding-right">
			<!-- Company Info -->
			<div class="company-info left-company-logo">
				<a
					href="${pageContext.request.contextPath}/company/${company.getId()}">
					<c:choose>
						<c:when test="${empty post.getCompany().getLogo()}">
							<td><img alt="Photo" width="100px" height="100px"
								src="<c:url value="/resources/images/company.png"/>" /></td>
						</c:when>
						<c:otherwise>
							<img width="100px" height="100px"
								src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
								alt="Photo" />
						</c:otherwise>
					</c:choose>
				</a>
				<div class="content">
					<h4>
						<a
							href="${pageContext.request.contextPath}/company/${company.getId()}">
							<strong>${post.getCompany().getName()}</strong>
						</a>
					</h4>
					<c:if test="${not empty company.getWebsite()}">
						<a rel="nofollow" onclick="Redirect();"
							href="${company.getWebsite()}"><i class="fa fa-link"></i>Website</a>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="single_job_listing">
				<div class="job_description">
					<h3>Description job</h3>
					<p>${post.getDescription()}</p>
				</div>
				<div class="job_description">
					<h3>Requirements job</h3>
					<p>${post.getRequirement()}</p>

				</div>

				<div class="clearfix"></div>
				<div class="wpb_wrapper">
					<h3 class="margin-bottom-5 margin-top-55">Related Jobs</h3>
					<div class="wpb_text_column wpb_content_element ">
						<div class="wpb_wrapper">
							<div class="job_listings">
								<ul class="job_listings">
									<c:forEach items="${posts}" var="perpost">
										<li class="job_listing"><a
											href="${pageContext.request.contextPath}/post/${perpost.getId()}">
												<c:choose>
													<c:when test="${empty post.getCompany().getLogo()}">
														<td><img alt="Photo" width="70px" height="70px"
															src="<c:url value="/resources/images/company.png"/>" /></td>
													</c:when>
													<c:otherwise>
														<img width="70px" height="70px"
															src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
															alt="Photo" />
													</c:otherwise>
												</c:choose>
												<div class="job-list-content">
													<h4>
														${perpost.getTitle()}
														<c:forEach items="${perpost.getTypes()}" var="type">
															<span class="job-type ${type.getName()}">${type.getName()}</span>
														</c:forEach>
													</h4>

													<div class="job-icons">
														<span class="ws-meta-company-name"><i
															class="fa fa-briefcase"></i>
															${perpost.getCompany().getName()}</span> <span
															class="ws-meta-job-location"><i
															class="fa fa-map-marker"></i> <c:forEach
																items="${perpost.getLocations()}" var="location"
																varStatus="loop">${location.getName()}<c:if
																	test="${!loop.last}">,</c:if>
															</c:forEach></span><span class="ws-meta-salary"> <i
															class="fa fa-money"></i> <c:choose>
																<c:when
																	test="${empty post.getMinsalary() && empty post.getMaxsalary()}">negotiate
									</c:when>
																<c:otherwise>
																	<c:if test="${not empty post.getMinsalary()}">
							 from &#36;${post.getMinsalary()}</c:if> to <c:if
																		test="${not empty post.getMaxsalary()}">
							 &#36;${post.getMaxsalary()}</c:if>
																</c:otherwise>
															</c:choose>
														</span>
													</div>
												</div>
										</a>
											<div class="clearfix"></div></li>
									</c:forEach>
								</ul>
								<div class="clearfix"></div>

							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- Widgets -->
	<div class="five columns" id="job-details">
		<!-- Sort by -->
		<div class="widget">
			<h4>Job Overview</h4>
			<div class="job-overview">
				<ul>
					<li><i class="fa fa-graduation-cap"></i>
						<div>
							<strong>Position:</strong> <span> ${post.getPosition()}</span>
						</div></li>
					<li><i class="fa fa-map-marker"></i>
						<div>
							<strong>Work Location:</strong> <span class="location"> <c:forEach
									items="${post.getLocations()}" var="location" varStatus="loop">
									<a class="google_map_link"
										href="http://maps.google.com/maps?q=${location.getName()};zoom=14&038;size=512x512&038;maptype=roadmap&038;sensor=false"
										target="_blank">${location.getName()}</a>
									<c:if test="${!loop.last}">,</c:if>
								</c:forEach>
							</span>
						</div></li>
					<li><i class="fa fa-user"></i>
						<div>
							<strong>Job Title:</strong> <span>${post.getTitle()}</span>
						</div></li>

					<li><i class="fa fa-money"></i>
						<div>
							<strong>Salary:</strong> <span><c:choose>
									<c:when
										test="${empty post.getMinsalary() && empty post.getMaxsalary()}">negotiate
									</c:when>
									<c:otherwise>
										<c:if test="${not empty post.getMinsalary()}">
							 from &#36;${post.getMinsalary()}</c:if> to <c:if
											test="${not empty post.getMaxsalary()}">
							 &#36;${post.getMaxsalary()}</c:if>
									</c:otherwise>
								</c:choose></span>
						</div></li>
					<li><i class="fa fa-calendar"></i>
						<div>
							<strong>Date Posted:</strong> <span>Posted
								${post.getDaypost().toString()}</span>
						</div></li>
				</ul>
				<div class="job_application application">
					<a href="#apply-dialog"
						class="small-dialog popup-with-zoom-anim button">Apply for job</a>

					<div id="apply-dialog"
						class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
						<div class="small-dialog-headline">
							<h2>Apply For This Job</h2>
						</div>
						<div class="small-dialog-content">
							<form class="job-manager-application-form job-manager-form"
								method="post" enctype="multipart/form-data"
								action="https://workscout.in/job/restaurant-dishwasher/">

								<fieldset class="fieldset-candidate_name">
									<label for="candidate_name">Full name</label>
									<div class="field required-field">
										<input type="text" class="input-text" name="candidate_name"
											id="candidate_name" placeholder="" value="" maxlength=""
											required />
									</div>
								</fieldset>
								<fieldset class="fieldset-candidate_email">
									<label for="candidate_email">Email address</label>
									<div class="field required-field">
										<input type="text" class="input-text" name="candidate_email"
											id="candidate_email" placeholder="" value="" maxlength=""
											required />
									</div>
								</fieldset>
								<fieldset class="fieldset-application_message">
									<label for="application_message">Message</label>
									<div class="field required-field">
										<textarea cols="20" rows="3" class="input-text"
											name="application_message" id="application_message"
											placeholder="Your cover letter/message sent to the employer"
											maxlength="" required></textarea>
									</div>
								</fieldset>
								<fieldset class="fieldset-application_attachment">
									<label for="application_attachment">Upload CV <small>(optional)</small></label>
									<div class="field ">

										<label class="fake-upload-btn no_ajax">
											<div class="job-manager-uploaded-files"></div> <input
											type="file" class="ws-file-upload input-text"
											data-file_types="jpg|jpeg|jpe|gif|png|bmp|tiff|tif|ico|asf|asx|wmv|wmx|wm|avi|divx|flv|mov|qt|mpeg|mpg|mpe|mp4|m4v|ogv|webm|mkv|3gp|3gpp|3g2|3gp2|txt|asc|c|cc|h|srt|csv|tsv|ics|rtx|css|vtt|dfxp|mp3|m4a|m4b|ra|ram|wav|ogg|oga|mid|midi|wma|wax|mka|rtf|js|pdf|class|tar|zip|gz|gzip|rar|7z|psd|xcf|doc|pot|pps|ppt|wri|xla|xls|xlt|xlw|mdb|mpp|docx|docm|dotx|dotm|xlsx|xlsm|xlsb|xltx|xltm|xlam|pptx|pptm|ppsx|ppsm|potx|potm|ppam|sldx|sldm|onetoc|onetoc2|onetmp|onepkg|oxps|xps|odt|odp|ods|odg|odc|odb|odf|wp|wpd|key|numbers|pages"
											multiple name="application_attachment[]"
											id="application_attachment" placeholder="" />
											<div class="upload-btn">
												<i class="fa fa-upload"></i> Browse
											</div>
										</label> <small class="description"> Upload your CV/resume or
											any other relevant file. Max. file size: 50 MB. </small>
									</div>
								</fieldset>


								<p class="send-app-btn">
									<input type="submit" name="wp_job_manager_send_application"
										value="Send application" />
								</p>
							</form>
							<hr />
							<form class="apply_with_resume" method="post"
								action="https://workscout.in/submit-resume/">
								<p>You can apply to this job and others using your online
									resume. Click the link below to submit your online resume and
									email your application to this employer.</p>

								<p>
									<input type="submit"
										name="wp_job_manager_resumes_apply_with_resume_create"
										value="Submit resume and apply" />
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>