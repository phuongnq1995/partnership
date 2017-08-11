<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">
		<div class="sixteen columns">
			
			<h1>My Contact</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to WorkScout."
							href="${pageContext.request.contextPath}" class="home"><span>Home</span></a>
					</span></li>
					<li class="current_item"><span><span>My Contact
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
	<article id="table-ajax"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">
		<nav class="woocommerce-MyAccount-navigation">
			<ul class="list-group">

				<a href="https://workscout.in/candidate-dashboard/" class="button"
					style="width: 100%;"> Compose </a>

				<li><a href="${pageContext.request.contextPath}/showContact" >
						Inbox(<span id="notseen">${notseensize}</span>/${notdeleted}) </a></li>
				<li><a href="https://workscout.in/job-alerts/"> Sent Mail </a>
				</li>
				<li><a href="https://workscout.in/my-bookmarks/"> Trash </a></li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<table id="table-response" class="resume-manager-resumes">
				<thead>
					<tr>
						<th class="resume-title"><i class="fa fa-user"></i> From</th>
						<th class="candidate-title"><i class="fa fa-file-text"></i>
							Messages</th>
						<th class="candidate-location"><i class="fa fa-calendar"></i>
							Time</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="response-contact">
					<c:forEach items="${contacts}" var="contact">
						<tr ${contact[4] != 0 ? "class='was-seen'" : "class='znot-seen'"}
							id="contact-${contact[0] }" >
							
							<td>${contact[5]}</td>
							<td>${s:substring(contact[2],0,10)}...</td>
							<td><fmt:formatDate value="${contact[3]}"
									pattern="HH:mm:ss dd/MM/yyyy" /></td>
							<td>
							
							<a href="#resume-dialog_${contact[0]}" id="read-message"
								class=" small-dialog popup-with-zoom-anim button "
								onclick="changeStatus(${contact[0]});"> <i
									class="fa fa-envelope"></i> Read
							</a>
								<div id="resume-dialog_${contact[0]}"
									class="small-dialog zoom-anim-dialog mfp-hide apply-popup">
									<div class="small-dialog-headline">
										<h2>Message</h2>
										From ${contact[5]}<br>
										<fmt:formatDate value="${contact[3]}"
											pattern="HH:mm:ss dd/MM/yyyy" />
									</div>
									<div class="small-dialog-content">
										<textarea rows="6" cols="8" disabled="disabled">${s:trim(contact[2])}</textarea>
									</div>
								</div>
								<c:if test="${contact[4] == 0}">
									<span class="badge badge-notify" id="new-${contact[0]}">new</span>
								</c:if>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->

	</article>
</div>
<script>
function changeStatus(id){
	$.ajax({
	    url:'${pageContext.request.contextPath}/changeStatus/'+id,
	    type: "GET",
	    success: function (data) {
	    	$("#contact-"+id).attr("class", "was-seen");
	    	$("#new-"+id).remove();
	    	$("#notseensize").html(data);
	    	$("#notseen").html(data);
	    }
	});
}
</script>