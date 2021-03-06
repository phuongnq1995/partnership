<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">
			
			<h1>Admin Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to Home"
							href="${pageContext.request.contextPath}" class="home"><span>Admin</span></a> </span></li>
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
				<li><a href="${pageContext.request.contextPath}/admin/statistic"> Statistic</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/companies"> Companies</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/employees">Candidates</a>
				</li>
				<li><a href="${pageContext.request.contextPath}/admin/posts">Post</a>
				</li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<table
				class="resume-manager-resumes manage-table resumes responsive-table stacktable large-only">
				<thead>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Address</th>
						<th>Logo</th>
						<th>Actions</th>
				</thead>
				<tbody>
					<c:forEach var="company" items="${pages.getContent()}">
						<tr>
							<td><a href="${pageContext.request.contextPath}/company/${company.getId()}">
								${company.getName()}</a></td>
							<td>${s:substring(company.getTagline(),0,10)}..</td>
							<td>${company.getAddress()}</td>
							<c:choose>
								<c:when test="${empty company.getLogo()}">
									<td><img
										src="<c:url value="/resources/images/company.png"/>"
										width="100px" height="100px" /></td>
								</c:when>
								<c:otherwise>
									<td><img
										src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
										width="100px" height="100px" /></td>
								</c:otherwise>
							</c:choose>
							<td><a 
								class="small-dialog popup-with-zoom-anim button" href="#resume-dialog${company.getId()}" id="link-resume-dialog" 
								>Delete </a>
								<div id="resume-dialog${company.getId()}"
									class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
									<div class="small-dialog-headline">
										<h2>Are You Sure?</h2>
									</div>
									<div class="small-dialog-content">
										<div >
											<label for="full-name">You will delete all post of this
												company&hellip;</label>
											<div class="field required-field">
												<span class="wpcf7-form-control-wrap full-name"></span>
											</div>
											<p class="send-app-btn">
												<a class="button"
												 href="${pageContext.request.contextPath}/admin/companies/delete/${company.getId()}" >Delete</a>
												
											</p>
										</div>
									</div>
								</div>

							</td>

						</tr>
					</c:forEach>
				<tbody>
			</table>
			<nav class="job-manager-pagination pagination">
					<ul>
						<c:forEach var="page" begin="1" end="${pages.getTotalPages()}">
							<li>
								<c:choose>
									<c:when test="${pages.getNumber()+1 == page}">
										<span class="current" data-page="${page}">${page}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/admin/companies?page=${page}" data-page="${page}">${page}</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
						<!-- <li><span class="current" data-page="1"></span></li> -->
						<c:if test="${pages.hasNextPage()}">
							<li style="float: right; position: absolute; right: 0;"><a
							href="${pageContext.request.contextPath}/admin/companies?page=${pages.getNumber()+2}" data-page="{page}">Next</a></li>
						</c:if>
						<c:if test="${pages.hasPreviousPage()}">
							<li style="float: left; position: absolute; left:0;"><a
							href="${pageContext.request.contextPath}/admin/companies?page=${pages.getNumber()}" data-page="{page}">Previous</a></li>
						</c:if>
					</ul>
				</nav>
		</div>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->


	</article>
</div>
