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
<link rel="stylesheet"  href="${path}/resources/css/customer/perfumeDetail.css">
</head>
<script>
$(function(){
	
	$("#btnCartAdd").click(function(){
		if(${sessionScope.sessionId != null}){
			cartAdd();
		}
		else{
			alert("로그인 후 이용해주세요.");
		}
	});
	
	$("#btnNowBuy").click(function(){
		if(${sessionScope.sessionId != null}){
			nowBuy();
		}
		else{
			alert("로그인 후 이용해주세요.");
		}
	});
});
	
	function cartAdd(){
		alert("장바구니에 담겼습니다.");
		
		let param={
				"pdNo" : ${dto.pdNo},
				"quantity" : $("#count").val(),
				"price" : ${dto.pdPrice},
				"_csrf" : '${_csrf.token}'
		}
		$.ajax({
			url:"/pj_hyr/cartAddAction.pf",
			type:"post",
			data:param
		})
	};
	
	function nowBuy(){
		alert("상품을 구매하였습니다.");
		let param={
				"pdNo" : ${dto.pdNo},
				"quantity" : $("#count").val(),
				"price" : ${dto.pdPrice},
				"_csrf" : '${_csrf.token}'
		}
		$.ajax({
			url:"/pj_hyr/nowBuy.pf",
			type:"post",
			data:param
		})
	};
	
	function sum(){
		let num = Number(document.getElementById('count').value);
		document.getElementById('lastPrice').innerHTML = num * Number(${dto.pdPrice});
	}
</script>
<body>
   <div class="wrap">
      <!-- header 시작 -->   
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- content -->
		<div id="container">
			<div class="pfContainer">
				<div class="pfImgContainer">
					<img src="${dto.pdImg}" id="pfImg">
				</div>
				<div class="pfInfoContainer">
					<span id="brand"> ${dto.pdBrand} >> </span>
					<span id="title"> ${dto.pdName} </span>
					<hr>
					<table>
						<tr>
						<th id="detailTitle"> 가격 </th>
						<td></td>
						<td id="detailContents"> <span id=price2> ${dto.pdPrice} 원</span></td>
						</tr>
						<tr>
						<th id="detailTitle"> 수량 </th>
						<td></td>
						<td id="detailContents">
							<!--  -->
							<input type="number" id="count" value="1" oninput="sum()">
						</td>
						</tr>
						<tr>
						<th id="detailTitle"> 사용후기 </th>
						<td></td>
						<td id="detailContents"> <a href="#" id=reviewP> 78개 </a></td>
						</tr>
						<tr>
						<th id="detailTitle"> 평점 </th>
						<td></td>
						<td id="detailContents"> ★4.3 </td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
						<th id="detailTitle"> 배송비 </th>
						<td id="detailContents"> 2,500원 (97,000원 이상 구매시 무료배송)</td>
						</tr>
						
						<tr>
						<th id="detailTitle"> 출고예정일 </th>
						<td id="detailContents"> 2시 이전 당일출고(주말, 공휴일 제외)</td>
						</tr>
						
						<tr>
						<th id="detailTitle"> 배송방법 </th>
						<td id="detailContents"> 퍼퓸그라피 / 본사 검수 및 직배송 / CJ대한통운</td>
						</tr>
					</table>
					<hr>
					<div class="choosebox"><!-- 용량/패키지 선택 -->
					<table>
					<tr>
					<th id="detailTitle"> 용량 </th>
					<td id="detailContents">
						<input type="button" value="50ml" class="button">
						<input type="button" value="100ml" class="button">
					</td>
					</tr>
					<tr>
					<th id="detailTitle"> 패키지 </th>
					<td id="detailContents">
						<input type="button" value="선물포장추가" class="button">
					</td>
					</tr>
					</table>
					</div>
					<hr>
					<span id="min"> (최소 주문 수량 1개 이상) </span>
					<div id="lastPrice"> ${dto.pdPrice} 원</div>
				
					<div id="detailbtn">
						<button type="button" class=btn2 id=btnCartAdd> 장바구니 </button>
						<button type="button" class=btn3 id=btnNowBuy> 바로구매 </button>
					</div>
				</div>
			</div>
		</div>		
		<!-- footer -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
</body>
</html>