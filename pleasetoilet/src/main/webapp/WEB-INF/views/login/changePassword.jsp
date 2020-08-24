<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>
<script>
var passReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
$('document').ready(()=>{
	console.log("${id}");
	$('#change').on('submit',(e)=>{
		if($('#pw1').val()!=$('#pw2').val()){
			e.preventDefault();
			alert("비밀번호가 일치하지 않습니다!");
		}
		if(passReg.test($('#pw1').val())==false){
			e.preventDefault();
			alert("형식에 맞게 비밀번호를 입력해주세요!");
		}		
	});
});
</script>

</head>
<body>
<form action="/app/login/changepassword" method="post" id="change">
<input type="text" id="id" value="${id}" name="id" hidden="hidden">
비밀번호:<input type="password" id="pw1" name="pw1">
비밀번호 확인:<input type="password" id="pw2" name="pw2">
<input type="submit" value="변경하기">
</form>
</body>
</html>