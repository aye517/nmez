<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreBarChart.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>

<h2>${dataList[0].gu} ${dataList[0].sector} 상권 현황 </h2>

<c:forEach var="data" items="${dataList }">
<span class="dong_data" hidden="hidden">${data.dong}</span>
<span class="count_data" hidden="hidden">${data.count}</span>
</c:forEach>
<hr>


<canvas id="bar-chart" width="600" height="400"></canvas>




<script type="text/javascript">
var dongL = document.getElementsByClassName("dong_data");
const dong_data = [];
for (var i=0; i<dongL.length; i++){
	dong_data[i] = document.getElementsByClassName("dong_data")[i].innerText;
	
}
//console.log(dong_data);
const count_data = [];

for (var i=0; i<dongL.length; i++){
	count_data[i] = document.getElementsByClassName("count_data")[i].innerText;
}

new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: dong_data,
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2",
        	  "#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2",
        	  "#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2",
        	  "#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2","#8e5ea2",],
          data: count_data
        }
      ]
    },
    options: {
      responsive: false,
      legend: { display: false },
      title: {
        display: false,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

</script>
</body>
</html>