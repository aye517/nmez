<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PwUpdate.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script type="text/javascript">
//new 비밀번호 check
var newCheck = false;
var sPw = '${session.uPw}';
var oldPw = $('#oldPw').val();
var newPw = $('#newPw').val();
var newPwCheck = $('#newPwCheck').val();

$(function(){
	$('#newPw').on("change keyup paste", function(){
		newPw = $('#newPw').val();
			console.log(newPw);
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
					console.log('pwChecked='+newCheck);
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
			//alert("비밀번호가 변경되었습니다.");
			self.close();
			window.opener.sessionOut();
			//window.opener.location.href="/bigdata";
		}
	}
};


</script>


<script type="text/javascript">

function pwUpdate() {
	//alert("ajax실행");
	var uId = '${session.uId }';
	var newPw = $('#newPw').val();
	console.log(uId + "ajax newPw =" + newPw);
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

</head>

<body>	

<h1>비밀번호 변경</h1>
	<form>
	기존 비밀번호 입력 <input id="oldPw" type="password"> <br>
	변경 비밀번호 입력 <input id="newPw" type="password" name="uPw">
	<font id="pwalert" size=2></font><br>
	변경 비밀번호 확인 <input id="newPwCheck" type="password">
	<font id="checkPw" size=2></font><br>
	<br>
	<input type="button" value="변경하기"  onclick="check()"> 
	</form>
</body>
</html>