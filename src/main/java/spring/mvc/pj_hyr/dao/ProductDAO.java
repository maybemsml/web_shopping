package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_hyr.dto.CartDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.ProductDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;
import spring.mvc.pj_hyr.dto.TotalDTO;

public interface ProductDAO {

	
	// 상품등록
	public int productInsert(ProductDTO dto);
	
	// 상품 갯수
	public int productCnt();
	
	// 상품목록
	public List<ProductDTO> productList(Map<String, Object> map);
	
	// 상품상세페이지
	public ProductDTO productDetail(int pdNo);
	
	// 상품수정
	public int productUpdate(ProductDTO dto);
	
	// 상품삭제
	public int productDelete(int pdNo);
	
	
//	/*
//	  
//	 	관리자 로그인
//	  
//	 */
//	
	// 로그인 처리
	public int adminIdPasswordChk(Map<String, Object> map);
	
	// 주문 관련 목록
	public List<OrderDTO> orderList(Map<String, Object> map);
	public int orderCnt();
	// 승인
	public int orderConfirm(int odNo);
	// 거절
	public int orderCancel(int odNo);
	
	
	// 환불 관련 목록
	public List<RefundDTO> refundList(Map<String, Object> map);
	public int refundCnt();
	// 승인
	public int refundConfirm(int rfNo);
	// 거절
	public int refundReject(int rfNo);
	
	// 결산
	public List<OrderDTO> totalList(Map<String, Object> map);
	// 총 판매개수
	public int totalCnt();
	// 월별결산
	public List<TotalDTO> monthTotal(Map<String, Object> map);
	
	
	
	
	/*
	 ! 고객 !
	  
	  장바구니
	  장바구니에 추가 / 삭제 목록 구매 갯수
	  
	 */
	
	public List<CartDTO> cartList(String sessionId);
	
	public void cartCnt(String sessionId);
	
	public void cartAdd(CartDTO cart);
	
	public void cartDelete(Map<String, Object> map);
	
	public int cartBuy(OrderDTO order);
	
	// 구매
	public void nowBuy(OrderDTO order);
	
	
}
