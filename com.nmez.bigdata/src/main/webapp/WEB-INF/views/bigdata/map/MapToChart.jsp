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

<%@ include file="../chart/LineChart.jsp"%>
<%@ include file="../chart/PieChart.jsp"%>
<%@ include file="../chart/BarChart.jsp"%>

</body>
</html>