package spring.mvc.pj_hyr.dto;


public class TotalDTO {
	
	private String month; // 월
	private int monthlysales; // 판매액
	private int monthlysoldCnt; // 판매건수
	
	public TotalDTO() {}

	public TotalDTO(String month, int monthlysales, int monthlysoldCnt) {
		super();
		this.month = month;
		this.monthlysales = monthlysales;
		this.monthlysoldCnt = monthlysoldCnt;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getMonthlysales() {
		return monthlysales;
	}

	public void setMonthlysales(int monthlysales) {
		this.monthlysales = monthlysales;
	}

	public int getMonthlysoldCnt() {
		return monthlysoldCnt;
	}

	public void setMonthlysoldCnt(int monthlysoldCnt) {
		this.monthlysoldCnt = monthlysoldCnt;
	}

	@Override
	public String toString() {
		return "TotalDTO [month=" + month + ", monthlysales=" + monthlysales + ", monthlysoldCnt=" + monthlysoldCnt
				+ "]";
	}
	

	
}
