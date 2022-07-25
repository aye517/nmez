<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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


<!-- 모달창 css확인해주세요! -->
<style type="text/css">
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>

<script type="text/javascript">

function sessionOut() {
	//var sessionData = keyName;
	//sessionStorage.setItem(keyName, keyValue ); // 저장
	//sessionStorage.getItem(keyName); // keyName에 해당하는 값 return (없으면 null)
	//sessionStorage.length; // 저장된 데이터의 갯수 리턴
	//sessionStorage.key(index); // index 번째의 키 이름 return
	//sessionStorage.removeItem(keyName); // keyName에 해당하는 값 삭제
	//sessionStorage.clear(); // 모든 데이터 삭제
	alert("비밀번호가 변경되었습니다. 다시 로그인해주세요");
	session.invalidate();
	window.location.href = 'http://localhost:8000/bigdata';
}

</script>


</head>
<body>

<%@ include file="../main/Header.jsp"%>

<h1> 회원정보수정</h1>

<form action="update" id="mypage" method="get">
	<table>
	
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

	<input type="submit" value="정보 수정">
	</form>
	<!-- 팝업창에서 비밀번호 변경  -->
	<div id ="">
	<a href="#" onclick='window.open("/bigdata/user/PwUpdate","_blank","height=300,width=500, status=yes,toolbar=no,menubar=no,location=no");return false'>
	<button>비밀번호 변경</button></a>
	</div>
	

	
</body>
</html>