package site.model;

public class AmercementEntity {
	
	private String amerceNO;
	private BorrowlistEntity b;
	private StudentEntity s;
	private String detail;
	private double mulct;
	private int pay;
	private String payTime;
	public String getAmerceNO() {
		return amerceNO;
	}
	public void setAmerceNO(String amerceNO) {
		this.amerceNO = amerceNO;
	}
	public BorrowlistEntity getB() {
		return b;
	}
	public void setB(BorrowlistEntity b) {
		this.b = b;
	}
	public StudentEntity getS() {
		return s;
	}
	public void setS(StudentEntity s) {
		this.s = s;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public double getMulct() {
		return mulct;
	}
	public void setMulct(double mulct) {
		this.mulct = mulct;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	
}
