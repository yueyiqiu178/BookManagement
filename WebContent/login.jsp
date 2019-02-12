<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/images/div.css" type="text/css" rel=stylesheet>
<link href="<%=path%>/images/globalstyle.css" type="text/css" rel=stylesheet>
<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
<script language="JavaScript" src="<%=path%>/js/stuLogin.js"></script>
</head>
<body>
<div id="father">
 		<div id="loginform">
 			<%
 			 String stuName= (String)session.getAttribute("stuName"); //得到當前登陸的學生學號
             if(stuName==null){
          	%>
            登陸我的圖書館
			<form name="login" action="<%=path%>/student/login.do" method="post" >
				<table>
					<tr>
						<td align="right">用戶名：</td>
						<td align="left"><input type="text" name="uname" value="200501" /><br></td>
					</tr>
					<tr>
						<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;碼：</td>
						<td align="left"><input type="password" name="pwd" value="200501" /><br></td>
					</tr>
					<tr>
						<td></td>
						<td>
						<input type="hidden" name="action" value="login">
						<!-- <input type="button" value="登錄" onclick="checkUser()"/> -->
						<img src="<%=path%>/images/dla.gif" id="dl" onclick="checkUser()" style="cursor:hand" />&nbsp;&nbsp;&nbsp;&nbsp;					
						<!--	<input type="reset" value="重置"/></td>  -->
						<img src="<%=path%>/images/cza.gif" id="cz" onclick="reset()" style="cursor:hand" />
					</tr>
					<%
						String message = (String)request.getAttribute("message");
						if(message!=null){
					%>
					<tr>
						<td colspan="2">
							<font color="red" size="2"><%= message %></font>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</form>
          	<%
             }
             else{
             	out.println(stuName+"，您好！<br/><br/>歡迎來到圖書館!!!");
             	out.println("<br/><br/><a href='"+path+"/student/stuinfo.do' target='bottomFrame'>【查看/修改個人信息】</a>");
             	out.println("<a href='"+path+"/student/logout.do'>【注銷】</a>");             	
             }
 			%>
 		</div>
 		<div id="message">
 		 提示：
 		  <ul>
	 		  <li>讀者登陸用戶名為學生證號</li>
	 		  <li>新生的初始密碼有以下兩種情況：
	 		  	<ol>
		 		  	<li>您的學生證號</li>
		 		  	<li>借書證上的條形號</li>
		 		</ol>
	 		  </li>
	 		  <li>登陸進入系統可修改密碼</li>
	 		  <li>保存好密碼，如果忘記密碼請持學生證到管理處取回</li>
 		  </ul>
 		</div>
 	</div>
</body>
</html>
