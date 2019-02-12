package site.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.dao.AmercementDao;
import site.dao.BookDao;
import site.dao.BorrowlistDao;
import site.dao.ManageDao;
import site.dao.OrderlistDao;
import site.model.AmercementEntity;
import site.model.BookEntity;
import site.model.BorrowlistEntity;
import site.model.ManageEntity;
import site.model.OrderlistEntity;
import site.model.StudentEntity;
import site.util.DateUtil;

@Service("manageService")
public class ManageService {
	
	@Autowired
	private ManageDao manageDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private OrderlistDao orderlistDao;
	@Autowired
	private BorrowlistDao borrowlistDao;
	@Autowired
	private AmercementDao amercementDao;
	
	public ManageEntity getManage(String id){
		ManageEntity r=manageDao.getManage(id);
		return r;
	}
	
	public boolean verify(String id,String pwd){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		paramMap.put("pwd", pwd);
		int r=manageDao.verifyManage(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public boolean check(String id){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		
		int r=manageDao.checkManage(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public boolean checkBook(String id){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		
		int r=bookDao.checkBook(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	
	public boolean updateManage(String id,String pwd){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		paramMap.put("pwd", pwd);
		
		int r=manageDao.updateManage(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public int addManage(String id,String pwd){
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		paramMap.put("pwd", pwd);
		int r=manageDao.addManage(paramMap);
		return r;
	}
	
	public int addBook(String bNO,String bName,String author,String publish,String isbn,String now,String price,int status){
		Map paramMap=new HashMap();
		paramMap.put("bNO", bNO);
		paramMap.put("bName", bName);
		paramMap.put("author", author);
		paramMap.put("publish", publish);
		paramMap.put("isbn", isbn);
		paramMap.put("now", now);
		paramMap.put("price", price);
		paramMap.put("status", status);
		int r=bookDao.addBook(paramMap);
		return r;
	}
	
	public Vector<Vector<String>> getPageContent(int page,int span){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		
		String[] titles=new String[]{"ManageID","ManageLevel"};
		
		List<Map> rl = manageDao.queryManage();									//搜索得到结果
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								//遍历查询结果
				Map map=(Map)rl.get(i);									//结果List中每一行为一个LinkedHashMap
				Set set=map.keySet();									//Map的键值为各个列的列名
				Vector<String> vtemp = new Vector<String>();			//创建临时信息向量				

				for(String o:titles){
					String info = map.get(o).toString();				//对取出的信息进行转码
					vtemp.add(info);			
				}
				
				vlist.add(vtemp);										//将每条记录添加进返回向量			
			}
		}		
		return vlist;
		
	}
	
	public Vector<Vector<String>> getPageContentBook(int page,int span){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		
		List<BookEntity> rl = bookDao.queryBook();									
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								
				BookEntity b=(BookEntity)rl.get(i);									
				Vector<String> vtemp = new Vector<String>();						
				vtemp.add(b.getBookNo());
				vtemp.add(b.getBookName());
				vtemp.add(b.getAuthor());
				vtemp.add(b.getPublish());
				vtemp.add(b.getBookIsbn());
				vtemp.add(String.valueOf(b.getBookPrice()));
				vtemp.add(String.valueOf(b.getBookStatus()));
				vlist.add(vtemp);												
			}
		}		
		return vlist;
		
	}
	
	public int pageManage(int span){
		int r=manageDao.countManage();
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public int pageBook(int span){
		int r=bookDao.countBook();
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public void delManage(String id){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		
		manageDao.deleteManage(paramMap);
		
	}
	
	public Vector<Vector<String>> getStuContent(int page,int span){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		
		List<StudentEntity> rl = manageDao.getStudents();								//搜索得到结果
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								//遍历查询结果
				StudentEntity s=(StudentEntity)rl.get(i);									//结果List中每一行为一个LinkedHashMap
											
				Vector<String> vtemp = new Vector<String>();			//创建临时信息向量				

							
				vtemp.add(s.getStudentno());
				vtemp.add(s.getPassword());
				vtemp.add(s.getName());
				vtemp.add(String.valueOf(s.getAge()));
				vtemp.add(s.getGender());
				vtemp.add(s.getClasss());
				vtemp.add(s.getDepartment());
				vtemp.add(String.valueOf(s.getPermit()));
				
				
				vlist.add(vtemp);										//将每条记录添加进返回向量			
			}
		}
		
		return vlist;
		
	}
	
	public Vector<Vector<String>> getStuContentById(int page,int span,String id){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		List<StudentEntity> rl = manageDao.getStudentsByNo(paramMap);								//搜索得到结果
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								//遍历查询结果
				StudentEntity s=(StudentEntity)rl.get(i);									//结果List中每一行为一个LinkedHashMap
											
				Vector<String> vtemp = new Vector<String>();			//创建临时信息向量				

							
				vtemp.add(s.getStudentno());
				vtemp.add(s.getPassword());
				vtemp.add(s.getName());
				vtemp.add(String.valueOf(s.getAge()));
				vtemp.add(s.getGender());
				vtemp.add(s.getClasss());
				vtemp.add(s.getDepartment());
				vtemp.add(String.valueOf(s.getPermit()));
				
				
				vlist.add(vtemp);										//将每条记录添加进返回向量			
			}
		}
		
		return vlist;
		
	}
	
	public int pageStu(int span){
		int r=manageDao.countStu();
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public int pageStuByNo(int span,String id){
		
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		int r=manageDao.countStudentsByNo(paramMap);
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	
	public void delStudent(String id){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		
		manageDao.deleteStu(paramMap);
		
	}
	
	public int addStu(String id,String pwd,String name,String age,String gender,String classs,String dept){
		Map paramMap=new HashMap();
		//(#{id},#{pwd},#{name},#{age},#{gender},#{class},#{dept},#{permit})
		paramMap.put("id", id);
		paramMap.put("pwd", pwd);
		paramMap.put("name", name);
		paramMap.put("age", age);
		paramMap.put("gender", gender.equals("1") ? "男":"女");
		paramMap.put("class", classs);
		paramMap.put("dept", dept);
		paramMap.put("permit", 1);

		int r=manageDao.addStu(paramMap);
		return r;
	}
	
	public boolean checkStu(String id){
		
		if(manageDao.checkStu(id)>0)
			return true;
		else
			return false;
	}
	
	public StudentEntity getStudent(String id){
		StudentEntity s=manageDao.getStudent(id);
		return s;
	}
	
	public BookEntity getBook(String id){
		BookEntity b=bookDao.getBook(id);
		return b;
	}
	
	
	public boolean updateStudent(String id,String name,String age,String gender,String classs,String dept,String permit){
		boolean result;
		
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		paramMap.put("name", name);
		paramMap.put("age", age);
		paramMap.put("gender", gender.equals("1") ? "男":"女");
		paramMap.put("class", classs);
		paramMap.put("dept", dept);
		paramMap.put("permit", permit);
		
		int r=manageDao.updateStu(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public boolean updateBook(String newNO,String bName,String author,String publish,String isbn,String price){
		boolean result;

		Map paramMap=new HashMap();
		paramMap.put("newNO", newNO);
		paramMap.put("bName", bName);
		paramMap.put("author", author);
		paramMap.put("publish", publish);
		paramMap.put("isbn", isbn);
		paramMap.put("price", price);
		
		int r=bookDao.updateBook(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	
	public Vector<Vector<String>> getPageContentSearchBook(int page,int span,String key,String condition){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	
		int start = (page-1)*span;										
		int end = start+span;											
		
		Map paramMap=new HashMap();
		paramMap.put("key", key);
		paramMap.put("condition", condition);
		List<BookEntity> rl = bookDao.queryBooksByCondition(paramMap);
		
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								
				BookEntity b=(BookEntity)rl.get(i);									
				Vector<String> vtemp = new Vector<String>();						
				vtemp.add(b.getBookNo());
				vtemp.add(b.getBookName());
				vtemp.add(b.getAuthor());
				vtemp.add(b.getPublish());
				vtemp.add(b.getBookIsbn());
				vtemp.add(String.valueOf(b.getBookPrice()));
				vtemp.add(String.valueOf(b.getBookStatus()));
				vlist.add(vtemp);												
			}
		}		
		return vlist;
		
	}
	
	public int pageSearchBook(int span,String key,String condition){
		Map paramMap=new HashMap();
		paramMap.put("key", key);
		paramMap.put("condition", condition);
		int r=bookDao.queryBooksByConditionCount(paramMap);
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public void delBook(String id){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("id", id);
		
		bookDao.deleteBook(paramMap);
		
	}
	
	
	public boolean canBorrow(String bno,String stdno){
		boolean flag=false;
		List<OrderlistEntity> list = orderlistDao.getOrderlistByBno(bno);
		Calendar cal = Calendar.getInstance();
		String now = DateUtil.getDateString(cal);
		if(list.size()!=0){				
			for(int i=0;i<list.size();i++){								
				OrderlistEntity b=(OrderlistEntity)list.get(i);									
				String endTime = b.getEndTime();
				int day = DateUtil.getDay(now,endTime);
				if(day>0){
					String ostuno=b.getS().getStudentno();
					if(ostuno.trim().equals(stdno.trim())){
						flag=true;
					}
				}
			}
		}
		else{
			flag=true;
		}
		
		return flag;
		
	}
	
	public int addBorrowlist(String stuno,String bno,String start,String end){
		Map paramMap=new HashMap();
		paramMap.put("stuno", stuno);
		paramMap.put("bno", bno);
		paramMap.put("start", start);
		paramMap.put("end", end);

		int r=borrowlistDao.addBorrowlist(paramMap);
		return r;
	}
	
	public boolean updateBookStatus(String id){
		boolean result;
		
		int r=bookDao.updateBookStatus(id);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public Vector<Vector<String>> getAmercementListDebtByStuno(String stdno){
		
		List<AmercementEntity> list = amercementDao.getAmercementListDebtByStuid(stdno);
		Vector<Vector<String>> v=new Vector<Vector<String>>();
		for(int i=0;i<list.size();i++){
			
			AmercementEntity a = list.get(i);
			BorrowlistEntity b=a.getB();
			BookEntity k=b.getB();
			StudentEntity s=a.getS();
			Vector<String> vtemp = new Vector<String>();
			vtemp.add(k.getBookName());
			vtemp.add(a.getDetail());
			vtemp.add(b.getStartTime());
			vtemp.add(b.getEndTime());
			vtemp.add(String.valueOf(a.getMulct()));
			vtemp.add(a.getAmerceNO());
			v.add(vtemp);
		}
		
		return v;
		
	}
	public Vector<Vector<String>> getBorrowListDebt(String id){
		
		List<BorrowlistEntity> list = borrowlistDao.getBorrowlistByStuid(id);
		Vector<Vector<String>> v=new Vector<Vector<String>>();
		for(int i=0;i<list.size();i++){
			
			BorrowlistEntity b = list.get(i);
			BookEntity k=b.getB();
			
			Vector<String> vtemp = new Vector<String>();
			vtemp.add(k.getBookName());
			vtemp.add("超期罰款");
			vtemp.add(b.getStartTime());
			vtemp.add(b.getEndTime());
			
			String end=b.getEndTime();
			String now=DateUtil.getDateString(Calendar.getInstance());
			int exceed=DateUtil.getDay(end, now);
			if(exceed>0){
				vtemp.add(String.valueOf(exceed*10));
				v.add(vtemp);
			}
			
		}
		
		return v;
		
	}
	
	public AmercementEntity getAmercement(String id){
		
		AmercementEntity a = amercementDao.getAmercementByAmerceid(id);
		
		return a;
		
	}
	
	public boolean updateAmercement(String id,String time){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("time", time);
		paramMap.put("id", id);
		
		int r = amercementDao.updateAmercement(paramMap);
		
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
}
