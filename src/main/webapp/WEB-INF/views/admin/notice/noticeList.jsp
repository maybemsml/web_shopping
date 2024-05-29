<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 게시판 목록 </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
</head>
<script>
$(function(){
	
	$("#btnInsert").click(function(){
		location.href="${path}/notice_insert.bd";
	});
	
	
});
</script>
<body>
   <div class="wrap">
      <!-- header 시작 -->   
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header 끝 -->
	<!-- UserLoginSuccessHandler 에서 msg 넘긴 메시지 받기 -->
	<c:if test="${msg != null}">
		<script type="text/javascript">
		   alert("${msg}");
		</script>
	</c:if>         
      
      <!-- 컨텐츠 시작 -->   
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div id="section1">
               <div id="menuName"> 게시글 목록 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="ad_productList" method="post">
                           <table>
                              <tr>
                                 <th style="width:5%"> 글번호 </th>
                                 <th style="width:10%"> 카테고리 </th>
                                 <th style="width:15%"> 글제목 </th>
                                 <th style="width:10%"> 작성일 </th>
                                 <th style="width:10%"> 조회수 </th>
                              </tr>
                              
                              <!-- 게시글이 있으면 -->
                            <c:forEach var="dto" items="${list}">  
                              <tr>
                              	<td>${dto.num}</td>
                              	<td>${dto.category}</td>
                              	<td><a href="${path}/notice_detailAction.bd?num=${dto.num}">${dto.title}</a>
                              	</td>
                              	<td>${dto.regDate}</td>
                              	<td>${dto.readCnt}</td>
                              </tr>
                            </c:forEach> 
                            
 	                          	<tr>
	                            	<td colspan="5" align="center">
	                            	<!-- 페이징 처리 -->
	                            	<!-- 이전 버튼 활성화 여부 -->
	                            	<c:if test="${paging.startPage > 10}">
	                            	 <a href="${path}/noticeList.bd?pageNum=${paging.prev}"> [이전] </a>
	                            	</c:if>
	                            	<!-- 페이지 번호 처리 -->
	                            	<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                            		<a href="${path}/noticeList.bd?pageNum=${num}"> ${num} </a> <!-- num = forEach 변수 -->
	                            	</c:forEach>
	                            	<!-- 다음 버튼 활성화 여부 -->
	                            	<c:if test="${paging.endPage < paging.pageCount}">
	                            	 <a href="${path}/noticeList.bd?pageNum=${paging.next}"> [다음] </a>
	                            	</c:if>
	                            	</td>
                            	</tr>
                            	
                            	<tr>
                            		<td colspan="5" align="right">
                            			<input type="button" class="inputButton" value="글쓰기" id="btnInsert">
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