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
		   	String money = status.getMoney();								//得到已繳欠款總額
		   	String url = "account.jsp";										//換頁時使用
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>，您的罰款總和為
			<font color="red" size="2.5"><%= money %>￥</font>，詳細記錄如下：<br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%">
				<th bgcolor="#D1D1E6">結算日期</th>
				<th bgcolor="#D1D1E6">結算項目</th>
				<th bgcolor="#D1D1E6">罰款金額</th>
				<th bgcolor="#D1D1E6">罰款所借書名</th>
				<%
					for(int i=0;i<v.size();i++){
						Vector<String> vtemp = v.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td align="center"><%= vtemp.get(0) %></td>
						<td align="center"><%= vtemp.get(1) %></td>
						<td align="center"><%= vtemp.get(2) %></td>
						<td align="center"><%= vtemp.get(3) %></td>
					</tr>
				<%
				    }
				%>
			</table>
			<%@ include file="navgation.jsp"%>
		<%
		   	}
		   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>，您的交納罰款記錄為空。
			</font></center>			
		<%
		   	}
		%>
		</div>
</body>
</html>