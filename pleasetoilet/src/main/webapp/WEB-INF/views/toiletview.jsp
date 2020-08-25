<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toilet View</title>
<script src="/app/resources/jquery-3.2.1.min.js"></script>

<link href="/app/resources/css/map.css" rel="stylesheet" />
<script>
	var list = "${list}";
	$("document").ready(()=> {
		console.log(list);
	});
	
</script>

</head>
<body>
	<!-- 지도 담을 영역 -->
	<div class="mapContainer">
		<div class="toiletList">
			<h1 id="listTitle">Please Toilet</h1>
			<div class="list">
			
			</div>
		</div>
		
		<div class="mapView">
			<div id="map" style="width:100%;"></div>
			
			
			<div class="container1">
            	<input
	              oninput="ShowSliderValue(this.value)"
	              type="range"
	              min="0"
	              max="500"
	              value="0"
	              class="distance"
	              name="range"
	            />
	            <div class="dis">
             		<font size="2" id="slider_value_view" class="disfont">0M</font>
          		</div>
          		<input type="button" value="찾기" id="findToiletBtn"></button>
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
	
	<!-- 슬라이드 바 -->
	<script language="javascript">
          function ShowSliderValue(sVal) {
            var obValueView = document.getElementById("slider_value_view");
            obValueView.innerHTML = sVal + "M";
          }
        </script>
</body>
</html>