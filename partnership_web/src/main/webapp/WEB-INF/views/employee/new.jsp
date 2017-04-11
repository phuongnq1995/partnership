<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container full-width">
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
							yyyy-MM-dd)</small></label><span class="error text-danger" style="color: red;"><form:errors
							path="birthday" /></span>
					<div class="field">
						<form:input type="date" class="input-text" path="birthday"
							id="candidate_date" />
					</div>
				</fieldset>

				<fieldset class="form  fieldset-candidate_name">
					<label for="candidate_email">Your Phone<small>*(format:
							xxxx-xxx-xxxx, xxxx-xxx-xxx)</small></label><span class="error text-danger"
						style="color: red;"><form:errors path="phone" /></span>
					<div class="field">
						<form:input type="tel" class="input-text" path="phone"
							id="candidate_email" placeholder="Your phone"
							pattern="^\d{4}-\d{3}-\d{3,4}$" />
					</div>
				</fieldset>

				<fieldset class="form  fieldset-candidate_location">
					<label for="candidate_location">Location<small>*</small></label><span
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

				<fieldset class="form  fieldset-resume_category">
					<label for="resume_category">Resume category<small>*</small></label>
					<span class="error text-danger" style="color: red;"><form:errors
							path="categories" /></span>
					<div class="field">
						<form:select path="categories" multiple="true"
							id="resume_category" class="chosen-select">
							<form:options items="${categories}" itemValue="id"
								itemLabel="name" />
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
</script>
<script>
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
</script>
<script>
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
</script>