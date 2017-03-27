<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="clearfix"></div>
<div class="submit-page" id="titlebar">
	<div class="container">
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="col-sm-5 alert alert-danger">
				<h3>${ERROR_MESSAGE}</h3>
			</div>
		</c:if>
		<div class="sixteen columns">
			<h2>
				<i class="fa fa-plus-circle"></i> Company Details
			</h2>
		</div>
	</div>
</div>
<div class="container full-width">
	<article
		class="sixteen columns post-2869 page type-page status-publish hentry">
		<div class="submit-page">
			<form:form method="POST" modelAttribute="company" action="new"
				enctype="multipart/form-data">
				<form:hidden path="id" />
				<span class="error text-danger" style="color: red;"><form:errors
						path="id" /></span>
				<fieldset class="form fieldset-company_name">
					<label for="name">Company name*</label>

					<div class="field required-field">
						<span class="error text-danger" style="color: red;"><form:errors
								path="name" /></span>
						<form:input type="text" class="input-text" path="name"
							id="company_name" placeholder="Enter the name of the company" />
					</div>
				</fieldset>

				<fieldset class="form fieldset-company_website">
					<label for="address">Address <small>(optional)</small></label>
					<div class="field ">
						<span class="error text-danger" style="color: red;"><form:errors
								path="address" /></span>
						<form:input type="text" class="input-text" path="address"
							id="address" placeholder="Street, state, city..." />
					</div>

				</fieldset>
				<fieldset class="form fieldset-company_website">
					<label for="city">City <small>(optional)</small></label> <select
						class="form-control" id="sel1" name="location">
						<c:forEach items="${listLocation}" var="location" >
							<option id="candidate_title" value="${location.getName()}">${location.getName()}</option>
						</c:forEach>
					</select>
				</fieldset>

				<fieldset class="form fieldset-company_website">
					<label for="website">Website <small>(optional)</small></label>
					<div class="field ">
						<span class="error text-danger" style="color: red;"><form:errors
								path="website" /></span>
						<form:input type="text" class="input-text" path="website"
							id="company_website" placeholder="http://" />
					</div>
				</fieldset>
				<fieldset class="form fieldset-company_tagline">
					<label for="tagline">Tagline* <small>(optional)</small></label>
					<div class="field ">
						<span class="error text-danger" style="color: red;"><form:errors
								path="tagline" /></span>
						<form:input type="text" class="input-text" path="tagline"
							id="company_tagline" placeholder="Briefly describe your company"
							maxlength="1450" />
					</div>
				</fieldset>
				<fieldset class="form fieldset-company_video">
					<span class="error text-danger" style="color: red;"><form:errors
							path="video" /></span> <label for="video">Video <small>(optional)</small></label>
					<div class="field ">
						<form:input type="text" class="input-text" path="video"
							id="company_video"
							placeholder="A link to a video about your company" />
					</div>
				</fieldset>

				<fieldset class="form fieldset-company_logo">
					<label for="logo">Logo <small>(optional)</small></label>
					<div class="field ">
						<label class="fake-upload-btn"> <input type='file'
							onchange="PreviewImage();"
							class="input-text wp-job-manager-file-upload" accept="image/*"
							name="fileUpload" id="uploadImage" />
							<div class="upload-btn">
								<i class="fa fa-upload"></i> Browse
							</div>
						</label><img id="uploadPreview"
							style="width: 160px; height: 100px; border: none;"
							alt="Maximum size:50 MB" />
					</div>
				</fieldset>

				<p class="send-btn-border">
					<input type="submit" name="submit_job" class="button big"
						value="Create" />
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