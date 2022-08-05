<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<title>QnA</title>
</head>
<%@ include file="./Header.jsp"%>
<body>
	<main id="qna_div">
	<article>
	<h1>문의하기</h1>
	</article>
	<br>
	<form action="sendMail" method="get" id="qna_form">
	<div class="qna_input">
	<div class="mail_input">
	<i class="fa-solid fa-at"></i> E-mail &nbsp:&nbsp 
	<input type="email" name="email" placeholder="답변 받을 메일주소">
	</div>
	<br>
	<div class="tilte_input" style="padding-left: 15px;">
	<i class="fa-solid fa-pen"></i> 제목 &nbsp:&nbsp
	<input type="text" name="subject" placeholder="제목을 입력하세요">
	</div>
	<br>
	<br>
	<div class="title_input">
	<i class="fa-solid fa-circle-question"></i> 문의 내용을 입력하세요.(관리자에게 이메일이 발송됩니다)
	</div>
	<br>
	<textarea name="content" rows="20" cols="60" placeholder="문의하실 내용을 입력하세요"></textarea>
	<br>
	<input type="submit" value="문의하기" class="qna_submit">
	</div>
	</form>
	</main>
<%@ include file="./Footer.jsp"%>	
</body>
</html>