package site.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.dao.*;
import site.model.*;
import site.util.DateUtil;

@Service("studentService")
public class StudentService {
	
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private BorrowlistDao borrowlistDao;
	@Autowired
	private AmercementDao amercementDao;
	@Autowired
	private OrderlistDao orderlistDao;
	@Autowired
	private BookDao bookDao;
	
	public StudentEntity getStudent(String studentno){
		StudentEntity r=studentDao.getStudent(studentno);
		return r;
	}
	
	public boolean doLostCard(String id){
		boolean result;
		
		int	r=studentDao.updatePermit(id);
			
	    if(r>0)
	    	result=true;
	    else
	    	result=false;
	
		return result;
	}
	
	public boolean verify(String studentno,String password){
		boolean result;
		Map paramMap=new HashMap();
		paramMap.put("studentNo", studentno);
		paramMap.put("password", password);
		int r=studentDao.verifyStudent(paramMap);
		if(r>0)
			result=true;
		else
			result=false;
		
		return result;
	}
	
	public boolean updateStuPwd(String studentno,String newpwd,String oldpwd){
		boolean result;
		
		Map paramMap=new HashMap();
		paramMap.put("studentNo", studentno);
		paramMap.put("password", oldpwd);
		int r=studentDao.verifyStudent(paramMap);
		
		if(r>0){
			paramMap=new HashMap();
			paramMap.put("studentNo", studentno);
			paramMap.put("password", newpwd);
			r=studentDao.updateStudentPwd(paramMap);
			
			if(r>0)
				result=true;
			else
				result=false;
		}
		else{
			result=false;
		}
		
		return result;
	}
	
	public Vector<Vector<String>> getPageContent(int page,int span,String key,String condition){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		paramMap.put("key", key);
		paramMap.put("condition", condition);
		
		String[] titles=new String[]{"BookNO","BookName","Author","Publish","BookIsbn",
				  "BuyTime","BookPrice","BookStatus"};
		
		List<Map> rl = 	studentDao.queryBooks(paramMap);								//搜索得到结果
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
	
	public int getSimpleBookCount(int span,String key,String condition){
		
		Map paramMap=new HashMap();
		paramMap.put("key", key);
		paramMap.put("condition", condition);
		int count=studentDao.querySimpleBookCount(paramMap);
		int result=count%span+1;
		return result;
	}
	
	
	public int getComplexBookCount(int span,String BookName,String Author,String Publish){
		
		Map paramMap=new HashMap();
		paramMap.put("BookName", BookName);
		paramMap.put("Author", Author);
		paramMap.put("Publish", Publish);
		int count=studentDao.queryComplexBookCount(paramMap);
		int result=count%span+1;
		return result;
	}
	
	public int addOrderList(String bookNO,String stdNo){
		Map paramMap=new HashMap();
		paramMap.put("bookNO", bookNO);
		paramMap.put("stdNo", stdNo);
		int r=studentDao.addOrderList(paramMap);
		return r;
	}
	
	
	public Vector<Vector<String>> getBorrowList(String id){
		
		List<BorrowlistEntity> list = borrowlistDao.getBorrowlistByStuid(id);
		Vector<Vector<String>> v=new Vector<Vector<String>>();
		for(int i=0;i<list.size();i++){
			BorrowlistEntity b = list.get(i);
			BookEntity k=b.getB();
			StudentEntity s=b.getS();
			Vector<String> vtemp = new Vector<String>();
			vtemp.add(k.getBookNo());
			vtemp.add(k.getBookName());
			vtemp.add(k.getAuthor());
			vtemp.add(k.getPublish());
			vtemp.add(b.getStartTime());
			vtemp.add(b.getEndTime());
			vtemp.add(b.getBorrowNo());
			v.add(vtemp);
		}
		for(int i=0;i<v.size();i++){
			Vector<String> vtemp = v.get(i);							//遍历取出每一条记录
			String end = vtemp.get(5);									//得到归还时间字符串表示
			Calendar cal = Calendar.getInstance();
			int year =  cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONDAY)+1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			String now = year+"-"+month+"-"+day;				
			if(DateUtil.getDay(now,end)<0){								
				String newEnd = "<font color='red'/>"+end+"</font>";				//将超期的书归还日期设置为红色字体
				vtemp.setElementAt(newEnd,5);
			}
		}
		return v;
		
	}
	
	
public Vector<Vector<String>> getBookSearchCom(int page,int span,String BookName,String Author,String Publish){
		
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//创建信息向量
		int start = (page-1)*span;										//得到起始记录条数
		int end = start+span;											//结束记录条数
		
		Map paramMap=new HashMap();
		paramMap.put("BookName", BookName);
		paramMap.put("Author", Author);
		paramMap.put("Publish", Publish);
		
		String[] titles=new String[]{"BookNO","BookName","Author","Publish","BookIsbn",
				  "BuyTime","BookPrice","BookStatus"};
		
		List<Map> rl = 	studentDao.queryBooksCom(paramMap);								//搜索得到结果
		System.out.println("rl.size()="+rl.size());
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

	public Vector<Vector<String>> getBorrowListHistory(String id){
	
	List<BorrowlistEntity> list = borrowlistDao.getBorrowlistHistoryByStuid(id);
	Vector<Vector<String>> v=new Vector<Vector<String>>();
	for(int i=0;i<list.size();i++){
		BorrowlistEntity b = list.get(i);
		BookEntity k=b.getB();
		StudentEntity s=b.getS();
		Vector<String> vtemp = new Vector<String>();
		vtemp.add(k.getBookNo());
		vtemp.add(k.getBookName());
		vtemp.add(k.getAuthor());
		vtemp.add(k.getPublish());
		vtemp.add(b.getStartTime());
		vtemp.add(b.getEndTime());
		vtemp.add(String.valueOf(b.getDeal()));
		v.add(vtemp);
	}
	
	return v;
	
}
	public int getBorrowListHistoryPage(String id,int span){
		int r=borrowlistDao.getBorrowlistHistoryByStuidCount(id);
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public Vector<Vector<String>> getOrderList(){
		
	List<OrderlistEntity> list = orderlistDao.getOrderlist();
	Vector<Vector<String>> v=new Vector<Vector<String>>();
	for(int i=0;i<list.size();i++){
		OrderlistEntity b = list.get(i);
		BookEntity k=b.getB();
		StudentEntity s=b.getS();
		Vector<String> vtemp = new Vector<String>();
		vtemp.add(s.getStudentno());
		vtemp.add(s.getClasss());
		vtemp.add(k.getBookName());
		vtemp.add(k.getAuthor());
		vtemp.add(k.getBookNo());
		vtemp.add(b.getEndTime());
		
		v.add(vtemp);
	}
	
	return v;
	
	}
	public int getOrderListPage(int span){
		int r=orderlistDao.getOrderlistCount();
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public Vector<Vector<String>> getOrderListByStuno(String id){
		
	List<OrderlistEntity> list = orderlistDao.getOrderlistByStuno(id);
	Vector<Vector<String>> v=new Vector<Vector<String>>();
	for(int i=0;i<list.size();i++){
		OrderlistEntity b = list.get(i);
		BookEntity k=b.getB();
		StudentEntity s=b.getS();
		Vector<String> vtemp = new Vector<String>();
		vtemp.add(s.getStudentno());
		vtemp.add(s.getClasss());
		vtemp.add(k.getBookName());
		vtemp.add(k.getAuthor());
		vtemp.add(k.getBookNo());
		vtemp.add(b.getEndTime());
		
		v.add(vtemp);
	}
	
	return v;
	
	}
	public int getOrderListByStunoPage(String id,int span){
		int r=orderlistDao.getOrderlistByStunoCount(id);
		r= r%span ==0 ? r/span:r/span+1;
		return r;
	}
	
	public Vector<Vector<String>> getBorrowListLost(String id){
		
		List<BorrowlistEntity> list = borrowlistDao.getBorrowlistLostByStuid(id);
		Vector<Vector<String>> v=new Vector<Vector<String>>();
		for(int i=0;i<list.size();i++){
			BorrowlistEntity b = list.get(i);
			BookEntity k=b.getB();
			StudentEntity s=b.getS();
			Vector<String> vtemp = new Vector<String>();
			vtemp.add(k.getBookNo());
			vtemp.add(k.getBookName());
			vtemp.add(k.getAuthor());
			vtemp.add(k.getPublish());
			vtemp.add(b.getStartTime());
			vtemp.add(b.getEndTime());
			vtemp.add(String.valueOf(b.getDeal()));
			v.add(vtemp);
		}
		
		return v;
		
	}
		public int getBorrowListLostPage(String id,int span){
			int r=borrowlistDao.getBorrowlistLostByStuidCount(id);
			r= r%span ==0 ? r/span:r/span+1;
			return r;
		}
		public Vector<Vector<String>> getAmercementList(String id){
			
			List<AmercementEntity> list = amercementDao.getAmercementListByStuid(id);
			Vector<Vector<String>> v=new Vector<Vector<String>>();
			for(int i=0;i<list.size();i++){
				
				AmercementEntity a = list.get(i);
				BorrowlistEntity b=a.getB();
				BookEntity k=b.getB();
				StudentEntity s=a.getS();
				Vector<String> vtemp = new Vector<String>();
				vtemp.add(a.getPayTime());
				vtemp.add(a.getDetail());
				vtemp.add(String.valueOf(a.getMulct()));
				vtemp.add(k.getBookName());
				v.add(vtemp);
			}
			
			return v;
			
		}
		public int getAmercementListPage(String id,int span){
			int r=amercementDao.getAmercementListByStuidCount(id);
			r= r%span ==0 ? r/span:r/span+1;
			return r;
		}
		
		public double getAmercementMoney(String id){
			double r=amercementDao.getAmercementSumByStuid(id);
			return r;
		}
		public Vector<Vector<String>> getAmercementListDebt(String id){
			
			List<AmercementEntity> list = amercementDao.getAmercementListDebtByStuid(id);
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
		
		public BorrowlistEntity getBorrowListByBno(String id){
			
			BorrowlistEntity b = borrowlistDao.getBorrowlist(id);
			return b;
			
		}
		
		public boolean getBorrowListOrdered(String id){
			
			boolean flag ;
			
			if(borrowlistDao.getBorrowlistOrderedCount(id)>0)
				flag=true;
			else
				flag=false;
			
			return flag;
			
		}
		public boolean updateBorrowlistConti(String id,String end){
			boolean result;
			
			Map paramMap=new HashMap();
			paramMap.put("id", id);
			paramMap.put("time", end);
			int r=borrowlistDao.updateBorrowlist(paramMap);
			
			
			if(r>0)
				result=true;
			else
				result=false;
			
			return result;
		}
		
		public int addAmercement(String BorrowNO,String StudentNO,String detail,String Mulct){
			Map paramMap=new HashMap();
			paramMap.put("BorrowNO", BorrowNO);
			paramMap.put("StudentNO", StudentNO);
			paramMap.put("Detail", detail);
			paramMap.put("Mulct", Mulct);
			int r=amercementDao.addAmercement(paramMap);
			return r;
		}
		
		public boolean updateBookStatus(String id){
			boolean result;
		
			int r=bookDao.updateBookStatusLost(id);
			
			
			if(r>0)
				result=true;
			else
				result=false;
			
			return result;
		}
		
		public boolean updateBorrowlistLost(String id){
			boolean result;
			

			int r=borrowlistDao.updateBorrowlistLost(id);
			
			
			if(r>0)
				result=true;
			else
				result=false;
			
			return result;
		}
}
		
