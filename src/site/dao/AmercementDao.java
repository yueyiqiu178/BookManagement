package site.dao;

import java.util.List;
import java.util.Map;

import site.model.AmercementEntity;
import site.model.BorrowlistEntity;

public interface AmercementDao {
	public List<AmercementEntity> getAmercementListByStuid(String id);
	public int getAmercementListByStuidCount(String id);
	public double getAmercementSumByStuid(String id);
	public List<AmercementEntity> getAmercementListDebtByStuid(String id);
	public int getAmercementListDebtByStuidCount(String id);
	public AmercementEntity getAmercementByAmerceid(String id);
	public int updateAmercement(Map map);
	public int addAmercement(Map map);
}
