<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<div
	style="background-image: url('<c:url value="/resources/images/banner-home-02.jpg"/>'); "
	data-img-width="2000" data-img-height="1330" data-diff="300"
	class="workscout-search-banner parallax background ">

	<div class="container">
		<c:if test="${MESSAGE != null}">
			${MESSAGE}
		</c:if>
		<div class="search-container sc-jobs">
			
			<!-- Form -->
			<h2>Find Job</h2>
			<form method="GET" action="${pageContext.request.contextPath}/post/searchForm">
				<input type="text" id="keywords" name="keywords" class="ico-01"
					placeholder="job title, keywords or company name" value="" /> 
					
				<select id="location" name="locationId" class="ico-02">
					<option value="0" >Select location</option>
					<c:forEach items="${locations}" var="location">
						<option value="${location.getId()}">${location.getName()}</option>
					</c:forEach>
				</select>
				<button>
					<i class="fa fa-search"></i>
				</button>
			</form>

			<!-- Announce -->
			<div class="announce">
				We have <strong>${postQuantity}</strong> job offers for you!
			</div>
		</div>
	</div>
</div>

<div class="container page-container home-page-container">

	<article
		class="sixteen columns post-9 page type-page status-publish hentry">
		<div class="vc_row wpb_row vc_row-fluid">

			<div class="wpb_column vc_column_container vc_col-sm-12">

				<div class="vc_column-inner ">
					<div class="wpb_wrapper">
						<h3 class="margin-top-0 margin-bottom-25">Popular Categories</h3>

						<ul id="popular-categories">
							<c:forEach items="${categories}" var="category">
								<li><a
									href="${pageContext.request.contextPath}/employee/searchByCategory/${category.getId()}">
										<i class="${category.getIcon()}"></i>${category.getName()}</a></li>
							</c:forEach>
						</ul>
						<div class="clearfix"></div>
						<div class="margin-top-30"></div>
						<a href="javascript:void(0)"
							class="button centered">Browse All Categories</a>
						<div class="margin-bottom-50"></div>
					</div>
				</div>

			</div>

		</div>

		<div class="vc_row wpb_row vc_row-fluid">
			<div class="wpb_column vc_column_container vc_col-sm-8">

				<div class="vc_column-inner ">
					<div class="wpb_wrapper">
						<h3 class="margin-top-0 margin-bottom-25">Recent Jobs</h3>

						<ul class="job_listings job-list full hide-desc">
							<c:forEach items="${posts}" var="perpost">
								<li class="job_listing"><a
									href="${pageContext.request.contextPath}/post/${perpost.getId()}">
										<c:choose>
											<c:when test="${empty perpost.getCompany().getLogo()}">
												<td><img alt="Photo" width="100px" height="100px"
													src="<c:url value="/resources/images/company.png"/>" /></td>
											</c:when>
											<c:otherwise>
												<img width="100px" height="100px"
													src="${pageContext.request.contextPath}/imageCompany/${perpost.getCompany().getId()}"
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
													</c:forEach></span><span class="ws-meta-salary"> <i class="fa fa-money"></i>
													<c:choose>
														<c:when
															test="${perpost.getMinsalary() == 0 && perpost.getMaxsalary() == 0}">negotiate
												</c:when>
														<c:otherwise>
															<c:if test="${perpost.getMinsalary() != 0}">
							 							from &#36;${perpost.getMinsalary()}</c:if>
															<c:if test="${perpost.getMaxsalary() != 0}">
							  							to &#36;${perpost.getMaxsalary()}  </c:if>
														</c:otherwise>
													</c:choose>
												</span>
											</div>
											<div class="listing-desc">
												<p>${fn:substring(perpost.getDescription(), 0, 100)}</p>
											</div>
										</div>
								</a>
									<div class="clearfix"></div></li>
							</c:forEach>

						</ul>
					</div>
				</div>
			</div>

			<div class="wpb_column vc_column_container vc_col-sm-4">
				<div class="vc_column-inner ">
					<div class="wpb_wrapper">
						<h3 class="margin-bottom-5">Job Spotlight</h3>
						<!-- Navigation -->
						<div class="showbiz-navigation">
							<div id="showbiz_left_73" class="sb-navigation-left">
								<i class="fa fa-angle-left"></i>
							</div>
							<div id="showbiz_right_75" class="sb-navigation-right">
								<i class="fa fa-angle-right"></i>
							</div>
						</div>
						<div class="clearfix"></div>

						<!-- Showbiz Container -->
						<div id="job-spotlight" data-delay="5000" data-autoplay="off"
							class="job-spotlight-car showbiz-container"
							data-visible="[1,1,1,1]">
							<div class="showbiz" data-left="#showbiz_left_73"
								data-right="#showbiz_right_75" data-play="#showbiz_play_74"
								id="sbiz7508">
								<div class="overflowholder" style="height: 502px;">
									<ul
										style="width: 4736px; transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, -0.00333, -3537, 0, 0, 1); height: 502px;">

										<c:forEach items="${mostPost}" var="perMost">
											<li style="width: 373px;">
												<div class="job-spotlight">
													<a
														href="${pageContext.request.contextPath}/post/${perpost.getId()}"><h4>
															${perMost.getTitle()}<br>
															<c:forEach items="${perMost.getTypes()}" var="typeMost">
																<span class="job-type ${typeMost.getName()}">${typeMost.getName()}</span>
															</c:forEach>
														</h4></a> <span class="ws-meta-company-name"><i
														class="fa fa-briefcase"></i>
														${perMost.getCompany().getName()}</span><br> <span
														class="ws-meta-job-location"><i
														class="fa fa-map-marker"></i> <c:forEach
															items="${perMost.getLocations()}" var="locationMost"
															varStatus="loop"> ${locationMost.getName()}<c:if
																test="${!loop.last}">,</c:if>
														</c:forEach></span><br> <span class="ws-meta-salary"> <i
														class="fa fa-money"></i> <c:choose>
															<c:when
																test="${perMost.getMinsalary() == 0 && perMost.getMaxsalary() == 0}">negotiate
												</c:when>
															<c:otherwise>
																<c:if test="${perMost.getMinsalary() != 0}">
							 							from &#36;${perMost.getMinsalary()}</c:if>
																<c:if test="${perMost.getMaxsalary() != 0}">
							  							to &#36;${perMost.getMaxsalary()}  </c:if>
															</c:otherwise>
														</c:choose>
													</span><br>
													<p>${fn:substring(perMost.getDescription(), 0, 100)}...</p>
													<security:authorize access="hasRole('ROLE_EMPLOYEE')">
														<div class="job_application application">

															<a id="new-apply" href="#apply-dialog"
																class="small-dialog popup-with-zoom-anim button">Apply
																for job</a>

															<div id="apply-dialog"
																class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
																<div class="small-dialog-headline">
																	<h2>Apply For This Job</h2>
																</div>
																<div class="small-dialog-content">
																	<form:form
																		class="job-manager-application-form job-manager-form"
																		method="post" enctype="multipart/form-data"
																		modelAttribute="postApply"
																		action="${pageContext.request.contextPath}/post/applyPost"
																		id="form-apply">

																		<form:hidden path="postId" value="${perMost.getId()}" />
	
																		<fieldset class="fieldset-candidate_name">
																			<label for="candidate_name">Your name<small>*</small></label>
																			<div class="field">
																				<form:input type="text" class="input-text"
																					path="fullname" id="candidate_name"
																					placeholder="Your full name"
																					value="${employee.getFullname()}" />
																			</div>
																		</fieldset>
																		<fieldset class="fieldset-candidate_email">
																			<label for="candidate_name">Your email<small>*</small></label>
																			<div class="field">
																				<form:input type="email" class="input-text"
																					path="email"
																					value="${pageContext.request.userPrincipal.name}"
																					placeholder="Your email" />
																			</div>
																		</fieldset>
																		<fieldset class="fieldset-application_message">
																			<label for="application_message">Message</label>
																			<div class="field required-field">
																				<form:textarea cols="20" rows="3" class="input-text"
																					path="message" id="application_message"
																					placeholder="Your cover letter/message sent to the employer" />
																			</div>
																		</fieldset>
																		<fieldset class="fieldset-application_attachment">
																			<label for="resume_file">Curriculum Vitae(CV)
																				<small>(PDF)</small>
																			</label>
																			<div class="field">

																				<label class="fake-upload-btn">
																					<div class="job-manager-uploaded-files"></div> <input
																					type='file' name="fileUpload"
																					class="input-text wp-job-manager-file-upload"
																					accept="|pdf|" id="resume_file" />
																					<div class="upload-btn">
																						<i class="fa fa-upload"></i>Browse
																					</div>
																				</label>
																			</div>
																			<p id="log"></p>
																			<div>
																				<a rel="nofollow" id="cv" href=""><i
																					class="fa fa-link"></i>Curriculum Vitae(CV)</a>
																			</div>
																		</fieldset>

																		<p class="send-app-btn">
																			<input type="submit"
																				name="wp_job_manager_send_application"
																				value="Send application" />
																		</p>
																	</form:form>
																	<hr />
																</div>
															</div>
														</div>
													</security:authorize>
													<security:authorize access="hasRole('ROLE_COMPANY')">
														<div class="job_application application">
															<a href="#signup-dialog"
																class="small-dialog popup-with-zoom-anim button">Sign
																up employee to apply</a>
														</div>
													</security:authorize>
													<c:if test="${pageContext.request.userPrincipal == null}">
														<div class="job_application application">

															<a href="#signup-dialog"
																class="small-dialog popup-with-zoom-anim button">Sign
																up employee to apply</a>

														</div>
													</c:if>
												</div>
											</li>
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

	</article>

</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#new-apply").click(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/employee/applyPost',
			type : "GET",
			success : function(data) {
				if (data != null) {
					$('#candidate_name').val(data.fullname);
					if (data.cv != null) {
						$('#cv').attr("href","${pageContext.request.contextPath}/cvEmployee/"+ data.id);
					} else {
						$("#cv").attr("style","display: none;");
					}
					$("#form-apply").attr("modelAttribute","postApply");
				}
			}
		});
	});
});
var input = document.getElementById("resume_file");
input.onclick = function() {
	this.value = null;
};
input.onchange = function() {
	var path = input.value;
	var filename = "";
	if (path.lastIndexOf("\\") != -1)
		filename = path.substring(path.lastIndexOf("\\") + 1, path.length);
	else
		filename = path.substring(path.lastIndexOf("/") + 1, path.length);
	document.getElementById("log").innerHTML = filename;
};
</script>

