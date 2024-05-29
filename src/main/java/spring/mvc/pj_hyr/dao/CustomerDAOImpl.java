package spring.mvc.pj_hyr.dao;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_hyr.util.SettingValues;
import spring.mvc.pj_hyr.dto.CustomerDTO;
import spring.mvc.pj_hyr.dto.NoticeDTO;
import spring.mvc.pj_hyr.dto.OrderDTO;
import spring.mvc.pj_hyr.dto.RefundDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// ID 중복확인 처리
	@Override
	public int idCheck(String strId) {
		System.out.println(" DAO - idCheck 중복확인 ");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.idCheck", strId);
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println(" DAO - insertCustomer() 회원가입 ");
		int insertCnt =  sqlSession.insert("spring.mvc.pj_hyr.dao.CustomerDAO.insertCustomer", dto);
		return insertCnt;
	}

	// 로그인 처리 및 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println(" DAO - idPasswordChk 로그인처리");
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.idPasswordChk", map);
		return selectCnt;
	}

	
	// 회원정보 인증 및 탈퇴처리
	@Override
	public int deleteCustomer(String strId) {
		System.out.println(" DAO - deleteCustomer 탈퇴처리");
		int deleteCnt = sqlSession.delete("spring.mvc.pj_hyr.dao.CustomerDAO.deleteCustomer", strId);
		return deleteCnt;
	}
	
	// 회원정보 인증 및 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println(" DAO - getCustomerDetail 상세페이지");
		CustomerDTO dto = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.getCustomerDetail", strId);
		return dto;
	}
	
	// 회원정보 수정 처리
	@Override
	public int getupdateCustomer(CustomerDTO dto) {
		System.out.println(" DAO - getupdateCustomer 정보수정");
		int updateCnt = sqlSession.update("spring.mvc.pj_hyr.dao.CustomerDAO.getupdateCustomer", dto);
		System.out.println(updateCnt + "dto : " + dto);
		return updateCnt;
	}

	/*
	  	Security
	 */
	
	//
	@Override
	public void sendEmail(String email, String key) {
		System.out.println(" DAO - sendEmail");
		
		final String username = SettingValues.ADMIN; // 네이버 이메일 id
		final String password = SettingValues.PW; // 네이버 비밀번호
		
		// naver 이메일 > 환경설정 > pop3/Imap 설정
		final String host = "smtp.naver.com"; // smpt.도메인
		int port = 465; // 포트번호
		
		// 메일내용
		String recipient = ""; // 수신인 메일주소(도메인까지 작성)
		String subject = "회원가입 인증 메일"; // 메일 제목
		String content = "링크를 눌러 회원가입을 완료하세요"
						+ "<a href='http://localhost/pj_hyr/emailChkAction.do?key="+key+"'> 가입완료하기 </a>"; // emailChkAction.do 컨트롤러에 추가
		
		Properties props = System.getProperties();
		
		// 정보를 담기 위한 객체 생성
		// SMTP 서버 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
			
		
		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String uname = username;
			String pwd = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(uname, pwd);
			}
		});
		
		session.setDebug(true);
		
		try {
			// try문 속 import시 javax.mail.~ 확인
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("")); // 발신자 이메일 주소를 set(aaa@mail.com 전부 다)
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자 set
			mimeMessage.setSubject(subject); // 제목
			mimeMessage.setContent(content,"text/html; charset=utf-8");
			Transport.send(mimeMessage);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
	}

	
	
	@Override
	public int selectKey(String key) {
		System.out.println(" DAO - selectKey ");
		
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.selectKey", key);
		System.out.println("selectKey : " + selectCnt);
		return selectCnt;
	}

	@Override
	public int updateGrade(String key) {
		System.out.println(" DAO - updateGrade ");
		
		int updateCnt = sqlSession.update("spring.mvc.pj_hyr.dao.CustomerDAO.updateGrade", key);
		System.out.println("updateGrade : " + updateCnt);
		return updateCnt;
	}
	
	
	
	// 목록
	@Override
	public List<NoticeDTO> noticeList(Map<String,Object> map) {
		System.out.println(" DAO - noticeList() ");
		
		List<NoticeDTO> noticeList = sqlSession.selectList("spring.mvc.pj_hyr.dao.CustomerDAO.noticeList", map);
		
		return noticeList;
	}

	// 글 총 갯수
	@Override
	public int noticeCnt() {
		System.out.println("DAO - noticeCnt()");
		
		CustomerDAO dao = sqlSession.getMapper(CustomerDAO.class);
		int total = dao.noticeCnt();
		return total;
	}

	// 조회수 증가
	@Override
	public void plusReadCnt_notice(int num) {
		System.out.println("DAO - plusReadCnt(int num) // 게시글 조회수 ++; ");
		
		sqlSession.update("spring.mvc.pj_hyr.dao.CustomerDAO.plusReadCnt_notice", num);
	}

	// 상세 페이지
	@Override
	public NoticeDTO getNoticeDetail(int num) {
		System.out.println("DAO - getNoticeDetail() // 상세페이지");		
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.getNoticeDetail", num);
	}


	@Override
	public List<OrderDTO> orderList(String sessionId) {
		System.out.println("DAO - orderList // customer 주문내역");
//		List<OrderDTO> orderList = null;
		return sqlSession.selectList("spring.mvc.pj_hyr.dao.CustomerDAO.orderList", sessionId);
	}

	// 확인하기★☆★☆★
	@Override
	public int orderCnt() {
		System.out.println("DAO - orderCnt()");
		
		return sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.orderCnt");
	}


	@Override
	public void refundReq(RefundDTO dto) {
		System.out.println("DAO - refundReq");
		
		sqlSession.insert("spring.mvc.pj_hyr.dao.CustomerDAO.refundReq", dto);
		
	}

	@Override
	public void orderExcept(Map<String, Object> map) {
		System.out.println("DAO - orderExcept");
		
		sqlSession.update("spring.mvc.pj_hyr.dao.CustomerDAO.orderExcept",map);
		
	}


	@Override
	public List<RefundDTO> refundList(String sessionId) {
		System.out.println("DAO - refundList // customer 환불내역");
		
		List<RefundDTO> refundList = sqlSession.selectList("spring.mvc.pj_hyr.dao.CustomerDAO.refundList",sessionId);
		return refundList;
	}




	@Override
	public int refundCnt() {
		System.out.println("DAO - refundCnt()");
		
		int total = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.refundCnt");
		return total;
	}


}
