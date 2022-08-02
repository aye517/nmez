<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>Main.jsp</title>

</head>
<body>
<%@ include file="Header.jsp"%>
<main>

 
	<br>
	<br>

	<div class="wrap_main">
	<div class="userForm">
	
	<div>
	<h1> Hello 네명이조~</h1>
	</div>
	<hr>
	<h3>session test</h3>
	<p>id: ${session.uId }</p>
	<p> x: ${session.uAddr_x } , y:${session.uAddr_y }</p>
	<hr>
	<h2>TEST 중입니다</h2>
	<br>
	<h3><a href="/bigdata/chartTest" style="color: blue">차트테스트</a></h3>
	<hr>
	
	<div class="userInput">
	<!-- 월별 시간대-성별 생활인구수 -->
	<form action="lineChart" method="post">
	<h5>
	<a href="/bigdata/lineChart" style="color: blue">라인차트(시간-성별) 테스트</a>
	>>>>>> 행정동코드 :</h5> <input type="text" name="t_code" placeholder="행정코드" class="int">
	<select name="t_month">
		<option selected="selected">1월</option>
		<%for (int i=2; i<=12; i++) {%>
		<option><%=i %>월</option>
		<%}; %>
	</select>
	<input type="submit">
	</form>
	</div>
	
	<hr>
	
	<div class="userInput">
	<!-- 지역별 생활인구 성별비율 -->
	<form action="pieChart" method="post">
	<h5>
	<a href="/bigdata/pieChart" style="color: blue">파이차트(총생활인구) 테스트</a>
	>>>>>> 행정동코드 :</h5> <input type="text" name="p_code" class="int">
	<input type="submit" >
	</form>
	</div>	
	
	<hr>
	 
	<div class="userInput">
	<!-- 지역별 나이-성별 생활인구수 -->
	<form action="barChart" method="post">
	<h5>
	<a href="/bigdata/barChart" style="color: blue">바차트(지역별 나이-성별 생활인구수) 테스트</a>
	>>>>>> 행정동코드 :</h5><input type="text" name="s_code" class="int">
	<input type="submit">
	</form>
	</div>
	</div>
	</div>
	<br>
	<br>
</main>
</body>
<%@ include file="Footer.jsp"%>
</html>