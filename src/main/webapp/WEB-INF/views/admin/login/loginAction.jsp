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
				<div id="menuName"> 관리자 로그인 </div>
			
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<div id="s2_inner">
					<div class="login">
						<form name="loginform" action="${path}/loginAction.ad" method="post">
						<c:if test="${empty sessionScope.sessionAdmin}">
							<table>
								<tr>
									<td colspan="2" align="center">
										<h3>
											<%
												out.print("아이디와 비밀번호가 존재하지 않습니다. 재로그인 해주세요");
											%>
										</h3>
									</td>
								</tr>
								
								<tr>
									<th> * 아이디 </th>
									<td>
										<input type="text" class="input" name="adminId" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
									</td>
								</tr>
								
								<tr>
									<th> * 비밀번호 </th>
									<td>
										<input type="password" class="input" name="adminPw" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
									</td>
								
								</tr>
								
								<tr>
									<td colspan="2" style="border-bottom:none">
									<br>
									<div align="right">
										<input class="inputButton" type="submit" value="로그인">
										<input class="inputButton" type="reset" value="초기화">
									</div>
									</td>
								</tr>
							</table>
						</c:if>
							
						<c:if test="${not empty sessionScope.sessionAdmin}">
							<table>
								<tr>
									<td colspan="2" align="center">
										<h3>
											<span style="color:#FF82AA"><b>${sessionScope.sessionAdmin}</b> 로그인 되었습니다.</span>
										</h3>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style=border-bottom:none>
									<br>
									<div align=right>
										<input type="button" class="inputButton" value="결산" onclick="window.location='${path}/total.ad'">
										<input type="button" class="inputButton" value="상품목록" onclick="window.location='${path}/productList.ad'">
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