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
		<div class="mapView">
			<div id="map" style="width:100%;"></div>

	    </div>
          	
		</div>
	</div>
	
	<!-- 지도 그리는 javascript api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea869e0cf7bcc98045e7cb9c4cdbc934"></script>
	<!-- 장소검색과 주소-좌표 변환을 위한 라이브러리 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea869e0cf7bcc98045e7cb9c4cdbc934&libraries=services"></script>
	
	<script>
		<!-- 지도 띄우기 -->
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lng = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            //message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    /* var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker); */
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}   

		$("document").ready(()=> {	

			$("#findToiletBtn").on("click", () => {
				location.href = "map";
			});
		});
		
		// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
		var points = list;

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker =     new kakao.maps.Marker({ position : points[i] });
		    marker.setMap(map);
		    
		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);
		}

		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
	</script>
	
	<script>
	function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(40, 100);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        
	
	</script>
</body>
</html>