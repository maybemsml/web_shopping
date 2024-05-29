package spring.mvc.pj_hyr.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_hyr.service.ProductServiceImpl;

// 상품 관련 구매환불기타처리
@Controller
public class ProductController{
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);   
	
	@Autowired
	private ProductServiceImpl service;
	
		
		/*
		 
		   상품 기본
		  
		 */
		@RequestMapping("perfumeList.pf")
		public String perfumeList(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - perfumeList.pf ");
			
			service.perfumeListAction(req, model);
			return "customer/perfume/perfumeList";
		}
		
		@RequestMapping("perfumeDetail.pf")
		public String productDetail(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - perfumeDetail.pf");
			
			service.productDetailAction(req, model);
			return "customer/perfume/perfumeDetail";
		}
		
		/*
		  
		  cart
		  
		 */
		// 리스트
		@RequestMapping("cartList.pf")
		public String cartList(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - cartList.pf");
			
			service.cartListAction(req, model);
			return "customer/cart/cartList";
		}
		
		// 카트에 추가
		@RequestMapping("cartAddAction.pf")
		public String cartAddAction(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - cartAddAction.pf");
			
			service.cartaddAction(req, model);
			return "redirect:/";
		}		

				
		
		// 삭제처리
		@RequestMapping("cartDeleteAction.pf")
		public String cartDeleteAction(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - cartDeleteAction.pf");
			
			service.cartDeleteAction(req, model);
			return null;
		}

		// 카트에서 구매
		@RequestMapping("cartBuyAction.pf")
		public String cartBuyAction(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - cartBuyAction.pf");
			
			service.cartBuyAction(req, model);
			return "customer/cart/cartBuyAction";
		}		

		// 바로구매
		@RequestMapping("nowBuy.pf")
		public String nowBuy(HttpServletRequest req, Model model)
				throws ServletException, IOException{
			logger.info(" url - nowBuy.pf");
			
			service.nowBuyAction(req, model);
			return "redirect:/";
		}		
}
