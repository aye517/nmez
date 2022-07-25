<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>Mypage.jsp</title>
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

</script>

</head>
<body>

<%@ include file="../main/Header.jsp"%>

<div class="userForm">
<h1> 마이페이지</h1>
<hr>
<form action="update" id="mypage" method="get">
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
	<br>
	<input type="submit" value="정보 수정">
	<br>
	<button id="pwCheck" onclick=>비밀번호 변경</button>
	<!-- 팝업창에서 비밀번호 확인 후, 비밀번호 변경 창 연결
	<div id ="">
	<a href="#" onclick='window.open("/bigdata/user/PwCheck","_blank","height=100,width=150, status=yes,toolbar=no,menubar=no,location=no");return false'>
	<button>비밀번호 수정</button></a>
	</div> -->
	</form>
</div>
	
<div class="modal">
  <div class="modal_content">
  <div class="modal_close">x</div>
   	<div>
	    <form action="pwCheck" method="post">
	    비밀번호 입력 <input type="password" name="uPw">
	    <input type="submit" value="변경하기">
	    </form>
   	</div>
   	  </div>
</div>
	
</body>
<%@ include file="../main/Footer.jsp"%>
</html>