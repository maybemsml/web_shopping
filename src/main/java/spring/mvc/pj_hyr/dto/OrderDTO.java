package spring.mvc.pj_hyr.dto;

import java.sql.Date;

public class OrderDTO {
	
	
	private int odNo; // 주문번호
	private int pdNo; // 상품번호
	private String cust_id; // 고객id
	private String pdCategory; // 카테고리
	private String pdBrand; // 브랜드
	private String pdName; // 상품명
	private String pdImg;
	private int price; // 가격
	private int quantity; // 수량
	private Date odDate;
	private String odStatus; // 주문진행상태
	
	public OrderDTO(){
		
	}

	public OrderDTO(int odNo, int pdNo, String cust_id, String pdCategory, String pdBrand, String pdName, String pdImg,
			int price, int quantity, Date odDate, String odStatus) {
		super();
		this.odNo = odNo;
		this.pdNo = pdNo;
		this.cust_id = cust_id;
		this.pdCategory = pdCategory;
		this.pdBrand = pdBrand;
		this.pdName = pdName;
		this.pdImg = pdImg;
		this.price = price;
		this.quantity = quantity;
		this.odDate = odDate;
		this.odStatus = odStatus;
	}

	public int getOdNo() {
		return odNo;
	}

	public void setOdNo(int odNo) {
		this.odNo = odNo;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getPdCategory() {
		return pdCategory;
	}

	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}

	public String getPdBrand() {
		return pdBrand;
	}

	public void setPdBrand(String pdBrand) {
		this.pdBrand = pdBrand;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public String getPdImg() {
		return pdImg;
	}

	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getOdDate() {
		return odDate;
	}

	public void setOdDate(Date odDate) {
		this.odDate = odDate;
	}

	public String getOdStatus() {
		return odStatus;
	}

	public void setOdStatus(String odStatus) {
		this.odStatus = odStatus;
	}

	@Override
	public String toString() {
		return "OrderDTO [odNo=" + odNo + ", pdNo=" + pdNo + ", cust_id=" + cust_id + ", pdCategory=" + pdCategory
				+ ", pdBrand=" + pdBrand + ", pdName=" + pdName + ", pdImg=" + pdImg + ", price=" + price
				+ ", quantity=" + quantity + ", odDate=" + odDate + ", odStatus=" + odStatus + "]";
	}

	
	
	
}
