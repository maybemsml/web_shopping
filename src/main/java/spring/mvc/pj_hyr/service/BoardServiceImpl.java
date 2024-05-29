package spring.mvc.pj_hyr.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_hyr.dao.BoardDAO;
import spring.mvc.pj_hyr.dto.NoticeDTO;
import spring.mvc.pj_hyr.page.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	

//------------------------------------------notice   
	   
	@Override
	public void noticeListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - noticeListAction() // 글목록 ");
		
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum); // Paging.java
		
		int total = dao.noticeCnt();
		System.out.println("total " + total);
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
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
		
		NoticeDTO dto = dao.getNoticeDetail(num);
		System.out.println("dto : " + dto);
		
		model.addAttribute("dto", dto);	
	}
	
	@Override
	public void noticeUpdateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - noticeUpdateAction() // 수정");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setTitle(req.getParameter("title"));
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));
		
		dao.updateNotice(dto);		
	}

	@Override
	public void noticeDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - noticeDeleteAction() // 삭제");

		int num = Integer.parseInt(req.getParameter("num"));
		
		dao.deleteNotice(num);
	}

	@Override
	public void noticeInsertAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("Service - boardInsertAction() // ");
		NoticeDTO dto = new NoticeDTO();

		dto.setTitle(req.getParameter("title"));
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));

		dao.writeNotice(dto);	
	}

}
