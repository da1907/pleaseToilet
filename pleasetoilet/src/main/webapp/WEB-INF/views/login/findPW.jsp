<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="/app/resources/css/find.css" rel="stylesheet"/>

<script src="/app/resources/jquery-3.2.1.min.js"></script>
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
<script>
var k="${msg}";
$('document').ready(()=>{
	console.log(k)
	if(k=="fail"){
		$('#stat').html("일치하는 아이디 또는 이메일이 없습니다.");
	}
});
</script>
</head>
<body>
<div class="login_bar">
	<button id="homeBtn" class="logBtn">홈</button>
    <button id="loginBtn" class="logBtn">로그인</button>     
</div>

<div class="form">
<h3>아이디와 이메일을 입력하세요</h3>
<form action="/app/login/findpw" method="post">
	<input type="text" id="id" name="id" placeholder="아이디"> <br>
	<input type="text" id="email" name="email" placeholder="이메일"> <br>
	<input type="submit" id="findBtn" value="비밀번호 찾기">
	<div id="stat">
	
	</div>
</form>
</div>
</body>
</html>