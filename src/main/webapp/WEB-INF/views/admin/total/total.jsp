<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 - 결산 </title>
<link rel="stylesheet"  href="${path}/resources/css/common/header.css">
<link rel="stylesheet"  href="${path}/resources/css/common/footer.css">
<link rel="stylesheet"  href="${path}/resources/css/admin/total.css">
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['월', '월 매출', { role: 'style' } ],
         <c:forEach var="month" items="${list2}">
          ["${month.month}", ${month.monthlysales}, 'color: #f6f3f0'],
         </c:forEach> 
        ]);
        
        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);

        var options = {
          title: " 월 매출 ",
          width: 800,
          height: 400,
          bar: {groupWidth: "95%"},
          legend: { position: "none" },
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
        chart.draw(view, options);
    }
  </script>
<body>
   <div class="wrap">
      <!-- header/leftMenu -->   
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
                <% 
                	int totalSales = 0; 
                	int totalCnt = 0;
                %>
            <div id="section1">
               <div id="menuName"> 결산 </div>
            </div>
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               <!-- 좌측메뉴 -->
               <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>
               <div id=totalContainer>
               	<div class="table_div">
               		<form name="ad_total" method="post">
                           <table>
                              <tr>
                                 <th style="width:10%"> 월 </th>
                                 <th style="width:10%"> 판매액 </th>
                                 <th style="width:10%"> 주문건수 </th>
                              </tr>
                              
                              <!-- 상품이 있으면 -->
                              <c:forEach var="month" items="${list2}">
                              <tr>
                              	<td>${month.month}</td>
                              	<td>${month.monthlysales}</td>
                              	<td>${month.monthlysoldCnt}</td>
                              </tr>
                              <c:set var="sales" value="${month.monthlysales}"/>
                              <c:set var="soldCnt" value="${month.monthlysoldCnt}"/>
                              <%
                              	totalSales += (Integer)pageContext.getAttribute("sales");
                              	totalCnt += (Integer)pageContext.getAttribute("soldCnt"); 
                              %>
                              </c:forEach>
                              <td colspan="12" align="center">
	               				<div>총 판매액 : <%=totalSales %>원, 주문건수 <%=totalCnt %> 건</div>
                              </td>
							<tr>
								<td colspan="12" align="center">
								<!-- 페이징 처리 -->
								<!-- 이전 버튼 활성화 여부 -->
								<c:if test="${paging.startPage > 10}">
									<a href="${path}/total.ad?pageNum=${paging.prev}"> [이전] </a>
								</c:if>
								<!-- 페이지 번호 처리 -->
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="${path}/total.ad?pageNum=${num}"> ${num} </a> <!-- num = forEach 변수 -->
								</c:forEach>
								<!-- 다음 버튼 활성화 여부 -->
								<c:if test="${paging.endPage < paging.pageCount}">
									<a href="${path}/total.ad?pageNum=${paging.next}"> [다음] </a>
								</c:if>
								</td>
							</tr>
							<tr>
							<td colspan="12">
		                  		<div id="columnchart_values" style="width: 800px; height: 400px;"></div>
							</td>
							</tr>
                          </table>
                   </form>
               	</div>
               </div>
             </div>
           </div>
         </div>   
      <!-- footer -->   
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
</body>
</html>