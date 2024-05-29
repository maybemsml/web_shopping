package spring.mvc.pj_hyr.dto;

import java.sql.Date;

public class NoticeDTO {
	private int num; // 글번호
	private String category; // 카테고리
	private String title; // 글제목
	private String content; // 글내용
	private int readCnt; // 조회수
	private Date regDate; // 등록일
	
	
	// 디폴트 생성자
	public NoticeDTO() {}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getReadCnt() {
		return readCnt;
	}


	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "NoticeDTO [num=" + num + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", readCnt=" + readCnt + ", regDate=" + regDate + "]";
	}
	
	
	
}
