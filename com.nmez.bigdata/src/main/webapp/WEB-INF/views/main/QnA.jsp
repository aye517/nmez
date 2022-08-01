<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<%@ include file="./Header.jsp"%>
<body>
	<div>
	<h1>문의하기</h1>
	<br>
	<form action="sendMail" method="get">
	<div>
	<i class="fa-solid fa-at"></i> E-mail : 
	<input type="email" name="email" placeholder="답변 받을 메일주소">
	<br>
	<i class="fa-solid fa-pen"></i> 제목 :
	<input type="text" name="subject" placeholder="제목을 입력하세요">
	<br>
	<br>
	<i class="fa-solid fa-circle-question"></i> 문의하기
	</div>
	<textarea name="content" rows="20" cols="60" placeholder="문의하실 내용을 입력하세요">
	</textarea>
	<br>
	<input type="submit" value="문의하기">
	</form>
	</div>
<%@ include file="./Footer.jsp"%>	
</body>
</html>