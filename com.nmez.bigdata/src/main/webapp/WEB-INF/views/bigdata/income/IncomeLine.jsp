<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncomeLine.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
<h2>시간별 매출</h2>
<table hidden="hidden">
<thead>
<tr>
<th>00-06</th>
<th>06-11</th>
<th>11-14</th>
<th>14-17</th>
<th>17-21</th>
<th>21-24</th>
<th>gu</th>
<th>dong</th>
<th>sector</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="data" items="${lineData }">
<td class="0006">${data.t00_06 }</td>
<td class="0611">${data.t06_11 }</td>
<td class="1114">${data.t11_14 }</td>
<td class="1417">${data.t14_17 }</td>
<td class="1721">${data.t17_21 }</td>
<td class="2124">${data.t21_24 }</td>
<td class="gu">${data.gu }</td>
<td class="dong">${data.dong }</td>
<td class="sector">${data.sector }</td>
</c:forEach>
</tr>
</tbody>
</table>



<canvas id="line-chart" width="500" height="300"></canvas>


<script type="text/javascript">

var gu = document.getElementsByClassName("gu")[0].innerText;
var dong = document.getElementsByClassName("dong")[0].innerText;
var sector = document.getElementsByClassName("sector")[0].innerText;
var t00_06 = document.getElementsByClassName("0006")[0].innerText;
var t06_11 = document.getElementsByClassName("0611")[0].innerText;
var t11_14 = document.getElementsByClassName("1114")[0].innerText;
var t14_17 = document.getElementsByClassName("1417")[0].innerText;
var t17_21 = document.getElementsByClassName("1721")[0].innerText;
var t21_24 = document.getElementsByClassName("2124")[0].innerText;

//console.log(t00_06, t06_11, t11_14 , t14_17, t17_21, t21_24 );
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: ['00시-06시', '06시-11시', '11시-14시'
	    		, '14시-17시', '17시-21시', '21시-24시' ],
	    datasets: [{ 
	        data: [t00_06, t06_11, t11_14 , t14_17, t17_21, t21_24 ],
	        label: "시간별 매출",
	        borderColor: "#3cba9f",
	        fill: false
	      }]
	  },
	  options: {
	    title: {
	      display: false,
	      text: '<' +gu +' '+ dong +' '+ sector +'> 시간별 매출' 
	    }
	  }
	});



</script>
</body>
</html>