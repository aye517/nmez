<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pie Chart</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="pie-chart" width="500" height="300"></canvas>
</head>
<body>
<script type="text/javascript">
new Chart(document.getElementById("pie-chart"),{
	type:'pie',
	datasets:{
		labels:[],
		data:[],
		backgroundColor:[]
	},
	options:{
		title:{
			display:true,
			text:''
		}
	}
})
</script>
</body>
</html>