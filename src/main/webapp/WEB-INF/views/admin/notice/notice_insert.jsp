<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 게시글 작성화면  </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">

<!-- join.js (select) -->
<script src="${path}/resources/js/option.js" defer></script>
<script>
	$(function() {
		// jQuery 사용, 페이지가 로딩되면
		
		// 게시글 작성 버튼 클릭시 게시글 작성화면으로 이동
		$("#btnSave").click(function(){
			
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
			
			
			document.insertForm.action = "${path}/notice_insertAction.bd"; // ★★★ form 행에 주는 것과 같음(button => js 핸들링)
			document.insertForm.submit();
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
               <div id="menuName"> 게시글 작성화면 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 시작 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <!-- 좌측메뉴 종료 -->
               
               <!-- 우측 내용시작  -->
               <div id="right">
                  <div class="table_div">
                     <form name="insertForm" method="post">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                           <table>
                              
                              
                              <tr>
                                 <th style="width:400px"> 글제목 </th>
                                 <td colspan="3" style="width:550; text-align:center">
                                 	<input type="text" class="input" name="title" id="title" size="50" required>
                                 </td>
                              </tr>
                              
                              <tr>
                              	<th style="width:400px"> 분류 </th>
                              	<td>
								<select class="input" name="category" style="width:100px" required>
									<option value=""> 분류 </option>
									<option value="공지"> 공지 </option>
									<option value="이벤트"> 이벤트 </option>
									<option value="기타"> 기타 </option>
								</select>
                              	</td>
                              </tr>
                              
                              
                              <tr>   
                                 <th style="width:400px"> 글내용 </th>
                                 <td colspan="3" style=text-align:center>
                                 	<textarea rows="5" cols="93" name="content" id="content" required></textarea>
                                 </td>
                              </tr>
                            	
                            	<tr>
                            		<td colspan="4" align="right">
                            			<input type="hidden" name="num" value="${dto.num}"> <!-- 없으면 parse -->
                            			<input type="button" class="inputButton" value="작성" id="btnSave">
                            			<input type="button" class="inputButton" value="초기화" >
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