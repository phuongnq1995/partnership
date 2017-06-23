<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">
		<div class="sixteen columns">
			<c:if test="${MESSAGE != null}">
				${MESSAGE}
			</c:if>
			<h1>Company Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to WorkScout."
							href="${pageContext.request.contextPath}/" class="home"><span>Company</span></a> </span></li>
					<li class="current_item"><span><span>Apply list
								Dashboard</span> </span></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<div class="container full-width">
	<article id="table-ajax"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">
		<nav class="woocommerce-MyAccount-navigation">
			<ul class="list-group">
				<c:forEach var="post" items="${posts}">
					<li>
						<button onclick="showApply('${post.getId()}')" id="show-apply">${post.getTitle()}</button>
						<span class="badge badge-notify">new</span>
					</li>
				</c:forEach>
			</ul>
		</nav>

		 <div class="woocommerce-MyAccount-content">
			<table id="table-response"
				class="resume-manager-resumes">
				<thead>
					<tr>
						<th>Full Name</th>
						<th>Email</th>
						<th>Message</th>
						<th>Cv</th>
					</tr>
				</thead>
				<tbody id="response-data">
				<tbody>
			</table>
		</div> 

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->

	</article>
</div>
<script type="text/javascript">
    function showApply(id){
    	var link = "${pageContext.request.contextPath}/post/showPostApply/"+ id ;
    	$.ajax({
    	    url : link,
    	    type: "GET",
    	    success: function (data) {
    	    	$('#response-data').empty();
    	    	var trHTML = '';
    	    	$.each(data, function (key,value) {
    	    		trHTML += 
    	                '<tr><td>' + value.fullname + 
    	                '</td><td>' + value.email + 
    	                '</td><td>' + value.message + 
    	                '</td><td>' + '<a href="${pageContext.request.contextPath}/cvApply/'+value.id+
    	                '"><i class="fa fa-link"></i>View cv</a>' + 
    	                '</td></tr>';     
    	          });
    	          $('#response-data').append(trHTML);
    	    }
    	  }); 
    }
</script>