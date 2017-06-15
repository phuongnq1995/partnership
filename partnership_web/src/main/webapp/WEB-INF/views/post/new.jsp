<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/jquery-ui.css" />"
	rel="stylesheet" media="all" type="text/css">
<script src="<c:url value="/resources/js/datepicker/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/resources/js/datepicker/1.12.1-jquery-ui.js"/>"></script>
<div id="titlebar" class="single submit-page">
	<div class="container">
		<div class="sixteen columns">
			<h2>
				<i class="fa fa-plus-circle"></i> Post a Job
			</h2>
		</div>
	</div>
</div>

<div class="container full-width">
	<article id="post-2869"
		class="sixteen columns post-2869 page type-page status-publish hentry">
		<div class="submit-page">
			<form:form modelAttribute="post" method="POST" action="new"
				class="job-manager-form">

				<form:hidden path="company.id" />
				<span class="error text-danger" style="color: red;"><form:errors
						path="company.id" /></span>
				<!-- Job Information Fields -->

				<fieldset class="form fieldset-job_title">
					<span class="error text-danger" style="color: red;"><form:errors
							path="title" /></span> <label for="job_title">Job Title</label>
					<div class="field required-field">
						<form:input type="text" class="input-text" path="title"
							id="job_title" placeholder="Title..." />
					</div>
				</fieldset>

				<fieldset class="form">
					<span class="error text-danger" style="color: red;"><form:errors
							path="position" /></span> <label>Position </label>
					<div class="field">
						<form:input type="text" class="input-text" path="position"
							id="account_email" />
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_category">
					<span class="error text-danger" style="color: red;"><form:errors
							path="level" /></span> <label for="resume_category">Job
						level<small>*</small>
					</label>
					<div class="field">
						<form:select path="level" id="resume_category"
							class="chosen-select">
							<form:options items="${levels}" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_category">
					<span class="error text-danger" style="color: red;"><form:errors
							path="locations" /></span> <label for="resume_category">Job
						location<small>*</small>
					</label>
					<div class="field">
						<form:select path="locations" multiple="true" id="resume_category"
							class="chosen-select">
							<form:options items="${locations}" itemValue="id"
								itemLabel="name" />
						</form:select>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_category">
					<span class="error text-danger" style="color: red;"><form:errors
							path="types" /></span> <label for="resume_category">Job type<small>*</small></label>
					<div class="field">
						<form:select path="types" multiple="true" id="resume_category"
							class="chosen-select">
							<form:options items="${types}" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_category">
					<span class="error text-danger" style="color: red;"><form:errors
							path="categories" /></span> <label for="resume_category">Job
						category<small>*</small>
					</label>
					<div class="field">
						<form:select path="categories" multiple="true"
							id="resume_category" class="chosen-select">
							<c:forEach items="${categories}" var="category">
								<form:option value="" disabled="true">${category.getName()}</form:option>
								<form:options items="${category.getChildren()}" itemValue="id"
								itemLabel="name" cssStyle="margin-left:10px"/>
							</c:forEach>
						</form:select>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_content">
					<span class="error text-danger" style="color: red;"><form:errors
							path="description" /></span> <label for="resume_content">Descriptions<small>*</small>
					</label>
					<div class="field">
						<div id="wp-resume_content-wrap"
							class="wp-core-ui wp-editor-wrap html-active">
							<div id="wp-resume_content-editor-container"
								class="wp-editor-container">
								<form:textarea class="wp-editor-area" rows="8" cols="40"
									path="description" id="resume_content"></form:textarea>
							</div>
						</div>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-resume_content">
					<span class="error text-danger" style="color: red;"><form:errors
							path="requirement" /></span> <label for="resume_content">Requirement<small>(optional)</small>
					</label>
					<div class="field">
						<div id="wp-resume_content-wrap"
							class="wp-core-ui wp-editor-wrap html-active">
							<div id="wp-resume_content-editor-container"
								class="wp-editor-container">
								<form:textarea class="wp-editor-area" rows="8" cols="40"
									path="requirement" id="resume_content"></form:textarea>
							</div>
						</div>
					</div>
				</fieldset>

				<fieldset class="form fieldset-application">
					<span class="error text-danger" style="color: red;"><form:errors
							path="emailApply" /></span> <label for="application">Application
						email/URL<small>*</small>
					</label>
					<div class="field required-field">
						<form:input type="text" class="input-text" path="emailApply"
							value="${pageContext.request.userPrincipal.name}"
							placeholder="Enter an email address or website URL" />
					</div>
				</fieldset>

				<fieldset class="form fieldset-salary_min">
					<span class="error text-danger" style="color: red;"><form:errors
							path="minsalary" /></span> <label for="salary_min">Minimum
						Salary (&#36;) <small>(optional)</small>
					</label>
					<div class="field ">
						<form:input type="number" class="input-text" path="minsalary"
							placeholder="e.g. 20000" />
					</div>
				</fieldset>
				<fieldset class="form fieldset-salary_max">
					<span class="error text-danger" style="color: red;"><form:errors
							path="maxsalary" /></span> <label for="salary_max">Maximum
						Salary (&#36;) <small>(optional)</small>
					</label>
					<div class="field ">
						<form:input type="number" class="input-text" path="maxsalary"
							placeholder="e.g. 50000" />
					</div>
				</fieldset>

				<fieldset class="form fieldset-application">
					<span class="error text-danger" style="color: red;"><form:errors
							path="dayend" /></span> <label for="application">Dead Line<small>(Max
							1 month)</small>
					</label>
					<div class="field required-field">
						<form:input type="text" class="uni-calendar input-text" path="dayend"
							id="dayend" />
					</div>
				</fieldset>

				<p class="send-btn-border">
					<input type="submit" name="submit_resume" class="button big"
						value="Post a job &rarr;" />
				</p>
			</form:form>
		</div>
	</article>
</div>
<script>
	
	$(".uni-calendar").datepicker({
	  	numberOfMonths: 1,
		changeMonth: true,
		dateFormat:"dd/mm/yy",
		yearRange:"-80:+80",
		changeYear: true,
	   	beforeShow: function (input, inst) { 
	        if($(input).hasClass('readonly')) {
	        	  inst.dpDiv.style.display = 'none';
	       }
	    }
	});
</script>