<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- session check -->
<script type="text/javascript">
$(document).ready(function() {
	var sessionCheck = false;
	if ('${session.uId }' == null || '${session.uId }' == ''){
		alert("세션정보가 없습니다. 메인페이지로 이동합니다.");
		window.location.href = 'http://localhost:8000/bigdata';
	}
});
</script>

<!-- 주소변경 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js">
Kakao.init('e9b8314301529a33db2e3f1e889eb001');
console.log(Kakao.isInitialized());
</script>

<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	//console.log(data);
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            document.getElementById('uAddr1').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("uAddr2").value = roadAddr;
                addrCheck = true;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("uAddr2").value = jibunAddr;
                addrCheck = true;
            }
            getCoords();
        }
    }).open();
};

function getCoords() {
	console.log("좌표담기");
	var uAddr = $('#uAddr2').val();
	var uAddr_x, uAddr_y;
	console.log(uAddr);
	$.ajax({		 
		url:'https://dapi.kakao.com/v2/local/search/address.json?query='+ encodeURIComponent(uAddr),
		headers: { 'Authorization': 'KakaoAK 0524e1eab081ae2ac905d6a5b76e3601'},
		type: 'GET',
		dataType : "json",
		success : function(data){
		$('#uAddr_x').val(data.documents[0].x);
		$('#uAddr_y').val(data.documents[0].y);
		}
	});

};
</script>

<script type="text/javascript">
var phoneCheck1 = true;
var phoneCheck2 = true;

$(function(){
	$('#uPhone2').on("change keyup paste", function(){
		phoneCheck1 = false;
		var p2 = $('#uPhone2').val();
		if (p2 != null && p2 != ''){
			if(p2.length < 3){
				phoneCheck1 = false;
			}else if(p2.length == 3){
				phoneCheck1 = true;
			}else if(p2.length == 4){
				phoneCheck1 = true;
				$('#uPhone3').focus();
			}
		};
		//console.log('PhoneChecked='+ phoneCheck1);
	});
});

$(function(){
	$('#uPhone3').on("change keyup paste", function(){
		phoneCheck2 = false;
		var p3 = $('#uPhone3').val();
		if (p3 != null && p3 != ''){
			if(p3.length < 4){
				phoneCheck2 = false;
			}else{
				phoneCheck2 = true;			
		}
		//console.log('PhoneChecked='+ phoneCheck2);
		}
	});
});

function updateCheck() {
	var up2 = $('#uPhone2').val();
	var up3 = $('#uPhone3').val();
	if ((phoneCheck1 != true || phoneCheck2 != true)){
		alert("휴대전화 번호를 확인하세요.");
		return false;
	}
	return true;
}
</script>


</head>
<body>

<%@ include file="../main/Header.jsp"%>

	<div class="userForm">
	<h1> 회원정보수정</h1>
	<div class="userInput">
<form action="update" id="update" method="post" onsubmit="return updateCheck()">
	<div class="userInput">
	<h3>아이디</h3>
	<span class="box_int_id">
	<input type="text" name="uId" value="${session.uId }" readonly="readonly" class="int"> 
	</span>

	</div>
	
	<div class="userInput">
	<h3>
	이름 : ${session.uName }<br>
	</h3>
	</div>
	
	<div class="userInput">
	<h3>
	생년월일 : ${session.uBYear }/${session.uBMonth }/${session.uBDay }<br>
	</h3>
	</div>
	
	<div class="userInput">
	<h3>휴대전화</h3>
	<div class="uPhone_div">
	<select name="uPhone1" class="sel"  id=uPhone1>
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	</select> -
	<input id="uPhone2" type="text" maxlength="4" name="uPhone2" value="${session.uPhone2 }"
	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="int"> -
	<input id="uPhone3" type="text" maxlength="4" name="uPhone3"  value="${session.uPhone3 }"
	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="int">
	</div>
	</div>

	<div class="userInput">
	<h3>*주소</h3>
	<div id="address" class="int_id">
	<span>
	  <input id="uAddr1" type="text" name="uAddr1" placeholder="우편번호" value="${session.uAddr1}" readonly class="int">
	  <input type="button" onclick="findAddr()" value="우편번호 찾기"><br>
	</span>
	<br>
	  <input id="uAddr2" type="text" name="uAddr2" placeholder="주소" value="${session.uAddr2}" readonly class="int"> <br>
	  <input type="text" name="uAddr3" placeholder="상세주소" value="${session.uAddr3}" class="int">
	  <input id="uAddr_x" name="uAddr_x" type="hidden" value="${session.uAddr_x}">
	  <input id="uAddr_y" name="uAddr_y" type="hidden" value="${session.uAddr_y}">
	
	</div>
	</div>

	<div class="userInput">
	<h3>이메일</h3>
	<span class="uMail">
	<input type="text" name="uEmail" value="${session.uEmail}" class="int_mail" id="email"> @
	<input text="email" id="domain-txt" readonly="readonly" name="uEmail_domain" value="${session.uEmail_domain}" class="int_mail">
	<select id="domain-list">
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="nate.com">nate.com</option>
		<option value="kakao.com">kakao.com</option>
		<option value="type">직접 입력</option>
	</select>
	</span>
	<br>
	<input type="submit" value="수정" class="submit_button">
	</div>
	</form>
	</div>
	</div>
	
</body>
<%@ include file="../main/Footer.jsp"%>
</html>