<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css?ver=1">
<title>MapToChart.jsp</title>
</head>
<body>

<div class="mapToChart_div">

<header id="mapToChart_header">
<div class="ccommercial_area_info">
<%@ include file="../../main/Header.jsp"%>
<h1>${p_data.p_place }의 상권 정보</h1>
</div>
<br>

<div class="select_code">
<h3>월별 생활인구</h3><br>

<form action="getChartM?t_code=${t_dataList[0].t_code}&t_month=${t_dataList[0].t_month}" method="get">
	<input type="hidden" name="code" placeholder="행정코드" value="${t_dataList[0].t_code}">
	<select name="t_month" class="sel">
		<option selected="selected">1월</option>
		<%for (int i=2; i<=12; i++) {%>
		<option><%=i %>월</option>
		<%}; %>
	</select>
	<input type="submit" class="chart_submit_button">
</form>
</div>
<hr>
</header>
<br>

<div class="chart_div">

<div class="chart_div_div"> 
<%@ include file="../chart/LineChart.jsp"%>
</div>

<div class="chart_div_div">
<h3>남녀 생활인구 비율</h3>
<%@ include file="../chart/PieChart.jsp"%>
</div>

<div class="chart_div_div">
<h3>연령대별 생활인구</h3>
<%@ include file="../chart/BarChart.jsp"%>
</div>
</div>
</div>

</body>
<%@ include file="../../main/Footer.jsp"%>
</html>