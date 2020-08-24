<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>
<script>
$('document').ready(()=>{
	var idReg = /^[A-za-z]/g;
	var passReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	var idcc=false;
	var idc=false;
	var pwc=false;
	var emc=false;
	$('#id').keyup(()=>{
		idc=false;
	});
	$('#idcheck').on('click',()=>{
		idcc=idReg.test($('#id').val());
		if(idcc===true){
			$.ajax({
				url: '/app/idcheck',
				data: {'id':$('#id').val()},
				type: 'post',
				dataType:'json',
				success:(serverdata)=>{
					idc=serverdata.key;
					if(idc===true){
						alert("중복확인완료!");
					} else
						alert("중복되었습니다!");
					}
			});
		} else if(idcc===false){
			alert("형식에 맞게 입력하세요")
		} else {
			alert("잠시 후에 다시 입력하세요");
		}
	});
	$('#pwcheck').keyup(()=>{
		if(passReg.test($('#pw').val())==true){
			if($('#pw').val()==$('#pwcheck').val())
				pwc=true;
			else
				pwc=false;
		}
		else
			false;
		console.log(pwc);
	});
	$('#email').keyup(()=>{
		if(emailReg.test($('#email').val())==true){
			emc=true;
		}
		else{
			emc=false;
		}
		console.log(emc);
	});
	
	$('#sign').on('submit',(e)=>{
		if(idc==true && pwc==true && emc==true){
			
		}
		else{
			e.preventDefault();
			if(idc==false){
				alert("아이디 중복확인이 되지 않았습니다.");
			}
			if(pwc==false)
				alert("비밀번호가 일치하지 않습니다.");
			if(emc==false)
				alert("이메일을 형식에 맞게 입력하세요.");
		}
			
	});
});
</script>
</head>
<body>
<form action="signup" method="post" id="sign">
아이디(영문으로 작성):<input type="text" id="id" name="id"><div id="idbox"><input type="button" id="idcheck" value="중복확인"></div><br>
비밀번호(8~ 15 자리 영문, 숫자, 특수문자 포함):<input type="password" id="pw" name="pw"><br>
비밀번호 확인:<input type="password" id="pwcheck" name="pwcheck"><br>
이메일:<input type="text" id="email" name="email"><br>
<input type="submit" value="가입하기">


</form>

</body>
</html>