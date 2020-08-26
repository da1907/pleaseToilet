<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>

<link href="/app/resources/css/find.css?ver=1" rel="stylesheet"/>
<script>
	$("document").ready(() => {
		$("#loginBtn").on("click", () => {
       		location.href = "/app/login";
       	});
		$("#signupBtn").on("click", () => {
       		location.href = "/app/signup";
       	});
	});
</script>
</head>
<body>

	<!-- navbar -->
	<div id="navbar">
		<a href="/app/home" id="homelogo">Please Toilet</a>
		<div class="login_bar">
			<button id="loginBtn" class="logBtn">로그인</button>
			<button id="signupBtn" class="logBtn">회원가입</button>
		</div>
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