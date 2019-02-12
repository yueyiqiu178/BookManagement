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
		<script language="JavaScript" src="<%=path%>/js/add_admin.js"></script>
</head>
<body>
<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">			
			<div id="ad_manage"><font size="4"><center>添加管理員			
			<form name="addAdmin" action="<%=path%>/manage/addmanage_post.do" method="post">
			<table>
				<tr>
					<td align="right">管理員ID：</td>
					<td align="left">
						<input name="adID" type="text" size="20" value="a12345" />
					</td>
				</tr>
				<tr>
					<td align="right">管理員密碼：</td>
					<td align="left">
						<input name="adPwd" type="password" size="20"  value="123456789" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!--<input type="button" value="添加" onclick="checkAddAdmin()"/>  -->
						<img src="<%=path%>/images/tja.gif" id="tj" onclick="checkAddAdmin()" 
								onmouseover="document.all.tj.src='<%=path%>/images/tjb.gif'"
							 	onmouseout="document.all.tj.src='<%=path%>/images/tja.gif'"
							  	onmousedown="document.all.tj.src='<%=path%>/images/tjc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="action" value="addAdmin"/>
						<!--	<input type="reset" value="清空"/>  -->
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
						<font color="red" size="3">
							<center><%= message %></center></font>
					</td>
				</tr>
				<%
					}
				%>		
			</table>
			</form>
			</div>
		</div>
</body>
</html>