package spring.mvc.pj_hyr.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.pj_hyr.dao.ProductDAO;
import spring.mvc.pj_hyr.dto.CartDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.ProductDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;
import spring.mvc.pj_hyr.dto.TotalDTO;
import spring.mvc.pj_hyr.page.Paging;
import spring.mvc.pj_hyr.page.Paging_total;

@Service
public class ProductServiceImpl implements ProductService {
	ProductDTO dto = new ProductDTO();
	
	@Autowired
	private ProductDAO dao;

	
	// 관리자 로그인
	@Override
	public void adLoginAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println(" pd Service - [product]adLoginAction 로그인처리");
		String adminId = req.getParameter("adminId");
		String adminPw = req.getParameter("adminPw");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminId", adminId);
		map.put("adminPw", adminPw);
		int selectCnt = dao.adminIdPasswordChk(map);

		if(selectCnt == 1) {
			req.getSession().setAttribute("sessionAdmin", adminId);
		}
		System.out.println(map);

		model.addAttribute("sessionAdmin", adminId);

	}
	
	@Override
	public void orderListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("Service - orderListAction 주문목록");
		
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.orderCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<OrderDTO> list = dao.orderList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}


	@Override
	public void refundListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("Service - refundListAction 환불목록");
		String pageNum = req.getParameter("pageNum");

		int total = dao.refundCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<RefundDTO> list = dao.refundList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}



	@Override
	public void orderConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]orderConfirmAction");
		
		int odNo = Integer.parseInt(req.getParameter("odNo"));
		
		dao.orderConfirm(odNo);
		
		model.addAttribute("odNo", odNo);
		
	}


	@Override
	public void orderRejectAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]orderCancelAction");
		
		int odNo = Integer.parseInt(req.getParameter("odNo"));
		
		dao.orderCancel(odNo);
		
		model.addAttribute("odNo", odNo);
		
	}


	@Override
	public void refundConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]refundConfirmAction");
		
		int rfNo = Integer.parseInt(req.getParameter("rfNo"));
		
		dao.refundConfirm(rfNo);
		
		model.addAttribute("rfNo", rfNo);	
	}


	@Override
	public void refundRejectAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]refundRejectAction");
		
		int rfNo = Integer.parseInt(req.getParameter("rfNo"));
		
		dao.refundReject(rfNo);
		
		model.addAttribute("rfNo", rfNo);	
		
	}


	@Override
	public void totalListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - totalListAction 결산목록");
		
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.totalCnt();
		System.out.println("total : " + total);
		
		Paging_total paging = new Paging_total(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<OrderDTO> list = dao.totalList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}


	@Override
	public void monthlyTotalAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - monthlyTotalAction 월별결산");
		
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.totalCnt();
		System.out.println("total : " + total);
		
		Paging_total paging = new Paging_total(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<TotalDTO> list2 = dao.monthTotal(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list2", list2);	
	}	
	

	
	// 상품등록
	@Override
	public void productAddAtction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productAddAtction 등록");
		
		// 이미지핸들러 Start 
		MultipartFile file = req.getFile("pdImg");
		System.out.println("file : " + file);
		
		// input 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		// 이미지 추가를 위한 샘플이미지 경로
		String realDir = "D:\\Dev01\\workspace_spring\\spring_pj_hyr\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			while((data = fis.read()) != -1){
				fos.write(data);
			}
			// 이미지 핸들러 End
			
			dto.setPdName(req.getParameter("pdName"));
			dto.setPdBrand(req.getParameter("pdBrand"));
			
			//imageUploadHandler 클래스에서 파일명을 setAttribute()로 넘겼으므로 getAttribute()로 처리
			// 수정 start 
			String p_img1 = "/pj_hyr/resources/upload/" + file.getOriginalFilename(); // 플젝명 / upload경로 / 파일명
			System.out.println("dto.getPdImg()" + p_img1);
			// 수정 end
			
			dto.setPdImg(p_img1);
			
			
			dto.setPdCategory(req.getParameter("pdCategory"));
			dto.setPdContent(req.getParameter("pdContent"));
			dto.setPdPrice(Integer.parseInt(req.getParameter("pdPrice")));
			dto.setPdQuantity(Integer.parseInt(req.getParameter("pdQuantity")));
			dto.setPdStatus(req.getParameter("pdStatus"));

			int insertCnt = dao.productInsert(dto);
			System.out.println(dto);
			
			model.addAttribute("insertCnt", insertCnt);
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			if(fis!=null) fis.close();
			if(fos!=null) fos.close();
		}
		
	}
	
	// 상품목록
	@Override
	public void productListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productListAction 목록");
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.productCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<ProductDTO> list = dao.productList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	// 상품목록 고객
	@Override
	public void perfumeListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productListAction 목록");
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.productCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setPfList(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start + " end : " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		List<ProductDTO> list = dao.productList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	// 상품상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productDetailAction 상세");
		
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String pageNum = req.getParameter("pageNum");
		
		ProductDTO dto = dao.productDetail(pdNo);
		System.out.println("dto " + dto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
	}

	// 상품수정
	@Override
	public void productUpdateAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productUpdateAction 수정");
		
		String pageNum = req.getParameter("pageNum") ;
		int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenPdNo")); 
		String hiddenPdImg = req.getParameter("hiddenPdImg");
		// 이미지핸들러 start
		MultipartFile file = req.getFile("pdImg");
		System.out.println("file : " + file);
		
		// input 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		// 이미지 추가를 위한 샘플이미지 경로
		String realDir = "D:\\Dev01\\workspace_spring\\spring_pj_hyr\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		String p_img1 = "";
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		if(file.getOriginalFilename()!=null && file.getOriginalFilename()!="") {
			
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			while((data = fis.read()) != -1){
				fos.write(data);
				}
			}
				catch(IOException e) {
				e.printStackTrace();
			}finally {
				if(fis!=null) fis.close();
				if(fos!=null) fos.close();
			// 이미지핸들러 End
			}
			//imageUploadHandler 클래스에서 파일명을 setAttribute()로 넘겼으므로 getAttribute()로 처리
			// 수정 start 
			p_img1 = "/pj_hyr/resources/upload/" + file.getOriginalFilename(); // 플젝명 / upload경로 / 파일명
			System.out.println("dto.getPdImg()" + p_img1);
			dto.setPdImg(p_img1);
			// 수정 end
		} else {
			p_img1= hiddenPdImg;
			System.out.println("기존이미지 : "+p_img1);
		}
		
		dto.setPdName(req.getParameter("pdName"));
		dto.setPdBrand(req.getParameter("pdBrand"));
		dto.setPdCategory(req.getParameter("pdCategory"));
		dto.setPdContent(req.getParameter("pdContent"));
		dto.setPdPrice(Integer.parseInt(req.getParameter("pdPrice")));
		dto.setPdQuantity(Integer.parseInt(req.getParameter("pdQuantity")));
		dto.setPdStatus(req.getParameter("pdStatus"));
		dto.setPdNo(hiddenPdNo); // input 태그 x = > hidden으로 넘김
		
		int updateCnt = dao.productUpdate(dto);
		
		model.addAttribute("updateCnt", updateCnt); // jsp 판별시 cnt로 판별해서 넘겨야 alert이 뜸
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pdNo", hiddenPdNo);
		
		
	}

	// 상품삭제
	@Override
	public void productDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - [product]productDeleteAction 삭제");
		
		int deleteCnt = 0;
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		
		deleteCnt = dao.productDelete(pdNo);

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// cart 목록
	@Override
	public void cartListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service - [product]cartListAction");
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		
		List<CartDTO> cartList = dao.cartList(sessionId);
		
		model.addAttribute("cartList", cartList);
		
	}

	// cart add
	@Override
	public void cartaddAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("Service - [product]cartaddAction 등록");
		
		int cartQuantity = Integer.parseInt(req.getParameter("quantity"));
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String sessionId = (String)req.getSession().getAttribute("sessionId");

		CartDTO cart = new CartDTO();
		
		cart.setQuantity(cartQuantity);
		cart.setPdNo(pdNo);
		cart.setCust_id(sessionId);
		
		dao.cartAdd(cart);
		
	}
	
	// 삭제
	@Override
	public void cartDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("Service - [product]cartDeleteAction 삭제");

		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdNo", pdNo);
		map.put("sessionId", sessionId);
		
		dao.cartDelete(map);
		System.out.println("delAct cartNo : " + pdNo);
		
	}
	
	// 구매 
	@Override
	public void cartBuyAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service - [product]cartBuyAction");

		int buyQuantity = Integer.parseInt(req.getParameter("quantity"));
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		int buyPrice = Integer.parseInt(req.getParameter("price"));
		
		OrderDTO dto = new OrderDTO();
		
		dto.setQuantity(buyQuantity);
		dto.setPdNo(pdNo);
		dto.setCust_id(sessionId);
		dto.setPrice(buyPrice);
		
		System.out.println(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdNo", pdNo);
		map.put("sessionId", sessionId);
		
		int insertCnt = dao.cartBuy(dto);
		dao.cartDelete(map); // 구매 후 장바구니에서 삭제
		model.addAttribute("insertCnt", insertCnt);
		
	}

	@Override
	public void nowBuyAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service - [product]nowBuyAction");

		int buyQuantity = Integer.parseInt(req.getParameter("quantity"));
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		int buyPrice = Integer.parseInt(req.getParameter("price"));
		
		OrderDTO dto = new OrderDTO();
		
		dto.setQuantity(buyQuantity);
		dto.setPdNo(pdNo);
		dto.setCust_id(sessionId);
		dto.setPrice(buyPrice);
		
		System.out.println(dto);
		
		dao.nowBuy(dto);
		
	}



}
