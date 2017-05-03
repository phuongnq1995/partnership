<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">
			<h1>Company Dashboard</h1>
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
<div class="row-fluid">
	<c:if test="${SUCCESS_MESSAGE != null}">
		<br>
		<div class="flash info pull-right" id="flash">
			<strong>${SUCCESS_MESSAGE}</strong>
		</div>
	</c:if>
	<c:if test="${ERROR_MESSAGE != null}">
		<br>
		<div class="flash error pull-right" id="flash">
			<strong>${ERROR_MESSAGE}</strong>
		</div>
	</c:if>
</div>
<div class="container full-width">

	<article id="post-14"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">

		<nav class="woocommerce-MyAccount-navigation">
			<ul>
				<li><a href="../my-bookmarks/my-bookmarks.html"> My
						Bookmarks </a></li>
				<li class=""><a href="https://workscout.in/my-account/">Dashboard</a>
				</li>
				<li class=""><a href="https://workscout.in/my-account/orders/">Orders</a>
				</li>
				<li class=""><a
					href="https://workscout.in/my-account/downloads/">Downloads</a></li>
				<li class=""><a
					href="https://workscout.in/my-account/edit-address/">Addresses</a>
				</li>
				<li class=""><a
					href="https://workscout.in/my-account/edit-account/">Account
						Details</a></li>
				<li class=""><a
					href="https://workscout.in/my-account/customer-logout/">Logout</a>
				</li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<table
				class="resume-manager-resumes manage-table resumes responsive-table stacktable large-only">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
						<th>Address</th>
						<th>Logo</th>
						<th>Actions</th>
				</thead>
				<tbody>
					<c:forEach var="company" items="${companies}">
						<tr>
							<td>${company.getId()}</td>
							<td>${company.getName()}</td>
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
							<td><a href="companies/delete/${company.getId()}"
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
<script>
	$(document).ready(function() {
		$('#flash').delay(10000).fadeOut('slow');
	});

	
</script>