<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title" /></title>
<link href="<c:url value="/resources/css/font-awesome.css" />"
	rel="stylesheet" media="all" type="text/css">
<link href="<c:url value="/resources/css/responsive.min.css"/>"
	media="all" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/base.min.css"/>" media="all"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/style.css"/>" media="all"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/woocommerce.min.css"/>"
	media="screen" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrapper">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />
	</div>

	<script src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script src="<c:url value="/resources/js/chosen.jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.jpanelmenu.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.superfish.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.flexslider-min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/stacktable.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.min.js"/>"></script>
</body>
</html>