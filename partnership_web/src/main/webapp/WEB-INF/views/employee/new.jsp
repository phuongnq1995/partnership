<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/jquery-ui.css" />"
	rel="stylesheet" media="all" type="text/css">
<script src="<c:url value="/resources/js/datepicker/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/resources/js/datepicker/1.12.1-jquery-ui.js"/>"></script>
<div class="container full-width">
	<div id="titlebar" class="single">
		<div class="container">
			<div class="sixteen columns">
				<c:if test="${MESSAGE != null}">
					${MESSAGE}
				</c:if>
				<h1>Employee Register</h1>
				<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
					<ul>
						<li class="home"><span><a title="Go to WorkScout."
								href="${pageContext.request.contextPath}/" class="home"><span>Home</span></a> </span></li>
						<li class="current_item"><span><span>Company
									Employee Register</span> </span></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<article id="post-13"
		class="sixteen columns post-13 page type-page status-publish hentry">
		<div class="submit-page">
			<form:form modelAttribute="employee" method="POST"
				action="new?${_csrf.parameterName}=${_csrf.token}"
				class="job-manager-form" enctype="multipart/form-data">
				<form:hidden path="userId" />
				<span class="error text-danger" style="color: red;"><form:errors
						path="userId" /></span>
				<fieldset class="form fieldset-candidate_name">
					<label for="candidate_name">Your name<small>*</small></label><span
						class="error text-danger" style="color: red;"><form:errors
							path="fullname" /></span>
					<div class="field">
						<form:input type="text" class="input-text" path="fullname"
							id="candidate_name" placeholder="Your full name" />
					</div>
				</fieldset>

				<fieldset class="form fieldset-candidate_title">
					<label for="candidate_name">Your email<small>*</small></label>
					<div class="field">
						<input type="email" class="input-text" name="email"
							value="${pageContext.request.userPrincipal.name}"
							disabled="disabled" />
					</div>
				</fieldset>

				<fieldset class="form  fieldset-candidate_title">
					<label for="candidate_title">Your Birthday<small>*(format:
							dd/mm/yyyy)</small></label><span class="error text-danger" style="color: red;"><form:errors
							path="birthday" /></span>
					<div class="field">
						<form:input type="text" class="uni-calendar input-text" path="birthday"
							id="candidate_date" placeholder="Your birthday"/>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-candidate_name">
					<label for="candidate_email">Your Phone<small>*</small>
					</label><span class="error text-danger"
						style="color: red;"><form:errors path="phone" /></span>
					<div class="field">
						<form:input type="tel" class="input-text" path="phone"
							id="candidate_email" placeholder="Your phone"/>
					</div>
				</fieldset>

				<fieldset class="form  fieldset-candidate_location">
					<label for="candidate_location">City<small>*</small></label><span
						class="error text-danger" style="color: red;"><form:errors
							path="location" /></span>
					<div class="field">
						<form:select path="location" items="${listLocation}"
							itemValue="id" itemLabel="name" id="candidate_title">
						</form:select>
					</div>
				</fieldset>

				<fieldset class="form fieldset-company_logo">
					<label for="logo">Photo <small>(optional)</small></label><span
						class="error text-danger" style="color: red;"><form:errors
							path="avatar" /></span>
					<div class="field ">
						<label class="fake-upload-btn"> <input type="file"
							name="fileUpload" onchange="PreviewImage();"
							class="input-text wp-job-manager-file-upload" accept="image/*"
							id="uploadImage" />
							<div class="upload-btn">
								<i class="fa fa-upload"></i> Browse
							</div>
						</label><img id="uploadPreview"
							style="width: 120px; height: 130px; border: none;"
							src="<c:url value="/resources/images/user.png" />" />
					</div>
				</fieldset>
					<fieldset class="form  fieldset-candidate_location">
					<label for="candidate_location">Job<small>*</small></label><span
						class="error text-danger" style="color: red;"><form:errors
							path="jobName" /></span>
					<div class="field">
						<form:select path="jobName" items="${categories}"
							itemValue="name" itemLabel="name" id="candidate_title">
						</form:select>
					</div>
				</fieldset>
				
				<fieldset class="form  fieldset-resume_category">
					<label for="resume_category">Resume skill<small>*</small></label>
					<span class="error text-danger" style="color: red;"><form:errors
							path="categories" /></span>
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
					<label for="resume_content">Descriptions yourself<small>(optional)</small>
					</label><span class="error text-danger" style="color: red;"><form:errors
							path="description" /></span>
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

				<fieldset class="form  fieldset-resume_file">
					<label for="resume_file">Curriculum Vitae(CV) <small>(PDF
							otional)</small>
					</label> <span class="error text-danger" style="color: red;"><form:errors
							path="cv" /></span>
					<div class="field">

						<label class="fake-upload-btn">
							<div class="job-manager-uploaded-files"></div> <input type='file'
							name="fileUpload" class="input-text wp-job-manager-file-upload"
							accept="|pdf|" id="resume_file" />
							<div class="upload-btn">
								<i class="fa fa-upload"></i>Browse
							</div>
						</label>
					</div>
					<p id="log"></p>
				</fieldset>

				<p class="send-btn-border">
					<input type="submit" name="submit_resume" class="button big"
						value="Register &rarr;" />
				</p>
			</form:form>
		</div>
	</article>
</div>
<script type="text/javascript">
	function PreviewImage() {
		var oFReader = new FileReader();
		oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);
		oFReader.onload = function(oFREvent) {
			document.getElementById("uploadPreview").src = oFREvent.target.result;
		};
	};
	var input = document.getElementById("resume_file");
	input.onclick = function() {
		this.value = null;
	};
	input.onchange = function() {
		var path = input.value;
		var filename = "";
		if (path.lastIndexOf("\\") != -1)
			filename = path.substring(path.lastIndexOf("\\") + 1, path.length);
		else
			filename = path.substring(path.lastIndexOf("/") + 1, path.length);
		document.getElementById("log").innerHTML = filename;
	};
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}
	today = yyyy + '-' + mm + '-' + dd;
	document.getElementById("candidate_date").setAttribute("max", today);
	
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