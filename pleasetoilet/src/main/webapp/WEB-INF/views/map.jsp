<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/app/resources/css/map.css" rel="stylesheet" />

</head>
<body>
	<!-- 지도 담을 영역 -->
	<div class="mapContainer">
		<div class="toiletList">
			<h1 id="listTitle">Please Toilet</h1>
			<div class="list">
			
			</div>
		</div>
		
		
		<div id="map" style="width:100%;"></div>
		
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
		
	</script>

</body>
</html>