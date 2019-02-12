<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript">
			function checkAmer(){
				var stuNO = document.amerce.stuNO.value;
				var reg = /^\d*$/;
				if(stuNO.trim()==""){
					alert("學生學號不得為空！！！");
					return;
				}
				if(!reg.test(stuNO)){
					alert("學號格式不對");
					return;
				}				
				document.amerce.submit();
			}
		</script>
</head>
<body>
		<div id="Menu">
			<%@ include file="borrow_left_menu.jsp" %>
		</div>		
		<div id="info_table">
			<center><br><br><font size="4">罰款繳納</center>
			<form name="amerce" action="<%=path%>/manage/getamercelist.do" method="get">
				<input type="hidden" name="action" value="get_amer_list">
				<table align="center">
					<tr>
						<td align="right">請輸入學生學號：</td>
						<td><input type="text" name="stuNO"></td>
					</tr>
					<tr>
						<td></td>
						<td align="right">
						<!-- <input type="button" value="查詢" onclick="checkAmer()"> -->	
						<img src="<%=path%>/images/tjaa.gif" id="tja" onclick="checkAmer()" 
							onmouseover="document.all.tja.src='<%=path%>/images/tjbb.gif'"
						 	onmouseout="document.all.tja.src='<%=path%>/images/tjaa.gif'"
						  	onmousedown="document.all.tja.src='<%=path%>/images/tjcc.gif'"
						   	style="cursor:hand"/>
						</td>
					</tr>
					<% 
						String message = (String)request.getAttribute("message");
						if(message!=null){
					%>
					<tr>
						<td colspan="2"><center><font color="red" size="3">
							<%= message %></center>
						</font></td>
					</tr>
					<%
						}
					 %>
				</table>
			</form>
		</div>
</body>
</html>