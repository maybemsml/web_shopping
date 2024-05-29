<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 아이디 중복확인 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/join.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/perfume.css">
	
	<!-- join.js -->
	<script src="${path}/resources/js/customer/join.js" defer></script>
</head>
<body>
	<div class="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- 본문시작 -->
	<div id="container">
			<div id="contents">
				<!-- 상단 1 -->
				<div id="section1">
					<h1 align="center"> 회원가입 </h1>
				</div>
				<!-- 상단2 -->
				<div id="section2">
					<div id="s2_inner">
						<div class="join">
							<form name="confirmform" action="${path}/idConfirmAction.do" method="post" onsubmit="return idConfirmCheck();">
							<!-- method="post", get 방식일시 _csrf가 url에 붙음 -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">							
								
								<c:if test="${selectCnt == 1}">
									<table align="center">
										<tr>
											<th colspan="2" align="center">
												<span>${strId}</span>는 사용할 수 없습니다.
											</th>
										</tr>
										
										<tr>
											<th> *아이디 </th>
											<td>
												<input type="text" class="input" name="cust_id" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
											</td>
										</tr>
										
										<tr>
											<td colspan="2" style="border-bottom:none;">
												<br>
												<div align="right">
													<input class="inputButton" type="submit" value="확인">
													<input class="inputButton" type="reset" value="취소" onclick="self.close();">
												</div>
											</td>
										</tr>
									</table>
								</c:if>
								
								<c:if test="${selectCnt eq 0}">
									<table align="center" width=600px>
										<tr>
											<th colspan="2" align="center" >
												<span>${strId}</span>는 사용할 수 있습니다.
											</th>
										</tr>
									
										<tr>
											<td colspan="2" style="border-bottom:none;">
												<br>
												<div align="right">
													<input class="inputButton" type="button" value="확인" onclick="setId('${strId}');">
												</div>
											</td>
										</tr>
									</table>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- 본문끝 -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>