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

import spring.mvc.pj_hyr.service.BoardServiceImpl;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardServiceImpl service;
	
	/*
	  	notice controller
	  
	 */
		
	// --- [notice] ---
	// 목록
	@RequestMapping("noticeList.bd")
	public String noticeList(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		logger.info(" url - .bd ");
		
		service.noticeListAction(req, model);
		return "admin/notice/noticeList";
	}
	
	// 상세페이지
	@RequestMapping("notice_detailAction.bd")
	public String noticeDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		logger.info(" url - notice_detailAction.bd ");
		
		service.noticeDetailAction(req, model);
		return "admin/notice/notice_detailAction";
	}
	
	// 수정/삭제시 페이지
	@RequestMapping("notice_edit.bd")
	public String noticeEdit(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		logger.info(" url - notice_edit.bd ");
		
		service.noticeDetailAction(req, model);
		return "admin/notice/notice_edit";
	}	
	
	// 수정처리 notice_updateAction
	@RequestMapping("notice_updateAction.bd")
	public String noticeUpdateAction(HttpServletRequest req, Model model, HttpServletResponse res)
			throws ServletException, IOException{
		logger.info(" url - notice_updateAction.bd ");
		
		service.noticeUpdateAction(req, model);
		String viewPage = req.getContextPath() + "/noticeList.bd" ;
		res.sendRedirect(viewPage);
		return null;
	}	


	// 삭제처리 notice_deleteAction
	@RequestMapping("notice_deleteAction.bd")
	public String noticeDeleteAction(HttpServletRequest req, Model model, HttpServletResponse res)
			throws ServletException, IOException{
		logger.info(" url - notice_deleteAction.bd ");
		
		service.noticeDeleteAction(req, model);
		String viewPage = req.getContextPath() + "/noticeList.bd" ;
		res.sendRedirect(viewPage);
		return null;
	}


	// 게시글 작성화면 notice_insert
	@RequestMapping("notice_insert.bd")
	public String noticeInsert(HttpServletRequest req, Model model)
			throws ServletException, IOException{
		logger.info(" url - notice_insert.bd ");
		
		return "admin/notice/notice_insert";
	}	
	
	// 게시글 작성처리 ${path}/notice_insertAction.bd
	@RequestMapping("notice_insertAction.bd")
	public String noticeInsertAction(HttpServletRequest req, Model model, HttpServletResponse res)
			throws ServletException, IOException{
		logger.info(" url - notice_insertAction.bd ");
		
		service.noticeInsertAction(req, model);
		String viewPage = req.getContextPath() + "/noticeList.bd";
		res.sendRedirect(viewPage);		
		return null;
	}	
		
		
		
		
}
