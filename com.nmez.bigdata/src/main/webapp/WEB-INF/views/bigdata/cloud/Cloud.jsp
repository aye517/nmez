<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width = 1050, user-scalable = no" charset="UTF-8"/>
<link rel="stylesheet" href="resources/css/basic.css">
<script type="text/javascript" src="resources/js/book/jquery.min.1.7.js"></script>
<script type="text/javascript" src="resources/js/book/modernizr.2.5.3.min.js"></script>
<style type="text/css">
.cat_div{
	display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
<title>Cloud.jsp</title>
</head>

<%@ include file="../../main/Header.jsp"%>
<body>
<div class="cat_div">
<h1>트렌드 분석</h1>
</div>
<div class="flipbook-viewport">
	<div class="container">
		<div class="flipbook">
			<div style="background-image:url(resources/img/cloud1.png)"></div>
			<div style="background-image:url(resources/img/cloud2.png)"></div>
			<div style="background-image:url(resources/img/cloud3.png)"></div>
			<div style="background-image:url(resources/img/cloud4.png)"></div>

		</div>
	</div>
</div>

<script type="text/javascript">
function loadApp() {
	// Create the flipbook
	$('.flipbook').turn({
			// Width
			width:922,
			
			// Height
			height:536,
			// Elevation
			elevation: 50,
			
			// Enable gradients
			gradients: true,
			
			// Auto center this flipbook
			autoCenter: true
	});
}
// Load the HTML4 version if there's not CSS transform
yepnope({
	test : Modernizr.csstransforms,
	yep: ['resources/js/book/turn.js'],
	nope: ['resources/js/book/turn.html4.min.js'],
	both: ['resources/css/basic.css'],
	complete: loadApp
});
</script>

</body>
<%@ include file="../../main/Footer.jsp"%>
</html>