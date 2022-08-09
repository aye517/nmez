<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp.jsp</title>
<%@ include file="../main/Header.jsp"%>
<link rel="stylesheet" href="resources/css/style.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js">
Kakao.init('e9b8314301529a33db2e3f1e889eb001');
console.log(Kakao.isInitialized());
</script>
 
<!-- 생년월일 select option -->
<script type="text/javascript">
$(document).ready(function(){
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#uBYear').append('<option value="' + i + '">' + i + '</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#uBMonth').append('<option value="' + mm + '">' + mm + '</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#uBDay').append('<option value="' + dd + '">' + dd+ '</option>');    
    }
    $("#uBYear  > option[value="+year+"]").attr("selected", "true");        
    $("#uBMonth  > option[value="+mon+"]").attr("selected", "true");    
    $("#uBDay  > option[value="+day+"]").attr("selected", "true");       
  
})
</script>


<!-- 다음API -->
<script type="text/javascript">
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            document.getElementById('uAddr1').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("uAddr2").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("uAddr2").value = jibunAddr;
            }
        }
    }).open();
}



</script>

<!-- 좌표 가져오기 -->
<script>

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
		//console.log(data);
		//console.log(data.documents[0].x);
		//console.log(data.documents[0].y);
		$('#uAddr_x').val(data.documents[0].x);
		$('#uAddr_y').val(data.documents[0].y);
		}
	});

};
</script>

<!-- 입력값 검증 -->
<script type="text/javascript">
//정보제공동의체크 안했을 시 입력 불가
$(document).ready(function() {
	//console.log("readonly실행")
	$('.int').attr('readonly', true);
	$('.int_mail').attr('readonly', true);
})

var idCheck = false;
var pwCheck = false;

function uIdCheck() {
	if ($('#uId').val().length < 6){
		$("#checkId").html('6자 이상 입력하세요');
		$("#checkId").attr('color','red');
		idCheck = false
	}else{
		//console.log("ajax실행")
		let uId = $('#uId').val();
		$.ajax({
			url : "bigdata/uIdCheck",
			type : "post",
			contentType : 'application/json',
			data : {"uId" : uId},
			dataType : 'text',
			success : function(result) {
				if(result == 1) {
					$("#checkId").html('사용할 수 없는 아이디입니다.');
					$("#checkId").attr('color','red');
					idCheck = false;
				}else{
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color','blue');
					idCheck = true;
				}
			},
			error : function() {
				console.log("중복체크 요청 실패");
			}		
		})
	}
};

//비밀번호 check
$(function(){
	$('#uPw').on("change keyup paste", function(){
		if ($('#uPw').val().length < 8 && $('#uPw').val().length != ''){
			$("#pwalert").html('8자 이상 입력하세요');
			$("#pwalert").attr('color','red');
			$('#uPw').focus();
			pwCheck = false
		}else{
			$("#pwalert").html('');
			uPwCheck();
		}
		})
		//console.log('pwChecked='+pwCheck);
	});
	
	
function uPwCheck() {
	$('#uPwCheck').blur(function uPwcheck() {
		if($('#uPw').val() != $('#uPwCheck').val()){
	    	if($('#uPwCheck').val()!='' && $('#uPwCheck').val()!=null){
	    		$("#checkPw").html('비밀번호가 일치하지 않습니다.');
				$("#checkPw").attr('color','red');
	    	    $('#uPwCheck').val('');
	    	    $('#uPwCheck').prop('readonly', false); //비밀번호 새로 입력했을때 readonly 해제
	         	$('#uPwCheck').focus();
	    	    pwCheck = false;
	       }
	   }else{
			$("#checkPw").html('비밀번호가 일치합니다.');
			$("#checkPw").attr('color','blue');
	    	$('#uPwCheck').prop('readonly', true); //비밀번호 확인완료시 readonly처리
	    	$('#uName').focus();
	    	pwCheck = true;
	    	//console.log('pwChecked='+pwCheck);
	    }
	});
};
//입력값 무결성 check
var nameCheck = false;
var phoneCheck1 = false;
var phoneCheck2 = false;
var addrCheck = false;

//이름에 한글, 영어만 사용가능
$(function(){
	$('#uName').on("change keyup paste", function(){
	var name = $('#uName').val();
	if (name != null && name != ''){
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^(ㄱ-힣a-zA-Z)]/gi, ''));
		}
		nameCheck = true;
	}else{
		nameCheck = false;
	}
	console.log('nameChecked='+ nameCheck);
	})
});


$(function(){
	$('#uPhone2').on("change keyup paste", function(){
		phoneCheck1 = false;
		var p2 = $('#uPhone2').val();
		if (p2 != null && p2 != ''){
			if(p2.length < 3){
				phoneCheck1 = false;
			}else if(p2.length == 4){
				phoneCheck1 = true;
				$('#uPhone3').focus();
			}
		};
		console.log('PhoneChecked='+ phoneCheck1);
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
		console.log('PhoneChecked='+ phoneCheck2);
		}
	});
});

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
            console.log();
            console.log();
            console.log('AddrChecked='+ addrCheck);
            
        }
    }).open();
};

//check box 표시 여부
var agreeChecked = false;

function isChecked() {
	if($('#agreeCheck').is(':checked')){
		agreeChecked = true;
		$('.int').attr('readonly', false);
		$('.int_mail').attr('readonly', false);
		$('#domain-txt').attr('readonly', true);
	}else{
		agreeChecked = false;
		$('.int').attr('readonly', true);
		$('.int_mail').attr('readonly', true);
	}
	console.log('AgreeChecked='+ agreeChecked);
};


function finalCheck() {
	if(agreeChecked != true) {
		alert("개인정보 동의해야 가입 가능");
		return false;
	}else if(idCheck != true){
		alert("아이디를 확인해주세요");	
		return false;
	}else if(pwCheck != true){
		alert("비밀번호를 확인해주세요");
		return false;
	}else if(nameCheck != true){
		alert("이름을 입력하세요");
		return false;
	}else if(phoneCheck1 != true || phoneCheck2 != true){
		alert("전화번호를 올바르게 입력하세요");
		return false;
	}else if(addrCheck != true){
		alert("주소가 입력되지 않았습니다.")
		return false;
	}
	return true;
	
}

</script>
</head>

<body id="signUp_main">

<main>
	<div id="wrap" class="wrapper">
		<h1>회원가입</h1>
	</div>
	<br>
	<div class="permit">
	<div class="permit_box">
<<<<<<< HEAD
	
	<div style="border-color: red; border: 1px">
	<p style="font:bold; color: red; margin-left: 28% ">
	※본 사이트는 웹 개발 및 데이터 분석 공부를 위한 프로젝트용 사이트입니다.</p>
	<p style="font:bold; color: red;  margin-left: 40% ">
	민감정보를 절대 입력하지마세요※</p>
	</div>
	<br>
	<textarea rows="10" cols="90" readonly="readonly">
&#10;정보제공 등에 대해 동의거부할 수 있으며,
미동의 시 정보 입력 및 회원 가입이 불가능합니다.
&#10;□ 개인정보의 수집ㆍ이용&#10;
- 개인정보 수집ㆍ이용 목적 : 서비스 제공을 위한 개인정보 수집
- 수집ㆍ이용하는 개인정보의 항목 : 성명, 생년월일, 주소, 전화번호, 이메일
- 개인정보의 보유 및 이용 기간 : 가입 후부터 1개월
&#10;
□ 위치정보의 수집ㆍ이용&#10;
- 위치정보수집ㆍ이용 목적 : 서비스 제공을 위한 위치정보 수집
- 위치정보의 보유 및 이용기간 : 가입 후부터 1개월
</textarea>
	
	
	<br>
	
	<div class="checkbox_div">
	<input id="agreeCheck" onclick="isChecked()" type="checkbox" > 동의합니다.
	</div>
	<br>
	
	</div>
	</div>
	<hr>
	<div class="userForm">
	<div class="row_group">
	<div class="userInput">
	<form action="signUp" id="signUp" method="post" onsubmit="return finalCheck();">

	<!-- 모든 input값에 공백처리 -->
	<h3>*아이디</h3>
	<span class="box_int_id">
	<input id="uId" type="text" name="uId" oninput="uIdCheck()" 
	maxlength="18" placeholder="6~16자 아이디 입력"  style="ime-mode:disabled;" class="int"> 
	<font id="checkId" size=2></font>
	</span> 
	
	<br>
	
	<div class="userInput">
	<h3>*비밀번호</h3> 
	<input type="password" id="uPw" name="uPw" placeholder="8~16자 비밀번호 입력" class="int">
	<font id="pwalert" size=2></font>
	</div>
	
	<br>
	<div class="userInput">
	<h3>*비밀번호 확인</h3> <input type="password" id="uPwCheck" name="uPwCheck" placeholder="비밀번호 확인" class="int">
	<font id="checkPw" size=2></font>
	</div>

	<br>

	<h3>*이름</h3> <input type="text" id="uName" name="uName" style="ime-mode:active;" class="int">
	
	<br>
	
	<h3>*생년월일</h3>
	<div class="bir_wrap">
	
	<div class="uBirthday">
		<select id="uBYear" name="uBYear" class="sel"></select>년
		<select id="uBMonth" name="uBMonth" class="sel"></select>월
		<select id="uBDay" name="uBDay" class="sel"></select>일
	</div>

	</div>
	
	<div class="userInput">
		<h3>*휴대전화</h3>
	<div class="uPhone_div">
	<select name="uPhone1" class="sel" id=uPhone1>
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
	</select> - 
	<input id="uPhone2" type="text" maxlength="4" name="uPhone2" class="int"
	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > -
	<input id="uPhone3" type="text" maxlength="4" name="uPhone3" class="int"
	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
	</div>
	</div>


	
	<div class="userInput">
		<h3>*주소</h3>
	<div id="address" class="int_id">
	<span>
	  <input id="uAddr1" type="text" name="uAddr1" placeholder="우편번호" readonly class="int">
	  <input type="button" onclick="findAddr()" value="우편번호 찾기" class="d_form_mini">
	</span>
	  <br>
	  <input id="uAddr2" type="text" name="uAddr2" placeholder="주소" readonly class="int"> 
	  <br>
	  <input type="text" name="uAddr3" placeholder="상세주소" class="int">
	  <input id="uAddr_x" name="uAddr_x" type="hidden">
	  <input id="uAddr_y" name="uAddr_y" type="hidden">
	</div>
	</div>


	<div class="userInput">
		<h3 class="list">이메일</h3>
	<span class="uMail">
	
	<input type="text" name="uEmail" class="int_mail" id="email"> @
	<input type="text" id="domain-txt" readonly="readonly" name="uEmail_domain" class="int_mail" >
		<select id="domain-list">
			<option value="naver.com">naver.com</option>
			<option value="google.com">google.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
			<option value="kakao.com">kakao.com</option>
			<option value="type">직접 입력</option>
		</select>
	</span>
	</div>

	<br>

	<!-- 입력값 조건 만족 안됐을 시  -->
	<input type="submit" value="회원가입하기" class="submit_button">
	</form>
</div>
</div>
</div>
</main>
	
</body>
<%@ include file="../main/Footer.jsp"%>

<!-- 이메일 직접입력 input 활성화 -->
<script type="text/javascript">
//도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if(event.target.value !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.readOnly=false;
  }
})
</script>




</html>