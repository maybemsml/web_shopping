package spring.mvc.pj_hyr.dto;

import java.sql.Date;

public class ProductDTO {

	/*
	  	SQL 컬럼명 pd tbl
	  
	    pdNo    NUMBER(7) PRIMARY KEY,          -- 상품번호
	    pdName  VARCHAR2(50) NOT NULL UNIQUE,   -- 상품명
	    pdBrand VARCHAR2(50) NOT NULL,          -- 브랜드
	    pdImg   VARCHAR2(100) NOT NULL,         -- 상품이미지
	    pdCategory  VARCHAR2(50) NOT NULL,      -- 상품카테고리
	    pdContent   CLOB,                       -- 상품설명
	    pdPrice NUMBER(9),                      -- 상품가격
	    pdQuantity  NUMBER(9) NOT NULL,         -- 상품수량
	    pdStatus    VARCHAR2(20) NOT NULL,      -- 상품상태코드
	    pdIndate    DATE    DEFAULT   sysdate   -- 상품 등록일
	*/
	
	private int pdNo; 			// 상품번호
	private String pdName; 		// 상품명
	private String pdBrand; 	// 브랜드
	private String pdImg;		// 상품이미지
	private String pdCategory;	// 상품카테고리
	private String pdContent;	// 상품설명
	private int pdPrice;		// 가격
	private int pdQuantity;		// 수량
	private String pdStatus;	// 상태코드
	private Date pdIndate;// 등록일
	
	
	public ProductDTO() {}


	public int getPdNo() {
		return pdNo;
	}


	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
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


	public String getPdImg() {
		return pdImg;
	}


	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}


	public String getPdCategory() {
		return pdCategory;
	}


	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}


	public String getPdContent() {
		return pdContent;
	}


	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}


	public int getPdPrice() {
		return pdPrice;
	}


	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}


	public int getPdQuantity() {
		return pdQuantity;
	}


	public void setPdQuantity(int pdQuantity) {
		this.pdQuantity = pdQuantity;
	}


	public String getPdStatus() {
		return pdStatus;
	}


	public void setPdStatus(String pdStatus) {
		this.pdStatus = pdStatus;
	}


	public Date getPdIndate() {
		return pdIndate;
	}


	public void setPdIndate(Date pdIndate) {
		this.pdIndate = pdIndate;
	}


	@Override
	public String toString() {
		return "ProductDTO [pdNo=" + pdNo + ", pdName=" + pdName + ", pdBrand=" + pdBrand + ", pdImg=" + pdImg
				+ ", pdCategory=" + pdCategory + ", pdContent=" + pdContent + ", pdPrice=" + pdPrice + ", pdQuantity="
				+ pdQuantity + ", pdStatus=" + pdStatus + ", pdIndate=" + pdIndate + "]";
	}
	
	
	
	
}
