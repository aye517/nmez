<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChartTest.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body>

code search:
<form action="chartTest" method="post">
	<input type="text" name="t_local_code">
	<input type="submit">
</form>

<canvas id="line_chart" width="500" height="300"></canvas>


<table hidden="hidden">
	<thead>
		<tr>
			<th>no.</th>
			<th>행정동코드</th>
			<th>행정동이름</th>
			<th>시간대</th>
			<th>남자생활인구</th>
			<th>여자생활인구</th>
		</tr>
	</thead>
	<tbody id="data">
	<c:forEach var="data" items="${dataList}">
	<tr align="center">
			<td class="t_id">${data.t_id}</td>
			<td class="t_local_code">${data.t_local_code}</td>
			<td class="t_id">${data.t_local_name}</td>
			<td class="t_time" >${data.t_time}</td>
			<td class="t_mpop">${data.t_mpop}</td>
			<td class="t_wpop">${data.t_wpop}</td>
	</c:forEach>
	</tbody>
	</table>
	
	<div>
	
	생활인구별
	활동인구 가장 많은 시간
	남 <input type="text" name="mhigh" value="" readonly>
	여 <input type="text" name="whigh" value="" readonly>
	
	활동인구 가장 적은 시간
	남<input type="text" name="mlow" value="" readonly>
	여<input type="text" name="wlow" value="" readonly>
	
	</div>

<!--<button onclick="getChart()">버튼</button>  -->

<script type="text/javascript">
document.ready(function() {
	var data = document.getElementById("data");
	var t_local_code = data.getElementsByClassName("t_local_code")[0].innerText;

	const mpop = [];
	const wpop = [];
	const time = [];
	var mhigh, mlow, whigh, wlow;

	for (let i=0; i<10; i++){
		time[i] = data.getElementsByClassName("t_time")[i].innerText;
		mpop[i] = data.getElementsByClassName("t_mpop")[i].innerText;
		wpop[i] = data.getElementsByClassName("t_wpop")[i].innerText;
		if()
	}
	
	
	
});

</script>
 -->


<script type="text/javascript">

var data = document.getElementById("data");
var t_local_code = data.getElementsByClassName("t_local_code")[0].innerText;

const mpop = [];
const wpop = [];
const time = [];

for (let i=0; i<10; i++){
	mpop[i] = data.getElementsByClassName("t_mpop")[i].innerText;
	wpop[i] = data.getElementsByClassName("t_wpop")[i].innerText;
	time[i] = data.getElementsByClassName("t_time")[i].innerText;
}

new Chart(document.getElementById("line_chart"),{
   type : 'line',
   data : {
      labels: time,
      datasets:[
         {
            label:'남성생활인구',
            data : mpop,
            borderColor : "#3e95cd",
            fill:false
         },
         {
            label:'여성생활인구',
            data: wpop,
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
         text : 'Chart Test'
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