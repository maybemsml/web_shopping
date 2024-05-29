<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/login.css">
</head>
<body>
	<div class="wrap">
		<!-- header -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- UserLoginFailureHandler 에서 msg 넘김 -->
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
				<div id="menuName"> 로그인 </div>
			
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<div id="s2_inner">
					<div class="login">
						<form name="loginform" action="${path}/loginAction.do" method="post">
						<!-- method="post", get 방식일시 _csrf가 url에 붙음 -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<table>
								<tr>
									<th> * 아이디 </th>
									<td>
										<input type="text" class="input" name="cust_id" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
									</td>
								</tr>
								
								<tr>
									<th> * 비밀번호 </th>
									<td>
										<input type="password" class="input" name="password" size="15" placeholder="공백없이 15자 이내로 작성" required>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style="border-bottom:none">
									<br>
									<div align="right">
										<input class="inputButton" type="submit" value="로그인">
										<input class="inputButton" type="reset" value="초기화">
										<input class="inputButton" type="button" class="button" value="회원가입" onclick="window.location='${path}/join.do'">
									</div>
									</td>
								</tr>
							
							</table>
						</form>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		<!-- footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>