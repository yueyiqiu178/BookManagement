package site.model;

public class OrderlistEntity {
	private String orderNo;
	private StudentEntity s;
	private BookEntity b;
	private String endTime;
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
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
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	
}
