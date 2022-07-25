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
			<i class="fa-brands fa-bilibili"></i> <a href="/bigdata/logo">NMEZ</a>
		</div>

		<ul class="navbar_menu">
			<li><i class="fa-solid fa-chart-pie" style="color:orange;"></i> <a href="">상권분석</a></li>
			<li><i class="fa-solid fa-magnifying-glass" style="color:#4CBB17"></i> <a href="">분류검색</a></li>
			<li><i class="fa-solid fa-cloud" style="color:skyblue"></i> <a href="">워드클라우드</a></li>
			<li><i class="fa-regular fa-comment-dots" style="color: #F64A8A;"></i> <a href="">문의하기</a>
			
		</ul>

		<ul class="navbar_icons">
		<!-- 로그인 시 로그아웃만 보이도록 작업 -->
			<li id="signup"><i class="fa-solid fa-user"></i> <a href="signUp">회원가입</a></li>
			<li hidden="hidden" id="update"><i class="fa-solid fa-user"></i> <a href="mypage">내 정보</a></li>
			<li id="login"><i class="fa-solid fa-right-to-bracket"></i> 로그인</li>
			<li hidden="hidden" id="logout"><i class="fa-solid fa-right-from-bracket"></i> <a href="logout">로그아웃</a></li>
		
			<li><i class="fa-solid fa-folder" style="color:white"></i> <a href="">포트폴리오</a></li>
		</ul>
		<a href="#" class="navbar_toogleBtn"><i class="fa-solid fa-bars"></i></a>
	</nav>
	<main>

</main>

<div class="modal">
  <div class="modal_content">
  <div class="modal_close" style="border:1px; border-color: red">x</div>
   	<div>
	    <form action="login" method="post">
	    로그인
	    <br>
	    아이디 <input type="text" name="uId"> <br>
	    비밀번호 <input type="password" name="uPw">
	    <input type="submit" value="로그인">
	    </form>
   	</div>
   	  </div>
</div>
</body>
</html>