<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MapToChart.jsp</title>
</head>
<body>

<h1>${p_data.p_place }의 상권 정보</h1>

<h3>월별 생활인구</h3>
<form action="getChartM?t_code=${t_dataList[0].t_code}&t_month=${t_dataList[0].t_month}" method="get">
	<input type="hidden" name="code" placeholder="행정코드" value="${t_dataList[0].t_code}">
	<select name="t_month">
		<option selected="selected">1월</option>
		<%for (int i=2; i<=12; i++) {%>
		<option><%=i %>월</option>
		<%}; %>
	</select>
	<input type="submit">
</form>

<%@ include file="../chart/LineChart.jsp"%>

<h3>남녀 생활인구 비율</h3>
<%@ include file="../chart/PieChart.jsp"%>

<h3>연령대별 생활인구</h3>
<%@ include file="../chart/BarChart.jsp"%>

</body>
</html>