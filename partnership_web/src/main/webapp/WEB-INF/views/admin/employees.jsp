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
					<li class="current_item"><span><span>Candidates
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
				<li class=""><a href="${pageContext.request.contextPath}/admin/posts">Post</a>
				</li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<table
				class="resume-manager-resumes manage-table resumes responsive-table stacktable large-only">
				<thead>
					<tr>
						<th>Name</th>
						<th>Avatar</th>
						<th>Phone</th>
						<th>Job</th>
						<th>Actions</th>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${pages.getContent()}">
						<tr>
							<td><a href="${pageContext.request.contextPath}/employee/${employee.getId()}">${employee.getFullname()}</a></td>
							<c:choose>
								<c:when test="${empty employee.getAvatar()}">
									<td><img src="<c:url value="/resources/images/user.png"/>"
									width="100px" height="100px" class="candidate_photo" /></td>
								</c:when>
								<c:otherwise>
									<td><img width="100px" height="100px"
									src="${pageContext.request.contextPath}/imageEmployee/${employee.getId()}"
									alt="Photo"  class="candidate_photo"/></td>
								</c:otherwise>
							</c:choose>
							<td>${employee.getPhone()}</td>
							<td>${employee.getJobName()}</td>
							<td><a href="companies/delete/${employee.getId()}"
								class="button">Delete </a></td>

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
									<a href="${pageContext.request.contextPath}/admin/employees?page=${page}" data-page="${page}">${page}</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
					<!-- <li><span class="current" data-page="1"></span></li> -->
					<c:if test="${pages.hasNextPage()}">
						<li style="float: right; position: absolute; right: 0;"><a
						href="${pageContext.request.contextPath}/admin/employees?page=${pages.getNumber()+2}" data-page="{page}">Next</a></li>
					</c:if>
					<c:if test="${pages.hasPreviousPage()}">
						<li style="float: left; position: absolute; left:0;"><a
						href="${pageContext.request.contextPath}/admin/employees?page=${pages.getNumber()}" data-page="{page}">Previous</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->


	</article>
</div>
