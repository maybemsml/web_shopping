<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 상품목록 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
</head>
<script>
$(function(){
	$("#btnInsert").click(function(){
		location.href="${path}/productAdd.ad";
	});
});

</script>
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
               <div id="menuName"> 상품목록 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="ad_productList" method="post">
                           <table>
                              <tr>
                                 <th style="width:5%"> 번호 </th>
                                 <th style="width:10%"> 브랜드 </th>
                                 <th style="width:15%"> 상품명 </th>
                                 <th style="width:10%"> 상품이미지 </th>
                                 <th style="width:10%"> 카테고리 </th>
                                 <th style="width:10%"> 상품가격 </th>
                                 <th style="width:10%"> 등록수량 </th>
                                 <th style="width:10%"> 상품상태 </th>
                                 <th style="width:10%"> 등록일 </th>
                                 <th style="width:5%"> 수정 </th>
                                 <th style="width:5%"> 삭제 </th>
                              </tr>
                              
                              <!-- 상품이 있으면 -->
                              <c:forEach var="dto" items="${list}">
                              <tr>
                              	<td>${dto.pdNo}</td>
                              	<td>${dto.pdBrand}</td>
                              	<td>${dto.pdName}</td>
                              	<!-- src 연결, upload폴더 새로고침 > 브라우저도 새로고침 해야 깨진 이미지가 보임 -->
                              	<td><img src="${dto.pdImg}" width=100></td> 
                              	<td>${dto.pdCategory}</td>
                              	<td>${dto.pdPrice}</td>
                              	<td>${dto.pdQuantity}</td>
                              	<td>${dto.pdStatus}</td>
                              	<td>${dto.pdIndate}</td>
                              	<td>
                              		<input type="button" value="수정" onclick="window.location='${path}/product_detailAction.ad?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">
                              	</td>
                              	<td>
                              		<input type="button" value="삭제" onclick="window.location='${path}/product_deleteAction.ad?pdNo=${dto.pdNo}'">
                              	</td>
                              </tr>
                              </c:forEach>
                              
								<tr>
									<td colspan="12" align="center">
									<!-- 페이징 처리 -->
									<!-- 이전 버튼 활성화 여부 -->
									<c:if test="${paging.startPage > 10}">
										<a href="${path}/productList.ad?pageNum=${paging.prev}"> [이전] </a>
									</c:if>
									<!-- 페이지 번호 처리 -->
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<a href="${path}/productList.ad?pageNum=${num}"> ${num} </a> <!-- num = forEach 변수 -->
									</c:forEach>
									<!-- 다음 버튼 활성화 여부 -->
									<c:if test="${paging.endPage < paging.pageCount}">
										<a href="${path}/productList.ad?pageNum=${paging.next}"> [다음] </a>
									</c:if>
									</td>
								</tr>
								
								<tr>
									<td colspan="12" align="right">
										<input type="button" class="inputButton" value="상품등록" id="btnInsert">
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
      <!-- 컨텐츠 끝 -->   
      <!-- footer 시작 -->   
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->   
   </div>
</body>
</html>