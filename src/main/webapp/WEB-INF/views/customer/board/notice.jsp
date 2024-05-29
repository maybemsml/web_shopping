<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> notice </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/customer/board.css">
</head>
<body>
<div class="wrap">
	<!-- header -->   
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- content -->
	<div id="container">
		<div id="menuName"> 공지사항 </div>
			<div id="noticeBoard">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" id="cate"> # </th>
			      <th scope="col" id="cate"> 분류 </th>
			      <th scope="col" colspan="2" id="cate" style="min-width:450px; max-width:800px;"> 제목 </th>
			      <th scope="col" id="cate"> 작성일 </th>
			    </tr>
			  </thead>
			  
			  <tbody>
			  <c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row"> ${dto.num} </th>
			      <td> ${dto.category} </td>
			      <td colspan="2"><a href="${path}/noticeDetail.do?num=${dto.num}"> ${dto.title} </a> </td>
			      <td> ${dto.regDate} </td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
			</div>
			
			
			<!-- paging -->
			<nav aria-label="Page navigation">
			  <ul class="pagination pagination-sm">
			    <li class="page-item">
			      <a class="page-link" href="${path}/notice.do?pageNum=${paging.prev}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			    <li class="page-item"><a class="page-link" href="${path}/notice.do?pageNum=${num}">${num}</a></li>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="${path}/notice.do?pageNum=${paging.next}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
	
	
	<!-- content end -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>

</body>
</html>