<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta charset="UTF-8">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&family=Noto+Sans+KR:wght@400;700&display=swap"
      rel="stylesheet"
    >
    <title>Please Toilet</title>
    <link href="/app/resources/css/toilet.css" rel="stylesheet"/>
    
    <script src="/app/resources/jquery-3.2.1.min.js"></script>
    <script>
      $("document").ready(() => {
    	  <% session=request.getSession();%>
    	  <% if(session.getAttribute("id")!=null){%>
		  	$('#mypageBtn').removeAttr("hidden");
		    $('#logoutBtn').removeAttr("hidden"); 
		    $('#loginBtn').attr("hidden","hidden");
		    $('#signupBtn').attr("hidden","hidden");

		   <%} else{%>
	    	$('#mypageBtn').attr("hidden","hidden");
		    $('#logoutBtn').attr("hidden","hidden");
	    	$('#loginBtn').removeAttr("hidden");
	    	$('#signupBtn').removeAttr("hidden");

	       <%}%>
        $("#loginBtn").on("click", () => {
          location.href = "login";
        });
        
        $("#logoutBtn").on("click", () => {
          location.href = "logout";
        });
        
        $("#mypageBtn").on("click", () => {
          location.href = "mypage";
        });
        
        $("#signupBtn").on("click", () => {
            location.href = "signup";
          });
        
        /* $("#findBtn").on("click", () => {
            location.href = "map";
          });
         */
      });
    </script>
  </head>
  <body>
    <div class="login_bar">
      <button id="mypageBtn" class="logBtn" hidden="hidden">마이페이지</button>
      <button id="logoutBtn" class="logBtn" hidden="hidden">로그아웃</button>
      <button id="loginBtn" class="logBtn">로그인</button>
      <button id="signupBtn" class="logBtn">회원가입</button>
      
    </div>
    <div class="container">
    	<img src="/app/resources/img/paper.png" class="paper" align="right">
    	<h1 class="main_title1">PLEASE</h1>
    	<h1 class="main_title2">TOILET</h1>
    	<div class="contents">
	        급똥은 주변의 화장실 위치 정보를 제공받을 수 있는 서비스입니다.<br>
	        <br>
	        우선, 주변 화장실 위치 정보를 제공받기 위해 사이트에서<br>
	        사용자의 위치를 파악할 수 있도록 허용해주세요.<br>
	        <br>
	        그리고, 화장실의 위치를 표시할 범위를 선택해주세요.<br>
        <form action="/app/map" method="get">
          <input class="find" id="findBtn" type="submit" value="주변의 화장실 찾기">
        </form>
        
      </div>
    </div>
  </body>
</html>