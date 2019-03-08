<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/blog/inc/Header.jsp"/>

<body data-target="#nino-navbar" data-spy="scroll">

<!-- Story About Us
    ================================================== -->
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">CONTENT</span>
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

<!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="${usermap.IMG }" alt="">
							</div>
							<div class="info">
								<h4 class="name">${usermap.ENG_NAME }</h4>
								<span class="regency">${usermap.EMAIL }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-happyClient-->



<jsp:include page="/WEB-INF/views/blog/inc/Footer.jsp"/>