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
<link href="<%=path%>/css/globalstyle.css" type="text/css" rel=stylesheet>
</head>
<body>
<div id="Menu">
			<%@ include file="stu_left_menu.jsp" %>
		</div>
		<div id="info_table">
		<%
			String stuName = (String)session.getAttribute("stuName");
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "borrow_history.jsp";			//換頁使用
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>，您的借閱歷史如下：<br/><br/>
		<table border="0" bgcolor="black" cellspacing="1" align="center">
			<th bgcolor="#D1D1E6">編號</th>
			<th bgcolor="#D1D1E6">名稱</th>
			<th bgcolor="#D1D1E6">作者</th>
			<th bgcolor="#D1D1E6">出版社</th>
			<th bgcolor="#D1D1E6">借出日期</th>
			<th bgcolor="#D1D1E6">歸還日期</th>
			<th bgcolor="#D1D1E6">備注</th>
		<%
				for(int i=0;i<v.size();i++){
					Vector<String> vtemp = v.get(i);
		%>
				<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
					<td><%= vtemp.get(0) %></td>
					<td><%= vtemp.get(1) %></td>
					<td><%= vtemp.get(2) %></td>
					<td><%= vtemp.get(3) %></td>
					<td><%= vtemp.get(4) %></td>
					<td><%= vtemp.get(5) %></td>
		<%
					if(vtemp.get(6).equals("1")){
		%>
						<td>已歸還</td>
		<%
					}
					else{
		%>
						<td>已丟失</td>
		<%
					}
		%>
				</tr>
		<%
			    }
		%>
		</table>
		<%@ include file="navgation.jsp" %>
		<%
			   	}
			   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>，，您的借閱記錄為空。
			</font></center>
		<%
			   	}
		%>
		</div>
</body>
</html>