package spring.mvc.pj_hyr.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CustomerService {
	
	// ID 중복확인 처리
	public void idConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 로그인 처리 및 회원정보 인증(수정, 탈퇴)
	public void loginAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 회원정보 인증 및 탈퇴처리
	public void deleteCustomerAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 회원정보 인증 및 상세페이지
	public void modifyDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 회원정보 수정처리	
	public void modifyCustomerAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// ++ security
	// 이메일 인증 enable update
	public void emailChkAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
//-----------------------------------------------------------
	
	// 게시글 목록
	public void noticeListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 게시글 상세페이지
	public void noticeDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

//---------------------------------------------------------- 주문 환불
	// 주문 관련 목록
	public void orderListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 환불 요청
	public void refundRequestAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 환불 내역
	public void refundListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	

}
