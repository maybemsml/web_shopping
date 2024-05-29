<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 처리</title>
<link rel=stylesheet href="${path}/resources/css/common/header.css">
<link rel=stylesheet href="${path}/resources/css/common/footer.css">
<link rel=stylesheet href="${path}/resources/css/customer/login.css">
</head>
<body>
	<div class=wrap>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 컨텐츠 시작 -->
	
		<div id=container>
			<div id=contents>
				<!-- 상단 중앙1 시작 -->
				<div id=section1>
					<div id="menuName">회원탈퇴 처리</div>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id=section2>
					<div id=s2_inner>
						<div class=login>
							<form name=sessionform action="" method=post>
								<!-- 삭제성공 -->
								<c:if test="${deleteCnt eq 1}">
									<script type="text/javascript">
										setTimeout(() => {
											alert("회원탈퇴 처리 되었습니다.");
											window.location="${path}/main.do";
										}, 1000);
									</script>
								</c:if>
								
								<c:if test="${deleteCnt eq 0}">
									<script type="text/javascript">
										setTimeout(() => {
											alert("회원정보가 일치하지 않습니다.");
											window.location="${path}/deleteCustomer.do";
										}, 1000);
									</script>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 컨텐츠 끝 -->

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>