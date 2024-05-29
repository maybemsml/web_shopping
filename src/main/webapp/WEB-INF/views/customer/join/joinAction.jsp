<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입처리 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/common/join.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/perfume.css">
</head>
<body>
	<div class="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- 본문 시작 -->
		
	<c:if test="${insertCnt eq 0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("가입에 실패하였습니다. 다시 진행해주세요");
				window.location="${path}/join.do";
			},1000);
		</script>
	</c:if>
	
	<c:if test="${insertCnt eq 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("회원가입 성공");
				window.location="${path}/login.do"
			});
		</script>
	</c:if>
	<!-- 본문 끝 -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>