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

<table>
<thead>
<tr>
<th>woman</th>
<th>man</th>
<th>법카</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="pie" items="${pieData }">
<td class="woman">${pie.woman }</td>
<td class="man">${pie.man }</td>
<td class="bc_card">${pie.bc_card }</td>
</c:forEach>
</tr>
</tbody>
</table>



<canvas id="pie-chart" width="500" height="300"></canvas>


<script type="text/javascript">

var man = document.getElementsByClassName("man");
console.log(man[0].innerText);


new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["남성","여성","법인카드"],
      datasets: [{
        label: "Population",
        backgroundColor: ["#3e95cd", "#e8c3b9",'#b1c2ff'],
        data: [,]
      }]
    },
    options: {
    	responsive: false,
    	title: {
        display: true,
        text: '<'+ + '> 총 생활인구 : ' + + '명'
      }
    }
});

</script>
</body>
</html>