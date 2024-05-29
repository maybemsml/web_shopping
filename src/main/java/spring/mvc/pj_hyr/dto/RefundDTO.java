package spring.mvc.pj_hyr.dto;

import java.sql.Date;

// ☆
public class RefundDTO {
	
	
	private int rfNo;
	private int odNo;
	private int pdNo;
	private int quantity;
	private int price;
	private String cust_id;
	private String rfStatus;
	private String pdName;
	private String pdBrand;
	private String pdCategory;
	private String pdImg;
	private Date reqDate;

	
	public RefundDTO() {}


	public RefundDTO(int rfNo, int odNo, int pdNo, int quantity, int price, String cust_id, String rfStatus,
			String pdName, String pdBrand, String pdCategory, String pdImg, Date reqDate) {
		super();
		this.rfNo = rfNo;
		this.odNo = odNo;
		this.pdNo = pdNo;
		this.quantity = quantity;
		this.price = price;
		this.cust_id = cust_id;
		this.rfStatus = rfStatus;
		this.pdName = pdName;
		this.pdBrand = pdBrand;
		this.pdCategory = pdCategory;
		this.pdImg = pdImg;
		this.reqDate = reqDate;
	}


	public int getRfNo() {
		return rfNo;
	}


	public void setRfNo(int rfNo) {
		this.rfNo = rfNo;
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


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getCust_id() {
		return cust_id;
	}


	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}


	public String getRfStatus() {
		return rfStatus;
	}


	public void setRfStatus(String rfStatus) {
		this.rfStatus = rfStatus;
	}


	public String getPdName() {
		return pdName;
	}


	public void setPdName(String pdName) {
		this.pdName = pdName;
	}


	public String getPdBrand() {
		return pdBrand;
	}


	public void setPdBrand(String pdBrand) {
		this.pdBrand = pdBrand;
	}


	public String getPdCategory() {
		return pdCategory;
	}


	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}


	public String getPdImg() {
		return pdImg;
	}


	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}


	public Date getReqDate() {
		return reqDate;
	}


	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}


	@Override
	public String toString() {
		return "RefundDTO [rfNo=" + rfNo + ", odNo=" + odNo + ", pdNo=" + pdNo + ", quantity=" + quantity + ", price="
				+ price + ", cust_id=" + cust_id + ", rfStatus=" + rfStatus + ", pdName=" + pdName + ", pdBrand="
				+ pdBrand + ", pdCategory=" + pdCategory + ", pdImg=" + pdImg + ", reqDate=" + reqDate + "]";
	}
	

}
