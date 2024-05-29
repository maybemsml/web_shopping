<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 마이페이지 </title>
	<link rel="stylesheet" href="${path}/resources/css/common/header.css">
	<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
	<link rel="stylesheet" href="${path}/resources/css/customer/mypage.css">
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="menuName"> 회원정보 </div>
			<div id="custInfoContainer">
				<div id="custGrade">
				저희 쇼핑몰을 이용해주셔서 감사합니다. <span class="highlightF"> ${sessionScope.sessionId}</span>님은 [family] 회원입니다.
				</div>
				<div id="custBonus">
					<div id="custBonusDetail">
						<table>
						<tr>
							<td> 가용 적립금 </td>
							<td class="bonusDetail" align="right"> 0원 </td>
							<td align="right"> <input type="button" value="조회" class=btn> </td>
						</tr>
						<tr>
							<td> 사용 적립금 </td>
							<td class="bonusDetail" align="right"> 0원 </td>
							<td></td>
						</tr>
						<tr>
							<td> 쿠폰 </td>
							<td class="bonusDetail" align="right"> 0개 </td>
							<td align="right"> <input type="button" value="조회" class=btn> </td>
						</tr>
						</table>
					</div>
					
					<div id="custBonusTotal">
						<table>
						<tr>
							<td> 가용 적립금 </td>
							<td class="bonusDetail" align="right"> 0원 </td>
							<td></td>
						</tr>
						<tr>
							<td> 총 주문 </td>
							<td class="bonusDetail" align="right"> 000,000원 </td>
							<td>(0회)</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>		
						</table>
					</div>
				</div>
				
				<div id="custOrder">
					<table>
						<tr>
						<td colspan=5 id="orderTitle"> 나의 주문처리 현황 <span class=small>(최근 3개월 기준)</span></td>
						</tr>
						
						<tr>
						<td class="highlightF"> 입금 전</td>
						<td class="highlightF"> 배송준비중 </td>
						<td class="highlightF"> 배송중 </td>
						<td class="highlightF"> 배송완료 </td>
						<td rowspan=2><div class=re> - 취소 : 0 <br> - 교환 : 0 <br> - 반품 : 0 <br></div> </td>
						</tr>
						
						<tr>
						<td class="orderCnt"> 0 </td>
						<td class="orderCnt"> 0 </td>
						<td class="orderCnt"> 0 </td>
						<td class="orderCnt"> 0 </td>
						
						</tr>
					
					</table>
				</div>
				<div id="custMenu">
					
					<div id="custMenuOrder">
						<a href="${path}/orderList.do"> <i class="fa-solid fa-truck-fast fa-2xl"></i>
						<div id="menuOrderCategory"> Order </div>
						<span class=small> 주문 내역 상세 조회 </span></a>
					</div>
					
					<div id="custMenuOrder">
						<a href="${path}/modifyCustomer.do"> <i class="fa-solid fa-user fa-2xl"></i>
						<div id="menuOrderCategory"> Profile </div>
						<span class=small> 개인 정보 수정 </span></a>
					</div>
					
					<div id="custMenuOrder">
						<a href="#"> <i class="fa-solid fa-hand-holding-heart fa-2xl"></i>
						<div id="menuOrderCategory"> Wishlist </div>
						<span class=small> 관심 상품 목록 </span></a>
					</div>
					
					<div id="custMenuOrder">
						<a href="${path}/refundList.do"> <i class="fa-solid fa-wallet fa-2xl"></i>
						<div id="menuOrderCategory"> refund </div>
						<span class=small> 환불 관련 내역 조회 </span></a>
					</div>
					
					<div id="custMenuOrder_">
						<a href="#"><i class="fa-solid fa-receipt fa-2xl"></i>
						<div id="menuOrderCategory"> Coupon </div>
						<span class=small> 보유한 쿠폰내역 </span></a>
					</div>
				</div>
			</div>
			<br>
				<div align="right">
				<input type="button" class="inputButton" value="회원수정" onclick="window.location='${path}/modifyCustomer.do'">
				<input type="button" class="inputButton" value="회원탈퇴" onclick="window.location='${path}/deleteCustomer.do'">
				</div>
		</div>
		<!-- 컨텐츠 끝 -->
		<!-- footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>		
</body>
</html>