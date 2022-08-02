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
<link rel="stylesheet" type="text/css" href="resources/css/scroll.css?ver=1">
</head>
<%@ include file="../main/Header.jsp"%>
<body style="margin: 0" class="wrap" style="overflow: hidden">
<nav id="top_menu">
<div id="NMEZ"><h1>Portfolio</h1></div>
    <ul class="menu">
      <li>
        <a href="#project_development">프로젝트 개발단계</a>
        <ul class="submenu">
          <li><a href="#sub_cat">subcat</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#data_anal">데이터 분석</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#web_develoment">웹 개발</a>
        <ul class="submenu">
          <li><a href="#web_ppt_18">submenu01</a></li>
          <li><a href="#web_ppt_19">submenu02</a></li>
          <li><a href="#web_ppt_20">submenu03</a></li>
          <li><a href="#web_ppt_21">submenu04</a></li>
          <li><a href="#web_ppt_22">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#impression">소감</a>
        <ul class="submenu">
          <li><a href="#web_ppt_18">submenu01</a></li>
          <li><a href="#web_ppt_19">submenu02</a></li>
          <li><a href="#web_ppt_20">submenu03</a></li>
          <li><a href="#web_ppt_21">submenu04</a></li>
          <li><a href="#web_ppt_22">submenu05</a></li>
        </ul>
      </li>
    </ul>
</nav>
<div class="main">
<div id="contents">

    <div id="project_development" >
    <img src="resources/img/cat1.jpg">
    <img id="sub_cat" src="resources/img/cat9.jpg">
    </div>
    
    <div id="data_anal">
    <img src="resources/img/cat2.jpg">
    </div>
    
    <div id="web_develoment">
  <% 
  // page num
  int ppt = 23;
  %>
  <% for (int i=17; i<ppt; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/NMEZ_PJ.pptx.pdf-page-00<%=i %>.jpg" >
  </div>
    <%} %>
    </div>
    
    <div id="impression">
    <img src="resources/img/cat4.jpg">
    <img src="resources/img/cat1.jpg">
    </div>
</div>
</div>
</body>
<%@ include file="../main/Footer.jsp"%>

</html>