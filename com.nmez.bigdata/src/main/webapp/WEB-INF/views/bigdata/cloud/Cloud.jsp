<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<meta name="viewport" content="width = 1050, user-scalable = no" charset="UTF-8"/>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="resources/js/book/jquery.min.1.7.js"></script>
<script type="text/javascript" src="resources/js/book/modernizr.2.5.3.min.js"></script>
<script type="text/javascript">
function loadApp() {

	var flipbook = $('.flipbook');

 	// Check if the CSS was already loaded
	
	if (flipbook.width()==0 || flipbook.height()==0) {
		setTimeout(loadApp, 10);
		return;
	}

	$('.flipbook .double').scissor();

	// Create the flipbook

	$('.flipbook').turn({
			// Elevation

			elevation: 2000,
			
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
	both: ['resources/js/book/scissor.min.js','resources/css/basic.css'],
	complete: loadApp
});
</script>
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
			<div class="page" style="background-image:url(resources/img/cat1.jpg)"><h5 align="center">표지</h5></div>
			<div class="double" style="background-image:url(resources/img/instagram.png)"><h5 align="center">7월18일 트렌드분석</h5></div>
			<div class="double" style="background-image:url(resources/img/cat3.jpg)"></div>
			<div class="double" style="background-image:url(resources/img/cat4.jpg)"></div>
			<div class="double" style="background-image:url(resources/img/cat5.jpg)"></div>
			<div class="double" style="background-image:url(resources/img/cat6.jpg)"></div>
			<div class="double" style="background-image:url(resources/img/cat7.jpg)"></div>
			<div class="double" style="background-image:url(resources/img/cat8.jpg)"></div>
			<div class="page" style="background-image:url(resources/img/cat9.jpg)"></div>
		</div>
	</div>
</div>


</body>
<%@ include file="../../main/Footer.jsp"%>
</html>