<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncomeDayBar.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>

<h2>요일별 매출</h2>
<table hidden="hidden">
<thead>
<tr>
<th>Mon</th>
<th>Tue</th>
<th>Wed</th>
<th>Thu</th>
<th>Fri</th>
<th>Sat</th>
<th>Sun</th>
<th>gu</th>
<th>dong</th>
<th>sector</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="data" items="${dayBarData }">
<td class="mon">${data.Mon}</td>
<td class="tue">${data.Tue}</td>
<td class="wed">${data.Wed}</td>
<td class="thu">${data.Thu}</td>
<td class="fri">${data.Fri}</td>
<td class="sat">${data.Sat}</td>
<td class="sun">${data.Sun}</td>
<td class="gu">${data.gu}</td>
<td class="dong">${data.dong}</td>
<td class="sector">${data.sector}</td>
</c:forEach>
</tr>
</tbody>
</table>


<canvas id="day-bar-chart" width="300" height="230"></canvas>

<script type="text/javascript">

var gu = document.getElementsByClassName("gu")[0].innerText;
var dong = document.getElementsByClassName("dong")[0].innerText;
var sector = document.getElementsByClassName("sector")[0].innerText;
var mon = document.getElementsByClassName("mon")[0].innerText;
var tue = document.getElementsByClassName("tue")[0].innerText;
var wed = document.getElementsByClassName("wed")[0].innerText;
var thu = document.getElementsByClassName("thu")[0].innerText;
var fri = document.getElementsByClassName("fri")[0].innerText;
var sat = document.getElementsByClassName("sat")[0].innerText;
var sun = document.getElementsByClassName("sun")[0].innerText;


new Chart(document.getElementById("day-bar-chart"), {
    type: 'bar',
    data: {
      labels: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
      datasets: [
        {
          label: "요일별 매출",
          backgroundColor: ["#666","#666","#666","#666","#666","#666","#666"],
          data: [mon, tue, wed, thu, fri, sat, sun]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: false,
        text: '<' +gu +' '+ dong +' '+ sector +'>'
      }
    }
});

</script>
</body>
</html>