package spring.mvc.pj_hyr.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.mvc.pj_hyr.dto.UserVO;

// 로그인 성공시 작동
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// security-context.xml에서 매개변수 생성자 호출 시 sqlSession의 주소값을 매개변수로 전달	
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인 성공시 자동실행
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println(" UserLoginSuccessHandler -- onAuthenticationSuccess ");
		
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO : " + vo.getUsername());
		
		String msg = authentication.getName() + " 님 환영합니다. ";
		
		
		String authority = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.authorityCheck", authentication.getName());
		
			
		request.setAttribute("msg", msg); // ment
		request.setAttribute("authority", authority); // 권한
		
		
		int grade = 0;
		String viewPage = "";
		
		if(authority.equals("ROLE_USER")) {
			request.getSession().setAttribute("sessionId", authentication.getName()); 
			grade = 1;
			viewPage = "/main.do";
		}
		
		else if(authority.equals("ROLE_ADMIN")) {
			request.getSession().setAttribute("sessionAdmin", authentication.getName()); 
			grade = 1;
			viewPage = "/noticeList.bd";
		}
		
		else {
			grade = 0;
			viewPage = "/main.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
