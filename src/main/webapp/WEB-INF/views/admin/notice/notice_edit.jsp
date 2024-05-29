<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 게시판 수정 및 삭제페이지  </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
<script>
	$(function() {
		// jQuery 사용, 페이지가 로딩되면
		// 게시글 목록버튼 클릭시 컨트롤러의 목록(board_list)으로 이동
		
		$("#btnList").click(function(){
			location.href="${path}/noticeList.bd";
		});
		
		// 게시글 수정
		$("#btnEdit").click(function(){
			const title = $("#title").val();
			const content = $("#content").val();
			
			if($("#title").val() == ""){
				alert("게시글 제목을 입력하세요");
				$("#title").focus();
				return false;
			}
			
			if(content == ""){
				alert("게시글 내용을 입력하세요");
				$("#content").focus();
				return false;
			}
			
			if(confirm("수정하시겠습니까?")){
			document.editForm.action = "${path}/notice_updateAction.bd"; // ★★★ form 행에 주는 것과 같음(button => js 핸들링)
			document.editForm.submit();
			}
		});
		
		// 게시글 삭제
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
			document.editForm.action = "${path}/notice_deleteAction.bd"; // ★★★ form 행에 주는 것과 같음(button => js 핸들링)
			document.editForm.submit();
			}
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
               <div id="menuName"> 게시판 수정/삭제 페이지 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="editForm" method="post">
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
                                <td>
								<select class="input" name="category" style="width:100px" required>
									<option <c:if test="${dto.category=='공지'}">selected</c:if> value="공지"> 공지 </option>
									<option <c:if test="${dto.category=='이벤트'}">selected</c:if> value="이벤트"> 이벤트 </option>
									<option <c:if test="${dto.category=='기타'}">selected</c:if> value="기타"> 기타 </option>
								</select>
								</td>
                                 <th style="width:200px"> 작성일 </th>
                                 <td style="text-align:center">${dto.regDate} </td>
                              </tr>
                              
                              <tr>
                                 <th style="width:200px"> 글제목 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<input type="text" class="input" name="title" id="title" size="50" value="${dto.title}">
                                 </td>
                              </tr>
                              
                              <tr>   
                                 <th style="width:200px"> 글내용 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<textarea rows="5" cols="93" name="content" id="content">${dto.content}</textarea>
                                 </td>
                              </tr>
                              
                            	
                            	<tr>
                            		<td colspan="4" align="right">
                            			<input type="hidden" name="num" value="${dto.num}"> <!-- 없으면 parse -->
                            			<input type="button" class="inputButton" value="수정" id="btnEdit">
                            			<input type="button" class="inputButton" value="삭제" id="btnDelete">
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