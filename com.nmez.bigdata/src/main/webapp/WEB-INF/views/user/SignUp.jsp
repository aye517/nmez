<%@page import="com.nmez.bigdata.api.GeocodingApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp.jsp</title>
<%@ include file="../main/Header.jsp"%>
<link rel="stylesheet" href="/bigdata/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCCVT0MZOPAQhunhMdmo8N6gjvCW42QQH4"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9b8314301529a33db2e3f1e889eb001"></script>


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
<script type="text/javascript">
</script>

<!-- ID중복확인, PW일치 확인 ajax -->
<script type="text/javascript">
var idCheck = false;
var pwCheck = false;
var nameCheck = false;

function uIdCheck() {
	if ($('#uId').val().length < 6){
		$("#checkId").html('6자 이상 입력하세요');
		$("#checkId").attr('color','red');
	}else{
		console.log("ajax실행")
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
		$('#uPwCheck').blur(function(){
		   if($('#uPw').val() != $('#uPwCheck').val()){
		    	if($('#uPwCheck').val()!='' && $('#uPwCheck').val()!=null){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#uPwCheck').val('');
		    	    $('#uPwCheck').prop('readonly', false); //비밀번호 새로 입력했을때 readonly 해제
		         	$('#uPwCheck').focus();
		    	    pwCheck = false;
		    	    //console.log('pwChecked='+pwCheck);
		       }
		   }else{
		    	   alert('비밀번호가 일치합니다.');
		    	   $('#uPwCheck').prop('readonly', true); //비밀번호 확인완료시 readonly처리
		    	   $('#uName').focus();
		    	   pwCheck = true;
		    	   //console.log('pwChecked='+pwCheck);
		    }
		})
		   console.log('pwChecked='+pwCheck);
	});


</script>
</head>
<body id="signUp_main">
<main>
	<h1>회원가입</h1>
	
	<textarea rows="5" cols="30">
	개인정보 및 위치정보 제공 동의
	</textarea> <br>
	<input type="checkbox" > 동의합니다. <!-- 미동의 시 가입불가 처리하기 -->
	
	<hr>
	<form action="signUp" method="post">
	<!-- *값은 NOT NULL -->
	<!-- 모든 input값에 공백처리 -->
	*아이디 <input id="uId" type="text" name="uId" oninput="uIdCheck()" maxlength="18" placeholder="아이디는 6~16자 영문, 영문+숫자"> 
	<font id="checkId" size=2></font>
	<br>
	*비밀번호 <input type="password" id="uPw" name="uPw" placeholder="비밀번호는 영문+숫자+특수문자 조합">
	<br>
	*비밀번호 확인 <input type="password" id="uPwCheck" name="uPwCheck">
	<font id="checkPw" size=2></font>
	<!-- 비밀번호 중복체크 ajax 구현 -->
	<br>
	*이름 <input type="text" id="uName" name="uName"> <!-- 숫자 포함할경우 alert -->
	<br>
	*생년월일
	<select id="uBYear" name="uBYear"></select>년
	<select id="uBMonth" name="uBMonth"></select>월
	<select id="uBDay" name="uBDay"></select>일
	
	<br>
	<!-- 숫자가 아닐경우 입력X or alert -->
	*전화번호
	<select name="uPhone1">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	</select>-
	<input type="text" name="uPhone2">-
	<input type="text" name="uPhone3">
	<br>
	*주소
	  <input id="uAddr1" type="text" name="uAddr1" placeholder="우편번호" readonly>
	  <input type="button" onclick="findAddr()" value="우편번호 찾기"><br>
	  <input id="uAddr2" type="text" name="uAddr2" placeholder="주소" readonly> <br>
	  <input id="uAddr3" type="text" name="uAddr3" placeholder="상세주소">
	  <input id="uAddr_x" type="hidden">
	  <input id="uAddr_y" type="hidden">
	<br>
	이메일
	<!-- 직접입력시 형식 준수여부 .을 포함? -->
	<input type="text" name="uEmail"> @
	<input type="text" id="domain-txt" readonly="readonly" name="uEmail_domain">
	<select id="domain-list">
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="nate.com">nate.com</option>
		<option value="kakao.com">kakao.com</option>
		<option value="type">직접 입력</option>
	</select>
	<br>
	<!-- 입력값 조건 만족 안됐을 시  -->
	<input type="submit" value="회원가입하기">
	</form>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
	<p>엡벨ㄹ베베벨벨</p>
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