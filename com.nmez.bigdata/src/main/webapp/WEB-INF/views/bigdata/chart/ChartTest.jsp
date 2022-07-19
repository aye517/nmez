<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChartTest.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="line_chart" width="500" height="300"></canvas>


</head>
<body>

</div>
<script type="text/javascript">

new Chart(document.getElementById("line_chart"),{
	type : 'line',
	data : {
		labels:[
			'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
		],
		datasets:[
			{
				label:'2019',
				data:[10,8,6,4,12,11,20,21,22,17,19,9],
				borderColor : "#3e95cd",
				fill:false
			},
			{
				label:'2018',
				data:[1,2,3,4,5,6,7,8,9,10,11,12],
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