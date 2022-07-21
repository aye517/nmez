<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9b8314301529a33db2e3f1e889eb001"></script>

<body>

<%@ include file="Header.jsp"%>


	<h1> Hello 네명이조~</h1>
	
	<br>
	<br>
	
	<div>
	<h2>TEST 중입니다</h2>
	<br>
	<a href="/bigdata/chartTest" style="color: blue">차트테스트</a>
	<hr>
	
	<!-- 월별 시간대-성별 생활인구수 -->
	<form action="lineChart" method="post">
	<a href="/bigdata/lineChart" style="color: blue">라인차트(시간-성별) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="t_code" placeholder="행정코드">
	<select name="t_month">
		<option selected="selected">1월</option>
		<%for (int i=2; i<=12; i++) {%>
		<option><%=i %>월</option>
		<%}; %>
	</select>
	<input type="submit">
	</form>
	<hr>
	
	<!-- 지역별 생활인구 성별비율 -->
	<form action="pieChart" method="post">
	<a href="/bigdata/pieChart" style="color: blue">파이차트(총생활인구) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="p_code">
	<input type="submit">
	</form>
	<hr>
	
	<!-- 지역별 나이-성별 생활인구수 -->
	<form action="barChart" method="post">
	<a href="/bigdata/barChart" style="color: blue">바차트(지역별 나이-성별 생활인구수) 테스트</a>
	>>>>>> 행정동코드 : <input type="text" name="s_code">
	<input type="submit">
	</form>
	
	</div>
	<br>
	<br>
	
	<h3>메인지도 sample</h3>
	<span></span>
	<div id="map" style="width:500px;height:400px;"></div>
<!-- 검색창 -->
<input type="text">
<!-- 다음지도 띄우기 -->
<script type="text/javascript">
var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 14 // 지도의 확대 레벨 
});

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10, // 클러스터 할 최소 지도 레벨 
    calculator: [10, 30, 50], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다
    texts: getTexts, // texts는 ['삐약', '꼬꼬', '꼬끼오', '치멘'] 이렇게 배열로도 설정할 수 있다 
    styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
            width : '30px', height : '30px',
            background: 'rgba(51, 204, 255, .8)',
            borderRadius: '15px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '31px'
        },
        {
            width : '40px', height : '40px',
            background: 'rgba(255, 153, 0, .8)',
            borderRadius: '20px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '41px'
        },
        {
            width : '50px', height : '50px',
            background: 'rgba(255, 51, 204, .8)',
            borderRadius: '25px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '51px'
        },
        {
            width : '60px', height : '60px',
            background: 'rgba(255, 80, 80, .8)',
            borderRadius: '30px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '61px'
        }
    ]
});

// 클러스터 내부에 삽입할 문자열 생성 함수입니다 
function getTexts( count ) {

  // 한 클러스터 객체가 포함하는 마커의 개수에 따라 다른 텍스트 값을 표시합니다 
  if(count < 10) {
    return '삐약';        
  } else if(count < 30) {
    return '꼬꼬';
  } else if(count < 50) {
    return '꼬끼오';
  } else {
    return '치멘';
  }
}

// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.get("", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
});

	kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

    // 현재 지도 레벨에서 1레벨 확대한 레벨
    var level = map.getLevel()-1;

    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
    map.setLevel(level, {anchor: cluster.getCenter()});
});
</script>
</body>
</html>