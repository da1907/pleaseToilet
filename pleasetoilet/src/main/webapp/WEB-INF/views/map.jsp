<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>

<link href="/app/resources/css/map.css" rel="stylesheet" />

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
 

		var list = "${list}";



		$("#findToiletBtn").on("click", () => {
			location.href = "map";
		});
	});
</script>

</head>
<body>
	<!-- navbar -->
	
	<div id="navbar">
 		<a href="home" id="title">Please Toilet</a>
		<div class="login_bar"> 
	      <button id="mypageBtn" class="logBtn" hidden="hidden">마이페이지</button>
	      <button id="logoutBtn" class="logBtn" hidden="hidden">로그아웃</button>
	      <button id="loginBtn" class="logBtn">로그인</button>
	      <button id="signupBtn" class="logBtn">회원가입</button>
	    </div>
	</div>
	
	<!-- 지도 담을 영역 -->
	<div class="mapContainer">
		<div class="listview">
		
		
		</div>
		<div class="mapView">
			<div id="map" style="width:100%;"></div>
	    </div>
          	
	</div>
	
	<!-- 지도 그리는 javascript api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea869e0cf7bcc98045e7cb9c4cdbc934"></script>
	<!-- 장소검색과 주소-좌표 변환을 위한 라이브러리 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea869e0cf7bcc98045e7cb9c4cdbc934&libraries=services"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
    		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    		level: 10 // 지도의 확대 레벨 
		}; 
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
    
			    var lat = position.coords.latitude, // 위도
			        lon = position.coords.longitude; // 경도
			    
			    var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			        message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			    
			    // 마커와 인포윈도우를 표시합니다
			    displayMarker(locPosition, message);
				console.log(lat, lon);        
		  	});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		    message = 'geolocation을 사용할수 없어요..'
		    
		displayMarker(locPosition, message);
		}
		//지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({  
			    map: map, 
			    position: locPosition
		}); 
		var iwContent = message, // 인포윈도우에 표시할 내용
	    	iwRemoveable = true;
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);
		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);      
	}
	</script>
</body>
</html>