<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header.jsp</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&family=Jua&family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="js/main.js"></script>
<script src="https://kit.fontawesome.com/ff98a1e189.js"
	crossorigin="anonymous"></script>
<style type="text/css">

body {
	margin: 0;
	font-family: 'Hahmlet', serif; font-family : 'Jua', sans-serif;
	font-family: 'Source Sans Pro', sans-serif;
	font-family: 'Jua', sans-serif;
}

a {
	text-decoration: none;
	color: white;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #263343;
	padding: 8px 12px;
}

.navbar_logo {
	font-size: 24px;
	color: white;
}

.navbar_logo i {
	color: #d49466;
}

.navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
}

.navbar_menu li {
	padding: 8px 12px;
}

.navbar_icons {
	list-style: none;
	color: white;
	display: flex;
	padding-left: 0;
}

.navbar_icons li {
	padding: 8px 12px;
}
.navbar_menu li:hover{
	background-color: #d49466;
	border-radius: 4px;
}
.navbar_toogleBtn{
	display:none;
	position: absolute;
	right: 32px;
	font-size: 24px;
	color: #d49466;
	}
@media screen and (max-width:768px){
	.navbar{
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	.navbar_menu{
	
	flex-direction: column;
	align-items: center;
	width: 100%;
	}
	.navbar_menu li{
	width:100%;
	text-align: center;
	}
	.navbar_icons{
	
	justify-content: center;
	width: 100%;
	}
	.navbar_toogleBtn{
	display: block;
	}
}	

</style>
</head>

<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-brands fa-bilibili"></i> <a href="main">NMEZ</a>
		</div>

		<ul class="navbar_menu">
			<li><i class="fa-solid fa-chart-pie"></i><a href="">상권분석</a></li>
			<li><i class="fa-solid fa-user"></i><a href="signUp">회원가입</a></li>
			<li><i class="fa-solid fa-right-to-bracket"></i><a href="">로그인</a></li>
			<li><i class="fa-regular fa-comment-dots"></i><a href="">문의하기</a>
		</ul>


		<ul class="navbar_icons">
			<li><i class="fa-solid fa-folder"></i><a href="">포트폴리오</a></li>
		</ul>
		<a href="#" class="navbar_toogleBtn"><i class="fa-solid fa-bars"></i></a>
	</nav>
</body>
</html>