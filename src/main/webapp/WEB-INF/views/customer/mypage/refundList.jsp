<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 환불 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/mypage.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/cartList.css">
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="menuName">  환불내역  </div>
			<% int refundprice = 0; %>
			<table class="table">
				  <thead>
				    <tr>
				      <th scope="col"> code </th>
				      <th scope="col"> 카테고리 </th>
				      <th scope="col" colspan=2> 주문상품 </th>
				      <th scope="col"> 수량 </th>
				      <th scope="col"> 개당가격 </th>
				      <th scope="col"> 합계 </th>
				      <th scope="col"> 요청일 </th>
				      <th scope="col"> 진행상태 </th>
				      <th scope="col">  </th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <c:forEach var="dto" items="${list}">
				    <tr>
				      <td> ${dto.rfNo}</td>
				      <td> ${dto.pdCategory}</td>
				      <td style=width:100px;><img src="${dto.pdImg}" width="100px"></td>
				      <td align="left"> ${dto.pdName} </td>
				      <td> ${dto.quantity}</td>
				      <td> ${dto.price} 원 </td>
				      <td> 총 ${dto.price * dto.quantity} 원 </td>
				      <td> ${dto.reqDate} </td>
				      <td> ${dto.rfStatus} </td>
				    </tr>
				    
				    <c:set var="price" value="${dto.price}"></c:set>
				    <c:set var="quantity" value="${dto.quantity}"></c:set>
				    <%
				    Integer price = (Integer)pageContext.getAttribute("price");
				    Integer quantity = (Integer)pageContext.getAttribute("quantity");
				    refundprice += (price * quantity); 
				    %>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>		
</body>
</html>