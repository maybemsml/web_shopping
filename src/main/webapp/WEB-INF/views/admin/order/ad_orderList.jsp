<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 주문관리 </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
</head>
<body>
   <div class="wrap">
      <!-- header 시작 -->   
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->   
      
      <!-- 컨텐츠 시작 -->   
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <div id="menuName"> 주문관리 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               <div id="right">
                  <div class="table_div">
                     <form name="ad_orderList" method="post">
                           <table>
                              <tr>
                                 <th style="width:5%"> # </th>
                                 <th style="width:10%"> 고객ID </th>
                                 <th style="width:10%"> 상품번호 </th>
                                 <th style="width:10%"> 카테고리 </th>
                                 <th style="width:10%"> 브랜드 </th>
                                 <th style="width:20%"> 상품명 </th>
                                 <th style="width:10%"> 상품가격 </th>
                                 <th style="width:10%"> 주문수량 </th>
                                 <th style="width:15%" colspan="3"> 상태 </th>
                              </tr>
                              
                              <!-- 상품이 있으면 -->
                              <c:forEach var="dto" items="${list}">
                              <tr>
                              	<td>${dto.odNo}</td>
                              	<td>${dto.cust_id}</td>
                              	<td>${dto.pdNo}</td>
                              	<td>${dto.pdCategory}</td>
                              	<td>${dto.pdBrand}</td>
                              	<td>${dto.pdName}</td>
                              	<td>${dto.price}</td>
                              	<td>${dto.quantity}</td>
                              <c:if test="${dto.odStatus == '주문요청'}">	
                              	<td style="width:10%" colspan="2">${dto.odStatus}</td>
                              	<td>
                              		<input type="button" value="승인" onclick="window.location='${path}/orderConfirmAction.ad?odNo=${dto.odNo}'">
                              		<input type="button" value="취소" onclick="window.location='${path}/orderCancelAction.ad?odNo=${dto.odNo}'">
                              	</td>
                              </c:if>
                              <c:if test ="${dto.odStatus != '주문요청'}">
                              	<td style="width:10%" colspan="3">${dto.odStatus}</td>
                              </c:if>	
                              </tr>
                              </c:forEach>
                              
								<tr>
									<td colspan="12" align="center">
									<!-- 페이징 처리 -->
									<!-- 이전 버튼 활성화 여부 -->
									<c:if test="${paging.startPage > 10}">
										<a href="${path}/orderList.ad?pageNum=${paging.prev}"> [이전] </a>
									</c:if>
									<!-- 페이지 번호 처리 -->
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<a href="${path}/orderList.ad?pageNum=${num}"> ${num} </a> <!-- num = forEach 변수 -->
									</c:forEach>
									<!-- 다음 버튼 활성화 여부 -->
									<c:if test="${paging.endPage < paging.pageCount}">
										<a href="${path}/orderList.ad?pageNum=${paging.next}"> [다음] </a>
									</c:if>
									</td>
								</tr>
                              
                           </table>
                        </form>
                  </div>
               </div>
               <!-- 우측 내용종료  -->   
      
			</div>                     
         </div>
      </div>
      <!-- footer 시작 -->   
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->   
   </div>
</body>
</html>