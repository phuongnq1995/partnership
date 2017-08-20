<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<div id="titlebar">
	<div class="container">
		<div class="ten columns">
			
			<span>
				${parentNameCategory}
			</span>
			<h1>
				${post.getTitle()}
				<c:forEach items="${post.getTypes()}" var="type">
					<span class="job-type ${type.getName()}">${type.getName()}</span>
				</c:forEach>

			</h1>
			<div class="skills">
				<c:forEach items="${post.getCategories()}" var="category">
					<span>${category.getName()}</span>
				</c:forEach>
			</div>
			
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
			</c:if>
			
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
					href="${pageContext.request.contextPath}/company/${post.getCompany().getId()}">
					<c:choose>
						<c:when test="${empty post.getCompany().getLogo()}">
							<td><img alt="Photo" width="100px" height="100px"
								src="<c:url value="/resources/images/company.png"/>" /></td>
						</c:when>
						<c:otherwise>
							<img width="100px" height="100px"
								src="${pageContext.request.contextPath}/imageCompany/${post.getCompany().getId()}"
								alt="Photo" />
						</c:otherwise>
					</c:choose>
				</a>
				<div class="content">
					<h4>
						<a
							href="${pageContext.request.contextPath}/company/${post.getCompany().getId()}">
							<strong>${post.getCompany().getName()}</strong>
						</a>
					</h4>
					<c:if test="${not empty post.getCompany().getWebsite()}">
						<a rel="nofollow" onclick="Redirect();"
							href="${post.getCompany().getWebsite()}"><i class="fa fa-link"></i>Website</a>
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
															src="${pageContext.request.contextPath}/imageCompany/${post.getCompany().getId()}"
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
													<div class="skills">
														<c:forEach items="${perpost.getCategories()}" var="percategory">
															<span>${percategory.getName()}</span>
														</c:forEach>
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
								<fmt:formatDate value="${post.getDaypost()}" pattern="dd/MM/yyyy" /></span>
						</div></li>
				</ul>
				
				
				<security:authorize access="hasRole('ROLE_EMPLOYEE')">
				<div class="job_application application">
					
					<a  id="new-apply" href="#apply-dialog"
						class="small-dialog popup-with-zoom-anim button">Apply for job</a>
					
					<div id="apply-dialog"
						class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
						<div class="small-dialog-headline">
							<h2>Apply For This Job</h2>
						</div>
						<div class="small-dialog-content">
							<form:form class="job-manager-application-form job-manager-form"
								method="post" enctype="multipart/form-data" modelAttribute="postApply"
								action="${pageContext.request.contextPath}/post/applyPost" id="form-apply">
								
								<form:hidden path="postId" value="${post.getId()}"/>
								
								<fieldset class="fieldset-candidate_name">
									<label for="candidate_name">Your name<small>*</small></label>
									<div class="field">
										<form:input type="text" class="input-text" path="fullname" 
											id="candidate_name" placeholder="Your full name" value="${employee.getFullname()}"/>
									</div>
								</fieldset>
								<fieldset class="fieldset-candidate_email">
									<label for="candidate_name">Your email<small>*</small></label>
									<div class="field">
										<form:input type="email" class="input-text" path="email"
											value="${pageContext.request.userPrincipal.name}" placeholder="Your email"/>
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
										<label for="resume_file">Curriculum Vitae(CV) <small>(PDF)</small>
									</label> 
									<div class="field">
				
										<label class="fake-upload-btn">
											<div class="job-manager-uploaded-files"></div> <input type='file'
											name="fileUpload" class="input-text wp-job-manager-file-upload"
											accept="|pdf|" id="fileUploadCv" />
											<div class="upload-btn">
												<i class="fa fa-upload"></i>Browse
											</div>
										</label>
									</div>
									<p id="log"></p>
									<div>
											<a rel="nofollow" id="cv"
												href=""><i
												class="fa fa-link" ></i>Curriculum Vitae(CV)</a>
									</div>
								</fieldset>
								
								<p class="send-app-btn">
									<input type="submit" name="wp_job_manager_send_application"
										value="Send application" />
								</p>
							</form:form>
							<hr />
						</div>
					</div>
					</div>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_COMPANY')" >
					<div class="job_application application">
							<p class=" button">Sign up employee to apply</p>
					</div>
				</security:authorize>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<div class="job_application application">
						
							<p class="button ">
								<a href="#signup-dialog" class="small-dialog popup-with-zoom-anim">Sign up employee to apply</a>
							</p>
					</div>
				</c:if>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
    $("#new-apply").click(function(){
    	$.ajax({
    	    url:'${pageContext.request.contextPath}/employee/applyPost',
    	    type: "GET",
    	    success: function (data) {
	    	      if(data != null){
		    	      $('#candidate_name').val(data.fullname);
		    	      if(data.cv != null){
			    	      $('#cv').attr("href","${pageContext.request.contextPath}/cvEmployee/"+data.id);
		    	      }else{
		    	    	  $("#cv").attr("style","display: none;");
		    	      }
		    	      $("#form-apply").attr("modelAttribute", "postApply");
	    	      }
    	    }
    	  });
    });
    
    /* $("#form-apply").submit(function(){
    	var postApply = $("#postApply").serialize();
    	$.ajax({
    	    type:"post",
    	    data:postApply,
    	    url:"${pageContext.request.contextPath}/post/applyPost",
    	    async: false,
    	    success: function(data){
    	       $("#flash").text(data);
    	       $("#new-apply").text("Wait for response")
    	    }
    	});
    }) */
});
</script>
