package site.model;

import java.io.Serializable;

public class BorrowlistEntity implements Serializable {
	private String borrowNo;
	private StudentEntity s;
	private BookEntity b;
	private String startTime;
	private String endTime;
	private int XuJie;
	private int deal;
	public String getBorrowNo() {
		return borrowNo;
	}
	public void setBorrowNo(String borrowNo) {
		this.borrowNo = borrowNo;
	}
	public StudentEntity getS() {
		return s;
	}
	public void setS(StudentEntity s) {
		this.s = s;
	}
	public BookEntity getB() {
		return b;
	}
	public void setB(BookEntity b) {
		this.b = b;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getXuJie() {
		return XuJie;
	}
	public void setXuJie(int xuJie) {
		XuJie = xuJie;
	}
	public int getDeal() {
		return deal;
	}
	public void setDeal(int deal) {
		this.deal = deal;
	}
	
	
	
}
