<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 장바구니 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/cartList.css">
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 컨텐츠 시작 -->
		
		<%-- <c:if test="${sessionScope.sessionId != null}"> --%>
		<div id="container">
			<div id="menuName"> 장바구니 </div>
			<% int cartTotalPrice = 0; %>
			<c:if test="${cartList!=null}">	  
			<table class="table">
				  <thead>
				    <tr>
				      <th scope="col"> 상품이미지 </th>
				      <th scope="col"> 상품명 </th>
				      <th scope="col"> 수량 </th>
				      <th scope="col"> 가격 </th>
				      <th scope="col">  </th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <c:forEach var="dto" items="${cartList}">
				    <script>
						$(function(){
							$("#chooseDelete${dto.cartNo}").click(function(){
								cartDelete();
							});
						});
							function cartDelete(){
								alert("장바구니에서 삭제되었습니다");
								let param={
										"pdNo" : ${dto.pdNo},
										"sessionId" : "${sessionScope.sessionId}",
										"_csrf" : '${_csrf.token}'
								}
								$.ajax({
									url:"/pj_hyr/cartDeleteAction.pf",
									type:"post",
									data:param,
									error:function(result){
										document.location.reload();
									}
								})
							};
						</script>
				    <tr>
				      <td class="cartImg"><img src="${dto.pdImg}" width="100px"></td>
				      <td id="cartName"> ${dto.pdName} </td>
				      <td id="cartQuantity">${dto.quantity}</td>
				      <td class="cartPrice"> ${dto.price} 원 </td>
				      <td><form name="cart" id="cart" action="cartBuyAction.pf" method="post">
				      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				      <input type="hidden" name="pdNo" id="pdNo" value="${dto.pdNo}">
				      <input type="hidden" name="quantity" id="quantity" value="${dto.quantity}">
				      <input type="hidden" name="price" id="price" value="${dto.price}">
				      <input class="inputButton" type="submit" id="chooseBuy" value="구매">  
				      <button type="button" class="inputButton" form="cart" id="chooseDelete${dto.cartNo}"> 삭제 </button>  
				      </form>
				      </td>
				    </tr>
				    
				    <c:set var="price" value="${dto.price}"></c:set>
				    <c:set var="quantity" value="${dto.quantity}"></c:set>
				    <%				    	
					    Integer price = (Integer)pageContext.getAttribute("price");
					    Integer quantity = (Integer)pageContext.getAttribute("quantity");
					    cartTotalPrice += (price * quantity); 
				    %>
				    </c:forEach>
				  </tbody>
				</table>
			<div> 장바구니 상품 총합계 <%=cartTotalPrice %> 원</div>
		</c:if>	    
			<%-- <c:if test="${cartList==null}">
			장바구니 empty
			</c:if> --%>
		</div>	
		<%-- </c:if> --%>
		<!-- 컨텐츠 끝 -->
		<!-- footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>		
</body>
</html>