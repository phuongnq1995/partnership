<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="s"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<style>
/* MENU-LEFT
-------------------------- */
/* layout */
#left ul.nav {
	margin-bottom: 2px;
	font-size: 12px; /* to change font-size, please change instead .lbl */
}

#left ul.nav ul, #left ul.nav ul li {
	list-style: none !important;
	list-style-type: none !important;
	margin-top: 1px;
	margin-bottom: 1px;
}

#left ul.nav ul {
	padding-left: 0;
	width: auto;
}

#left ul.nav ul.children {
	padding-left: 40px;
	width: auto;
}

#left ul.nav ul.children li {
	margin-left: 0px;
}

#left ul.nav li a:hover {
	text-decoration: none;
}

#left ul.nav li a:hover .lbl {
	color: #999 !important;
}

#left ul.nav li.current>a .lbl {
	background-color: #999;
	color: #fff !important;
}
/* parent item */
#left ul.nav li.parent a {
	padding: 0px;
	color: #ccc;
}

#left ul.nav>li.parent>a {
	border: solid 1px #999;
	text-transform: uppercase;
}

#left ul.nav li.parent a:hover {
	background-color: #fff;
	-webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	-moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
	box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
}
/* link tag (a)*/
#left ul.nav li.parent ul li a {
	color: #222;
	border: none;
	display: block;
	padding-left: 5px;
}

#left ul.nav li.parent ul li a:hover {
	background-color: #fff;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
/* sign for parent item */
#left ul.nav li .sign {
	display: inline-block;
	width: 14px;
	padding: 13px 30px;
	background-color: transparent;
	color: #fff;
}

#left ul.nav li.parent>a>.sign {
	margin-left: 0px;
	background-color: #999;
}
/* label */
#left ul.nav li .lbl {
	padding: 5px 12px;
	display: inline-block;
}

#left ul.nav li.current>a>.lbl {
	color: #fff;
}

#left ul.nav  li a .lbl {
	font-size: 12px;
}
/* THEMATIQUE
------------------------- */
/* theme 1 */
#left ul.nav>li.item-1.parent>a {
	border: solid 1px #ff6307;
}

#left ul.nav>li.item-1.parent>a>.sign, #left ul.nav>li.item-1 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ff6307;
}

#left ul.nav>li.item-1 .lbl {
	color: #ff6307;
}

#left ul.nav>li.item-1 li.current>a .lbl {
	background-color: #ff6307;
	color: #fff !important;
}
/* theme 2 */
#left ul.nav>li.item-8.parent>a {
	border: solid 1px #51c3eb;
}

#left ul.nav>li.item-8.parent>a>.sign, #left ul.nav>li.item-8 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #51c3eb;
}

#left ul.nav>li.item-8 .lbl {
	color: #51c3eb;
}

#left ul.nav>li.item-8 li.current>a .lbl {
	background-color: #51c3eb;
	color: #fff !important;
}
/* theme 3 */
#left ul.nav>li.item-15.parent>a {
	border: solid 1px #94cf00;
}

#left ul.nav>li.item-15.parent>a>.sign, #left ul.nav>li.item-15 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #94cf00;
}

#left ul.nav>li.item-15 .lbl {
	color: #94cf00;
}

#left ul.nav>li.item-15 li.current>a .lbl {
	background-color: #94cf00;
	color: #fff !important;
}
/* theme 4 */
#left ul.nav>li.item-22.parent>a {
	border: solid 1px #ef409c;
}

#left ul.nav>li.item-22.parent>a>.sign, #left ul.nav>li.item-22 li.parent>a>.sign
	{
	margin-left: 0px;
	background-color: #ef409c;
}

#left ul.nav>li.item-22 .lbl {
	color: #ef409c;
}

#left ul.nav>li.item-22 li.current>a .lbl {
	background-color: #ef409c;
	color: #fff !important;
}
</style>
<div class="clearfix"></div>
<div id="titlebar" class="single">
	<div class="container">

		<div class="sixteen columns">

			<h1>Admin Dashboard</h1>
			<nav id="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
				<ul>
					<li class="home"><span><a title="Go to Home."
							href="${pageContext.request.contextPath}" class="home"><span>Admin</span></a> </span></li>
					<li class="current_item"><span><span>Statistic 
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

	<article id="post-14"
		class="sixteen columns woocommerce-account post-14 page type-page status-publish hentry">

		<nav class="woocommerce-MyAccount-navigation">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/statistic"> Statistic</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/companies"> Companies</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/employees">Candidates</a>
				</li>
				<li class=""><a href="${pageContext.request.contextPath}/admin/posts">Post</a>
				</li>
			</ul>
		</nav>

		<div class="woocommerce-MyAccount-content">
			<div id="render-div"></div>
		</div>
		<footer class="entry-footer"> </footer>
		<!-- .entry-footer -->
	</article>
</div>
<script type="text/javascript" charset="utf-8">
//Set up the chart

var chart = new Highcharts.Chart({
	
 chart: {
     renderTo: 'render-div',
     type: 'column'
 },
 title: {
     text: 'Company report'
 },
 subtitle: {
     text: 'Chart for post quantity'
 },
 xAxis: {
     categories:  [
    	 <% 
    	 List<Object[]> companies = (List<Object[]>) request.getAttribute("companies");
    	 for (int i = 0; i < companies.size(); i++  ){ 
    	 %>
    	 	<%="'"+companies.get(i)[1]+"'"+(i == companies.size() -1 ? "" : ",") %>
    	 <%} %>
     ]
 },
 yAxis: {
     title: {
         text: 'quantity'
     },
     tickInterval: 1
 },
 plotOptions: {
     column: {
         depth: 25
     }
 },
 series: [
	 {
     data: [
			<% for (int i = 0; i < companies.size(); i++  ){ 
		    	 %>
		    	 	<%=companies.get(i)[2]+(i == companies.size() -1 ? "" : ",") %>
		    	 <%} %>
    	 ],
   	name : 'Company'
 	}
	]
});
//Activate the sliders
$('#sliders input').on('input change', function () {
 chart.options.chart.options3d[this.id] = parseFloat(this.value);
 chart.redraw(false);
});

!function ($) {
    
    $(document).on("click","#left ul.nav li.parent > a > span.sign", function(){          
        $(this).find('i:first').toggleClass("icon-minus");      
    }); 
    
}(window.jQuery);
</script>