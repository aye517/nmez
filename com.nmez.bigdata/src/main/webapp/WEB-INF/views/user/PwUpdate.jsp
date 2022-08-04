<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>PwUpdate.jsp</title>
<style type="text/css">
.userForm{
	width:50%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0 auto;
	align-items: center;
}
.uesrInput{
	display: flex;
	flex-direction: column;
	position: relative;
	justify-content: center;	
	padding-bottom: 10px;
	padding-top: 10px;
	height: auto;
	align-items: center;
}
.login_button{
	height:40px;
	width: 100%;
}
body{

	font-family: 'Nanum Gothic', sans-serif;
	background: #f5f6f7;
	
}
.int{
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script type="text/javascript">

$(document).ready(function() {
	var sessionCheck = false;
	if ('${session.uId }' == null || '${session.uId }' == ''){
		alert("회원정보가 없습니다. 메인페이지로 이동합니다.");
		window.location.href = 'http://localhost:8000/bigdata';
	}
});

</script>


<script type="text/javascript">
//new 비밀번호 check
var newCheck = false;
var sPw = '${session.uPw}';
var oldPw = $('#oldPw').val();
var newPw = $('#newPw').val();
var newPwCheck = $('#newPwCheck').val();

$(function(){
	$('#newPw').on("change keyup paste", function(){
		$('#newPwCheck').prop('readonly', false); 
		newPw = $('#newPw').val();
			//console.log(newPw);
			if (newPw.length < 8 && newPw.length != ''){
				$("#pwalert").html('8자 이상 입력하세요');
				$("#pwalert").attr('color','red');
				$('#newPw').focus();
				newCheck = false;
			}else{
				if(sPw == newPw){
					$("#pwalert").html('기존 비밀번호와 동일합니다.');
					$("#pwalert").attr('color','red');
					$('#newPw').focus();
					newCheck = false;
				}else{
					$("#pwalert").html('');
					//console.log('pwChecked='+newCheck);
					uPwCheck();
				}
			}
	});
		//console.log('pwChecked='+newCheck);
	});
	

function uPwCheck() {
	$('#newPwCheck').blur(function uPwcheck() {
		
		newPw = $('#newPw').val();
		newPwCheck = $('#newPwCheck').val();
		//newCheck = false;
		//console.log(newCheck);
		if(newPw != newPwCheck){
	    	if(newPwCheck !='' && newPwCheck !=null){
	    		$("#checkPw").html('비밀번호가 일치하지 않습니다.');
				$("#checkPw").attr('color','red');
	    	    $('#newPwCheck').prop('readonly', false); //비밀번호 새로 입력했을때 readonly 해제
	         	$('#newPwCheck').focus();
	         	newCheck = false;
	         	//console.log('pwChecked='+newCheck);
	       }
		}else{
				$("#checkPw").html('비밀번호가 일치합니다.');
				$("#checkPw").attr('color','blue');
		    	$('#newPwCheck').prop('readonly', true); //비밀번호 확인완료시 readonly처리
		    	newCheck = true;
		    	//console.log('pwChecked='+newCheck);
	    }
	});
};

//최종 체크
function check() {
	var sPw = '${session.uPw}';
	var oldPw = $('#oldPw').val();
	var newPw = $('#newPw').val();
	var newPwCheck = $('#newPwCheck').val();
	
	if(oldPw != sPw){
		alert("기존 비밀번호가 올바르지 않습니다.");
	}else{
		if(newCheck == false){
			alert("비밀번호를 올바르게 입력해주세요.");
		}else{
			pwUpdate();
			alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.");			
			sessionOut();
			window.opener.location.href="/bigdata";
			self.close();
		}
	}
};

</script>

<!-- 비밀번호 변경 ajax -->
<script type="text/javascript">

function pwUpdate() {
	//alert("pwU ajax실행");
	var uId = '${session.uId }';
	var newPw = $('#newPw').val();
	//console.log(uId + "ajax newPw =" + newPw);
	const param = {
			"uId" : uId,
			"uPw" : newPw
		};
	$.ajax({
		type : "post",
		url : "pwUpdate",
		contentType : 'application/json',
		data : JSON.stringify(param),
		success : function(result) {
			if(result == 1) {
				console.log("비밀번호 변경완료");
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
	//alert("session out실행");
	$.ajax({
		type : "post",
		url : "sessionOut",
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

</head>

<body>	
<div class="userForm">
<h1>비밀번호 변경</h1>
<div class="userInput">
	<form>
	기존 비밀번호 입력 <input id="oldPw" type="password" class="int"> <br>
	변경 비밀번호 입력 <input id="newPw" type="password" name="uPw" class="int">
	<font id="pwalert" size=2></font><br>
	변경 비밀번호 확인 <input id="newPwCheck" type="password" class="int">
	<font id="checkPw" size=2></font><br>
	<br>
	<input type="button" value="변경하기"  onclick="check()" class="login_button"> 
	</form>
</div>
</div>
</body>
</html>