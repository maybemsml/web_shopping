<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 게시판 상세페이지  </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
<script>
$(function() {
		// 게시글 목록버튼 클릭시 컨트롤러의 목록(board_list)으로 이동
		$("#btnList").click(function(){
			location.href="${path}/noticeList.bd";
		});
		
		// 게시글 수정삭제 화면으로 이동
		$("#btnEdit").click(function(){
			document.detailForm.action="${path}/notice_edit.bd"; // ★★★ form 행에 주는 것과 같음(button => js 핸들링)
			document.detailForm.submit();
		});
		
		
	});
</script>
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
               <div id="menuName"> 게시판 상세페이지 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="detailForm" method="post">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                           <table>
                              <tr>
                                 <th style="width:200px"> 글번호 </th>
                                 <td style="width:200px; text-align:center">${dto.num} </td>
                                 
                                 <th style="width:200px"> 조회수 </th>
                                 <td style="width:200px; text-align:center">${dto.readCnt} </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> 분류 </th>
                                 <td style="width:200px; text-align:center">${dto.category} </td>

                                 <th style="width:200px"> 작성일 </th>
                                 <td style="width:200px; text-align:center">${dto.regDate} </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> 글제목 </th>
                                 <td colspan="3" text-align:center>${dto.title} </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> 글내용 </th>
                                 <td colspan="3" text-align:center>${dto.content} </td>
                              </tr>
                              
                            	
                            	<tr>
                            		<td colspan="4" align="right">
                            			<input type="hidden" name="num" value="${dto.num}">
                            			<input type="button" class="inputButton" value="수정/삭제" id="btnEdit">
                            			<input type="button" class="inputButton" value="글목록" id="btnList">
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