<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncomeMain.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/chart.css?ver=1">
<%@ include file="../../main/Header.jsp"%>
</head>
<div>
<c:forEach var="gu" items="${guList }">
<span id="gu" hidden="hidden">${gu.gu}</span>
</c:forEach>

<c:forEach var="dong" items="${dongList }">
<span id="dong" hidden="hidden">${dong.dong}</span>
</c:forEach>

<c:forEach var="sector" items="${sectorList }">
<span id="sector" hidden="hidden">${sector.sector}</span>
</c:forEach>
</div>
<script type="text/javascript">

//구 리스트
var guList = [];
guList = document.querySelectorAll('#gu');
var guselect = [];

var i = 0;
for(i=0; i<25; i++){
	guselect[i] = guList[i].innerText;
}
//console.log(gu);


//업종별 리스트
var sectorList = [];
sectorList = document.querySelectorAll('#sector');
var sectorselect = [];

for(i=0; i<23; i++){
	sectorselect[i] = sectorList[i].innerText;
};
//console.log(sector);


//동 리스트
var dongList = [];
dongList = document.querySelectorAll('#dong');
//console.log(dong);


//구별 동 리스트 생성 시작=============================

//구 옵션 select 시 동 옵션 변경
const getGu = (target) => {
	  const guValue = target.value;
	  const guText =  target.options[target.selectedIndex].text;
	  console.log(guValue);
	  getDong(guValue);
	}

const dongselect = [];


//시작시 강남구의 동
function dongFirst(dongselect) {
	//console.log(dongselect);
 	for(var i=0; i < dongselect.length; i++) {
         $('#select_dong').append('<option value="' + dongselect[i] + '">' + dongselect[i] + '</option>');    
     }
};

//구 변경시 바뀐 동 가져오기
function dongUpdate(dongselect) {
	var pieDong = document.getElementById("hDong").innerText;
	$("#select_dong").empty();
  for(var i=0; i < dongselect.length; i++) {
  	$("#select_dong").append('<option value="' + dongselect[i] + '">' + dongselect[i] + '</option>');
  }
  	$("#select_dong  > option[value="+pieDong+"]").attr("selected", "true");  
}


function getDong(guValue) {
	
	//alert("getDong ajax실행");
	const param = {
			"gu" : guValue
		};
	$.ajax({
		type : "post",
		url : "getDong",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result != null) {
				for(i=0; i<result.length; i++){
					dongselect[i] = result[i].dong;
					}
				
				dongUpdate(dongselect);
			//console.log(dongselect[0]);
			}else{
				console.log("없는 정보");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});
};


function getDongFirst(guValue) {
	
	//alert("getDong ajax실행");
	const param = {
			"gu" : guValue
		};
	$.ajax({
		type : "post",
		url : "getDong",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result != null) {
				for(i=0; i<result.length; i++){
					dongselect[i] = result[i].dong;
					}				
			//console.log(dongselect[0]);
			dongFirst(dongselect);
			}else{
				console.log("없는 정보");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});
};


//console.log(dongselect);
$(document).ready(function(){
	//console.log('${isLoad}');
    var pieId = document.getElementById("hId").innerText;
    //console.log(pieId);
    var pieGu = document.getElementById("hGu").innerText;
    var pieDong = document.getElementById("hDong").innerText;
    var pieSector = document.getElementById("hSector").innerText;
    //console.log(pieGu, pieDong, pieSector);
    //console.log("pieId="+pieId);
    //$('#noData').hide();
    
    //첫 검색 페이지, 정보 검색 후 페이지 처리
    if( '${isLoad}' === 'true'){
    	  if ( pieId === '' || pieId === null){
    	    	$('#showCharts').hide();
    	 		$('.noData').append("<div style='display:flex;justify-content:center;align-items:center;height:250px;'><h1>해당 지역의 데이터가 없습니다!</h1></div>");
    	     }else{
    	    	 $('#showCharts').show();
    	     }
    }else{
    	if ( pieId === '' || pieId === null){
	    	$('#showCharts').hide();
	     }else{
	    	 $('#showCharts').show();
	     }
    	
    };
   
	
    //구 selectbox
	 if ( pieId === '' || pieId === null){
		for(var i=0 ; i < guselect.length ; i++) {
			$('#select_gu').append('<option value="' + guselect[i] + '">' + guselect[i] + '</option>');    
		}
		$("#select_gu  > option[value="+guselect[0]+"]").attr("selected", "true"); 
		
	 } else{
		for(var i=0 ; i < guselect.length ; i++) {
			$('#select_gu').append('<option value="' + guselect[i] + '">' + guselect[i] + '</option>');    
		}
		$("#select_gu  > option[value="+pieGu+"]").attr("selected", "true");     
	 }
  
   //동 selectbox   
    if ( pieId === '' || pieId === null){
		getDongFirst(guselect[0]);
        $("#select_dong  > option[value="+dongselect[0]+"]").attr("selected", "true");    
	}else {
		getDong(pieGu);
	};
   //console.log(dongselect[0]);
   
   //sector selectbox
   
   if ( pieId === '' || pieId === null){
	   for(var i=0; i < sectorselect.length; i++) {
	       $('#select_sector').append('<option value="' + sectorselect[i] + '">' + sectorselect[i] + '</option>');   
		}	
	   $("#select_sector  > option[value="+sectorselect[0]+"]").attr("selected", "true");
	}else {
		for(var i=0; i < sectorselect.length; i++) {
		       $('#select_sector').append('<option value="' + sectorselect[i] + '">' + sectorselect[i] + '</option>');   
		}
	    $("#select_sector > option[value="+pieSector+"]").attr("selected", "true");
	}
}); //function end


</script>

<body>


<span id="hId" hidden="hidden">${pieData[0].id}</span>
<span id="hGu" hidden="hidden">${pieData[0].gu}</span>
<span id="hDong" hidden="hidden">${pieData[0].dong}</span>
<span id="hSector" hidden="hidden">${pieData[0].sector}</span>

<article class="area_select">
<div>
<h1>매출분석</h1>
</div>
<br>
<div>
<h3>지역과 업종을 선택하세요 <i class="fa-solid fa-arrow-pointer"></i></h3>
<br>
</div>

<form id="select" action="incomeCharts" method="get" >
<div class="select_form">
<select onchange="getGu(this)" id="select_gu" name="gu" class="sel"></select>
<select id="select_dong" name="dong" class="sel"></select>
<select id="select_sector" name="sector" class="sel"></select>
</div>
<div class="form_submit">
<input type="submit" value="검색" class="chart_submit_button">
</div>
</form>
</article>

<hr>

<div id="showCharts">

<div class="Sales_information">
<h1>${pieData[0].gu} ${pieData[0].dong} ${pieData[0].sector} 매출정보</h1>
</div>
<br>

<div class="charts_main">
<%@ include file="./IncomeCharts.jsp"%>
</div>

</div>

<!--넓게 나오게 해주세요 -->
<div class="noData">

</div>

</body>
<%@ include file="../../main/Footer.jsp"%>
</html>