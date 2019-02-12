<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
<link href="<%=path%>/css/globalstyle.css" type="text/css" rel=stylesheet>
<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
<script language="JavaScript" src="<%=path%>/js/adminLogin.js"></script>
</head>
<body>
	<div id="father">
 		<div id="loginform">
 			<%
 			 String adName = (String)session.getAttribute("adName"); //得到當前登陸的學生學號
             if(adName==null){
          	%>
            登陸管理系統
			<form name="login" action="<%=path%>/manage/login.do" method="post">
				<table>
					<tr>
						<td align="right">用戶名：</td>
						<td align="left"><input type="text" name="uname" value="wyf" /><br></td>
					</tr>
					<tr>
						<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;碼：</td>
						<td align="left"><input type="password" name="pwd" value="123456"  /><br></td>
					</tr>
					<tr>
						<td></td>						
						<td align="center">
						<input type="hidden" name="action" value="login">
						<!-- <input type="button" value="登陸" onclick="checkAdmin()"/> -->
						<img src="<%=path%>/images/dla.gif" id="dl" onclick="checkAdmin()" 
							onmouseover="document.all.dl.src='<%=path%>/images/dlb.gif'"
						 	onmouseout="document.all.dl.src='<%=path%>/images/dla.gif'"
						  	onmousedown="document.all.dl.src='<%=path%>/images/dlc.gif'"
						   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;						
						<!-- <input type="reset" value="重置"/> -->
						<img src="<%=path%>/images/cza.gif" id="cz" onclick="reset()" 
							onmouseover="document.all.cz.src='<%=path%>/images/czc.gif'"
						 	onmouseout="document.all.cz.src='<%=path%>/images/cza.gif'"
						  	onmousedown="document.all.cz.src='<%=path%>/images/czc.gif'"
						   	onmouseup="document.all.cz.src='<%=path%>/images/czc.gif'"
						  	style="cursor:hand" />						
						</td>
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
             	out.println(adName+"，您好！<br/><br/>歡迎進入管理端系統!!!");
             	out.println("<br/><br/><a href='"+path+"/manage/ad_manage.do' target=");
             	out.println("'bottomFrame'>【賬號維護】</a>");
             	out.println("<a href='"+path+"/manage/logout.do'>【注銷】</a>");
             }
 			%>
 		</div>
 		<div id="message">
 		 提示：
 		  <ul>
	 		  <li>管理員的用戶名和密碼由超級管理員設置</li><br><br>
	 		  <li>保存好密碼，不要向任何人透露密碼</li><br><br>
	 		  <li>登陸進入系統可修改密碼</li><br><br>
	 		  <li>如果忘記密碼請持有效證件到超級管理員處取回</li>
 		  </ul>
 		</div>
 	</div>
</body>
</html>