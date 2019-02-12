package site.dao;

import java.util.List;
import java.util.Map;

import site.model.BookEntity;
import site.model.ManageEntity;
import site.model.StudentEntity;

public interface ManageDao {
	public ManageEntity getManage(String id);
	public int verifyManage(Map map);
	public int checkManage(Map map);
	public int addManage(Map map);
	public int updateManage(Map map);
	public List<Map> queryManage();
	public int countManage();
	public void deleteManage(Map map);
	public List<StudentEntity> getStudents();
	public List<StudentEntity> getStudentsByNo(Map map);
	public int countStu();
	public int countStudentsByNo(Map map);
	public void deleteStu(Map map);
	public int addStu(Map map);
	public int checkStu(String id);
	public StudentEntity getStudent(String id);
	public int updateStu(Map map);
	
}
