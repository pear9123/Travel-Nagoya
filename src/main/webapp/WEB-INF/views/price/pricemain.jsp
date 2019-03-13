<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/chungcommon.css" />

<script>
$(document).ready(function(){
	$("#save").click(function(){
		console.log('a');
		var state = $('#message-text').val();
		console.log(state);
		$('#form').submit();
	});
});
</script>
	  <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading" style="margin-bottom: 50px;">
				Travel Price
			</h2>
			<div class="sectionContent">
				<div class="row">
					<c:forEach var="list" items="${list }" varStatus="status">
						<div class="col-md-12" style="text-align: left;">
							<article>
								<h5 class="articleTitle" style="font-size: 15px;"><a href="/PriceContent.do?primary=${list.pid }">${status.count }. ${list.state} 여행</a></h5>
								<p class="articleDesc">
									${list.comment }
									<br/>
									${list.date }
								</p>
							</article>
						</div>
					</c:forEach>
<!-- 					<div class="col-md-12"> -->
<!-- 						<article> -->
<!-- 							<h5 class="articleTitle" style="font-size: 15px;"><a href="">1. 나고야여행 2일차</a></h5> -->
<!-- 							<p class="articleDesc"> -->
<!-- 							</p> -->
<!-- 						</article> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<article> -->
<!-- 							<h3 class="articleTitle" style="font-size: 15px;"><a href="">2. 나고야여행 1일차</a></h3> -->
<!-- 							<p class="articleDesc"> -->
<!-- 								Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. -->
<!-- 							</p> -->
<!-- 						</article> -->
<!-- 					</div> -->
					
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->
<div id="fixedfooter_modal">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo">New Create</button>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Travel</h5>
      </div>
      <div class="modal-body">
        <form name="form" action="/PriceCreate.do" method="post" id="form">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">여행지 입력</label>
            <input type="text" class="form-control" id="recipient-name" name="message-title">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">기타 여행 기록</label>
            <textarea class="form-control" id="message-text" name="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save">Save</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/blog/inc/Footer.jsp"/>
