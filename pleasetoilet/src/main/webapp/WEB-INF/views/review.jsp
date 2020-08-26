<%@page import="com.pleasetoilet.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
      src="https://kit.fontawesome.com/faea847e34.js"
      crossorigin="anonymous"
    ></script>
<script src="/app/resources/jquery-3.2.1.min.js"></script>
<link href="/app/resources/css/review.css?ver=1" rel="stylesheet" />

</head>
<body>
	<!-- navbar -->
	<div id="navbar">
 		<a href="home" id="homelogo">Please Toilet</a>
		<div class="login_bar"> 
	      <button id="mypageBtn" class="logBtn">마이페이지</button>
	      <button id="logoutBtn" class="logBtn">로그아웃</button>
	    </div>
	</div>
	
	<div class="review_container">
		<%if(request.getAttribute("list")==null){ %>
		등록된 리뷰가 없습니다.
		<%} else{ %>
			<h1 class="toilet_name">
				<% ArrayList<ReviewVO> list=(ArrayList<ReviewVO>)request.getAttribute("list"); %>
				<%=list.get(0).getTname()%>
			</h1>
			<c:forEach items="${list}" var="vo">
			<table>
				<tr id="content">
					<td class="icon"><img
            			class="personicon"
            			src="/app/resources/img/person.png"
            			alt="person"/></td>
					<td class="content">${vo.contents}</td>
					
				</tr>
				<tr>
					<td class="writer">${vo.id}</td>
					<td class="date">${vo.usedate}</td>
				</tr>
				
			</table>
			
			</c:forEach>
			<%} %>

	</div>
</body>
</html>