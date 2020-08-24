<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>가입시 입력했던 이메일을 입력하세요</h3>
<form action="/app/login/findid" method="post">
이메일: <input type="text" id="email" name="email">
<input type="submit" value="아이디찾기">
</form>
</body>
</html>