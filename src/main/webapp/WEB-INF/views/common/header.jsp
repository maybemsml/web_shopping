<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> header </title>
	<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형일시 필요 -->

	<style>@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);</style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	
	<script src="https://kit.fontawesome.com/a8b63ce895.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"  href="${path}/resources/css/customer/perfume.css">
</head>
<body>

		<!-- header 시작 -->
		<nav class="navbar">
			<ul class="navbar_title">
				<li><a href="main.do"><span class="titlePf">Perfume</span></a></li> 
			</ul>
			
			<ul class="navbar_menu">
				<li><a href="${path}/notice.do"> Notice </a></li>
				<li><a href=""> Brand </a></li>
				<li><a href="${path}/perfumeList.pf"> Perfume </a></li>
				<li><a href="${path}/review.bd"> Review </a>
			</ul>
			
			<ul class="navbar_icons">
			
				<c:if test="${sessionScope.sessionId == null && sessionScope.sessionAdmin == null}"> <!-- 로그인 하지 않았을 때 -->
				<li><a href="${path}/login.do"> login </a>
				<li><a href="${path}/join.do"> join </a></li>
				<li><a href="${path}/cartList.pf"><i class="fa-solid fa-cart-shopping"></i></a></li>
				</c:if>
				
				<c:if test="${sessionScope.sessionId != null}"> <!-- 로그인 했을 때 -->
				<li><a href="${path}/mypage.do"><i class="fa-solid fa-user"></i> ${sessionScope.sessionId} 님 </a></li> <!-- 마이페이지 -->
				<li><a href="${path}/cartList.pf"><i class="fa-solid fa-cart-shopping"></i></a></li>
				<li><a href="${path}/logout.do"><i class="fa-solid fa-xmark"></i> </a>
				</c:if>
				
				<c:if test="${sessionScope.sessionAdmin != null}"> <!-- 관리자 로그인시 -->
				<li><a href="${path}/noticeList.bd"> 관리자 : ${sessionScope.sessionAdmin} </a></li>
				<li><a href="${path}/productList.ad"> 상품관리 </a></li>
				<li><a href="${path}/orderList.ad"> 주문관리 </a></li>
				<li><a href="${path}/refundList.ad"> 환불관리 </a></li>
				<li><a href="${path}/logout.do"><i class="fa-solid fa-xmark"></i> </a>
				</c:if>
				
			</ul>
		</nav>
		<!-- header 끝 -->