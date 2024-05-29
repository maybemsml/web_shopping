<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 상품 등록화면 </title>
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
               <div id="menuName"> 상품 등록화면 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="ad_productAdd" action="${path}/product_addAction.ad?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
                           <table>
                              <tr>
                                 <th style="width:200px"> *상품명 </th>
                                 <td style="text-align:center">
                                 	<input type="text" class="input" name="pdName" id="pdName" placeholder="상품명 입력" required autofocus>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *브랜드 </th>
                                 <td style=text-align:center>
                                 	<input type="text" class="input" name="pdBrand" id="pdBrand" placeholder="브랜드 입력" required>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> *상품이미지 </th>
                                 <td colspan="3" style="width:550px; text-align:center">
                                 	<input type="file" class="input" name="pdImg" id="pdImg" accept="image/*">
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *상품카테고리 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<select class="input" id="pdCategory" name="pdCategory" required>
                                 		<option> 상품카테고리 </option>
                                 		<option value="향수"> 향수 </option>
                                 		<option value="바디워시"> 바디워시 </option>
                                 		<option value="기타"> 기타 </option>
                                 	</select>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *상품설명 </th>
                                 <td style=text-align:center>
                                 	<textarea rows="5" cols="70" id="pdContent" name="pdContent"></textarea>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *가격 </th>
                                 <td style=text-align:center>
                                 	<input type="number" class="input" name="pdPrice" id="pdPrice" placeholder="가격 입력" size="10" required>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *등록수량 </th>
                                 <td style=text-align:center>
                                 	<input type="number" class="input" name="pdQuantity" id="pdQuantity" placeholder="수량 입력" size="10" required>
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> *상품상태코드 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<select class="input" id="pdStatus" name="pdStatus" required>
                                 		<option> 상품판매상태 </option>
                                 		<option value="판매중"> 판매중 </option>
                                 		<option value="품절"> 품절 </option>
                                 		<option value="절판"> 절판 </option>
                                 	</select>
                                 </td>
                              </tr>
                            	
                            	<tr>
                            		<td colspan="4" align="right">
                            			<input type="submit" class="inputButton" value="상품등록">
                            			<input type="reset" class="inputButton" value="초기화" >
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