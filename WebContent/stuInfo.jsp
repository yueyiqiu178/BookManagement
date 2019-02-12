<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<%@ page import="java.util.*,site.model.StudentEntity"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/images/div.css" type="text/css" rel=stylesheet>
<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
<script language="JavaScript" src="<%=path%>/js/stuChangePwd.js"></script>
</head>
<body>
<% StudentEntity stu = (StudentEntity)request.getAttribute("student"); %>
		<div id="father">
			<div id="stuInfo">
				<%= stu.getName() %>，您好，您的個人信息如下：
				<ul>
				<table><!-- 顯示學生信息表格 -->
					<tr>
						<td align="right">學號：</td>
						<td align="left"><%= stu.getStudentno() %></td>
					</tr>
					<tr>
						<td align="right">姓名：</td>
						<td align="left"><%= stu.getName() %></td>
					</tr>
					<tr>
						<td align="right">年齡：</td>
						<td align="left"><%= stu.getAge() %></td>
					</tr>
					<tr>
						<td align="right">性別：</td>
						<td align="left"><%= stu.getGender() %></td>
					</tr>
					<tr>
						<td align="right">班級：</td>
						<td align="left"><%= stu.getClasss() %></td>
					</tr>
					<tr>
						<td align="right">學院：</td>
						<td align="left"><%= stu.getDepartment() %></td>
					</tr>
					<tr>
						<td align="right">權限：</td>
						<td align="left">
						<%	
							if(stu.getPermit()==1){
						%>
							 <font color="red" size="3">可以借書</font>
						<%
							}
							else{
						%>
							 <font color="red" size="3">不可借書</font>
						<%
							}
						%>
						</td>
					</tr>
				</table></ul>
				<table><!-- 修改密碼表單 -->
					<form name="stuChangePwd" action="<%=path%>/student/changepassword.do" method="post">
						<tr>
							<td align="right">請輸入舊密碼：</td>
							<td align="left">
								<input name="oldPwd" type="password"  value="000000" size="20" />
							</td>
						</tr>
						<tr>
							<td align="right">請輸入新密碼：</td>
							<td align="left">
								<input name="newPwd" type="password" value="111111" size="20" />
							</td>
						</tr>
						<tr>
							<td align="right">再次輸入新密碼：</td>
							<td align="left">
								<input name="newPwdAgain" type="password" value="111111" size="20" />
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<!-- <input type="button" value="修改" onclick="checkStuChangePwd()"/> -->
								<img src="<%=path%>/images/xga.gif" id="xg" onclick="checkStuChangePwd()" 
									onmouseover="document.all.xg.src='<%=path%>/images/xgb.gif'"
								 	onmouseout="document.all.xg.src='<%=path%>/images/xga.gif'"
								  	onmousedown="document.all.xg.src='<%=path%>/images/xgc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;
								<input type="hidden" name="action" value="stuChangePwd"/>
								<!-- <input type="reset" value="清空"/> -->
								<img src="<%=path%>/images/qka.gif" id="qk" onclick="reset()" 
									onmouseover="document.all.qk.src='<%=path%>/images/qkb.gif'"
								 	onmouseout="document.all.qk.src='<%=path%>/images/qka.gif'"
								  	onmousedown="document.all.qk.src='<%=path%>/images/qkc.gif'"
								   	onmouseup="document.all.qk.src='<%=path%>/images/qkb.gif'"
								  	style="cursor:hand" >
							</td>
						</tr>
						<%
							String message = (String)request.getAttribute("message");
							if(message!=null){
						%>
						<tr>
							<td colspan="10">
								<font color="red" size="2"><%= message %></font>
							</td>
						</tr>
						<%
							}
						%>					
					</form>
				</table>
			</div>
			<div id="message">
			  在這裡您可以查看自己的基本資料，並可以修改密碼，密碼格式應滿足以下要求：
	 		  <ul>
		 		  <li>密碼位數不能小於6位</li>
		 		  <li>密碼只能是字母和數字組合</li>
		 		  <li>最好不要使用您的生日、電話號碼等作為密碼</li>		      
	 		  </ul>
	 		  溫馨提示：請保存好您的密碼，如果忘記密碼請持學生證去管理處查詢。
			</div>
		</div>
</body>
</html>