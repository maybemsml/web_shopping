<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원탈퇴 - 인증화면 </title>
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
					<div id="menuName"> 회원탈퇴 - 인증화면 </div>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id=section2>
					<div id=s2_inner>
						<div class=login>
							<form name=passwordform action="${path}/deleteCustomerAction.do" method=post>
								<table>
									<tr>
										<td colspan="2">
											<h3>
												<span style="color:#FF82AA"><b>${sessionScope.sessionId}</b></span>님 비밀번호를 입력하세요
											</h3>
										</td>
									</tr>
								
									<tr>
										<th> * 비밀번호 : </th>
										<td><input type=password class=input name=password size=20 placeholder="공백없이 15자이내로 작성" required></td>
									</tr>
									
									<tr>
										<td colspan=2 style=border-bottom:none>
											<br>
											<div align=right>
												<input type=submit class=inputButton value=회원탈퇴>
												<input type=reset class=inputButton value=탈퇴취소 onclick="window.location='${path}/main.do'">
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

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>