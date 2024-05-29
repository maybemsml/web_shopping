package spring.mvc.pj_hyr.dto;

public class CartDTO {
	
	private int cartNo;
	private int pdNo;
	private int quantity;
	private String cust_id;
	private String pdName; 		// 상품명
	private String pdBrand; 	// 브랜드
	private String pdImg;		// 상품이미지
	private int price;		// 가격
	private String pdCategory;
	
	public CartDTO() {}

	@Override
	public String toString() {
		return "CartDTO [cartNo=" + cartNo + ", pdNo=" + pdNo + ", quantity=" + quantity + ", cust_id=" + cust_id
				+ ", pdName=" + pdName + ", pdBrand=" + pdBrand + ", pdImg=" + pdImg + ", price=" + price
				+ ", pdCategory=" + pdCategory + "]";
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPdCategory() {
		return pdCategory;
	}

	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}

	public CartDTO(int cartNo, int pdNo, int quantity, String cust_id, String pdName, String pdBrand, String pdImg,
			int price, String pdCategory) {
		super();
		this.cartNo = cartNo;
		this.pdNo = pdNo;
		this.quantity = quantity;
		this.cust_id = cust_id;
		this.pdName = pdName;
		this.pdBrand = pdBrand;
		this.pdImg = pdImg;
		this.price = price;
		this.pdCategory = pdCategory;
	}

	
	
}
