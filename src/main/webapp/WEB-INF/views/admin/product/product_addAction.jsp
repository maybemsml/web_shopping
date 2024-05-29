<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상품등록 처리 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
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
		
		
		<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				setTimeout(function(){
					alert("상품등록 실패");
					window.location="${path}/productAdd.ad";
				}, 1000);
			</script>
		</c:if>
		
		<c:if test="${insertCnt eq 1}">
			<script type="text/javascript">
				setTimeout(function(){
					alert("상품등록 성공");
					window.location="${path}/productList.ad"
				}, 1000);
			</script>
		</c:if>
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