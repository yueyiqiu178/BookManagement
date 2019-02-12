package site.dao;

import java.util.*;

import site.model.StudentEntity;

public interface StudentDao {
	public StudentEntity getStudent(String studentNo);
	public int verifyStudent(Map map);
	public int updateStudentPwd(Map map);
	public int updatePermit(String id);
	public List<Map> queryBooks(Map map);
	public int querySimpleBookCount(Map maps);
	public int addOrderList(Map map);
	public List<Map> queryBooksCom(Map map);
	public int queryComplexBookCount(Map maps);
}
