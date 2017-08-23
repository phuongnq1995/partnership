<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">
			
			<h1>Admin Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to WorkScout."
							href="../workscout.html" class="home"><span>Admin</span></a> </span></li>
					<li class="current_item"><span><span>Company
								Dashboard</span> </span></li>
				</ul>
			</nav>
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
		</div>
	</div>
</div>
<div class="container full-width">

	<article id="post-14"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">

		<nav class="woocommerce-MyAccount-navigation">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/admin/statistic">
						Statistic</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/companies"> Companies</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/employees">Candidates</a>
				</li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/posts">Post</a>
				</li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<form class="list-search" method="POST" action="${pageContext.request.contextPath}/admin/acceptPosts" id="admin-post">
			
				<div class="container wpjm-container right-sidebar">
					<!-- #secondary -->

					<article id="post-2871"
						class="eleven columns post-2871 page type-page status-publish hentry">
						<div class="padding-right">

							<div class="search_keywords">
								<a class="button pull-right" id="delete-post"  style="background-color:#a73939">Delete</a>
								<a class="button pull-right" id="accept-post" 
								 style="margin-right: 15px;" >Accept</a>
								<div class="clearfix"></div>
							</div>
							
							<input type="hidden" value="1" name="mode" id="mode-admin"/>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />

							<div class="job_listings margin-top-15" data-show_filters="false"
								data-show_pagination="true" data-orderby="featured"
								data-order="DESC">
								<!-- Listings Loader -->
								<div class="listings-loader">
									<i class="fa fa-spinner fa-pulse"></i>
								</div>
								<ul class="job_listings job-list full ">
									<c:forEach items="${pages.getContent()}" var="perpost">
										<li class="job_listing">
											<div class="admin-post">
												<c:choose>
													<c:when test="${empty perpost.getCompany().getLogo()}">
														<td><img alt="Photo" width="70px" height="70px"
															src="<c:url value="/resources/images/company.png"/>" /></td>
													</c:when>
													<c:otherwise>
														<img width="70px" height="70px"
															src="${pageContext.request.contextPath}/imageCompany/${perpost.getCompany().getId()}"
															alt="Photo" />
													</c:otherwise>
												</c:choose>
												<div class="job-list-content">
													<h4 class="checkboxes pull-right" style="margin-bottom: 0;">
														<input type="checkbox" name="check_post" value="${perpost.getId()}"
															id="salary_check_${perpost.getId()}" class="filter_by_check"> <label
															for="salary_check_${perpost.getId()}"></label>
													</h4>
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
											</div>

										</li>
									</c:forEach>
								</ul>
								<nav class="job-manager-pagination pagination">
									<ul>
										<c:forEach var="page" begin="1" end="${pages.getTotalPages()}">
											<li><c:choose>
													<c:when test="${pages.getNumber()+1 == page}">
														<span class="current" data-page="${page}">${page}</span>
													</c:when>
													<c:otherwise>
														<a
															href="${pageContext.request.contextPath}/post/index?page=${page}"
															data-page="${page}">${page}</a>
													</c:otherwise>
												</c:choose></li>
										</c:forEach>
										<!-- <li><span class="current" data-page="1"></span></li> -->
										<c:if test="${pages.hasNextPage()}">
											<li style="float: right; position: absolute; right: 0;"><a
												href="${pageContext.request.contextPath}/post/index?page=${pages.getNumber()+2}"
												data-page="{page}">Next</a></li>
										</c:if>
										<c:if test="${pages.hasPreviousPage()}">
											<li style="float: left; position: absolute; left: 0;"><a
												href="${pageContext.request.contextPath}/post/index?page=${pages.getNumber()}"
												data-page="{page}">Previous</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
							<footer class="entry-footer"> </footer>
						</div>
					</article>
				</div>
			</form>
		</div>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->


	</article>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#accept-post").click(function() {
		$("#admin-post").submit();
	});
	
	$("#delete-post").click(function() {
		$("#mode-admin").val(0);
		$("#admin-post").submit();
	});
});
</script>