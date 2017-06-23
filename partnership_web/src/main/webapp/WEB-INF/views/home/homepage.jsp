<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div
	style="background-image: url('<c:url value="/resources/images/banner-home-02.jpg"/>'); "
	data-img-width="2000" data-img-height="1330" data-diff="300"
	class="workscout-search-banner parallax background ">

	<div class="container">
		<div class="sixteen columns">
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
		</div>
		<div class="search-container sc-jobs">
			<!-- Form -->
			<h2>Find Job</h2>
			<form method="GET" action="/searchForm">
				<input type="text" id="keywords" name="keywords" class="ico-01"
					placeholder="job title, keywords or company name" value="" /> <input
					type="text" id="location" name="location" class="ico-02"
					placeholder="city, province or region" value="" />
				<button>
					<i class="fa fa-search"></i>
				</button>
			</form>
			<!-- Browse Jobs -->

			<div class="browse-jobs">
				Or browse job offers by <a
					href="browse-categories/browse-categories.html">category</a>

			</div>

			<!-- Announce -->
			<div class="announce">
				We have <strong>23</strong> job offers for you!
			</div>
		</div>
	</div>
</div>
