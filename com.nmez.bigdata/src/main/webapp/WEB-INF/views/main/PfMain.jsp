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
        <h4><a href="#web_ppt_3">프로젝트 개요</a></h4>
        <ul class="submenu">
          <li><h5><a href="#web_ppt_4">개발 환경</a></h5></li>
          <li><h5><a href="#web_ppt_5">개발 기간</a></h5></li>
          <li><h5><a href="#web_ppt_6">프로젝트 개요</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#web_ppt_8">데이터 분석</a></h4>
        <ul class="submenu">
          <li><h5><a href="#web_ppt_9">인스타그램 크롤링</a></h5></li>
          <li><h5><a href="#web_ppt_15">네이버 부동산 크롤링</a></h5></li>
          <li><h5><a href="#web_ppt_19">공공데이터 분석</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#web_ppt_58">웹 개발</a></h4>
        <ul class="submenu">
          <li><h5><a href="#web_ppt_59">웹 개발 환경설정</a></h5></li>
          <li><h5><a href="#web_ppt_64">데이터 웹 구현</a></h5></li>
          <li><h5><a href="#web_ppt_72">사용자 웹 서비스 구현</a></h5></li>
          <li><h5><a href="#web_ppt_81">Github Repository, Branch 활용  형상관리 경험</a></h5></li>
        </ul>
      </li>
      <li>
        <h4><a href="#web_ppt_82">소감</a></h4>
      </li>
    </ul>
      <div id="download_link">
      <h4><a href="https://drive.google.com/uc?export=download&id=1TbSFs7fkpdGQOfbkf9MCxjzwUQ_Mnjcw">데이터 정리코드 다운로드</a></h4>
      </div>
</nav>
<div class="main">
<div id="contents">

    <section id="project_development" >
     <% 
  // page num
  int opening = 8;
  %>
  <% for (int i=1; i<opening; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/opening/NMEZ_PJ_0809_Page_0<%=i %>.jpg" >
  </div>
    <%} %>
    </section>
    
    <section id="data_anal">
         <% 
  // page num
  int data1 = 19;
  %>
  <% for (int i=8; i<data1; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video1">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/KjEiWmHZfeI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
     <% 
  // page num
  int data2 = 28;
  %>
  <% for (int i=19; i<data2; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video2">
     <iframe width="560" height="315" src="https://www.youtube.com/embed/sy_5PPvNiAA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
         <% 
  // page num
  int data3 = 34;
  %>
  <% for (int i=28; i<data3; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video3">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/Z1MUVqD4Zwg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <div id="web_ppt_34>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_34.jpg" >
	</div>
	<div id="web_ppt_35>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_35.jpg" >
	</div>
	<div id="data_video4">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/U84znMajdOY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% 
  // page num
  int data4 = 39;
  %>
  <% for (int i=36; i<data4; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video5">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/DxVS56UEqBU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
	<div id="web_ppt_39>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_39.jpg" >
	</div>
	<div id="data_video6">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/IcuY1i8kT40" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% 
  // page num
  int data5 = 53;
  %>
  <% for (int i=40; i<data5; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video7">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/I-I06ghZXro" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <div id="web_ppt_53>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_53.jpg" >
	</div>
	<div id="data_video8">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/uxcbxV1XHmw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
	<% 
  // page num
  int data6 = 58;
  %>
  <% for (int i=54; i<data6; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/data/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    <div id="data_video9">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/pNZQppyXNX0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    
    </div>
    </section>
    
    <section id="web_develoment">
  <% 
  // page num
  int web = 82;
  %>
  <% for (int i=58; i<web; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/web/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    </section>
    
    <section id="impression">
         <% 
  // page num
  int impression = 87;
  %>
  <% for (int i=82; i<impression; i++) {%>
  <div id="web_ppt_<%=i%>">
    <img src="resources/img/ppt/impression/NMEZ_PJ_0809_Page_<%=i %>.jpg" >
  </div>
    <%} %>
    </section>
</div>
</div>
</body>
<%@ include file="../main/Footer.jsp"%>

</html>