<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/chart.css">
<style type="text/css">
.charts {
    display: flex;
    flex-direction: row;
    justify-content: center;
}
</style>
<title>IncomeCharts.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
<div class="charts">
<div class="chart_mix_1">
<div class="pieChart">
<%@ include file="./IncomePie.jsp"%>
</div>
<div class="lineChart">
<%@ include file="./IncomeLine.jsp"%>
</div>
</div>
<div class="chart_mix_2">
<div class="barChart">
<%@ include file="./IncomeAgeBar.jsp"%>
</div>
<div class="dayBarChart">
<%@ include file="./IncomeDayBar.jsp"%>
</div>
</div>
</div>

</body>
</html>