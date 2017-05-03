<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div
	style="background-image: url(https://39sf152pf74z2negmt1gi8ik-wpengine.netdna-ssl.com/wp-content/uploads/2016/10/banner-home-02.jpg);"
	data-img-width="2000" data-img-height="1330" data-diff="300"
	class="workscout-search-banner parallax background ">
	<div class="container">
		<div class="sixteen columns">
			<div class="message">
				<c:if test="${SUCCESS_MESSAGE != null}">
					<br>
					<div class="flash flash-info pull-right" id="flash">
						<strong style="color: green">${SUCCESS_MESSAGE}</strong>
					</div>
				</c:if>
				<c:if test="${ERROR_MESSAGE != null}">
					<br>
					<div class="flash flash-error pull-right" id="flash">
						<strong style="color: red">${ERROR_MESSAGE}</strong>
					</div>
				</c:if>
			</div>
			<div class="search-container sc-jobs">
				<!-- Form -->
				<h2>Find Job</h2>
				<form method="GET" action="https://workscout.in/browse-jobs/">
					<input type="text" id="search_keywords" name="search_keywords"
						class="ico-01" placeholder="job title, keywords or company name"
						value="" /> <input type="text" id="search_location"
						name="search_location" class="ico-02"
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
</div>
<script>
	$(document).ready(function() {
		$('#flash').delay(10000).fadeOut('slow');
	});
</script>