package spring.mvc.pj_hyr.dto;

import java.sql.*;

public class CustomerDTO {
	
	// 멤버변수
	private String cust_id; // 아이디
	private String password; // 비밀번호
	private String username; // 이름
	private Date birthday; // 생년월일
	private String address; // 주소
	private String hp; // 전화번호
	private String email; // 이메일
	private String gender; // 성별
	private Timestamp regDate; // 등록일
	
	private String key; // 회원가입시 이메일 key 추가
	private String authority; // 권한 : ROLE_USER/ADMIN
	private String enabled; // 계정사용 가능여부(1:사용가능, 0:사용불가)	
	
	// 디폴트 생성자
	public CustomerDTO() {}

	public CustomerDTO(String cust_id, String password, String username, Date birthday, String address, String hp,
			String email, String gender, Timestamp regDate, String key, String authority, String enabled) {
		super();
		this.cust_id = cust_id;
		this.password = password;
		this.username = username;
		this.birthday = birthday;
		this.address = address;
		this.hp = hp;
		this.email = email;
		this.gender = gender;
		this.regDate = regDate;
		this.key = key;
		this.authority = authority;
		this.enabled = enabled;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "CustomerDTO [cust_id=" + cust_id + ", password=" + password + ", username=" + username + ", birthday="
				+ birthday + ", address=" + address + ", hp=" + hp + ", email=" + email + ", gender=" + gender
				+ ", regDate=" + regDate + ", key=" + key + ", authority=" + authority + ", enabled=" + enabled + "]";
	}
	
	
}
