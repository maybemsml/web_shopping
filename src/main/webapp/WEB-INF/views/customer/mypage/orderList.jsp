<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주문내역 </title>
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
			<div id="menuName">  주문내역  </div>
			<% int orderTotalPrice = 0; %>
			<table class="table">
				  <thead>
				    <tr>
				      <th scope="col"> 주문번호 </th>
				      <th scope="col"> 주문일 </th>
				      <th scope="col"> 카테고리 </th>
				      <th scope="col" colspan=2> 주문상품 </th>
				      <th scope="col"> 수량 </th>
				      <th scope="col"> 가격 </th>
				      <th scope="col"> 주문상태 </th>
				      <th scope="col">  </th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <c:forEach var="dto" items="${list}">
				    <tr>
					  <form name="refund" action="refundRequest.do" method="post">
				      <td> ${dto.odNo}</td>
				      <td> ${dto.odDate}</td>
				      <td> ${dto.pdCategory}</td>
				      <td style=width:100px;><img src="${dto.pdImg}" width="100px"></td>
				      <td> ${dto.pdName} </td>
				      <td>${dto.quantity}</td>
				      <td> ${dto.price} 원 </td>
				     <c:if test="${dto.odStatus eq '주문승인'}">
					      <td> ${dto.odStatus} </td>
					      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					      <input type="hidden" name="odNo" id="odNo" value="${dto.odNo}">
					      <input type="hidden" name="pdNo" id="pdNo" value="${dto.pdNo}">
					      <input type="hidden" name="quantity" id="quantity" value="${dto.quantity}">
					      <input type="hidden" name="price" id="price" value="${dto.price}">
					      <td>
					      <input class="inputButton" type="submit" id="refundReq" value="환불요청">  
					      </td>
				     </c:if>
				      <c:if test="${dto.odStatus != '주문승인'}">
				      	<td> ${dto.odStatus} </td>
				      	<td></td>
				      </c:if>
					  </form>
				    </tr>
				    
				    <c:set var="price" value="${dto.price}"></c:set>
				    <c:set var="quantity" value="${dto.quantity}"></c:set>
				    <%
				    	Integer price = (Integer)pageContext.getAttribute("price");
				    	Integer quantity = (Integer)pageContext.getAttribute("quantity");
				    	orderTotalPrice += (price * quantity); 
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