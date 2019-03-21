<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Hello, world!</title>
</head>
<body>
<h1>새로고침</h1>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- javascript -->
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e649516b2c829c7966b88c0a9437a5f7"></script>
<style>
    .wrap {position: absolute;left: 0;bottom: 35px;width: 165px;height: 43px;margin-left: -82px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>


<script type="text/javascript">
//<![CDATA[
// 카카오 로그인 버튼을 생성합니다.
$(document).ready(function(){
	$('#NaviKeyword').click(function(){
		var x = $('#x_position_1').val();
		var y = $('#y_position_1').val();
		$('#x_position').val(x);
		$('#y_position').val(y);
		$('#TravelNaviKeyword').submit();
		console.log(x+" // "+y);
	});
	
	var x_point = $("#x_position_1").val();
	console.log(x_point);
	if(x_point == null){
		$("#firstform").show();
		$("#secondform").hide();
		$("#radioform").hide();
	} else {
		$("#firstform").hide();
		$("#secondform").show();
		$("#radioform").show();
	}
	
	var isend = $("#mylocation").val();
	if(isend != null){
		$("#isend").val(isend);
	}
	
	var last_result = $("#last_result").val();
	if(last_result == 2){
		$("#result_table").show();
	}
	
});
function url(obj){
	console.log(obj);
	if(obj == 'price'){
		document.location.href = "/Price.do";
	} else if(obj == 'blog'){
		document.location.href = "/BlogMain.do";
	} else if(obj == 'navi'){
		document.location.href = "/TravelNaviView.do";
	}
	
}

//]]>
</script>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" onclick="url('blog');" href="#">ChungVee</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" onclick="url('blog');">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" onclick="url('price');">Price</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" onclick="url('navi');">Location</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>

<main role="main" class="container">

	<div class="starter-template">
<!-- <h1>Location</h1> -->
	</div>

</main><!-- /.container -->



<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content" style="padding: 12px;">

<input type="hidden" id="appkey" >
<input type="hidden" id="mylocation" value="${isend }">
<input type="hidden" id="last_result" value="${last_result }">

<!-- 내 위치 조회 -->
<div style="float: right;">
	<a href="http://map.daum.net/link/to/롯데마트진해점,35.1581869981686,128.698749459948" target="_blank">
		<img alt="" src="/resources/images/mylocation.png">
	</a>
</div>

<!-- 지역 검색 -->
<form action="/TravelNaviView.do" class="form-inline" >
<div class="input-group mb-3">
  <input type="text" class="form-control" name="isend" id="isend" placeholder="현재 위치 입력" aria-label="현재 위치 검색" aria-describedby="basic-addon2">
  <div class="input-group-append">
    <button type="submit" class="btn btn-outline-secondary" type="button" >검색</button>
  </div>
</div>
</form>

<!-- 키워드 검색 -->
<form action="/TravelNaviKeyword.do" class="form-inline" id="TravelNaviKeyword">
	<div class="input-group mb-3" id="secondform" style="display: none;">
		<input type="hidden" name="isend" value="${isend }">
		<input type="hidden" name="last_result" value="2">
		<input type="hidden" name="x_position" id="x_position">
		<input type="hidden" name="y_position" id="y_position">
  		<input type="text" class="form-control" name="query" id="query" placeholder="현재 위치 검색" aria-label="현재 위치 검색" aria-describedby="basic-addon2">
  		<div class="input-group-append">
    		<button onclick="NaviKeyword()" id="NaviKeyword" class="btn btn-outline-secondary" type="button">전송</button>
  		</div>
	</div>
	<div class="input-group mb-3" id="radioform" style="display: none;">
		<input type="radio" value="1000" name="radius" id="radius1"><label for="radius1">1km</label>
 		<input type="radio" value="3000" name="radius" id="radius2"><label for="radius2">3km</label>
 		<input type="radio" value="5000" name="radius" id="radius3"><label for="radius3">5km</label>
  	</div>
</form>

<!-- 지도 표시 -->
<div id="map" style="width:100%;height:350px;display:none"></div>

<!-- 결과 테이블 -->
<table class="table" id="result_table" style="display: none">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">이름</th>
      <th scope="col">분류</th>
      <th scope="col" style="width: 20%">이동</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="keylist" items="${keyitems }" varStatus="status">
<!-- 	<div> -->
<%-- 		${keylist.id } --%>
<%-- 		${keylist.x } --%>
<%-- 		${keylist.y } --%>
<!-- 	</div> -->
<!-- 	<br/> -->
	
    <tr>
      <th scope="row">${status.count }</th>
      <td>${keylist.place_name }</td>
      <td>${keylist.category_name }</td>
      <td><a href="http://map.daum.net/link/to/${keylist.id }" target="_blank">길찾기</a></td>
      
    </tr>
    </c:forEach>
  </tbody>
</table>

<c:forEach var="list" items="${items }" varStatus="status">
<%-- 	<a href="http://map.daum.net/link/map/${list.y },${list.x}">이동하기</a> --%>
<%-- 	<div>${list.x }</div> --%>
<%-- 	<div>${list.y }</div> --%>
	<input type="hidden" id="x_position_${status.count }" value="${list.x }">
	<input type="hidden" id="y_position_${status.count }" value="${list.y }">
</c:forEach>

<input type="hidden" id="pin_x_maker" value="${pin_x_maker }">
<input type="hidden" id="pin_y_maker" value="${pin_y_maker }">
<input type="hidden" id="pin_radius" value="${pin_radius }">

<script>
var last_result = $("#last_result").val();
if(last_result == 2){
	var ymaker = $("#pin_x_maker").val();
	var xmaker = $("#pin_y_maker").val();
	$("#map").show();
} else {
	var ymaker = $("#x_position_1").val();
	var xmaker = $("#y_position_1").val();
	console.log("xmaker : "+ymaker);
	console.log("ymaker : "+xmaker);
	if(xmaker == null){
		xmaker = "33.450701";
		ymaker = "126.570667";
	} else {
		// 주소만 검색시
		$("#map").show();
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(xmaker, ymaker), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};
		//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);

		//마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(xmaker, ymaker); 

		//마커를 생성합니다
		var marker = new daum.maps.Marker({
		 position: markerPosition
		});

		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}
}

console.log("last_result : "+last_result);


// 키워드 검색 결과시
if(last_result == 2){
    
// 	var array = new Array(); 
// 	console.log("array[0] : "+array[0]);
// 	console.log("array lenght : "+array.length);
// 	console.log("last_result : "+last_result);
	var pin_radius = $("#pin_radius").val();
// 	pin_radius = pin_radius * 1;
	var set_radius = parseInt(pin_radius / 2);
	var set_lever = "";
	console.log("set_radius : "+set_radius);
	if(set_radius == 500){
		set_lever = 4;
	} else if(set_radius == 1500){
		set_lever = 7;
	} else if(set_radius == 2500){
		set_lever = 9;
	} 
	console.log("set_lever : "+set_lever);
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(xmaker, ymaker), // 지도의 중심좌표
        level: set_lever // 지도의 확대 레벨
    };

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '현재위치', 
	        latlng: new daum.maps.LatLng(xmaker, ymaker)
	    },
	    <c:forEach items="${keyitems}" var="item" >
		    {
		        title: '${item.place_name}',
		        content: '<div class="wrap"><div class="info"><div class="title">${item.place_name}</div></div></div>',
		        latlng: new daum.maps.LatLng(${item.y}, ${item.x}),
		    },
		</c:forEach>
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
		if(i == 0){
			//마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(xmaker, ymaker); 

			//마커를 생성합니다
			var marker = new daum.maps.Marker({
			 position: markerPosition
			});

			//마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			//지도에 표시할 원을 생성합니다
			var circle = new daum.maps.Circle({
			    center : new daum.maps.LatLng(xmaker, ymaker),  // 원의 중심좌표 입니다 
			    radius: set_radius, // 미터 단위의 원의 반지름입니다 
			    strokeWeight: 5, // 선의 두께입니다 
			    strokeColor: '#75B8FA', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'dashed', // 선의 스타일 입니다
			    fillColor: '#CFE7FF', // 채우기 색깔입니다
			    fillOpacity: 0.7  // 채우기 불투명도 입니다   
			}); 

			// 지도에 원을 표시합니다 
			circle.setMap(map);
			
		} else {
			
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
// 		        content : positions[i].content,
		        image : markerImage // 마커 이미지 
		    });
		    var overlay = new daum.maps.CustomOverlay({
		        content: positions[i].content,
		        map: map,
		        position: marker.getPosition()       
		    });
		    
		 	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		    daum.maps.event.addListener(marker, 'click', function() {
		        overlay.setMap(map);
		    });
		}
	}
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
	}
}





</script>

	</div>
    <!-- End of Content Wrapper -->
	
  </div>
  <!-- End of Page Wrapper -->
  

  	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  </body>
</html>
