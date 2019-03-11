<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>
	
    <!-- Footer
    ================================================== -->
    <footer id="footer" style="background: white;">
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="colInfo">
	        			<div class="footerLogo">
	        				<a href="#" >Reply</a>	
	        			</div>
		        		<div class="sectionContent">
							<div class="row">
							
								<c:forEach var="list" items="${listmap }">
									<div class="col-md-12">
										<div class="item" layout="row" style="border-bottom: 1px solid gainsboro; padding-top: 15px;">
											<div class="nino-avatar fsr" style="width: 65px; margin-right: 30px;">
												<img class="img-circle" alt="" src="${list.IMG }">
											</div>
											<div class="info">
												<h4 class="name">${list.ENG_NAME }</h4>
												<span class="regency">${list.NAME }</span>
												<p class="desc">
													${list.reply }
												</p>
											</div>
										</div>
									</div>
								</c:forEach>
								
							</div>
						</div>
	        			<div class="nino-followUs">
	        				<div class="totalFollowReply"><span></span> </div>
	        				<div class="socialNetwork">
	        					<span class="text">Follow Us: </span>
	        					<a href="" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-google-plus"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-youtube-play"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-dribbble"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-tumblr"></i></a>
	        				</div>
	        			</div>
	        			<form action="#" class="nino-subscribeForm" name="form">
	        				<div class="input-group input-group-lg">
	        					<input type="hidden" name="uid" value="${uid }">
								<input type="text" class="form-control" placeholder="Reply..." required name="reply">
								<span class="input-group-btn">
									<button class="btn btn-success" onclick="replyform()">Submit</button>
								</span>
							</div>
	        			</form>
        			</div>
        		</div>
        	</div>
        </div>
    </footer><!--/#footer-->

    <!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
    <form action="" id="nino-searchForm" >
    	<input type="text" placeholder="Search..." class="form-control nino-searchInput">
    	<i class="mdi mdi-close nino-close"></i>
    </form><!--/#nino-searchForm-->
	
    <!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- javascript -->
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/template.js"></script>

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