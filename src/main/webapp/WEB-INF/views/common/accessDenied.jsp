<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> dinied </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/common/main.css">
</head>
<body>
<div class="wrap">
   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
   
   <div id="container">
      <div id="contents" style="text-align: center">
         <h1>관리자 페이지</h1>
         <br>
         
         <!-- UserDeniedHandler에서  errMsg 전달 -->
         <p style="font-size: 18px">${errMsg}</p> <br>
         
         <c:if test="${sessionScope.customerID !=null}">
            <button value="이동하기" class="inputButton" style="width:200px; font-size:24px; text-align: center;"
               onclick="window.location='logout.do'">이동하기</button>
         </c:if>
         <c:if test="${sessionScope.customerID == null}">
            <button value="이동하기" class="inputButton" style="width:200px; font-size:24px; text-align: center;"
               onclick="window.location='login.do'">이동하기</button>
         </c:if>
      </div>
   </div>
</div>
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>