package spring.mvc.pj_hyr.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {

//----------------------------------------------------------------관리자
//	
//	/*
//	  
//	  관리자
//	  
//	 */
//	
	// admin 로그인 처리
	public void adLoginAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;	
	// order confirm
	public void orderConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	// order cancel
	public void orderRejectAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// refund confirm
	public void refundConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	// refund reject
	public void refundRejectAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	// 결산
	// list
	public void totalListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	public void monthlyTotalAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
//-----------------------------------------------------------------------------
	
	// 상품등록
	public void productAddAtction(MultipartHttpServletRequest req, Model model) 
		throws ServletException, IOException;
	
	// 상품목록
	public void productListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품상세페이지
	public void productDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품수정
	public void productUpdateAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품삭제
	public void productDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	
	// 상품목록 - 고객(12)
	public void perfumeListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	/*
	 
	 	장바구니
	 	리스트 등록 삭제? 구매
	  
	 */
	
	// 리스트
	public void cartListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;	
	
	// 등록
	public void cartaddAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 삭제
	public void cartDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 구매
	public void cartBuyAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;	
	
	// 바로구매
	public void nowBuyAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	/*
	  	order & refund
	 */
	
	// 주문내역
	public void orderListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 환불내역
	public void refundListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
//	
}
