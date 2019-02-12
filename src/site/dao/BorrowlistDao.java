package site.dao;

import java.util.List;
import java.util.Map;

import site.model.BorrowlistEntity;

public interface BorrowlistDao {
	public List<BorrowlistEntity> getBorrowlistByStuid(String id);
	public List<BorrowlistEntity> getBorrowlistHistoryByStuid(String id);
	public int getBorrowlistHistoryByStuidCount(String id);
	public List<BorrowlistEntity> getBorrowlistLostByStuid(String id);
	public int getBorrowlistLostByStuidCount(String id);
	public int addBorrowlist(Map map);
	public BorrowlistEntity getBorrowlist(String id);
	public int getBorrowlistOrderedCount(String id);
	public int updateBorrowlist(Map map);
	public int updateBorrowlistLost(String id);
}
