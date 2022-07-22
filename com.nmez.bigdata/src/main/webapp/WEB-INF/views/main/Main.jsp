<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<body>

<%@ include file="Header.jsp"%>


	<h1> Hello 네명이조~</h1>
	
	<br>
	<br>

	
	<div>
	<h2>TEST 중입니다</h2>
	<hr>
	<h3>session test</h3>
	<p>id: ${session.uId }</p>
	<p> x: ${session.uAddr_x } , y:${session.uAddr_y }</p>
	<hr>
	<br>
	<a href="/bigdata/chartTest" style="color: blue">차트테스트</a>
	<hr>
	<!-- 월별 시간대-성별 생활인구수 -->
	<form action="lineChart" method="post">
	<a href="/bigdata/lineChart" style="color: blue">라인차트(시간-성별) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="t_code" placeholder="행정코드">
	<select name="t_month">
		<option selected="selected">1월</option>
		<%for (int i=2; i<=12; i++) {%>
		<option><%=i %>월</option>
		<%}; %>
	</select>
	<input type="submit">
	</form>
	<hr>
	
	<!-- 지역별 생활인구 성별비율 -->
	<form action="pieChart" method="post">
	<a href="/bigdata/pieChart" style="color: blue">파이차트(총생활인구) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="p_code">
	<input type="submit">
	</form>
	<hr>
	
	<!-- 지역별 나이-성별 생활인구수 -->
	<form action="barChart" method="post">
	<a href="/bigdata/barChart" style="color: blue">바차트(지역별 나이-성별 생활인구수) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="s_code">
	<input type="submit">
	</form>
	
	</div>
	<br>
	<br>

</body>
</html>