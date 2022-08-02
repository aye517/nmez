<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header.jsp</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/ff98a1e189.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="resources/js/main.js" defer="defer"></script>

<script type="text/javascript">
$(function(){ 
	  $("#login").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".modal_close").click(function(){
	    $(".modal").fadeOut();
	  });
	  
	});
</script>

<!-- session 전달 시 -->
<script type="text/javascript">
$(document).ready(function() {
	var sessionCheck = false;
	if ('${session.uId }' == null || '${session.uId }' == ''){
		console.log("session없음");
		$('#signup').prop('hidden', false);
		$('#login').prop('hidden', false);
		$('#update').prop('hidden', true);
		$('#logout').prop('hidden', true);
	}else{
		console.log("session있음");
		$('#signup').prop('hidden', true);
		$('#login').prop('hidden', true);
		$('#update').prop('hidden', false);
		$('#logout').prop('hidden', false);
	}
});
 
</script>

</head>

<body id="header">
	<nav class="navbar">
		<div class="navbar_logo">
				<a href="/bigdata/logo"> 
				<i class="fa-solid fa-person"></i><i class="fa-solid fa-person"></i><i class="fa-solid fa-person"></i><i class="fa-solid fa-person"></i> 
				<img src="resources/img/logo.png" style="width: 80px;height: 40px;">
				</a>
		</div>

		<ul class="navbar_menu">
			<li><i class="fa-solid fa-chart-pie" style="color:orange;"></i> <a href="map">생활인구분석</a></li>
			<li><i class="fa-solid fa-chart-line"  style="color:#CC99FF;"></i> <a href="income">매출분석</a></li>
			<li><i class="fa-solid fa-magnifying-glass" style="color:#4CBB17"></i> <a href="store">상권분류</a></li>
			<li><i class="fa-solid fa-cloud" style="color:skyblue"></i> <a href="cloud">트렌드분석</a></li>
			<li><i class="fa-regular fa-comment-dots" style="color: #F64A8A;"></i> <a href="qna">문의하기</a>
			
		</ul>

		<ul class="navbar_icons">
		<!-- 로그인 시 로그아웃만 보이도록 작업 -->
			<li id="signup"><i class="fa-solid fa-user"></i> <a href="signUp">회원가입</a></li>
			<li hidden="hidden" id="update"><i class="fa-solid fa-user"></i> <a href="mypage">내 정보</a></li>
			<li id="login"><i class="fa-solid fa-right-to-bracket"></i> 로그인</li>
			<li hidden="hidden" id="logout"><i class="fa-solid fa-right-from-bracket"></i> <a href="logout">로그아웃</a></li>
		
			<li><i class="fa-solid fa-folder" style="color:white"></i> <a href="portfolio">포트폴리오</a></li>
		</ul>
		<a href="#" class="navbar_toogleBtn"><i class="fa-solid fa-bars"></i></a>
	</nav>
	<main>

</main>

<div class="modal">
   
  <div class="modal_content">
  <div class="modal_close">X</div>
  <div class="login_form">
	    <div class="login_msg"><h5>로그인</h5></div>
	    <form action="login" method="post">
	    <h5>아이디</h5> <input type="text" name="uId" class="login_input">
	    <h5>비밀번호</h5> <input type="password" name="uPw" class="login_input">
	    <br>
	    <div class="button_div">
	    <input type="submit" value="로그인" class="login_button" >
	    </div>
	    </form>
  </div>

   	
   	  </div>
</div>
</body>
</html>