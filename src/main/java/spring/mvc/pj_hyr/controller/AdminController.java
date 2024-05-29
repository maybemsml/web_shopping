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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.pj_hyr.service.ProductServiceImpl;

@Controller
public class AdminController{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private ProductServiceImpl service;
	
	
	// customer login으로 통일	
//		// admin controller 첫화면, 로그인
//		@RequestMapping("login.ad")
//		public String adlogin(HttpServletRequest req, Model model) throws ServletException, IOException{
//			logger.info("service - login.ad");
//			
//			return "admin/login/login";
//		}
//		
//		@RequestMapping("loginAction.ad")
//		public String adloginAction(HttpServletRequest req, Model model) throws ServletException, IOException{
//			logger.info("service - loginAction.ad");
//			
//			service.adLoginAction(req,model);
//			return "admin/login/loginAction";
//		}
		
		// logout = customer와 과정 동일하여 메서드 함께 사용
		
		
		// ---[상품정보]---
		// 상품등록 화면
		@RequestMapping("productAdd.ad")
		public String productAdd(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - productAdd.ad");
			
			return "admin/product/product_add";
		}
		
		// 상품등록 처리 ${path}/ad_product_addAction.pd
		@RequestMapping("product_addAction.ad")
		public String product_addAction(MultipartHttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - product_addAction.ad");
			// 매개변수 MultipartHttpServletRequest req로 변경
			// 주의사항 : 이미지 선택시 !Spring 패키지!에 있는 이미지로 가져와야 함
			// pom.xml에 fileupload 라이브러리 추가, servlet-context.xml에 MultipartResolver 설정 추가
			
			service.productAddAtction(req, model);
			return "admin/product/product_addAction";
		}
		
		 
		// 상품목록 ad_product_list
		@RequestMapping("productList.ad")
		public String productList(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - productList.ad");
			
			service.productListAction(req, model);
			return "admin/product/product_list";
		}
		
		// 상품상세페이지 - 목록 수정버튼 클릭 시 이동
		@RequestMapping("product_detailAction.ad")
		public String product_detailAction(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - product_detailAction.ad");
			
			service.productDetailAction(req, model);
			return "admin/product/product_detailAction";
		}
		
		// 상품수정처리 
		@RequestMapping("product_updateAction.ad")
		public String product_updateAction(MultipartHttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - product_updateAction.ad");
			
			service.productUpdateAction(req, model);
			return "admin/product/product_updateAction";
		}
		
		// 상품삭제 - 목록 삭제버튼 클릭 시 이동
		@RequestMapping("product_deleteAction.ad")
		public String product_deleteAction(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - product_deleteAction.ad");
			
			service.productDeleteAction(req, model);
			return "admin/product/product_deleteAction";
		}

		
		// 주문목록
		@RequestMapping("orderList.ad")
		public String orderList(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - orderList.ad");
			
			service.orderListAction(req, model);
			return "admin/order/ad_orderList";
		}
		
		// 주문승인처리
		@RequestMapping("orderConfirmAction.ad")
		public String orderConfirmAction(HttpServletRequest req, Model model, HttpServletResponse res)
				throws ServletException, IOException{
			logger.info("service - orderConfirmAction.ad");
			
			service.orderConfirmAction(req, model);
			String viewPage = req.getContextPath() + "/orderList.ad";
			res.sendRedirect(viewPage);
			return null;
		}
		
		// 주문거절처리
		@RequestMapping("orderCancelAction.ad")
		public String orderCancelAction(HttpServletRequest req, Model model, HttpServletResponse res)
				throws ServletException, IOException{
			logger.info("service - orderCancelAction.ad");
			
			service.orderRejectAction(req, model);
			String viewPage = req.getContextPath() + "/orderList.ad";
			res.sendRedirect(viewPage);
			return null;
		}
		
		
		// 환불목록
		@RequestMapping("refundList.ad")
		public String refundList(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - refundList.ad");
			
			service.refundListAction(req, model);
			return "admin/refund/ad_refundList";
		}
		
		// 환불승인처리
		@RequestMapping("refundConfirmAction.ad")
		public String refundConfirmAction(HttpServletRequest req, Model model, HttpServletResponse res)
				throws ServletException, IOException{
			logger.info("service - refundConfirmAction.ad");
			
			service.refundConfirmAction(req, model);
			String viewPage = req.getContextPath() + "/refundList.ad";
			res.sendRedirect(viewPage);
			return null;
		}

		// 환불거절처리
		@RequestMapping("refundDeleteAction.ad")
		public String refundRejectAction(HttpServletRequest req, Model model, HttpServletResponse res)
				throws ServletException, IOException{
			logger.info("service - refund_reject.ad");
			
			service.refundRejectAction(req, model);
			String viewPage = req.getContextPath() + "/refundList.ad";
			res.sendRedirect(viewPage);
			return null;
		}
		
		
		// 결산
		@RequestMapping("total.ad")
		public String total(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info("service - total.ad");
			
			service.totalListAction(req, model);
			service.monthlyTotalAction(req, model);
			return "admin/total/total";
		}
		
}
