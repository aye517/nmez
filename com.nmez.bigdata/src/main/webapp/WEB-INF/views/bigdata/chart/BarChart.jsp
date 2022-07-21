<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BarChart.jsp</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<body> 

<canvas id="bar-chart" width="100" height="100"></canvas>


<table>
		<thead>
			<tr>
			<th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="s_data" items="${s_dataList}">
		<tr class="s_data" align="center">
			<td class="s_code">${s_data.s_code}</td>
			<td class="s_palce">${s_data.s_place}</td>
			<td class="s_under_10s">${s_data.s_under_10s}</td>
			<td class="s_10s">${s_data.s_10s}</td>
			<td class="s_early20s">${s_data.s_early20s}</td>
			<td class="s_late20s">${s_data.s_late20s}</td>
			<td class="s_early30s">${s_data.s_early30s}</td>
			<td class="s_late30s">${s_data.s_late30s}</td>
			<td class="s_40s">${s_data.s_40s}</td>
			<td class="s_50s">${s_data.s_50s}</td>
			<td class="s_60s">${s_data.s_60s}</td>
			<td class="s_upper70s">${s_data.s_upper70s}</td>
			<td class="s_gender">${s_data.s_gender}</td>
		</c:forEach>
		</tbody>
	</table>

<script type="text/javascript">
var s_data = document.getElementsByClassName('s_data');
var s_man = s_data[0];
var s_woman = s_data[1];
const s_man_arr = [];
const s_woman_arr = [];
//console.log(s_man);
//console.log(s_woman);

for(let i=0; i<13; i++){
	s_man_arr[i] = s_man.getElementsByTagName('td')[i].innerText;
	s_woman_arr[i] = s_woman.getElementsByTagName('td')[i].innerText;
}

new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["10세미만", "10대", "20초반", "20후반", "30초반"
    	  		, "30후반", "40대", "50대", "60대", "70세이상"],
      datasets: [
        {
          label: s_man_arr[1] + " 남자",
          backgroundColor: ["#3e95cd","#3e95cd","#3e95cd","#3e95cd","#3e95cd",
        	  "#3e95cd","#3e95cd","#3e95cd","#3e95cd","#3e95cd"],
          data: [ s_man_arr[2], s_man_arr[3], s_man_arr[4], s_man_arr[5],
        	  s_man_arr[6], s_man_arr[7], s_man_arr[8], s_man_arr[9],
        	  s_man_arr[10], s_man_arr[11]]
        },
        {
            label: s_man_arr[1] + " 여자",
            backgroundColor: ["#c45850","#c45850","#c45850","#c45850","#c45850",
            	"#c45850","#c45850","#c45850","#c45850","#c45850"],
            data: [ s_woman_arr[2], s_woman_arr[3], s_woman_arr[4], s_woman_arr[5],
        	  	s_woman_arr[6], s_woman_arr[7], s_woman_arr[8], s_woman_arr[9],
        	  	s_woman_arr[10], s_woman_arr[11]]
          }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text:  '<'+ s_man_arr[1] +'> 의 남녀 인구비율'
      }
    }
});
</script>
</body>
</html>