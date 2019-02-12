<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript" src="<%=path%>/js/add_stu.js"></script>
</head>
<body>
<div id="Menu">
			<%@ include file="stum_left_menu.jsp" %>
		</div>		
		<div id="info_table"><br>			
			<div id="stuInfo"><br><br><font size="3">添加學生<br><br>
				<form name="addStu" action="<%=path%>/manage/addstu.do" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">學號：</td>
							<td><input type="text" name="stuNO" value="200502" ></td>
						</tr>
						<tr>
							<td align="right">姓名：</td>
							<td><input type="text" name="stuName" value="邱岳溢"></td>
						</tr>
						<tr>
							<td align="right">年齡：</td>
							<td><input type="text" name="age" value="20"></td>							
						</tr>
						<tr>
							<td align="right">性別：</td>
							<td>
								<input type="radio" name="gender" value="1" checked="true">男
								<input type="radio" name="gender" value="0">女
							</td>
						</tr>
						<tr>
							<td align="right">班級：</td>
							<td><input type="text" name="stuClass" value="一甲"></td>
						</tr>
						<tr>
							<td align="right">系別：</td>
							<td><input type="text" name="dep" value="資工系"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="add_stu"></td>
							<td>
								<!-- <input type="button" value="添加" onclick="checkAddStu()"> -->
								<img src="<%=path%>/images/tja.gif" id="tj" onclick="checkAddStu()" 
									onmouseover="document.all.tj.src='<%=path%>/images/tjb.gif'"
								 	onmouseout="document.all.tj.src='<%=path%>/images/tja.gif'"
								  	onmousedown="document.all.tj.src='<%=path%>/images/tjc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <input type="reset" value="重置"> -->
								<img src="<%=path%>/images/qka.gif" id="qk" onclick="reset()" 
									onmouseover="document.all.qk.src='<%=path%>/images/qkb.gif'"
								 	onmouseout="document.all.qk.src='<%=path%>/images/qka.gif'"
								  	onmousedown="document.all.qk.src='<%=path%>/images/qkc.gif'"
								   	onmouseup="document.all.qk.src='<%=path%>/images/qkb.gif'"
								  	style="cursor:hand" >
							</td>
						</tr>
					</table>
				</form>
			<% 
				String message = (String)request.getAttribute("message");
				if(message!=null){
			%>
				<center><font color="red" size="3"><%= message %></font></center>
			<%
				}
			 %>
			</div>
			<div id="message">提示：<br><br>
				<li>輸入學生信息請認真填寫</li><br><br>
				<li>學號和年齡應為數字組成，不得包含其他字符</li><br><br>
				<li>添加學生後，學生的借書權限默認為可以借書</li><br><br>
				<li>添加學生時，學生的登錄密碼默認為學生學號</li><br><br>				
			</div>
		</div>
</body>
</html>