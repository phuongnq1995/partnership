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
				<li><a href="${pageContext.request.contextPath}/admin/companies"> Companies</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/employees">Candidates</a>
				</li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/posts">Post</a>
				</li>
				<li class=""><a
					href="${pageContext.request.contextPath}/admin/users">User</a></li>
				<li class="">
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
					<c:forEach var="employee" items="${employees}">
						<tr>
							<td>${employee.getFullname()}</td>
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
		</div>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->


	</article>
</div>
