<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>scroll_menu</title>
<script type="text/javascript" src="resources/js/scroll/scroll_menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/scroll.css">
</head>
<%@ include file="../main/Header.jsp"%>
<body style="margin: 0" class="wrap" style="overflow: hidden">
<nav id="top_menu">
<div id="NMEZ" ><h1>Portfolio</h1></div>
    <ul class="menu">
      <li>
        <h4><a href="#project_development">프로젝트 개요</a></h4>
        <ul class="submenu">
          <li><h5><a href="#sub_cat">개발 환경</a></h5></li>
          <li><h5><a href="#">개발 기간</a></h5></li>
          <li><h5><a href="#">프로젝트 개요</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#data_anal">데이터 분석</a></h4>
        <ul class="submenu">
          <li><h5><a href="#">인스타그램 크롤링</a></h5></li>
          <li><h5><a href="#">네이버 부동산 크롤링</a></h5></li>
          <li><h5><a href="#">공공데이터 분석</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#web_develoment">웹 개발</a></h4>
        <ul class="submenu">
          <li><h5><a href="#web_ppt_3">웹 개발 환경설정</a></h5></li>
          <li><h5><a href="#web_ppt_7">데이터 웹 구현</a></h5></li>
          <li><h5><a href="#web_ppt_15">사용자 웹 서비스 구현</a></h5></li>
          <li><h5><a href="#web_ppt_24">Github Repository, Branch 활용  형상관리 경험</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#impression">소감</a></h4>
      </li>
    </ul>
      <div id="download_link">
      <h4><a href="https://drive.google.com/uc?export=download&id=1TbSFs7fkpdGQOfbkf9MCxjzwUQ_Mnjcw">데이터 정리코드 다운로드</a></h4>
      </div>
</nav>
<div class="main">
<div id="contents">

    <section id="project_development" >
    </section>
    
    <section id="data_anal">
    </section>
    
    <section id="web_develoment">
  <% 
  // page num
  int ppt = 25;
  %>
  <% for (int i=1; i<ppt; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/web/NMEZ_PJ_web_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    </section>
    
    <section id="impression">
    </section>
</div>
</div>
</body>
<%@ include file="../main/Footer.jsp"%>

</html>