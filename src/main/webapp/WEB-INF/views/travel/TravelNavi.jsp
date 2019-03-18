<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>흥청망청</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  
  <!-- javascript -->
  <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e649516b2c829c7966b88c0a9437a5f7"></script>

</head>
<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('e649516b2c829c7966b88c0a9437a5f7');
// 카카오 로그인 버튼을 생성합니다.
function navi(){
    Kakao.Navi.start({
        name: "현대백화점 판교점",
        x: 127.11205203011632,
        y: 37.39279717586919,
        coordType: 'wgs84'
    });
};

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
	} else {
		$("#firstform").hide();
		$("#secondform").show();
	}
	
	
});



//]]>
</script>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

<input type="hidden" id="appkey" >

<a href="http://map.daum.net/link/to/롯데마트진해점,35.1581869981686,128.698749459948" target="_blank">내위치확인</a>

<form action="/TravelNaviView.do" class="form-inline" >
<div class="input-group mb-3">
  <input type="text" class="form-control" name="isend" placeholder="현재 위치 검색" aria-label="현재 위치 검색" aria-describedby="basic-addon2">
  <div class="input-group-append">
    <button type="submit" class="btn btn-outline-secondary" type="button">검색</button>
  </div>
</div>
</form>

<form action="/TravelNaviKeyword.do" id="TravelNaviKeyword" >
<div class="form-group mx-sm-3 mb-2" id="secondform" style="display: none;">
	<input type="hidden" name="x_position" id="x_position">
	<input type="hidden" name="y_position" id="y_position">
	<input type="text" name="query" id="query">
	<select name="radius" id="radius">
		<option value="2000" selected="selected">2km</option>
		<option value="3000">3km</option>
		<option value="5000">5km</option>
		<option value="20000">20km</option>
	</select>
	<button onclick="NaviKeyword()" id="NaviKeyword">전송</button>
</div>
</form>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">이름</th>
      <th scope="col">분류</th>
      <th scope="col" style="width: 18%">이동</th>
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
	<a href="http://map.daum.net/link/map/${list.y },${list.x}">이동하기</a>
	<div>${list.x }</div>
	<div>${list.y }</div>
	<input type="hidden" id="x_position_${status.count }" value="${list.x }">
	<input type="hidden" id="y_position_${status.count }" value="${list.y }">
</c:forEach>




<!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->
	
  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>