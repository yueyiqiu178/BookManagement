package site.dao;

import java.util.List;
import java.util.Map;

import site.model.BookEntity;

public interface BookDao {
	public BookEntity getBook(String no);
	public int checkBook(Map map);
	public int addBook(Map map);
	public List<BookEntity> queryBook();
	public int countBook();
	public int updateBook(Map map);
	public List<BookEntity> queryBooksByCondition(Map map);
	public int queryBooksByConditionCount(Map map);
	public void deleteBook(Map map);
	public int updateBookStatus(String id);
	public int updateBookStatusLost(String id);
}
