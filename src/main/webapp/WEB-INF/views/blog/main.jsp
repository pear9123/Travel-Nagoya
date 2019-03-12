<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>

    <!-- Our Team
    ================================================== -->
	<section id="nino-ourTeam">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">${map.ENG_NAME }</span>
			</h2>
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<div class="">
						<div class="item">
							<div>
								<a data-toggle="modal" data-target="#MainImageModal"><img src="${map.IMG }" alt="" style="width:23%; border-radius: 50% "></a>
							</div>
						</div>
						<div class="info">
<%-- 							<h4 class="name">${map.NAME }</h4> --%>
<!-- 							<span class="regency"><a href="j_spring_security_logout">LOG OUT</a></span> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#nino-ourTeam-->
	
	<!-- Testimonial
    ================================================== -->
    <section class="nino-testimonial bg-white">
    	<div class="container">
    		<div class="nino-testimonialSlider">
				<ul>
					<c:forEach var="notice" items="${notice }">
						<li>
							<div layout="row">
								<div class="nino-symbol fsr">
									<i class="mdi mdi-comment-multiple-outline nino-icon"></i>
								</div>
								<div>
									<span class="name">NOTICE</span>
									<p>${notice.notice }</p>
								</div>
							</div>
						</li>
					</c:forEach>
					
				</ul>
			</div>
    	</div>
    </section><!--/#nino-testimonial-->


    <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
			</h2>
			<div class="sectionContent">
				<div class="row">
				
					<c:forEach var="list" items="${list }">
						<div class="col-md-4 col-sm-4">
							<article>
								<div class="articleThumb" >
									<a href="/BlogDetail.do?pid=${list.pid }"><img src="${list.thumbnail }" alt="" style="height: 380px; width: 285px; object-fit: cover;"></a>
									<div class="date">
										<span class="number">${list.day }</span>
										<span class="text">${fn:substring(list.month,0,3) }</span>
									</div>
								</div>
								<h3 class="articleTitle"><a href="">${list.title }</a></h3>
								<p class="articleDesc">
									${list.content }
								</p>
								<div class="articleMeta">
									<a href="/BlogDetail.do?pid=${list.pid }"><i class="mdi mdi-eye nino-icon"></i> ${list.count }</a>
									<a href="/BlogReply.do?uid=${list.pid }"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> ${list.replycount }</a>
								</div>
							</article>
						</div>
					</c:forEach>
					
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->

    <!-- Map
    ================================================== -->
    <section id="nino-map">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
    			<i class="mdi mdi-map-marker nino-icon"></i>
    			<span class="text">Open map</span>
    			<span class="text" style="display: none;">Close map</span>
    		</h2>
    		<div class="mapWrap">
	    		<iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d79466.26604960626!2d-0.19779784176715043!3d51.50733004537892!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!3m2!1d51.5073509!2d-0.1277583!5e0!3m2!1sen!2s!4v1469206441744" width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
	    	</div>
    	</div>
    </section><!--/#nino-map-->
    
	
<jsp:include page="/WEB-INF/views/blog/inc/Footer.jsp"/>

