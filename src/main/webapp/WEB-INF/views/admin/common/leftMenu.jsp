<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 leftMenu </title>
</head>
<body>
<!-- 좌측메뉴 시작 -->
	<div id="left">
		<div class="left_inside">
		<!-- 좌측메뉴바 시작 -->
		<ul class="left_menubar">
			<li><h3>관리자 메뉴</h3></li>
		<hr>
			<ul class="product_menu">
				<li><h4><a href="${path}/productList.ad">상품목록</a></h4></li>
				<li><h4><a href="${path}/productAdd.ad">상품등록</a></h4></li>
				<li><h4><a href="${path}/orderList.ad">주문관리</a></h4></li>
				<li><h4><a href="${path}/refundList.ad">환불관리</a></h4></li>
				<li><h4><a href="${path}/noticeList.bd">공지사항</a></h4></li> 
				<li><h4><a href="#">회원정보</a></h4></li> 
				<li><h4><a href="${path}/total.ad">결산</a></h4></li> 
				<li><h4><a href="${path}/logout.do">로그아웃</a></h4></li> 
			</ul>
		</ul>                     
		<!-- 좌측메뉴바 종료 -->
		</div>               
	</div>
<!-- 좌측메뉴 종료 -->
</body>
</html>