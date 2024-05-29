package spring.mvc.pj_hyr.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_hyr.dao.CustomerDAOImpl;
import spring.mvc.pj_hyr.dto.CustomerDTO;
import spring.mvc.pj_hyr.dto.NoticeDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;
import spring.mvc.pj_hyr.page.Paging;
import spring.mvc.pj_hyr.util.EmailChkHandler;

@Service
public class CustomerServiceImpl implements CustomerService{
	CustomerDTO dto = new CustomerDTO();
	
	@Autowired
	private CustomerDAOImpl dao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화

	// ID 중복확인 처리	
	@Override
	public void idConfirmAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - idConfirmAction 중복확인 ");
		
		String strId = req.getParameter("cust_id");
		
		int selectCnt = dao.idCheck(strId);
		System.out.println("cnt : " + selectCnt);

		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("strId", strId);
	}

	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - signInAction 회원가입처리 ");
		
		dto.setCust_id(req.getParameter("cust_id"));
		
		String password = req.getParameter("password");
		String encryptPassword = passwordEncoder.encode(password); // 암호화 후 pw
		dto.setPassword(encryptPassword);
		System.out.println(password + "\n ==암호화== \n " + encryptPassword);
		
		dto.setUsername(req.getParameter("username"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));
		
		// hp(not null) if로 확인하여 값이 존재할 때만 받음
		String hp = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		if(!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		dto.setHp(hp);
		
		// email = id와 도메인 따로 받아서 병합
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2;
		dto.setEmail(email);
		
		dto.setGender(req.getParameter("gender"));
		
		// regDate는 입력값이 없으면 sysdate, 아래문장은 직접 설정 문장
		dto.setRegDate(new Timestamp(System.currentTimeMillis())); // java.sql 사용
		
		// security (회원가입시 인증 이메일)
		String key = EmailChkHandler.getKey();
		dto.setKey(key);
		System.out.println(dto);
		int insertCnt = dao.insertCustomer(dto);
		System.out.println("insertCnt" + insertCnt);
		
		if(insertCnt == 1) {
			dao.sendEmail(email, key);
		}
		
		model.addAttribute("insertCnt", insertCnt);
		
		
	}

	// 로그인 처리 및 회원정보 인증(수정, 탈퇴)	
	@Override
	public void loginAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - loginAction 로그인처리");

		String strId = req.getParameter("cust_id");
		String strPassword = req.getParameter("password");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		
		// 로그인 처리
		int selectCnt = dao.idPasswordChk(map);
		System.out.println("selectCnt " + selectCnt);
		
		// 로그인 성공시 세션id 설정
		if(selectCnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", strId);
		}
		
		// 세션으로 로그인 여부 판단 => JSP 전달 생략
	}

	
	// 회원정보 인증 및 탈퇴처리 ++
	@Override
	public void deleteCustomerAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - deleteCustomerAction 인증+탈퇴 ");
		String strId = (String) req.getSession().getAttribute("sessionId");		
		// 탈퇴 처리
		int deleteCnt = dao.deleteCustomer(strId);

		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	// 회원정보 인증 및 상세페이지 ++
	@Override
	public void modifyDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - modifyDetailAction 상세페이지");
		String strId = (String) req.getSession().getAttribute("sessionId");
		
		// 수정 상세페이지
		CustomerDTO dto = null;
		dto = dao.getCustomerDetail(strId);
		
		model.addAttribute("dto", dto);
		
	}
	
	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" Service - modifyCustomerAction 수정처리");
		dto.setCust_id((String)req.getSession().getAttribute("sessionId"));
		
		// 암호화된 비밀번호
		String password = req.getParameter("password");
		String encryptPassword = passwordEncoder.encode(password);
		dto.setPassword(encryptPassword);
		
		dto.setPassword(req.getParameter("password"));
		dto.setUsername(req.getParameter("username"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));
		String hp=null;
		if (!req.getParameter("hp1").equals("") && !req.getParameter("hp2").equals("") && !req.getParameter("hp3").equals("")) {
			hp = req.getParameter("hp1") +"-"+ req.getParameter("hp2") +"-"+ req.getParameter("hp3");
		}
		dto.setHp(hp);
		
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		dto.setEmail(email);
		
		dto.setGender(req.getParameter("gender"));
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		// update
		int updateCnt = dao.getupdateCustomer(dto);
		System.out.println("updateCnt : "+ updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 이메일 인증 => enabled update
	@Override
	public void emailChkAction(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		System.out.println("Service - emailChkAction / enabled update ");
		
		String key = req.getParameter("key");
		int selectCnt = dao.selectKey(key);
		
		if(selectCnt == 1) {
			int insertCnt = dao.updateGrade(key);
			model.addAttribute("insertCnt", insertCnt);
		}
	}
	
	//notice
	@Override
	public void noticeListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("Service - noticeListAction() // customer ");
		

		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum); // Paging.java
		
		int total = dao.noticeCnt();
		System.out.println("total " + total);
		
		paging.setTotalCount(total);
		
		// 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeDTO> list = dao.noticeList(map); 
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}

	@Override
	public void noticeDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - noticeDetailAction() // 글 상세페이지");
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		dao.plusReadCnt_notice(num);
		
		NoticeDTO dto = dao.getNoticeDetail(num);
		System.out.println("dto : " + dto);
		
		model.addAttribute("dto", dto);
		
	}

	@Override
	public void orderListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("Service - orderListAction");
		
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		List<OrderDTO> list = dao.orderList(sessionId);
		int total = dao.orderCnt();
		System.out.println("orderDTO : "+list);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
	}

	@Override
	public void refundRequestAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - refundRequestAction");
		
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		int odNo = Integer.parseInt(req.getParameter("odNo"));
		RefundDTO dto = new RefundDTO();
		dto.setOdNo(odNo);
		dto.setPdNo(Integer.parseInt(req.getParameter("pdNo")));
		dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setCust_id(sessionId);
		
		// 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("odNo", odNo);
		
		dao.refundReq(dto);
		dao.orderExcept(map);
		
	}

	@Override
	public void refundListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("Service - refundListAction");
		
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		List<RefundDTO> list = dao.refundList(sessionId);
		int total = dao.refundCnt();
		
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
	}

}
