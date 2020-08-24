<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급똥</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>
<script>
$('document').ready(()=>{
	$('#changepassword').on("click",()=>{
		$.ajax({
			url:"/app/changepassword",
			dataType:"html",
			type:"get",
			data:{},
			success:(result)=>{
				$('#pageContainer').html(result);
				
			}
		});
	});
	$('#uselist').on("click",()=>{
		$.ajax({
			url:"/app/uselist",
			dataType:"html",
			type:"get",
			data:{},
			success:(result)=>{
				$('#pageContainer').html(result);
				
			}
		});
	});
	$('#deletemember').on("click",()=>{
		$.ajax({
			url:"/app/deletemember",
			dataType:"html",
			type:"get",
			data:{},
			success:(result)=>{
				$('#pageContainer').html(result);
				
			}
		});
	});
});
</script>

</head>
<body>
<button id="changepassword">비밀번호 변경</button>
<button id="uselist">길찾기 내역 확인</button>
<button id="deletemember">회원탈퇴</button>
<div id="pageContainer">
</div>
</body>
</html>