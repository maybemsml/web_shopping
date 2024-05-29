package spring.mvc.pj_hyr.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

// 로그인 실패시 작동
public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println(" UserLoginFailureHandler - onAuthenticationFailure ");
		
		String strId = request.getParameter("cust_id");
		String strPassword = request.getParameter("password");
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.idCheck",strId);
		
		
		if(selectCnt != 0) {
			// 암호화된 비밀번호 가져오기(회원가입 시점에 암호화)
			String encryptPassword  = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.passwordCheck",strId);
			System.out.println("화면에서 입력받은 pw : " + strPassword);
			System.out.println("암호화된 pw : " + encryptPassword);
			
			// 입력한 비밀번호와 가입된 비밀번호(암호화된 비밀번호) 일치 여부 판별
			if(passwordEncoder.matches(strPassword, encryptPassword)) {
				System.out.println("비밀번호 일치 시 이메일 인증");
				request.setAttribute("msg", "이메일을 인증하세용");
			}
			else {
				System.out.println("비밀번호 불일치");
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			}
			
		} else {
			System.out.println("아이디 불일치");
			request.setAttribute("msg", "아이디가 일치하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/login/login.jsp");
		dispatcher.forward(request, response);
	}
	
}
