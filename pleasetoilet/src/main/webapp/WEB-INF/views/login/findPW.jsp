<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>
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
<form action="/app/login/findpw" method="post">
아이디:<input type="text" id="id" name="id">
이메일:<input type="text" id="email" name="email">
<input type="submit" value="입력">
<div id="stat">

</div>
</form>
</body>
</html>