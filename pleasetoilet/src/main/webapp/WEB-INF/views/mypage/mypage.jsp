<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Please Toilet</title>
<link rel="stylesheet" href="/app/resources/css/mypage.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<script src="/app/resources/jquery-3.2.1.min.js"></script>
<script>
var passReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
$('document').ready(() => {
	if("${msg}"=="fail"){
		alert("비밀번호가 틀렸습니다!");
	}
	$('#changepassword').on("click",() => {
		console.log('clicked');
		$.ajax({
			url : "/app/mypage/changepassword",
			dataType : "html",
			type : "get",
			data : {},
			success : (result) => {
				$('#body-mypage').html(result);
			}
		});
	});
	$("#homelogo").on("click", () => {
   		location.href = "home";
   	});
	$("#logoutBtn").on("click", () => {
        location.href = "logout";
      });
	
	$('#usedlog').on("click",() => {
		$.ajax({
			url : "/app/mypage/usedlog",
			dataType : "html",
			type : "get",
			data : {},
			success : (result) => {
				$('#body-mypage').html(result);
			}
		});
	});
	$('#signout').on("click",() => {
		$.ajax({
			url : "/app/mypage/signout",
			dataType : "html",
			type : "get",
			data : {},
			success : (result) => {
				$('#body-mypage').html(result);
			}
		});
	});
	
	$('#changepassword1').on('submit',(e)=>{
    	if($('#newpw').val()!=$('#newpwcheck').val()){
    		e.preventDefault();
    		alert("입력한 두 비밀번호가 일치하지 않습니다.")
    	}
    	if(passReg.test($('#newpw').val())==false){
    		e.preventDefault();
    		alert("비밀번호 형식에 맞게 입력해주세요");
    	}
    	
    });
	
	
	$('#gosignout').on('submit',(e)=>{
    	if($('#pw').val()!=$('#pwcheck').val()){
    		e.preventDefault();
    		alert("입력한 두 비밀번호가 일치하지 않습니다.")
    	}
    });
});
</script>

</head>
<body>
	<div id="navbar">
		<a href="home" id="homelogo">Please Toilet</a>
		<div class="login_bar">
	      <button id="logoutBtn" class="logBtn">로그아웃</button>
	    </div>
	</div>
	<div id="container">
        <div id="title">
            <h1 id="title-mypage">MY PAGE</h1>
            <ul id="subtitles">
                <li class="subtitle"><span><a id="changepassword">비밀번호 변경</a></span></li>
                <li class="subtitle"><span><a id="usedlog">길찾기 내역 확인</a></span></li>
                <li class="subtitle"><span><a id="signout">회원 탈퇴</a></span></li>
            </ul>
        </div>
        <div id="body-mypage">
        	<form action="/app/mypage/changepassword" method="post" id="changepassword1">
		        <input class="inputs" type="password" name="oldpw" id="oldpw" placeholder="현재 비밀번호를 입력하세요.">
		        <input class="inputs" type="password" name="newpw" id="newpw" placeholder="변경할 비밀번호를 입력하세요.">
		        <input class="inputs" type="password" name="newpwcheck" id="newpwcheck" placeholder="변경할 비밀번호 확인">
		        <input type="submit" value="비밀번호 변경하기">
		    </form>
        </div>
    </div>
</body>
<script src="/app/resources/js/mypage-log.js"></script>
</html>