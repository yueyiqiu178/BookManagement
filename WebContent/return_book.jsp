<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript">
			function checkReturn(){
				var bNO = document.rebook.bNO.value;
				var reg = /^\d*$/;
				if(bNO.trim()==""){
					alert("圖書編號不得為空！！！");
					return;
				}
				if(!reg.test(bNO)){
					alert("圖書編號號格式不對");
					return;
				}				
				document.rebook.submit();
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="borrow_left_menu.jsp" %>
		</div>		
		<div id="info_table">
			<center><br><br><font size="4">圖書歸還</center>
			<form name="rebook" action="ManageServlet" method="post">
				<input type="hidden" name="action" value="return_book">
				<table align="center">
					<tr>
						<td align="right">請輸入圖書編號：</td>
						<td><input type="text" name="bNO"></td>
					</tr>
					<tr>
						<td></td>
						<td align="right">
						<!-- <input type="button" value="提交" onclick="checkReturn()"> -->	
						<img src="<%=path%>/images/tjaa.gif" id="tja" onclick="checkReturn()" 
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