<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserDrop.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- session check -->
<script type="text/javascript">
$(document).ready(function() {
	var sessionCheck = false;
	if ('${session.uId }' == null || '${session.uId }' == ''){
		alert("회원정보가 없습니다. 메인페이지로 이동합니다.");
		window.location.href = 'http://localhost:8000/bigdata';
	}
});
</script>

<!-- 탈퇴 ajax -->
<script type="text/javascript">
function userDrop() {
	alert("ajax실행");
	var uId = '${session.uId }';
	const param = {
			"uId" : uId
		};
	$.ajax({
		type : "post",
		url : "user/userDrop",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result == 1) {
				console.log("회원탈퇴 완료");
			}else{
				console.log("없는 정보");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});

};
</script>

<!-- session invalidate -->
<script type="text/javascript">
function sessionOut() {
	alert("session out실행");
	$.ajax({
		type : "post",
		url : "user/sessionOut",
		success : function(result) {
			if(result == 1) {
				console.log("session invalidate");
			}else{
				console.log("유효하지 않은 실행");
			}
		},
		error : function() {
			console.log("요청 실패");
		}		
	});
};

</script>


<script type="text/javascript">

//최종 체크
function check() {
	var sId = '${session.uId}';
	var sPw = '${session.uPw}';
	var uId = $('#uId').val();
	var uPw = $('#uPw').val();

	if(sId != uId || sPw != uPw){
		alert("아이디와 비밀번호를 확인해주세요");
	}else{
		userDrop();
		alert("정상적으로 탈퇴되었습니다.");			
		sessionOut();
		window.opener.location.href="/bigdata";
		self.close();
		}
};

</script>


</head>

<body>	

<h1>회원탈퇴</h1>
<h3>아이디와 비밀번호를 입력해주세요</h3>
	<form>
	아이디 <input id="uId" type="text" name="uId" > <br>
	비밀번호 <input id="uPw" type="password" name="uPw"> <br>
	<input type="button" value="회원탈퇴하기"  onclick="check()"> 
	</form>
</body>
</html>