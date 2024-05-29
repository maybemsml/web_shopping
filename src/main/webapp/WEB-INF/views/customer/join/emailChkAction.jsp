<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 처리 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/join.css">
</head>
<body>
	<div class="wrap">
		<!-- header -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				setTimeout(function(){
					alert("이메일 인증 실패");
					window.location="${path}/login.do";
				}, 1000);
			</script>
		</c:if>
		
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				setTimeout(function(){
					alert("이메일 인증 성공");
					window.location="${path}/login.do"
				}, 1000);
			</script>
		</c:if>
		
		<!-- footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>		
</body>
</html>