<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>

<body data-target="#nino-navbar" data-spy="scroll">

<!-- CONTENT LIST
    ================================================== -->
	<section id="nino-story" >
		<div class="container">
			<h2 class="nino-sectionHeading">
<!-- 				<span class="nino-subHeading">CONTENT</span> -->
				${map.title }
			</h2>
			<p class="nino-sectionDesc">${map.content }
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<c:forEach var="list" items="${list }">
						<div style="padding: 0px 10px 10px 10px">
							<img src="${list.path }${list.image }">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>		
	</section><!--/#nino-story-->

<!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
			<div class="sectionContent" style="border-top:1px solid #e5e5e5">
				<div class="row">
					<div class="col-md-12">
						<article>
							<div class="articleMetaDetail">
								<a href="#"><i class="mdi mdi-eye nino-icon"></i> ${map.count }</a>
								<a href="/BlogReply.do?uid=${map.pid }"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> ${count }</a>
							</div>
						</article>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->




 <!-- NAME CARD
    ================================================== -->
    <section id="nino-whatWeDo" style="padding-bottom: 40px;">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">${usermap.ENG_NAME }</span>
				<span class="regency">${usermap.EMAIL }</span>
			</h2>
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-12">
						<div class="text-center">
							<img src="${usermap.IMG }" alt="" style="border-radius: 30%; max-width: 25%">
						</div>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-whatWeDo-->

<jsp:include page="/WEB-INF/views/blog/inc/Footer.jsp"/>