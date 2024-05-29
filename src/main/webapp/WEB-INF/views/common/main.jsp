<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> main </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/common/main.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/perfume.css">
</head>
<body>
<div class="wrap">		
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- UserLoginSuccessHandler 에서 msg 넘긴 메시지 받기 -->
	<c:if test="${msg != null}">
	   <script type="text/javascript">
	      alert("${msg}");
	   </script>
	</c:if>
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="carouselExampleIndicators" class="carousel slide">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-bs-interval="10000">
			      <img src="${path}/resources/images/banner/bn1.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img src="${path}/resources/images/banner/bn2.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img src="${path}/resources/images/banner/bn3.jpg" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			
			<div id="title"> New </div>
			<div class="newPfListContainer">
				<div class="newPfContainer">
					<img src="${path}/resources/images/perfume/pf3.jpg" id="newpfImg">
						<div class="pfContent">
							<span id="pfbrand"> 딥디크 </span>
							<span id="newpfName"><a href="#">일리오 EDT </a></span>
							<span id="pfPreview"> preview <br>preview preview</span>
						</div>	
				</div>
				
				<div class="newPfContainer">
					<img src="${path}/resources/images/perfume/pf3.jpg" id="newpfImg">
						<div class="pfContent">
							<span id="pfbrand"> 딥디크 </span>
							<span id="newpfName"><a href="#">일리오 EDT </a></span>
							<span id="pfPreview"> preview <br>preview preview</span>
						</div>	
				</div>
				
				<div class="newPfContainer">
					<img src="${path}/resources/images/perfume/pf3.jpg" id="newpfImg">
						<div class="pfContent">
							<span id="pfbrand"> 딥디크 </span>
							<span id="newpfName"><a href="#">일리오 EDT </a></span>
							<span id="pfPreview"> preview <br>preview preview</span>
						</div>	
				</div>
				
				<div class="newPfContainer">
					<img src="${path}/resources/images/perfume/pf3.jpg" id="newpfImg">
						<div class="pfContent">
							<span id="pfbrand"> 딥디크 </span>
							<span id="newpfName"><a href="#">일리오 EDT </a></span>
							<span id="pfPreview"> preview <br>preview preview</span>
						</div>	
				</div>
				
				<div class="newPfContainer">
					<img src="${path}/resources/images/perfume/pf3.jpg" id="newpfImg">
						<div class="pfContent">
							<span id="pfbrand"> 딥디크 </span>
							<span id="newpfName"><a href="#">일리오 EDT </a></span>
							<span id="pfPreview"> preview <br>preview preview</span>
						</div>	
				</div>
			</div>
		</div>		
		<!-- 컨텐츠 끝 -->

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>	
</body>
</html>