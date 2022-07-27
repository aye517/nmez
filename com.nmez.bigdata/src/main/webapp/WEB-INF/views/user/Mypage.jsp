<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>Mypage.jsp</title>
<style type="text/css">
th, tr ,td{
	padding-right: 25px;
	padding-left: 25px;
	padding-top: 10px;
	padding-bottom: 10px;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function() {
	var sessionCheck = false;
	if ('${session.uId }' == null || '${session.uId }' == ''){
		alert("세션정보가 없습니다. 메인페이지로 이동합니다.");
		window.location.href = 'http://localhost:8000/bigdata';
	}
});
</script>
<script type="text/javascript">

$(function(){ 
	  $("#pwCheck").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".modal_close").click(function(){
	    $(".modal").fadeOut();
	  });
	  
	});

var popupWidth = 500;
var popupHeight = 400;

var popupX = (window.screen.width/2)-(popupWidth/2);
var popupY = (window.screen.height/2)-(popupHeight/2);

function popup(){
	console.log(popupX,popupY);

	window.open("pwUpdate","_blank","status=yes,width="+popupWidth+',height='+popupHeight+',left='+popupX+',top='+popupY+',menubar=yes,toolbar=no,menubar=no,location=no');
>>>>>>> branch 'catdogbranch0725' of http://github.com/aye517/nmez.git
}
function showModalessPopupHelp(sURL,sParam,sWinName) {
	Left = screen.width - 650;
	Top = 0;
	Width = 640;
	Height = 900;
	features = "width="+ Width + ",height=" + Height + ",left=" + Left + ",top=" + Top +",scrollbars=auto,directories=no,menubar=no";
	sURL = sURL + sParam;

	win = window.open(sURL, sWinName, features);
	win.focus();
	return false;
	}
</script>


</head>
<body>

<%@ include file="../main/Header.jsp"%>

<div class="userForm">
<h1> 마이페이지</h1>
<hr>
<form action="update" id="mypage" method="get">
	<div class="user_info_div">
	<table class="user_info_table">
	
	<tr>
		<th><i></i>아이디 </th>
		<td> ${session.uId } </td>
	</tr>
	<tr>
		<th><i></i>이름</th>
		<td> ${session.uName } </td>
	</tr>
	<tr>
		<th><i></i>생년월일</th>
		<td>${session.uBYear } - ${session.uBMonth } - ${session.uBDay } </td>
	</tr>
	<tr>
		<th><i></i>휴대전화</th>
		<td>${session.uPhone1 } - ${session.uPhone2 } - ${session.uPhone3 } </td>
	</tr>
	<tr>
		<th><i></i>주소</th>
		<td>우)${session.uAddr1 } ${session.uAddr2 }  ${session.uAddr3 } </td>
	</tr>
	<tr>
		<th><i></i>이메일</th>
		<td> ${session.uEmail} @ ${session.uEmail_domain} </td>
	</tr>
	</table>
	</div>
	<br>
	<input type="submit" value="정보 수정" class="login_button">
	</form>

	<br>
	 
	
	<input type="button" value="비밀번호 변경" onclick="popup();" class="login_button">

<!-- 팝업창이 하나 열려있으면 더이상 열리지않도록 하기 
	<a href="#" onclick='window.open("/bigdata/pwUpdate","_blank","height=300,width=500, status=yes,toolbar=no,menubar=no,location=no");return false'>
	<button>비밀번호 변경</button></a>
-->
	<br>
	<a href="#" onclick='window.open("/bigdata/userDrop","_blank","height=300,width=500, status=yes,toolbar=no,menubar=no,location=no");return false'>
	<button class="login_button">회원탈퇴하기</button></a>

	</div>



</body>
<%@ include file="../main/Footer.jsp"%>
</html>