<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncomePie.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
<h2>매출 남녀비율</h2>
<table hidden="hidden">
<thead>
<tr>
<th>woman</th>
<th>man</th>
<th>gu</th>
<th>dong</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="data" items="${pieData }">
<td class="woman">${data.woman }</td>
<td class="man">${data.man }</td>
<td class="gu">${data.gu }</td>
<td class="dong">${data.dong }</td>
<td class="sector">${data.sector }</td>
</c:forEach>
</tr>
</tbody>
</table>



<canvas id="pie-chart" width="500" height="300"></canvas>


<script type="text/javascript">

var man = document.getElementsByClassName("man")[0].innerText;
//console.log(man);
var woman = document.getElementsByClassName("woman")[0].innerText;
var gu = document.getElementsByClassName("gu")[0].innerText;
var dong = document.getElementsByClassName("dong")[0].innerText;
var sector = document.getElementsByClassName("sector")[0].innerText;



new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["남자 하루매출 : "+ man +"원"
    	  	,"여자 하루매출 : "+ woman +"원"],
      datasets: [{
        label: "Population",
        backgroundColor: ["#3e95cd", "#e8c3b9"],
        data: [man, woman]
      }]
    },
    options: {
    	responsive: false,
    	title: {
        display: false,
        text: '<' +gu +' '+ dong +' '+ sector +'>'
      }
    }
});

</script>
</body>
</html>