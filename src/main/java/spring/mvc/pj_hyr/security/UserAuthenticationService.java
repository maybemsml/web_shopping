package spring.mvc.pj_hyr.security;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import spring.mvc.pj_hyr.dto.CustomerDTO;
import spring.mvc.pj_hyr.dto.UserVO;

/*
  
  	제일 먼저 진입
 	로그인 인증처리 클래스 : 비밀번호 인증, 로그인 성공/실패/불가 여부 판단
	userService는 login-processing-url="/loginAction.do"에 의해 자동호출, 그러므로 loginAction.do 주석처리
 
 */

public class UserAuthenticationService implements UserDetailsService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// security-context.xml에서 매개변수 생성자 호출 시 sqlSession의 주소값을 매개변수로 전달
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
   /* 핵심코드
    * 로그인 인증을 처리하는 메서드
    * 1) 매개변수 username을 id로 수정
    * 2) 매개변수로 전달된 아이디와 일치하는 레코드를 읽어온다.
    * 3) 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교처리
    * 4) 정보가 없으면 예외처리를 발생시키고, 있으면 해당정보를 dto로 리턴한다.
    * 5) 로그인 성공이면 UserLoginSeccessHandler로 이동
    *    로그인 실패이면 UserLoginFailureHandler로 이동
    *    권한이 없으면 403에러, UserDeniedHandler로 이동
    */

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		CustomerDTO dto = sqlSession.selectOne("spring.mvc.pj_hyr.dao.CustomerDAO.selectCustomer", id);
		System.out.println(id);
		System.out.println("security 로그인 체크 : " + dto + " id : " + id);
		
		// 로그인 인증 실패시 인위적으로 예외 생성(강제종료 같은 error 방지)
		if(dto==null) throw new UsernameNotFoundException(id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(dto.getAuthority())); // Default ROLE_USER => customer
		
		return new UserVO(dto.getCust_id(),dto.getPassword(),dto.getEnabled().equals("1"), 
				true, true, true, authority);
	
	}

}
