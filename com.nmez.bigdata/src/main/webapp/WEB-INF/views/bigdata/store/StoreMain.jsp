<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreMain.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<%@ include file="../../main/Header.jsp"%>
</head>

<div hidden="hidden">
<c:forEach var="gu" items="${guList }">
<span id="gu" >${gu.gu}</span>
</c:forEach>

<c:forEach var="category" items="${categoryList }">
<span id="category" >${category.category}</span>
</c:forEach>
</div>

<div hidden="hidden">
<span id="hGu">${dataList[0].gu}</span>
<span id="hDong">${dataList[0].dong}</span>
<span id="hCategory" >${dataList[0].category}</span>
<span id="hSector" >${dataList[0].sector}</span>
</div>
<script type="text/javascript">

//구 리스트
var guList = [];
guList = document.querySelectorAll('#gu');
var guselect = [];
const dongselect = [];

var i = 0;
for(i=0; i<25; i++){
	guselect[i] = guList[i].innerText;
}
//console.log(guselect);

//구 옵션 select 시 동 옵션 변경
const getGu = (target) => {
	  const guValue = target.value;
	  const guText =  target.options[target.selectedIndex].text;
	  //console.log(guValue);
	  getStoreDong(guValue);
	}


function getStoreDong(guValue) {
	
	//alert("getDong ajax실행");
	const param = {
			"gu" : guValue
		};
	$.ajax({
		type : "post",
		url : "getStoreDong",
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

//구 변경시 바뀐 동 가져오기
function dongUpdate(dongselect) {
	var dataDong = document.getElementById("hDong").innerText;
	$("#select_dong").empty();
  for(var i=0; i < dongselect.length; i++) {
  	$("#select_dong").append('<option value="' + dongselect[i] + '">' + dongselect[i] + '</option>');
  }
  	$("#select_dong  > option[value="+dataDong+"]").attr("selected", "true");  
}

//============================

var dataGu = document.getElementById("hGu").innerText;
var dataDong = document.getElementById("hDong").innerText;
var dataCategory = document.getElementById("hCategory").innerText;
var dataSector = document.getElementById("hSector").innerText;	
	
//카테고리 리스트
var categoryList = [];
categoryList = document.querySelectorAll('#category');
var categoryselect = [];
const sectorselect = [];
var i = 0;
for(i=0; i<4; i++){
	categoryselect[i] = categoryList[i].innerText;
}
//console.log(categoryselect);

//카테고리 옵션 select 시 섹터 옵션 변경
const getCategory = (target) => {
	  const cateValue = target.value;
	  const cateText =  target.options[target.selectedIndex].text;
	  //console.log(cateValue);
	  getStoreSector(cateValue);
	}

function getStoreSector(cateValue) {
	
	//alert("getDong ajax실행");
	const param = {
			"category" : cateValue
		};
	$.ajax({
		type : "post",
		url : "getStoreSector",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result != null) {
				for(i=0; i<result.length; i++){
					sectorselect[i] = result[i].sector;
					}
				sectorUpdate(sectorselect);
			}else{
				console.log("없는 정보");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});
};

//카테고리 변경시 바뀐 섹터 가져오기
function sectorUpdate(sectorselect) {
	var dataSector = document.getElementById("hSector").innerText;
	$("#select_sector").empty();
  for(var i=0; i < sectorselect.length; i++) {
  	$("#select_sector").append('<option value="' + sectorselect[i] + '">' + sectorselect[i] + '</option>');
  }
  	$("#select_sector  > option[value="+dataSector+"]").attr("selected", "true");  
}


//=======================초기 셋팅

function getDongFirst(guValue) {
	//alert("getDong ajax실행");
	const param = {
			"gu" : guValue
		};
	$.ajax({
		type : "post",
		url : "getStoreDong",
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

//시작시 강남구의 동
function dongFirst(dongselect) {
	//console.log(dongselect);
	for(var i=0; i < dongselect.length; i++) {
       $('#select_dong').append('<option value="' + dongselect[i] + '">' + dongselect[i] + '</option>');    
   }
};


//시작시 sector셋팅
function getSectorFirst(categoryValue) {
	//alert("getSector ajax실행");
	const param = {
			"category" : categoryValue
		};
	$.ajax({
		type : "post",
		url : "getStoreSector",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result != null) {
				for(i=0; i<result.length; i++){
					sectorselect[i] = result[i].sector;
				}
				sectorFirst(sectorselect);
			}else{
				console.log("없는 정보");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});
};

function sectorFirst(sectorselect) {
	for(var i=0; i < sectorselect.length; i++) {
       $('#select_sector').append('<option value="' + sectorselect[i] + '">' + sectorselect[i] + '</option>');    
   }
};



//console.log(dongselect);
$(document).ready(function(){
	//console.log('${isLoad}');
    var dataGu = document.getElementById("hGu").innerText;
    var dataDong = document.getElementById("hDong").innerText;
    var dataCategory = document.getElementById("hCategory").innerText;
    var dataSector = document.getElementById("hSector").innerText;
    //console.log(dataGu, dataDong, dataCategory, dataSector);
    
    
 	//첫 검색 페이지, 정보 검색 후 페이지 처리
    if( '${isLoad}' === 'true'){
    	  if ( dataGu === '' || dataGu === null){
    	    	$('#showCharts').hide();
    	 		$('#noData').append("<h1>해당 지역의 데이터가 없습니다!</h1>");
    	     }else{
    	    	 $('#showCharts').show();
    	     }
    }else{
    	if ( dataGu === '' || dataGu === null){
	    	$('#showCharts').hide();
	     }else{
	    	 $('#showCharts').show();
	     }
    	
    };
   
	
    //구 selectbox
	 if ( dataGu === '' || dataGu === null){
		for(var i=0 ; i < guselect.length ; i++) {
			$('#select_gu').append('<option value="' + guselect[i] + '">' + guselect[i] + '</option>');    
		}
		$("#select_gu  > option[value="+guselect[0]+"]").attr("selected", "true"); 
		
	 } else{
		for(var i=0 ; i < guselect.length ; i++) {
			$('#select_gu').append('<option value="' + guselect[i] + '">' + guselect[i] + '</option>');    
		}
		$("#select_gu  > option[value="+dataGu+"]").attr("selected", "true");     
	 }
  
   //동 selectbox   
    if ( dataGu === '' || dataGu === null){
		getDongFirst(guselect[0]);
        $("#select_dong  > option[value="+dongselect[0]+"]").attr("selected", "true");    
	}else {
		//getDong(dataGu);
	};
   //console.log(dongselect[0]);
   
    //카테고리 selectbox
	 if ( dataGu === '' || dataGu === null){
		for(var i=0 ; i < categoryselect.length ; i++) {
			$('#select_category').append('<option value="' + categoryselect[i] + '">' + categoryselect[i] + '</option>');    
		}
		$("#select_category  > option[value="+categoryselect[0]+"]").attr("selected", "true"); 
		
	 } else{
		for(var i=0 ; i < categoryselect.length ; i++) {
			$('#select_category').append('<option value="' + categoryselect[i] + '">' + categoryselect[i] + '</option>');    
		}
		$("#select_category  > option[value="+dataCategory+"]").attr("selected", "true");     
	 }
   
	//셀터 selectbox   
	    if ( dataGu === '' || dataGu === null){
			getSectorFirst(categoryselect[0]);
	        $("#select_sector  > option[value="+sectorselect[0]+"]").attr("selected", "true");    
		}else {
			getStoreSector(dataCategory);
		};
}); //function end



</script>

<body>


<h1>상권분류</h1>
<br>
<h3>지역과 분류를 선택하세요 <i class="fa-solid fa-arrow-pointer"></i></h3>

<form id="select" action="storeChart" method="get" >
지역구 <select onchange="getGu(this)" id="select_gu" name="gu"></select>
<select id="select_dong" hidden="hidden"></select>
대분류 <select onchange="getCategory(this)" id='select_category' name="category"></select>
소분류 <select id="select_sector" name="sector"></select>
<input type="submit" value="검색">
</form>

<hr>
<div id="showCharts">
<h1></h1>
<%@ include file="./StoreBarChart.jsp"%>
</div>

<div id="noData">

</div>

</body>
<%@ include file="../../main/Footer.jsp"%>
</html>