<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/scroll.css">
<title>scroll_menu</title>
<script type="text/javascript" src="resources/js/scroll/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="resources/js/scroll/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="resources/js/scroll/scroll_menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/scroll.css">
</head>
<%@ include file="../main/Header.jsp"%>
<body style="margin: 0" class="wrap" style="overflow: hidden">
<header id="top_menu">
<div id="NMEZ"><h1>Portfolio</h1></div>
<ul>
	<li class="on"><a href="project_development">프로젝트 개발단계</a></li>
	<li><a href="data_anal">데이터 분석</a></li>
	<li><a href="web_develoment">웹 개발</a></li>
	<li><a href="impression">소감</a></li>
</ul>
</header>
<div class="main">
<div id="contents">
    <div id="project_development"><img alt="" src="resources/img/cat1.jpg"><img src="resources/img/cat9.jpg"></div>
    <div id="data_anal"><img alt="" src="resources/img/cat2.jpg"></div>
    <div id="web_develoment"><img alt="" src="resources/img/cat3.jpg"></div>
    <div id="impression"><img alt="" src="resources/img/cat4.jpg"><img alt="" src="resources/img/cat1.jpg"></div>
</div>
</div>

</body>
<%@ include file="../main/Footer.jsp"%>

</html>