<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/app/resources/css/mypage.css" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <script src="/app/resources/jquery-3.2.1.min.js"></script>
    <script>
    $('#gosignout').on('submit',(e)=>{
    	if($('#pw').val()!=$('#pwcheck').val()){
    		e.preventDefault();
    		alert("입력한 두 비밀번호가 일치하지 않습니다.")
    	}
    });
    </script>
    <title>Please Toilet</title>
</head>
<body>
    <form action="/app/mypage/signout" method="post" id="gosignout">
        <input class="inputs" type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요.">
        <input class="inputs" type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인">
        <input type="submit" value="회원 탈퇴하기">
    </form>
</body>
</html>