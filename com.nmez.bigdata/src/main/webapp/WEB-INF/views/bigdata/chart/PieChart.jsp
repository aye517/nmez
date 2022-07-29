<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<title>PieChart.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>

<div class="canvas-container">
<canvas id="pie-chart" width="500" height="300"></canvas>
</div>


<div class="chart_table">
	<table hidden="hidden">
		<thead>
			<tr>
				<th>no.</th>
				<th>행정동이름</th>
				<th>행정동코드</th>
				<th>총생활인구</th>
				<th>남자생활인구</th>
				<th>여자생활인구</th>
			</tr>
		</thead>
		<tbody>
		<tr id ="p_data" align="center">
			<td id="p_id">${p_data.p_id}</td>
			<td id="p_code">${p_data.p_code}</td>
			<td id="p_place">${p_data.p_place}</td>
			<td id="p_total">${p_data.p_total}</td>
			<td id="p_man">${p_data.p_man}</td>
			<td id="p_woman">${p_data.p_woman}</td>		
		</tbody>
	</table>
	</div>
<hr>


<script type="text/javascript">

var data = document.getElementById('p_data');
const data_arr = [];

for (i=0; i<6; i++){
data_arr[i] = data.getElementsByTagName('td')[i].innerText;
}

//console.log(data_arr);

new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["남성","여성"],
      datasets: [{
        label: "Population",
        backgroundColor: ["#3e95cd", "#e8c3b9"],
        data: [data_arr[4],data_arr[5]]
      }]
    },
    options: {
    	responsive: false,
    	title: {
        display: true,
        text: '<'+ data_arr[2]+ '> 총 생활인구 : ' + data_arr[3] + '명'
      }
    }
});

</script>
</body>
</html>