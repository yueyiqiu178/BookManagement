package site.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import site.model.AmercementEntity;
import site.model.BookEntity;
import site.model.ManageEntity;
import site.model.StudentEntity;
import site.service.*;
import site.util.DateUtil;
import site.util.StatusBean;

@Controller
@RequestMapping(value="/manage")
public class ManageController {
	
	@Autowired
	ManageService manageService;
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public ModelAndView doDelSession(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "uname", required = false) String uname,
            @RequestParam(value = "pwd", required = false) String pwd,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		
		if(manageService.verify(uname, pwd)){
			System.out.println("goin");
			ManageEntity m=manageService.getManage(uname);
			session.setAttribute("adName", uname);
			session.setAttribute("adLevel", m.getManageLevel());
		}
		else{
			message = "非法的用戶名和密碼，請核對後登陸";
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin_login");
		view.addObject("message", message);
		return view;
	}
	
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public ModelAndView doLogout(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession(true);
		
		session.invalidate();							
		
		System.out.println("sessionout");
		
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/admin_login.jsp");
		
		return view;
	}
	
	@RequestMapping(value="/ad_manage",method = RequestMethod.GET)
	public ModelAndView doAdManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adName");
		String message = "";
		ModelAndView view = new ModelAndView();
		if(id!=null){
			view.setViewName("redirect:/admin_manage.jsp");
		}
		else{
			message = "對不起，您還沒有登錄，請先登錄。";
			view.addObject("message", message);
			view.setViewName("/admin_login");
		}
		
		return view;
	}
	
	@RequestMapping(value="/stu_manage",method = RequestMethod.GET)
	public ModelAndView doStuManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adName");
		String message = "";
		ModelAndView view = new ModelAndView();
		if(id!=null){
			view.setViewName("redirect:/stu_manage.jsp");
		}
		else{
			message = "對不起，您還沒有登錄，請先登錄。";
			view.addObject("message", message);
			view.setViewName("/admin_login");
		}
		
		return view;
	}
	
	@RequestMapping(value="/borrow_manage",method = RequestMethod.GET)
	public ModelAndView doBorrowManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adName");
		String message = "";
		ModelAndView view = new ModelAndView();
		if(id!=null){
			view.setViewName("redirect:/borrow_manage.jsp");
		}
		else{
			message = "對不起，您還沒有登錄，請先登錄。";
			view.addObject("message", message);
			view.setViewName("/admin_login");
		}
		
		return view;
	}
	
	@RequestMapping(value="/book_manage",method = RequestMethod.GET)
	public ModelAndView doBookManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adName");
		String message = "";
		ModelAndView view = new ModelAndView();
		if(id!=null){
			view.setViewName("redirect:/book_manage.jsp");
		}
		else{
			message = "對不起，您還沒有登錄，請先登錄。";
			view.addObject("message", message);
			view.setViewName("/admin_login");
		}
		
		return view;
	}
	
	@RequestMapping(value="/addboook_post",method = RequestMethod.POST)
	public ModelAndView doAddBookPost(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "bNO", required = false) String bNO,
            @RequestParam(value = "bName", required = false) String bName,
            @RequestParam(value = "author", required = false) String author,
            @RequestParam(value = "publish", required = false) String publish,
            @RequestParam(value = "isbn", required = false) String isbn,
            @RequestParam(value = "price", required = false) String price,
            Model model) throws UnsupportedEncodingException{
		
		
		bName = new String(bName.getBytes("ISO-8859-1"),"UTF-8");
		author = new String(author.getBytes("ISO-8859-1"),"UTF-8");
		publish = new String(publish.getBytes("ISO-8859-1"),"UTF-8");
		
		String message="";
		HttpSession session=request.getSession();
		String now = DateUtil.getDateString(Calendar.getInstance());
		if(manageService.checkBook(bNO)){
			message = "該圖書編號已經存在，請核對後輸入。";
		}
		else{
			if(manageService.addBook(bNO, bName,author,publish,isbn,now,price,0)>0)
				message = "添加圖書成功。";	
			else
				message = "未知錯誤添加失敗。";	
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/book_manage");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/listbook",method = RequestMethod.GET)
	public ModelAndView doListBook(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		
		String message = "";
		ModelAndView view = new ModelAndView();
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		
	    Vector<Vector<String>> v=manageService.getPageContentBook(page, span);
	    int total = manageService.pageBook(span);
	    
	    view.setViewName("/list_book");
	    view.addObject("v", v);
	    status.setCurPage(1);
	    status.setTotal(total);
	
		
		return view;
	}
	
	@RequestMapping(value="/editbook",method = RequestMethod.GET)
	public ModelAndView doEditBook(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "bNO", required = false) String bNO,
            Model model) throws ServletException, IOException{
		
		BookEntity b =  manageService.getBook(bNO);
		
		Vector<String> vtemp = new Vector<String>();			

		Vector<Vector<String>> v = new Vector<Vector<String>>();
		
		vtemp.add(b.getBookNo());
		vtemp.add(b.getBookName());
		vtemp.add(b.getAuthor());
		vtemp.add(b.getPublish());
		vtemp.add(b.getBookIsbn());
		vtemp.add(String.valueOf(b.getBookPrice()));
		
		v.add(vtemp);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/edit_book");
		view.addObject("v", v);
		return view;
	}
	
	@RequestMapping(value="/delbook",method = RequestMethod.GET)
	public ModelAndView doDelBook(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "bNO", required = false) String bNO,
            Model model) throws ServletException, IOException{
		String message = "";
		manageService.delBook(bNO);
		
		message = "刪除成功<a href='"+request.getContextPath()+"/manage/listbook.do'/>點擊這裡返回</a>";
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin_info_two");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/savebook",method = RequestMethod.POST)
	public ModelAndView doSaveBook(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "newNO", required = false) String newNO,
            @RequestParam(value = "bName", required = false) String bName,
            @RequestParam(value = "author", required = false) String author,
            @RequestParam(value = "publish", required = false) String publish,
            @RequestParam(value = "isbn", required = false) String isbn,
            @RequestParam(value = "price", required = false) String price,
            Model model) throws ServletException, IOException{
		
			
		String message = "";
		bName = new String(bName.getBytes("ISO-8859-1"),"UTF-8");
		author = new String(author.getBytes("ISO-8859-1"),"UTF-8");
		publish = new String(publish.getBytes("ISO-8859-1"),"UTF-8");

			if(manageService.updateBook(newNO, bName, author, publish, isbn, price))
				message = "圖書信息修改成功。";
			else
				message = "未知错误，修改失败";
		
	    BookEntity b =  manageService.getBook(newNO);
	    
	    Vector<String> vtemp = new Vector<String>();			
        
	    Vector<Vector<String>> v = new Vector<Vector<String>>();
	    
	    vtemp.add(b.getBookNo());
	    vtemp.add(b.getBookName());
	    vtemp.add(b.getAuthor());
	    vtemp.add(b.getPublish());
	    vtemp.add(b.getBookIsbn());
	    vtemp.add(String.valueOf(b.getBookPrice()));
	    
	    v.add(vtemp);			
			
		ModelAndView view = new ModelAndView();
		view.setViewName("/edit_book");
		view.addObject("message", message);
		view.addObject("v", v);
		return view;
	}
	
	@RequestMapping(value="/searchbook",method = RequestMethod.POST)
	public ModelAndView doSearchBook(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "condition", required = false) String condition,
            Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		
		String message = "";
		ModelAndView view = new ModelAndView();
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		
		key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		condition = new String(condition.getBytes("ISO-8859-1"),"UTF-8");
		
		Vector<Vector<String>> v=manageService.getPageContentSearchBook(page, span, key, condition);
		int total = manageService.pageSearchBook(span, key, condition);
			
		view.setViewName("/list_book");
		view.addObject("v", v);
		status.setCurPage(1);
		status.setTotal(total);
		
		
		return view;
	}
	
	@RequestMapping(value="/addmanage",method = RequestMethod.GET)
	public ModelAndView doAddManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		String level=String.valueOf((int) session.getAttribute("adLevel"));
		String message = "";
		ModelAndView view = new ModelAndView();
		if(level.equals("1")){
			view.setViewName("redirect:/add_admin.jsp");
		}else{
			message = "您不是超級管理員，沒有對管理員進行管理的功能。";
			view.setViewName("/admin_info_one");
			view.addObject("message", message);
		}
		
		return view;
	}
	
	@RequestMapping(value="/addmanage_post",method = RequestMethod.POST)
	public ModelAndView doAddManagePost(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "adID", required = false) String adID,
            @RequestParam(value = "adPwd", required = false) String adPwd,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		
		if(manageService.check(adID)){
			message = "管理員名已存在，請核對後重新添加！！！";
		}
		else{
			if(manageService.addManage(adID, adPwd)>0)
				message = "成功添加管理員。";	
			else
				message = "未知錯誤添加失敗。";	
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/add_admin");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/resetpwd",method = RequestMethod.GET)
	public ModelAndView doResetPwd(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		String level=String.valueOf((int) session.getAttribute("adLevel"));
		String message = "";
		ModelAndView view = new ModelAndView();
		if(level.equals("1")){
			view.setViewName("redirect:/admin_resetPwd.jsp");
		}else{
			message = "您不是超級管理員，沒有對管理員進行管理的功能。";
			view.setViewName("/admin_info_one");
			view.addObject("message", message);
		}
		
		return view;
	}
	
	@RequestMapping(value="/resetpwd_post",method = RequestMethod.POST)
	public ModelAndView doResetPwdPost(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "adID", required = false) String adID,
            @RequestParam(value = "adPwd", required = false) String adPwd,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		
		if(manageService.check(adID)){
			if(manageService.updateManage(adID, adPwd))
				message = "密碼重置成功！！！";	
			else
				message = "未知錯誤，重置失敗。";	
		}
		else{
			message = "該管理員不存在，請核對後重新輸入。";	
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin_resetPwd");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/listmanage",method = RequestMethod.GET)
	public ModelAndView doListManage(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		String level=String.valueOf((int) session.getAttribute("adLevel"));
		String message = "";
		ModelAndView view = new ModelAndView();
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		
		if(level.equals("1")){
			Vector<Vector<String>> v=manageService.getPageContent(page, span);
			int total = manageService.pageManage(span);
			
			view.setViewName("/list_admin");
			view.addObject("v", v);
			status.setCurPage(1);
			status.setTotal(total);
		}else{
			message = "您不是超級管理員，沒有對管理員進行管理的功能。"; 
			view.setViewName("/admin_info_one");
			view.addObject("message", message);
		}
		
		return view;
	}
	
	@RequestMapping(value="/delmanage",method = RequestMethod.GET)
	public ModelAndView doDelManage(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "mID", required = false) String mID,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		
		manageService.delManage(mID);
		
		message = "刪除管理員"+mID+"成功<a href='"+request.getContextPath()+"/manage/listmanage.do'/>點擊這裡返回</a>";
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin_info_one");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/changepwd",method = RequestMethod.POST)
	public ModelAndView doChangePwd(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "oldPwd", required = false) String oldPwd,
            @RequestParam(value = "newPwd", required = false) String newPwd,
            Model model){
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("adName");
		String message = "";
		ModelAndView view = new ModelAndView();
		
		if(this.manageService.verify(id, oldPwd)){
			if(this.manageService.updateManage(id, newPwd))
				message = "密碼修改成功，下次請用新密碼登陸。";	
			else
				message = "未知錯誤，密碼修改失敗。";
		}
		else{
			message = "舊密碼輸入錯誤，請核對後重新修改。";
		}
		
		view.setViewName("/admin_manage");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/liststu",method = RequestMethod.GET)
	public ModelAndView doListStu(HttpServletRequest request,  
            HttpServletResponse response,Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		String level=String.valueOf((int) session.getAttribute("adLevel"));
		String message = "";
		ModelAndView view = new ModelAndView();
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		
		Vector<Vector<String>> v=manageService.getStuContent(page, span);
		int total = manageService.pageStu(span);
			
		view.setViewName("/list_stu");
		view.addObject("v", v);
		status.setCurPage(1);
		status.setTotal(total);
		
		
		return view;
	}
	
	@RequestMapping(value="/search_stu",method = RequestMethod.POST)
	public ModelAndView doSearchStu(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            Model model) throws ServletException, IOException{
		HttpSession session=request.getSession();
		String level=String.valueOf((int) session.getAttribute("adLevel"));
		String message = "";
		ModelAndView view = new ModelAndView();
		StatusBean status = (StatusBean)session.getAttribute("status");
		int span = status.getSpan();
		int page =	1;						
		
		Vector<Vector<String>> v=manageService.getStuContentById(page, span, stuNO);
		int total = manageService.pageStuByNo(span, stuNO);
			
		view.setViewName("/list_stu");
		view.addObject("v", v);
		status.setCurPage(1);
		status.setTotal(total);
		
		
		return view;
	}
	
	@RequestMapping(value="/delstu",method = RequestMethod.GET)
	public ModelAndView doDelStu(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            Model model) throws ServletException, IOException{
		String message = "";
		manageService.delStudent(stuNO);
		
		message = "刪除學生"+stuNO+"成功<a href='"+request.getContextPath()+"/manage/liststu.do'/>點擊這裡返回</a>";
		ModelAndView view = new ModelAndView();
		view.setViewName("/admin_info_two");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/addstu",method = RequestMethod.POST)
	public ModelAndView doAddStu(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            @RequestParam(value = "stuName", required = false) String stuName,
            @RequestParam(value = "age", required = false) String age,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "stuClass", required = false) String stuClass,
            @RequestParam(value = "dep", required = false) String dep,
            Model model) throws ServletException, IOException{
		
			
		String message = "";
		stuName = new String(stuName.getBytes("ISO-8859-1"),"UTF-8");
		stuClass = new String(stuClass.getBytes("ISO-8859-1"),"UTF-8");
		dep = new String(dep.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("stuName="+stuName);
		if(this.manageService.checkStu(stuNO)){
			message = "該學號學生已經存在。請核對後添加！";	
		}
		else{
			if(manageService.addStu(stuNO, stuNO, stuName, age, gender, stuClass, dep)>0)
				message = "添加新生成功。";	
			else
				message = "位置錯誤添加失敗。";
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/stu_manage");
		view.addObject("message", message);
		return view;
	}
	@RequestMapping(value="/editstu",method = RequestMethod.GET)
	public ModelAndView doEditStu(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            Model model) throws ServletException, IOException{
		
		StudentEntity s =  manageService.getStudent(stuNO);
		
		Vector<String> vtemp = new Vector<String>();			//创建临时信息向量				

		
		vtemp.add(s.getStudentno());
		vtemp.add(s.getName());
		vtemp.add(String.valueOf(s.getAge()));
		vtemp.add(s.getGender());
		vtemp.add(s.getClasss());
		vtemp.add(s.getDepartment());
		vtemp.add(String.valueOf(s.getPermit()));
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/edit_stu");
		view.addObject("student", vtemp);
		return view;
	}
	
	@RequestMapping(value="/savestu",method = RequestMethod.POST)
	public ModelAndView doSaveStu(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "newNO", required = false) String newNO,
            @RequestParam(value = "stuName", required = false) String stuName,
            @RequestParam(value = "age", required = false) String age,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "stuClass", required = false) String stuClass,
            @RequestParam(value = "dep", required = false) String dep,
            @RequestParam(value = "per", required = false) String per,
            Model model) throws ServletException, IOException{
		
			
		String message = "";
		stuName = new String(stuName.getBytes("ISO-8859-1"),"UTF-8");
		stuClass = new String(stuClass.getBytes("ISO-8859-1"),"UTF-8");
		dep = new String(dep.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("stuName="+stuName);
		System.out.println("newNO="+newNO);
			if(manageService.updateStudent(newNO, stuName, age, gender, stuClass, dep, per))
				message = "修改保存成功。";	
			else
				message = "未知错误，修改失败";
		
			System.out.println("message="+message);	
			StudentEntity s =  manageService.getStudent(newNO);
			
			Vector<String> vtemp = new Vector<String>();			//创建临时信息向量				

			
			vtemp.add(s.getStudentno());
			vtemp.add(s.getName());
			vtemp.add(String.valueOf(s.getAge()));
			vtemp.add(s.getGender());
			vtemp.add(s.getClasss());
			vtemp.add(s.getDepartment());
			vtemp.add(String.valueOf(s.getPermit()));			
			
		ModelAndView view = new ModelAndView();
		view.setViewName("/edit_stu");
		view.addObject("message", message);
		view.addObject("student", vtemp);
		return view;
	}
	
	@RequestMapping(value="/borrowbook",method = RequestMethod.POST)
	public ModelAndView doBorrowBook(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            @RequestParam(value = "bNO", required = false) String bNO,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		
		StudentEntity s = manageService.getStudent(stuNO);
		
		if(s!=null){
			if(s.getPermit()==1){
				BookEntity b = manageService.getBook(bNO);
				if(b!=null){
					if(manageService.canBorrow(bNO, stuNO)){
						Calendar now = Calendar.getInstance();
						String start = DateUtil.getDateString(now);	
						String end = DateUtil.addSomeDay(start,60);
						if(manageService.addBorrowlist(stuNO, bNO, start, end)>0 && manageService.updateBookStatus(bNO)==true){
							message = "借書成功。";
						}
						else{
							message = "未知錯誤，借書失敗";
						}
					}
					else{
						message = "該書已被人預約，不可借出。";
					}
				}
				else{
					message = "該圖書編號對應圖書不存在，請核對後重新輸入。";
				}
			}
			else{
				message = "該生沒有借書權限。";
			}
		}
		else{
			message = "沒有該學號學生，請核對後輸入";
		}

		
		ModelAndView view = new ModelAndView();
		view.setViewName("/borrow_manage");
		view.addObject("message", message);
		return view;
	}
	
	@RequestMapping(value="/getamercelist",method = RequestMethod.GET)
	public ModelAndView doGetAmerceList(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "stuNO", required = false) String stuNO,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		ModelAndView view = new ModelAndView();
		
		StudentEntity s = manageService.getStudent(stuNO);
		
		
		if(s!=null){
			Vector<Vector<String>> va=manageService.getAmercementListDebtByStuno(stuNO);
			Vector<Vector<String>> vb=manageService.getBorrowListDebt(stuNO);
			String name = s.getName();
			view.addObject("va", va);
			view.addObject("vb", vb);
			view.addObject("stuName", name);
			view.setViewName("/list_amerce");
		}
		else{
			message = "沒有該學號學生，請核對後輸入";
			view.addObject("message", message);
			view.setViewName("/amerce");
		}

		return view;
	}
	
	@RequestMapping(value="/amerce",method = RequestMethod.POST)
	public ModelAndView doAmerce(HttpServletRequest request,  
            HttpServletResponse response,
            @RequestParam(value = "AmerceNO", required = false) String AmerceNO,
            Model model){
		
		String message="";
		HttpSession session=request.getSession();
		ModelAndView view = new ModelAndView();
		
		AmercementEntity s = manageService.getAmercement(AmerceNO);
		String stdno = s.getS().getStudentno();
		Calendar cal = Calendar.getInstance();	
		String now = DateUtil.getDateString(cal);
		
		if(manageService.updateAmercement(AmerceNO, now)){
			message = "繳納成功<a href='"+request.getContextPath()+"/manage/getamercelist.do?stuNO="+stdno+"' />點擊這裡返回</a>";
		}
		else{
			message = "繳納失敗<a href='"+request.getContextPath()+"/manage/getamercelist.do?stuNO="+stdno+"' />點擊這裡返回</a>";
		}		
		
		view.addObject("message", message);
		view.setViewName("/list_amerce");
		return view;
	}
	
}
