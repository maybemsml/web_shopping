<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> List </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/customer/perfume.css">
</head>
<body>
   <div class="wrap">
      <!-- header 시작 -->   
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- content -->
		<div id="container">
			<div id="menuName">Perfume</div>
				<div class="pflistContainer">
				
				<c:forEach var="dto" items="${list}">
					<a href="${path}/perfumeDetail.pf?pdNo=${dto.pdNo}">
					<div class="perfumeContainer">
						<img src="${dto.pdImg}" id="pfImg">
						<div class="pfContent">
							<span id="pfbrand"> ${dto.pdBrand} </span>
							<span id="pfName"> ${dto.pdName} </span>
							<span id="pfPreview"> ${dto.pdContent} </span>
							<span id="pfPrice">${dto.pdPrice}</span>
						</div>
					</div>
					</a>
				</c:forEach>	
				</div>
			
				<!-- 페이징 -->
				<div id=page>
				<!-- 이전 버튼 활성화 여부 -->
				<c:if test="${paging.startPage > 10}">
					<a href="${path}/perfumeList.pf?pageNum=${paging.prev}"> [이전] </a>
				</c:if>
				<!-- 페이지 번호 처리 -->
				<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					<a href="${path}/perfumeList.pf?pageNum=${num}"> ${num} </a> <!-- num = forEach 변수 -->
				</c:forEach>
				<!-- 다음 버튼 활성화 여부 -->
				<c:if test="${paging.endPage < paging.pageCount}">
					<a href="${path}/perfumeList.pf?pageNum=${paging.next}"> [다음] </a>
				</c:if>
				</div>
			</div>
			<!-- paging 
			<nav aria-label="Page navigation">
			  <ul class="pagination pagination-sm">
			    <li class="page-item">
			      <a class="page-link" href="${path}/perfumeList.pf?pageNum=${paging.prev}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			    <li class="page-item"><a class="page-link" href="${path}/perfumeList.pf?pageNum=${num}">${num}</a></li>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="${path}/perfumeList.pf?pageNum=${paging.next}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
			-->
		<!-- footer -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
</body>
</html>