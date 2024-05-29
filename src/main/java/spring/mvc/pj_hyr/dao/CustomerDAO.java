package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_hyr.dto.CustomerDTO;
import spring.mvc.pj_hyr.dto.NoticeDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;

public interface CustomerDAO {

	// ID 중복확인 처리
	public int idCheck(String strId);
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	// 로그인 처리 및 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);
	// 회원정보 인증 및 탈퇴처리
	public int deleteCustomer(String strId);
	// 회원정보 인증 및 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	// 회원정보 수정처리
	public int getupdateCustomer(CustomerDTO dto);
	
	// security
	// 가입 성공시 이메일 전송
	public void sendEmail(String email, String key);
	// 이메일 인증
	public int selectKey(String key);
	// 등급 변경
	public int updateGrade(String key);
	
	/*
	 customer ver
	 notice
	*/
	// notice 목록
	public List<NoticeDTO> noticeList(Map<String,Object> map);
	// notice 갯수
	public int noticeCnt();
	// notice 조회수 증가
	public void plusReadCnt_notice(int num);
	// notice 상세페이지
	public NoticeDTO getNoticeDetail(int num);
	
	
	/*
	   mypage
	   
	   order (주문내역 및 status)
	   refund(status) 요청
	   
	 */
	
	public List<OrderDTO> orderList(String sessionId);
	public int orderCnt();
	
	// 환불요청
	public void refundReq(RefundDTO dto);
	// 요청한 주문 내역에서 제외
	public void orderExcept(Map<String,Object> map);
	
	public List<RefundDTO> refundList(String sessionId);
	public int refundCnt();
	
	
}
