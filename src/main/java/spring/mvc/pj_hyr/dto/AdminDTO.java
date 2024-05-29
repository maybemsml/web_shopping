package spring.mvc.pj_hyr.dto;

public class AdminDTO {
	
	private String adminId; // 관리자 id
	private String adminPw; // 관리자 pw
	private String name; // 관리자 이름
	private String dept; // 관리부서
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPw=" + adminPw + ", name=" + name + ", dept=" + dept + "]";
	}
	
	
	

}
