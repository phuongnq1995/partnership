<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div id="titlebar" class="single with-map">
	<div class="container">
		<div class="sixteen columns">

			<div class="ten columns">
				<span>We have ${pages.getTotalElements()} resumes in our database</span>
				<h2 class="showing_jobs">Showing all resumes</h2>
			</div>
			<c:if test="${MESSAGE != null}">
					${MESSAGE}
			</c:if>
		</div>
	</div>
</div>
<div class="container wpjm-container right-sidebar margin-top-55">
<form class="list-search" method="POST"
				action="${pageContext.request.contextPath}/employee/searchForm">
	<!-- Widgets -->
	<div class="five columns sidebar " role="complementary">
		
			<!-- Skills -->
			<div class="widget">
				<h4>Filter by Skills</h4>
				<div class="search_categories resume-filter">
					<select name='search_skills[]' id='search_skills'
						class='chosen-select' multiple='multiple'
						data-placeholder='Choose a skill'
						data-no_results_text='No results match'
						data-multiple_text='Select Some Options'>
						<c:forEach items="${categoriesOriginal}" var="category">
							<option class="level-0" disabled="disabled">${category.getName()}</option>
							<c:forEach items="${category.getChildren()}" var="children">
								<option style="margin-left:10px" value="${children.getId()}">${children.getName()}</option>
							</c:forEach>
							<option>
						</c:forEach>
					</select>

				</div>
			</div>
	</div>
	<!-- #secondary -->
	<article class="eleven columns">
		<div class="padding-right">
				<div class="search_keywords">
					<button>
						<i class="fa fa-search"></i>
					</button>
					<input type="text" name="keywords" id="keywords"
						placeholder="Search employee by name, description"
						value="" />
					<div class="clearfix"></div>
				</div>

			<div class="resumes">
				<!-- Listings Loader -->
				<div class="listings-loader">
					<i class="fa fa-spinner fa-pulse"></i>
				</div>
				
				<ul class="resumes">
					<c:forEach items="${pages.getContent()}" var="employee">
					<li class="photo-rounded">
						<a href="${employee.getId()}" >
						<c:choose>
							<c:when test="${empty employee.getAvatar()}">
								<td><img src="<c:url value="/resources/images/user.png"/>"
									width="100px" height="100px" class="candidate_photo" /></td>
							</c:when>
							<c:otherwise>
								<img width="100px" height="100px"
									src="${pageContext.request.contextPath}/imageEmployee/${employee.getId()}"
									alt="Photo"  class="candidate_photo"/>
							</c:otherwise>
						</c:choose>
						
						<div class="resumes-content">
							<h4>
								${employee.getFullname()}<span>${employee.getJobName()}</span>
							</h4>
							<span class="icons"><i class="fa fa-map-marker">&nbsp;${employee.getLocation().getName()}</i></span>
							<span class="icons"><i class="fa fa-birthday-cake"></i>
								 <fmt:formatDate value="${employee.getBirthday()}" pattern="dd/MM/yyyy" /></span> 
							<p>About Me&nbsp;${employee.getDescription()}&#8230;</p>
		
							<div class="skills">
								<c:forEach items="${employee.getCategories()}" var="category">
									<span>${category.getName()}</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div> 
						</a>
						<div class="clearfix"></div></li>
					</c:forEach>
				</ul>
				<nav class="job-manager-pagination pagination">
					<ul>
						<c:forEach var="page" begin="1" end="${pages.getTotalPages()}">
							<li>
								<c:choose>
									<c:when test="${pages.getNumber()+1 == page}">
										<span class="current" data-page="${page}">${page}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/employee/index?page=${page}" data-page="${page}">${page}</a>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
						<!-- <li><span class="current" data-page="1"></span></li> -->
						<c:if test="${pages.hasNextPage()}">
							<li style="float: right; position: absolute; right: 0;"><a
							href="${pageContext.request.contextPath}/employee/index?page=${pages.getNumber()+2}" data-page="{page}">Next</a></li>
						</c:if>
						<c:if test="${pages.hasPreviousPage()}">
							<li style="float: left; position: absolute; left:0;"><a
							href="${pageContext.request.contextPath}/employee/index?page=${pages.getNumber()}" data-page="{page}">Previous</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<footer class="entry-footer"> </footer>
			<!-- .entry-footer -->
		</div>
	</article>
	</form>
</div>