<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> notice </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/customer/noticeDetail.css">
</head>
<script>
$(function(){
	$("#btnList").click(function(){
		location.href="${path}/notice.do";
	});
});

</script>
<body>
<div class="wrap">
	<!-- header -->   
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
      
      <!-- 컨텐츠 시작 -->   
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
               <div id="menuName"> 공지사항 </div>
               <!-- 우측 내용시작  -->
               <div id="notice">
                     <form name="detailForm" method="post" class="noticeDetail">
                           <div class="table_div">
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
                            			<input type="button" class="inputButton" value="글목록" id="btnList">
                            		</td>
                            	</tr>
                           </table>
                        </form>
                      </div> 
               </div>
               <!-- 우측 내용종료  -->   
            </div>                     
      <!-- 컨텐츠 끝 -->   
      
     <!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
 </div>

</body>
</html>