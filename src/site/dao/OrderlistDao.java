package site.dao;

import java.util.List;

import site.model.*;

public interface OrderlistDao {
	public List<OrderlistEntity> getOrderlist();
	public int getOrderlistCount();
	public List<OrderlistEntity> getOrderlistByStuno(String id);
	public int getOrderlistByStunoCount(String id);
	public List<OrderlistEntity> getOrderlistByBno(String id);
}
