package spring.mvc.pj_hyr.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_hyr.service.CustomerServiceImpl;


@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
    
	@Autowired
	private CustomerServiceImpl service;
	
	
	
	// 첫페이지
	@RequestMapping("main.do")
	public String main() throws ServletException, IOException{
		logger.info(" url - main.do ");
		
		return "common/main";
	}
	
	// -- [회원가입] --
	// 회원가입 화면
	@RequestMapping("join.do")
	public String join() throws ServletException, IOException{
		logger.info(" url - join.do ");
		
		return "customer/join/join";
	}
	
	@RequestMapping("idConfirmAction.do")
	public String idConfirmAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - idConfirmAction.do ");
		
		service.idConfirmAction(req, model);
		return "customer/join/idConfirmAction";
	}
	
	// 회원가입 처리
	@RequestMapping("joinAction.do")
	public String joinAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - joinAction.do ");
		
		service.signInAction(req, model);
		return "customer/join/joinAction";
	}
	// security 이메일 인증
	@RequestMapping("emailChkAction.do")
	public String emailChkAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - emailChkAction.do ");
		
		service.emailChkAction(req, model);
		return "customer/join/emailChkAction";
	}
	
	// ---[로그인]---
	
	// 로그인 화면
	@RequestMapping("login.do")
	public String login(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - login.do ");
		
		return "customer/login/login";
	}
	
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - logout.do ");
		
		req.getSession().invalidate(); // 세션삭제
		return "common/main";
	}
	
	// ---[회원탈퇴]---
	
	// 회원탈퇴 화면
	@RequestMapping("deleteCustomer.do")
	public String deleteCustomer(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - deleteCustomer.do ");
		
		return "customer/mypage/customerInfo/deleteCustomer";
	}
	
	// 회원탈퇴 처리
	@RequestMapping("deleteCustomerAction.do")
	public String deleteCustomerAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - deleteCustomerAction.do ");
		
		service.deleteCustomerAction(req, model);
		req.getSession().invalidate();
		return "customer/mypage/customerInfo/deleteCustomerAction";
	}
	
	
	// ---[회원수정]---
	// 회원수정화면
	@RequestMapping("modifyCustomer.do")
	public String modifyCustomer(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - modifyCustomer.do ");
		
		return "customer/mypage/customerInfo/modifyCustomer";
	}
	// 회원상세페이지 처리
	@RequestMapping("modifyDetailAction.do")
	public String modifyDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - modifyDetailAction.do ");
		
		service.modifyDetailAction(req, model);
		return "customer/mypage/customerInfo/modifyDetailAction";
	}
	
	// 회원수정 처리
	@RequestMapping("modifyCustomerAction.do")
	public String modifyCustomerAction(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - modifyCustomerAction.do ");
		
		service.modifyCustomerAction(req, model);
		return "customer/mypage/customerInfo/modifyCustomerAction";
	}
	
	
	/*
	  	notice
	 */
	
	// notice main
	@RequestMapping("notice.do")
	public String noticeList(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - notice.do ");
		
		service.noticeListAction(req, model);
		return "customer/board/notice";
	}
		
	

	// notice 상세페이지
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - noticeDetail.do ");
		
		service.noticeDetailAction(req, model);
		return "customer/board/noticeDetail";
	}

	
	/*
	 
	 	mypage
	  
	 */
	
	// main
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - mypage.do ");
		
		return "customer/mypage/mypage";
	}
	// 고객 주문내역(요청 및 승인 내역 확인)	
	@RequestMapping("orderList.do")
	public String orderList(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - orderList.do ");
		
		service.orderListAction(req, model);
		return "customer/mypage/orderList";
	}
	
	// 고객 환불(요청)	
	@RequestMapping("refundRequest.do")
	public String refundRequest(HttpServletRequest req, Model model, HttpServletResponse res) throws ServletException, IOException{
		logger.info(" url - refundRequest.do ");
		
		service.refundRequestAction(req, model);
		String viewPage = req.getContextPath() + "/orderList.do";
		res.sendRedirect(viewPage);
		return null;
	}

	// 환불내역
	@RequestMapping("refundList.do")
	public String refundList(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info(" url - refundList.do");
		
		service.refundListAction(req, model);
		return "customer/mypage/refundList";
	}
	
	


}
