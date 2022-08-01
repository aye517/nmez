<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<title>LineChart.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- 생활인구 가장 많은/적은 시간 -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var data = document.getElementById("data");
	var t_local_code = data.getElementsByClassName("t_code")[0].innerText;

	const m = [];
	const w= [];
	const t = [];
	var mhigh, mlow, whigh, wlow;
	var mhigh_t, mlow_t, whigh_t, wlow_t;

	for (let i=0; i<10; i++){
		t[i] = data.getElementsByClassName("t_time")[i].innerText;
		m[i] = data.getElementsByClassName("t_man")[i].innerText;
		w[i] = data.getElementsByClassName("t_woman")[i].innerText;
	}
	//console.log("m : " + m)
	//console.log("w : " + w)
	
	//high, low값 넣기
	var i = 0;
	while(i<10){ 
		i++;
		if(m[i] > m[i-1]){
			mhigh = m[i];
			mhigh_t = t[i];
		}
		if(m[i] < m[i-1]){
			mlow = m[i];
			mlow_t = t[i];
		}
		if(w[i] > w[i-1]){
			whigh = w[i];
			whigh_t = t[i];
		}
		if(w[i] < w[i-1]){
			wlow = w[i];
			wlow_t = t[i];
		}
	}
	//console.log(mhigh_t + ":" + mhigh + ',' + whigh_t + ":" + whigh)
	//console.log(mlow_t + ":" +mlow+','+ wlow_t + ":" + wlow)
	
	document.getElementById('mhigh_t').innerText = mhigh_t + '시 > ';
	document.getElementById('mhigh').innerText = mhigh + '명';
	document.getElementById('whigh_t').innerText = whigh_t + '시 >';
	document.getElementById('whigh').innerText = whigh + '명';
	document.getElementById('mlow_t').innerText = mlow_t + '시 >';
	document.getElementById('mlow').innerText = mlow + '명';
	document.getElementById('wlow_t').innerText = wlow_t + '시 >';
	document.getElementById('wlow').innerText = wlow + '명';
	
	console.log(document.getElementById('wlow_t').value);
});

</script>
</head>
<body>

<div class="canvas-container">
<canvas id="line_chart" width="300" height="230"></canvas>
</div>

<div>

	<div class="chart_table_line">
	<h4>활동인구 가장 많은 시간</h4>
	<div class="chart_sex">
	남 <font id="mhigh_t" ></font>
	<font type="text" id="mhigh"></font><br>
	여 <font id="whigh_t"></font>
	<font type="text" id="whigh"></font>
	</div>
	<br>
	<br>
	<h4>활동인구 가장 적은 시간</h4>
	<div class="chart_sex">
	남 <font id="mlow_t"></font>
	<font type="text" id="mlow"></font><br>
	여 <font id="wlow_t"></font>
	<font type="text" id="wlow"></font>
	</div>
	</div>
	

	<div hidden="hidden">
	<table>
		<thead>
			<tr>
				<th>no.</th>
				<th>월</th>
				<th>행정동코드</th>
				<th>행정동이름</th>
				<th>시간대</th>
				<th>총생활인구</th>
				<th>남자생활인구</th>
				<th>여자생활인구</th>
			</tr>
		</thead>
		<tbody id="data">
		<c:forEach var="data" items="${t_dataList}">
		<tr align="center">
				<td class="t_id">${data.t_id}</td>
				<td class="t_month">${data.t_month}</td>
				<td class="t_place">${data.t_place}</td>
				<td class="t_code">${data.t_code}</td>
				<td class="t_time" >${data.t_time}</td>
				<td class="t_total">${data.t_total}</td>
				<td class="t_man">${data.t_man}</td>
				<td class="t_woman">${data.t_woman}</td>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>



<!-- time chart -->
<script type="text/javascript">

var data = document.getElementById("data");
var t_code = data.getElementsByClassName("t_code")[0].innerText;
var t_place = data.getElementsByClassName("t_place")[0].innerText;
var t_month = data.getElementsByClassName("t_month")[0].innerText;
const man = [];
const woman = [];
const time = [];

for (let i=0; i<10; i++){
	man[i] = data.getElementsByClassName("t_man")[i].innerText;
	woman[i] = data.getElementsByClassName("t_woman")[i].innerText;
	time[i] = data.getElementsByClassName("t_time")[i].innerText;
}

new Chart(document.getElementById("line_chart"),{
   type : 'line',
   data : {
      labels: time ,
      datasets:[
         {
            label:'남성생활인구',
            data : man,
            borderColor : "#3e95cd",
            fill:false
         },
         {
            label:'여성생활인구',
            data: woman,
            borderColor : "#8e5ea2",
            fill:false
         }
      ]
   },
   options: {
      responsive: false,
      legend : {
         position : 'top',
      },
      title : {
         display:true,
         text : '<'+ t_place +'> 의 남녀 생활인구(' + t_month +')'
      },
      animation : {
         animateScale:true,
         anumateRotate:true
      }
      }
});
</script>
</body>
</html>