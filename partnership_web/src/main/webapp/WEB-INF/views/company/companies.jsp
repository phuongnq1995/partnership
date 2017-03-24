<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
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
					<!-- Breadcrumb NavXT 5.6.0 -->
					<li class="home"><span property="itemListElement"
						typeof="ListItem"><a property="item" typeof="WebPage"
							title="Go to WorkScout." href="../workscout.html" class="home"><span
								property="name">Admin</span></a>
							<meta property="position" content="1"></span></li>
					<li class="current_item"><span property="itemListElement"
						typeof="ListItem"><span property="name">Company
								Dashboard</span>
							<meta property="position" content="2"></span></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
	<div class="row-fluid">
		<br />
		<c:if test="${SUCCESS_MESSAGE != null}">
			<div class="flash info">
				<strong>${SUCCESS_MESSAGE}</strong>
			</div>
		</c:if>
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="flash error">
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
			<table class="resume-manager-resumes manage-table resumes responsive-table stacktable large-only">
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
							<td><img
								src="${pageContext.request.contextPath}/imageCompany/${company.getId()}"
								width="100px" height="100px" /></td>
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
