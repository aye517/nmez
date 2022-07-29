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

<%@ include file="../../main/Header.jsp"%>
</head>

<c:forEach var="gu" items="${guList }">
<span id="gu" hidden="hidden">${gu.gu}</span>
</c:forEach>

<c:forEach var="dong" items="${dongList }">
<span id="dong" hidden="hidden">${dong.dong}</span>
</c:forEach>

<c:forEach var="sector" items="${sectorList }">
<span id="sector" hidden="hidden">${sector.sector}</span>
</c:forEach>

<script type="text/javascript">

//구 리스트
var guList = [];
guList = document.querySelectorAll('#gu');
var gu = [];

var i = 0;
for(i=0; i<25; i++){
	gu[i] = guList[i].innerText;
}
//console.log(gu);


//동 리스트
var dongList = [];
dongList = document.querySelectorAll('#dong');
var dong = [];

for(i=0; i<369; i++){
	dong[i] = dongList[i].innerText;
	}
//console.log(dong);

//업종별 리스트
var sectorList = [];
sectorList = document.querySelectorAll('#sector');
var sector = [];

for(i=0; i<23; i++){
	sector[i] = sectorList[i].innerText;
	}
//console.log(sector);

$(document).ready(function(){
    //구 selectbox
    for(var i=0 ; i < gu.length ; i++) {
        $('#select_gu').append('<option value="' + gu[i] + '">' + gu[i] + '</option>');    
    }
    //동 selectbox            
    for(var i=0; i < dong.length; i++) {
        $('#select_dong').append('<option value="' + dong[i] + '">' + dong[i] + '</option>');    
    }
    //업종 selectbox
    for(var i=0; i < sector.length; i++) {
        $('#select_sector').append('<option value="' + sector[i] + '">' +sector[i] + '</option>');    
    }
    //받아온 데이터값이 없으면 0번째 option default
    if ('${pieData}' != ''){
    $("#select_gu  > option[value=${pieData[0].gu}]").attr("selected", "true");        
    $("#select_dong  > option[value=${pieData[0].dong}").attr("selected", "true");    
    $("#select_sector  > option[value=${pieData[0].sector}]").attr("selected", "true");           	
    } else{
    	$("#select_gu  > option[value="+gu[0]+"]").attr("selected", "true");        
        $("#select_dong  > option[value="+dong[0]+"]").attr("selected", "true");    
        $("#select_sector  > option[value="+sector[0]+"]").attr("selected", "true");           	
    }
    
});
</script>


<body>
<form action="incomeCharts" method="get" >
<select id="select_gu" name="gu" class="sel"></select>
<select id="select_dong" name="dong" class="sel"></select>
<select id="select_sector" name="sector" class="sel"></select>
<input type="submit">
</form>

<%@ include file="./IncomeCharts.jsp"%>

</body>
<%@ include file="../../main/Footer.jsp"%>
</html>