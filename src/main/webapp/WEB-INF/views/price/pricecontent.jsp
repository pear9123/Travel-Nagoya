<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>
	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>	
	<script type="text/javascript" src="/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/template.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/chungcommon.css" />
	<script type="text/javascript">
	$(document).ready(function(){
		
		var sum = $("#sum_value").val();
		$("#sum_result_pay").html(sum);
		
		var tpc = $("#trans_person_cnt").text();
		var tpp = $("#trans_person_price").text();
		tpc = tpc * 1;
		tpp = tpp * 1;
		console.log(tpc);
		console.log(tpp);
		var tsp = tpc * tpp;
		$("#trans_sum_pay").html(tsp);		
		
		$("#chk0").click(function(){
	    	$(".rest").show();
	    	$(".trans").hide();
	    	$(".etc").hide();
	    	$("#result_pri").html(0);
		});
		
		$("#chk1").click(function(){
	    	$(".trans").show();
	    	$(".rest").hide();
	    	$(".etc").hide();
	    	$("#result_pri").html(0);
		});
		
		$("#chk2").click(function(){
	    	$(".etc").show();
	    	$(".rest").hide();
	    	$(".trans").hide();
	    	$("#result_pri").html(0);
		});
		
		$('#plus').click(function(){
			console.log('a');
			var cnt = $('#number').val();
			cnt *= 1;
			var count = cnt+1;
			$('#number').val(count);
			
			var price = $('#trans_price').val();
			price *= 1;
			console.log("더할값 : "+price);
			var result_count = $('#number').val();
			console.log("더할명수 : "+result_count);
			var result_pri = result_count * price;
			console.log("결과 값 : "+result_pri);
			$('#result_pri').html(result_pri);
		});
		
		$('#minus').click(function(){
			console.log('b');
			var cnt = $('#number').val();
			cnt *= 1;
			var count = cnt-1;
			if(count < 0){
				$('#number').val(0); 
			} else {
				$('#number').val(count);
			}
			
			var price = $('#trans_price').val();
			price *= 1;
			console.log("더할값 : "+price);
			var result_count = $('#number').val();
			console.log("더할명수 : "+result_count);
			var result_pri = result_count * price;
			console.log("결과 값 : "+result_pri);
			$('#result_pri').html(result_pri);
		});
		
// 		$("#modifymodal").click(function(){
// 			var num = $(this).attr('value');
// 			console.log(num);
// 		});
		
		
	});
	
	function modalshow(obj){
		console.log(obj);
		$('#recipient-name').val(obj);
	}
	</script>
<!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
    		<h2 class="nino-sectionHeading" style="padding-bottom: 10px; margin-bottom: 0px;">
    			${day } <br>
			</h2>
			<h5 style="text-align: right;">총사용금액 : <span id="sum_result_pay"></span>원</h5>
			<div class="sectionContent">
				<div class="row">
					<c:set var="sum" value="0"/>
					<c:forEach var="list" items="${Contentlist }">
						<div class="col-md-12">
							<div layout="row" class="item">
								<div class="nino-avatar fsr">
									<img class="img-circle" src="${list.IMG }" alt="">
								</div>
								<div class="info">
									<h4 class="name">
										<c:choose>
											<c:when test="${list.flag_chk == 'trans' }">
												<span id="trans_sum_pay"></span> 원 -
											</c:when>
											<c:otherwise>
												${list.price } 원 - 
											</c:otherwise>
										</c:choose>	
									<c:choose>
										<c:when test="${list.flag_chk == 'rest' }">
											식비(<c:choose><c:when test="${list.checked == '0' }">아침</c:when> 
															<c:when test="${list.checked == '1' }">점심</c:when>
															<c:when test="${list.checked == '2' }">저녁</c:when> 
												</c:choose>)
										</c:when>
										<c:when test="${list.flag_chk == 'trans' }">
											교통비(<span id="trans_person_cnt">${list.person_cnt }</span>명 - 장당 <span id="trans_person_price">${list.person_price }</span>원)
										</c:when>
										<c:when test="${list.flag_chk == 'etc' }">
											<c:choose>
												<c:when test="${list.checked == '0' }">주류</c:when>
												<c:when test="${list.checked == '1' }">야식</c:when>
												<c:when test="${list.checked == '2' }">기타</c:when>
											</c:choose>
										</c:when>
									</c:choose> 
									</h4>
									<span>
									<c:choose>
										<c:when test="${list.flag_chk == 'rest' }">
											${list.state } / ${list.date } 
										</c:when>
										<c:when test="${list.flag_chk == 'trans' }">
											<c:choose>
											<c:when test="${list.checked == '0' }">버스</c:when>
											<c:when test="${list.checked == '1' }">지하철</c:when>
											<c:when test="${list.checked == '2' }">기타</c:when>
										 </c:choose> / ${list.date }
										</c:when>
										<c:when test="${list.flag_chk == 'etc' }">
											${list.state } / ${list.date } 
										</c:when>
									</c:choose>
									</span>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="modalshow('${list.pid}')" id="modifymodal">dd</button>
<!-- 									<button style="border: none;background-color: white;"><img alt="" src="/resources/images/price_modify.png" style="width: 20px;"></button> -->
								</div>
							</div>
						</div>
						<c:set var="sum" value="${sum + list.price }"/>
					</c:forEach>
					<input type="hidden" id="sum_value" value="${sum }">
			</div>
		<div id="fixedfooter">
			<div class="inner1">
				<input type="radio" id="chk0" name="chk" value="0" checked="checked"><label for="chk0">식비&nbsp;&nbsp;</label>
				<input type="radio" id="chk1" name="chk" value="1" ><label for="chk1">교통&nbsp;&nbsp;</label>
				<input type="radio" id="chk2" name="chk" value="2" ><label for="chk2">기타&nbsp;&nbsp;</label>
				<label style="float: right;">결재금액 : <span id="result_pri"></span></label>
			</div>
			<div class="rest" style="display:none;">		
				<form action="/PriceContentProc.do" method="post" id="formrest">
					<input type="hidden" name="flag" value="rest">
					<input type="hidden" name="uid" value=${uid }>
					<select id="rest" style="height: 33px;" name="rest">
						<option value="0">아침</option>
						<option value="1">점심</option>
						<option value="2">저녁</option>
					</select>
					<input type="text" name="rest_title" placeholder="식당이름" style="width: 100px; height: 33px;">
					<input type="text" name="rest_price" id="rest_price" placeholder="금액" style="width: 100px; height: 33px;" onkeyup="$('#result_pri').html(this.value)">
					<input type="submit" value="입력">
				</form>
			</div>
			
			<div class="trans" style="display:none;">
				<form action="/PriceContentProc.do" method="post" id="formtrans">
					<input type="hidden" name="flag" value="trans">
					<input type="hidden" name="uid" value=${uid }>
					<select id="tran" class="tran" style="height: 33px" name="tran">
						<option value="0">버스</option>
						<option value="1">지하철</option>
						<option value="2">기타</option>
					</select>
					<input type="text" name="trans_price" id="trans_price" placeholder="금액" style="width: 90px; height: 33px;">
	<!-- 				<a><img alt="" src="/resources/images/minus.png"></a>0<a><img alt="" src="/resources/images/plus.png"></a> -->
					<div class="_1OAG72_XBn">
						<button type="button" class="_2EwDwou2_k _1wF7pQPqYn" id="minus">-</button>
							<input type="text" class="_2OQlsm6qE-" value="0" id="number" name="number">
						<button type="button" class="_2EwDwou2_k _3EUt9iTNwM" id="plus">+</button>
					</div>
					<input type="submit" value="입력">
				</form>
			</div>
			
			<div class="etc" style="display:none;">		
				<form action="/PriceContentProc.do" method="post" id="formetc">
					<input type="hidden" name="flag" value="etc">
					<input type="hidden" name="uid" value=${uid }>
					<select id="etc" style="height: 33px;" name="etc">
						<option value="0">주류</option>
						<option value="1">야식</option>
						<option value="2">기타</option>
					</select>
					<input type="text" name="etc_title" placeholder="기타이름" style="width: 100px; height: 33px;">
					<input type="text" name="etc_price" id="etc_price" placeholder="금액" style="width: 100px; height: 33px;" onkeyup="$('#result_pri').html(this.value)">
					<input type="submit" value="입력">
				</form>
			</div>
		</div>
			
			
    	</div>
    </section><!--/#nino-happyClient-->
    
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">금액</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">장소</label>
            <input type="text" class="form-control" id="state">
          </div>
          <div class="form-group">
          	<select>
          		<option>아침</option>
          		<option>점심</option>
          		<option>저녁</option>
          	</select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

    
   
	


	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
</body>
</html>