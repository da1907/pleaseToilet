<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="/app/resources/css/find.css" rel="stylesheet"/>
<script>
	$("document").ready(() => {
	    $("#loginBtn").on("click", () => {
	        location.href = "login";
	      });
	      
	      $("#homeBtn").on("click", () => {
	        location.href = "home";
	      });
	});
</script>
</head>
<body>

<div class="login_bar">
	<button id="homeBtn" class="logBtn">홈</button>
    <button id="loginBtn" class="logBtn">로그인</button> 
</div>

<div class="form">
	<h3>가입시 입력했던 이메일을 입력하세요</h3>
	<form action="/app/login/findid" method="post">
	<input type="text" id="email" name="email" placeholder="이메일"> <br>
	<input type="submit" id="findBtn" value="아이디찾기">
	</form>
</div>
</body>
</html>