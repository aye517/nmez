<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<title>MapToChart.jsp</title>
</head>
<body>

<div class="mapToChart_div">

<div class="ccommercial_area_info">
<%@ include file="../../main/Header.jsp"%>
<h1>${p_data.p_place }의 상권 정보</h1>
</div>

<div class="chart_div">

<div class="chart_div_div"> 
<%@ include file="../chart/LineChart.jsp"%>
</div>

<div class="chart_div_div">
<%@ include file="../chart/PieChart.jsp"%>
</div>

<div class="chart_div_div">
<%@ include file="../chart/BarChart.jsp"%>
</div>
</div>
</div>
</body>
<%@ include file="../../main/Footer.jsp"%>
</html>