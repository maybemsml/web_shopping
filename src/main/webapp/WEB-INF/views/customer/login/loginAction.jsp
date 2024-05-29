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
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<div id="menuName"> 로그인 처리 </div>
			
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<div id="s2_inner">
					<div class="login">
						<form name="loginform" action="${path}/loginAction.do" method="post">
						<c:if test="${empty sessionScope.sessionId}">
							<table>
								<tr>
									<td colspan="2" align="center">
										<h3>
											<%
												out.print("일치하지 않습니다. 재로그인 해주세요");
											%>
										</h3>
									</td>
								</tr>
								
								<tr>
									<th> * 아이디 </th>
									<td>
										<input type="text" class="input" name="cust_id" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
									</td>
								</tr>
								
								<tr>
									<th> * 비밀번호 </th>
									<td>
										<input type="password" class="input" name="password" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
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
						</c:if>
							
						<c:if test="${not empty sessionScope.sessionId}">
							<table>
								<tr>
									<td colspan="2" align="center">
										<h3>
											<span style="color:#FF82AA"><b>${sessionScope.sessionId}</b>님 반갑습니다.</span>
										</h3>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style=border-bottom:none>
									<br>
									<div align=right>
										<input type="button" class="inputButton" value="회원수정" onclick="window.location='${path}/modifyCustomer.do'">
										<input type="button" class="inputButton" value="회원탈퇴" onclick="window.location='${path}/deleteCustomer.do'">
										<input type="button" class="inputButton" value="로그아웃" onclick="window.location='${path}/logout.do'">
									</div>
								</tr>
							
							</table>
						</c:if>
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