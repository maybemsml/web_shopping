<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 상품 상세페이지 </title>
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
               <div id="menuName"> 상품 상세페이지 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="ad_productDetail" action="${path}/product_updateAction.ad?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
                           <table>
                           <!-- hidden : 직접 input태그에서 입력받지 못한 값들을 전달할 때 사용 -->
                           <input type="hidden" name="pageNum" value="${pageNum}">
                           <input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
                           <input type="hidden" name="hiddenPdImg" value="${dto.pdImg}"> <!-- 수정된 상품 이미지 -->
                           
                              
                              <tr>
                                 <th style="width:200px"> *상품번호 </th>
                                 <td style="text-align:center">
                                 	${dto.pdNo}
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> *상품명 </th>
                                 <td style="text-align:center">
                                 	<input type="text" class="input" name="pdName" id="pdName" placeholder="상품명 입력" value="${dto.pdName}" required autofocus>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *브랜드 </th>
                                 <td style=text-align:center>
                                 	<input type="text" class="input" name="pdBrand" id="pdBrand" value="${dto.pdBrand}" placeholder="브랜드 입력" required>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> *상품이미지 </th>
                                 <td colspan="3" style="width:550px; text-align:center">
                                 	<img src="${dto.pdImg}" width="80px"><br>
                                 	<input type="file" class="input" name="pdImg" id="pdImg" accept="image/*">
                                 </td>
                              </tr>
                              
                              <tr>   <!-- 이따함 -->
                                 <th style="width:200px"> *상품카테고리 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<select class="input" id="pdCategory" name="pdCategory" required>
                                 		<option value=""> 분류선택 </option>
                                 		<option <c:if test="${dto.pdCategory=='향수'}">selected</c:if> value="향수"> 향수 </option>
                                 		<option <c:if test="${dto.pdCategory=='바디워시'}">selected</c:if> value="바디워시"> 바디워시 </option>
                                 		<option <c:if test="${dto.pdCategory=='기타'}">selected</c:if> value="기타"> 기타 </option>
                                 	</select>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *상품설명 </th>
                                 <td style=text-align:center>
                                 	<textarea rows="5" cols="70" id="pdContent" name="pdContent"> ${dto.pdContent}</textarea>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *가격 </th>
                                 <td style=text-align:center>
                                 	<input type="number" class="input" name="pdPrice" id="pdPrice" value="${dto.pdPrice}" placeholder="가격 입력" size="10" required>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *등록수량 </th>
                                 <td style=text-align:center>
                                 	<input type="number" class="input" name="pdQuantity" id="pdQuantity" value="${dto.pdQuantity}" placeholder="수량 입력" size="10" required>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *상품상태코드 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<select class="input" id="pdStatus" name="pdStatus" required>
                                 		<option> 상품판매상태 </option>
                                 		<option <c:if test="${dto.pdStatus=='판매중'}"> selected </c:if> value="판매중"> 판매중 </option>
                                 		<option <c:if test="${dto.pdStatus=='품절'}"> selected </c:if> value="품절"> 품절 </option>
                                 		<option <c:if test="${dto.pdStatus=='절판'}"> selected </c:if> value="절판"> 절판 </option>
                                 	</select>
                                 </td>
                              </tr>
                              
                              <tr>
                              	<th> 등록일 </th>
                              	<td colspan="2">${dto.pdIndate} </td>
                              </tr>
                              
                            	
                            	<tr>
                            		<td colspan="4" align="right">
                            			<input type="submit" class="inputButton" value="수정">
                            			<input type="reset" class="inputButton" value="초기화" >
                            			<input type="button" class="inputButton" value="목록" onclick="window.location='${path}/productList.ad'">
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