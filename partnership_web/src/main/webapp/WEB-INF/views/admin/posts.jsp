<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
			<h1>Admin Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to WorkScout."
							href="../workscout.html" class="home"><span>Admin</span></a> </span></li>
					<li class="current_item"><span><span>Company
								Dashboard</span> </span></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<div class="container full-width">

	<article id="post-14"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">

		<nav class="woocommerce-MyAccount-navigation">
			<ul>
				<li><a href="../my-bookmarks/my-bookmarks.html"> Companies</a></li>
				<li class=""><a href="https://workscout.in/my-account/">Candidates</a>
				</li>
				<li class=""><a href="https://workscout.in/my-account/orders/">Post</a>
				</li>
				<li class=""><a
					href="https://workscout.in/my-account/downloads/">User</a></li>
				<li class="">
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<form class="list-search" method="POST" action="searchPost">
				<div class="container wpjm-container right-sidebar margin-top-55">
					<!-- #secondary -->

					<article id="post-2871"
						class="eleven columns post-2871 page type-page status-publish hentry">
						<div class="padding-right">

							<div class="search_keywords">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
								<input type="text" name="keywords" id="keywords"
									placeholder="job title, keywords or company name"
									value="${keywords}" />
								<div class="clearfix"></div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />

							<div class="job_listings" data-location="" data-keywords=""
								data-show_filters="false" data-show_pagination="true"
								data-per_page="10" data-orderby="featured" data-order="DESC"
								data-categories="">
								<!-- Listings Loader -->
								<div class="listings-loader">
									<i class="fa fa-spinner fa-pulse"></i>
								</div>
								<ul class="job_listings job-list full ">
									<c:forEach items="${pages.getContent()}" var="perpost">
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
