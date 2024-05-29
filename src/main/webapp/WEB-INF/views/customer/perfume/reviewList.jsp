<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> review  </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/ad_productList.css">
</head>
<body>
<!-- 우측 -->
<div id="right">
	<div class="table_div">
		<table border="1" width="1000px">
				<tr>
					<th colspan="2"> 리뷰목록 </th>
				</tr>
				<tr>
					<th style="width:200px"> 작성자 </th>
					<th> 글내용 </th>
				</tr>
			<c:forEach var="dto" items="${list}">
				<tr>	
					<td>${dto.writer}</td>
					<td>${dto.content}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>
</html>