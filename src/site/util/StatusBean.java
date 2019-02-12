package site.util;

public class StatusBean {
	private int curPage = 1;			//记录当前页默认为1
	private int total =1;				//总共多少页默认为1
	private int span = 5;				//每页显示记录条数
	private String money;				//记录已缴罚款
	private String sql;
    public StatusBean() {}				//无参构造器
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getSpan() {
		return span;
	}
	public void setSpan(int span) {
		this.span = span;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
    
}
