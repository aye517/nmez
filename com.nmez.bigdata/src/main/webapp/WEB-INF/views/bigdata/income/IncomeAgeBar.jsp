<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncomeAgeBar.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
<h2>법인, 개인(나이별) 매출</h2>
<table hidden="hidden">
<thead>
<tr>
<th>bc_card</th>
<th>10s</th>
<th>20s</th>
<th>30s</th>
<th>40s</th>
<th>50s</th>
<th>60s</th>
<th>gu</th>
<th>dong</th>
<th>sector</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="data" items="${ageBarData }">
<td class="bc_card">${data.bc_card }</td>
<td class="10s">${data.a10s }</td>
<td class="20s">${data.a20s }</td>
<td class="30s">${data.a30s}</td>
<td class="40s">${data.a40s}</td>
<td class="50s">${data.a50s}</td>
<td class="60s">${data.a60s }</td>
<td class="gu">${data.gu }</td>
<td class="dong">${data.dong }</td>
<td class="sector">${data.sector }</td>
</c:forEach>
</tr>
</tbody>
</table>


<canvas id="bar-chart" width="300" height="230"></canvas>

<script type="text/javascript">

var gu = document.getElementsByClassName("gu")[0].innerText;
var dong = document.getElementsByClassName("dong")[0].innerText;
var sector = document.getElementsByClassName("sector")[0].innerText;
var a10s = document.getElementsByClassName("10s")[0].innerText;
var a20s = document.getElementsByClassName("20s")[0].innerText;
var a30s = document.getElementsByClassName("30s")[0].innerText;
var a40s = document.getElementsByClassName("40s")[0].innerText;
var a50s = document.getElementsByClassName("50s")[0].innerText;
var a60s = document.getElementsByClassName("60s")[0].innerText;
var bc_card = document.getElementsByClassName("bc_card")[0].innerText;


new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["법인매출", "10대", "20대", "30대", "40대", "50대", "60대"],
      datasets: [
        {
          label: "연령별 매출",
          backgroundColor: ["#3e95cd", "#d5d5d5","#3cba9f"
        	  	,"#e8c3b9","#c45850","#ffff99","#8e5ea2" ],
          data: [bc_card, a10s, a20s, a30s, a40s, a50s, a60s]
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