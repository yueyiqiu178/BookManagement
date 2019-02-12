package site.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import site.model.BorrowlistEntity;
import site.model.StudentEntity;
import site.service.StudentService;
import site.util.DateUtil;
import site.util.StatusBean;


@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public ModelAndView doLogin(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		String stuNO = request.getParameter("uname").trim();			//得到登陆用户名
		String pwd = request.getParameter("pwd").trim();	
		HttpSession session=request.getSession();
		String message="";
		
		if((studentService.verify(stuNO,pwd))){
			StudentEntity std=studentService.getStudent(stuNO);							
									
			session.setAttribute("stuNO",stuNO);					//将学号放进session
			session.setAttribute("stuName",std.getName());			//将学生姓名放进session		
		}
		else{
			message = "非法的用戶名和密碼，請核對後重新登錄。";	 //登陆失败消息
			request.setAttribute("message", message);					//设置消息						
		}
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/login");
		view.addObject("message", message);
		return view;
		
	}
	
	
	@RequestMapping(value="/stuinfo",method = RequestMethod.GET)
	public ModelAndView doStuInfo(HttpServletRequest request,  
            HttpServletResponse response,Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		if(stdno==null){
			message="您還沒有登錄，請先登陸再查看。";
			view.setViewName("/login");
			view.addObject("message", message);
		}
		else{
			std=studentService.getStudent(stdno);
			view.addObject("student", std);
			view.setViewName("/stuInfo");
		}
		
		return view;
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public ModelAndView doLogout(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession(true);
		
		session.invalidate();							
		
		System.out.println("sessionout");
		
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/login.jsp");
		
		return view;
	}
	
	@RequestMapping(value="/changepassword",method = RequestMethod.POST)
	public ModelAndView doDelSession(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "oldPwd", required = false) String oldPwd,
            @RequestParam(value = "newPwd", required = false) String newPwd,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		String message="";
		StudentEntity std=null;
		
		System.out.println("oldPwd="+oldPwd);
		System.out.println("newPwd="+newPwd);
		
		std=studentService.getStudent(stdno);
		boolean flag = this.studentService.updateStuPwd(stdno, newPwd,oldPwd);		
		
		
		if(flag==true){												
			message = "密碼修改成功，下次請用新密碼登陸。";					
		}
		else{														
			message = "舊密碼輸入錯誤，請核對後重新修改。";			
		}
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/stuInfo");
		view.addObject("message", message);
		view.addObject("student", std);
		return view;
	}
	
	
	@RequestMapping(value="/borrowbook",method = RequestMethod.GET)
	public ModelAndView doBorrowBook(HttpServletRequest request,  
            HttpServletResponse response,Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		if(stdno==null){
			message="您還沒有登錄，請先登陸再查看。";
			view.setViewName("/login");
			view.addObject("message", message);
		}
		else{
			Vector<Vector<String>> v = studentService.getBorrowList(stdno);
			view.addObject("v", v);
			view.setViewName("/current_book");
		}
		
		return view;
	}
	
	
	@RequestMapping(value="/querybooksimple",method = RequestMethod.POST)
	public ModelAndView doQueryBookSimple(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "condition", required = false) String condition,
            Model model){
		System.out.println("key="+key);
		System.out.println("condition="+condition);
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		Vector<Vector<String>> v=studentService.getPageContent(page, span, key, condition);
		System.out.println("v.size()="+v.size());
		
		int total=studentService.getSimpleBookCount(span, key, condition);
		status.setTotal(total);
		status.setCurPage(page);
		session.setAttribute("status", status);
		ModelAndView view = new ModelAndView();
		view.addObject("v", v);
		view.setViewName("/query_book_result");
		
		
		return view;
	}
	
	@RequestMapping(value="/querybookcomplex",method = RequestMethod.POST)
	public ModelAndView doQueryBookComplex(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "BookName", required = false) String BookName,
            @RequestParam(value = "Author", required = false) String Author,
            @RequestParam(value = "Publish", required = false) String Publish,
            Model model){
		
		try {
			BookName = new String(BookName.getBytes("ISO-8859-1"),"UTF-8");
			Author = new String(Author.getBytes("ISO-8859-1"),"UTF-8");
			Publish = new String(Publish.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		Vector<Vector<String>> v=studentService.getBookSearchCom(page, span, BookName, Author,Publish);
		System.out.println("v.size()="+v.size());
		
		int total=studentService.getComplexBookCount(span, BookName, Author, Publish);
		status.setTotal(total);
		status.setCurPage(page);
		session.setAttribute("status", status);
		ModelAndView view = new ModelAndView();
		view.addObject("v", v);
		view.setViewName("/query_book_result");
		
		
		return view;
	}
	
	
	@RequestMapping(value="/inform",method = RequestMethod.GET)
	public ModelAndView doInform(HttpServletRequest request,  
            HttpServletResponse response,
            Model model){
	
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		StatusBean status = (StatusBean)session.getAttribute("status");
		if(status==null){
			status = new StatusBean();									//为空则创建一个Bean对象
		}
		int span = status.getSpan();
		int page =	1;						
		Vector<Vector<String>> v=studentService.getOrderList();
		System.out.println("v.size()="+v.size());
		
		int total=studentService.getOrderListPage(span);
		status.setTotal(total);
		status.setCurPage(page);
		session.setAttribute("status", status);
		ModelAndView view = new ModelAndView();
		view.addObject("v", v);
		view.setViewName("/order_list");
		
		
		return view;
	}
	
	@RequestMapping(value="/searchorder",method = RequestMethod.POST)
	public ModelAndView doSearchOrder(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            Model model){
	
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		StatusBean status = (StatusBean)session.getAttribute("status");
		if(status==null){
			status = new StatusBean();									//为空则创建一个Bean对象
		}
		int span = status.getSpan();
		int page =	1;						
		Vector<Vector<String>> v=studentService.getOrderListByStuno(stuNO);
		System.out.println("v.size()="+v.size());
		
		int total=studentService.getOrderListByStunoPage(stuNO, span);
		status.setTotal(total);
		status.setCurPage(page);
		session.setAttribute("status", status);
		ModelAndView view = new ModelAndView();
		view.addObject("v", v);
		view.setViewName("/order_list");
		
		
		return view;
	}
	
	@RequestMapping(value="/order",method = RequestMethod.POST)
	public ModelAndView doOrder(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "bookNO", required = false) String bookNO,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		StudentEntity std=studentService.getStudent(stdno);
		String message="";
		int per=std.getPermit();
		System.out.println("stdno="+stdno);
		if(per==0){
			message="您沒有借書權限，所以不可預訂，請到管理處開通。"
					+"<br><a href='javascript:history.go(-1);'/>點擊這裡返回</a>";								 
		}
		else{
			int r=studentService.addOrderList(bookNO, stdno);
			System.out.println("r="+r);
			message="預約成功，請關注預約通知，並按時取書。"
					+"<br><a href='javascript:history.go(-1);'/>點擊這裡返回</a>";
			
		}
		
		ModelAndView view = new ModelAndView();
		view.addObject("message", message);
		view.setViewName("/stu_info_two");
		return view;
	}
	
	@RequestMapping(value="/changepage",method = RequestMethod.GET)
	public ModelAndView doChangePage(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "url", required = false) String url,
            @RequestParam(value = "curPage", required = false) String curPage,
            Model model){
		
		
		ModelAndView view = new ModelAndView();
		//view.addObject("message", message);
		view.setViewName("/stu_info_two");
		return view;
	}
	
	@RequestMapping(value="/borrowhistory",method = RequestMethod.GET)
	public ModelAndView doBorrowHistory(HttpServletRequest request,  
            HttpServletResponse response,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		int total = studentService.getBorrowListHistoryPage(stdno, span);
		status.setCurPage(1);
		status.setTotal(total);
		session.setAttribute("status", status);
		Vector<Vector<String>> v = studentService.getBorrowListHistory(stdno);
		view.addObject("v", v);
		view.setViewName("/borrow_history");

		
		return view;
	}
	@RequestMapping(value="/borrowlost",method = RequestMethod.GET)
	public ModelAndView doBorrowLost(HttpServletRequest request,  
            HttpServletResponse response,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		int total = studentService.getBorrowListLostPage(stdno, span);
		status.setCurPage(1);
		status.setTotal(total);
		session.setAttribute("status", status);
		Vector<Vector<String>> v = studentService.getBorrowListLost(stdno);
		view.addObject("v", v);
		view.setViewName("/lost_book");

		
		return view;
	}
	
	@RequestMapping(value="/borrowfine",method = RequestMethod.GET)
	public ModelAndView doBorrowFine(HttpServletRequest request,  
            HttpServletResponse response,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		int total = studentService.getAmercementListPage(stdno, span);
		status.setCurPage(1);
		status.setTotal(total);
		double m = studentService.getAmercementMoney(stdno);
		status.setMoney(String.valueOf(m));
		session.setAttribute("status", status);
		Vector<Vector<String>> v = studentService.getAmercementList(stdno);
		
		view.addObject("v", v);
		view.setViewName("/account");

		
		return view;
	}
	
	@RequestMapping(value="/borrowdebt",method = RequestMethod.GET)
	public ModelAndView doBorrowDebt(HttpServletRequest request,  
            HttpServletResponse response,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");
		System.out.println("stdno="+stdno);
		String message="";
		ModelAndView view = new ModelAndView();
		StudentEntity std=null;
		
		Vector<Vector<String>> v = studentService.getAmercementListDebt(stdno);
		v.addAll(studentService.getBorrowListDebt(stdno));
		view.addObject("v", v);
		view.setViewName("/current_amerce");

		
		return view;
	}
	
	@RequestMapping(value="/lostcard",method = RequestMethod.POST)
	public ModelAndView doLostCard(HttpServletRequest request,  
			HttpServletResponse response,
            @RequestParam(value = "pwd", required = false) String pwd,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");	
		String message="";
		
		if((studentService.verify(stdno,pwd))){
								
			studentService.doLostCard(stdno);					
			message = "掛失成功。";	
		}
		else{
			message = "密碼錯誤，掛失失敗。";				
		}
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/lost_card");
		view.addObject("message", message);
		return view;
		
	}
	
	@RequestMapping(value="/conbook",method = RequestMethod.POST)
	public ModelAndView doConBook(HttpServletRequest request,  
			HttpServletResponse response,
            @RequestParam(value = "borrowNO", required = false) String borrowNO,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");	
		String message="";
		
		
		BorrowlistEntity b = studentService.getBorrowListByBno(borrowNO);
		int k = b.getXuJie();
		
		if(k==1){
			message = "該書已經續借過一次，不能再次續借。";
		}
		else{
			if(studentService.getBorrowListOrdered(borrowNO)){
				message = "該書已經被預約，請您按時還書。";	
			}
			else{
				String end = b.getEndTime();
				Calendar cal = Calendar.getInstance();
				String newEnd = DateUtil.addSomeDay(end,30);
				String now = DateUtil.getDateString(cal);
				int day = DateUtil.getDay(now,end);
				if(day>5){
					message = "續借圖書只能在歸還前5天續借。";
				}
				else{
					if(day<=0){
						message = "圖書已超期，不可續借，請盡快還書";					 			
					}
					else{
						if(studentService.updateBorrowlistConti(borrowNO, newEnd)){
							message = "續借成功，新的歸還日期為"+newEnd;
						}
						else{
							message = "續借失敗";
						}
					}
				}
			}
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/stu_info_one");
		view.addObject("message", message);
		return view;
		
	}
	
	@RequestMapping(value="/lostbook",method = RequestMethod.POST)
	public ModelAndView doLostBook(HttpServletRequest request,  
			HttpServletResponse response,
            @RequestParam(value = "borrowNO", required = false) String borrowNO,
            Model model){
		
		HttpSession session=request.getSession();
		String stdno=(String) session.getAttribute("stuNO");	
		String message="";
		
		BorrowlistEntity b = studentService.getBorrowListByBno(borrowNO);
		
		studentService.updateBookStatus(borrowNO);
		studentService.updateBorrowlistLost(borrowNO);
		studentService.addAmercement(borrowNO, stdno ,"丟書罰款",String.valueOf(b.getB().getBookPrice()));
		
		
		String end = b.getEndTime();
		Calendar cal = Calendar.getInstance();	
		String now = DateUtil.getDateString(cal);
		int days = DateUtil.getDay(now,end);
		
		if(days<0){
			double money = -days*0.1;
			studentService.addAmercement(borrowNO, stdno ,"超期罰款",String.valueOf(money));
		}
		
		studentService.doLostCard(stdno);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/stu_info_one");
		view.addObject("message", message);
		return view;
		
	}
	
}
