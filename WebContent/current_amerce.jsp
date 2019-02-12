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
		   	if(v!=null&&v.size()!=0){
		%>
		<%= stuName %>，您當前欠款記錄如下：<br/><br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%">
				<th bgcolor="#D1D1E6">欠款書名</th>
				<th bgcolor="#D1D1E6">欠款項目</th>
				<th bgcolor="#D1D1E6">借出日期</th>
				<th bgcolor="#D1D1E6">應還日期</th>				
				<th bgcolor="#D1D1E6">欠款金額</th>
				<%
					double total = 0.0;			//記錄未交罰款的總額
					for(int i=0;i<v.size();i++){
						Vector<String> vtemp = v.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td><%= vtemp.get(0) %></td>
						<td><%= vtemp.get(1) %></td>
						<td><%= vtemp.get(2) %></td>
						<td><%= vtemp.get(3) %></td>
						<td><%= vtemp.get(4) %></td>
					</tr>
				<% 
					total = total+Double.parseDouble(vtemp.get(4));
					total = Math.round(total*100)/100.0;
				    }
				%>
					<tr bgcolor="white">
						<td colspan="4" align="right">金額總計</td>
						<td>
							<font color="red" size="2.5"/><%= total %>￥
						</td>
					</tr>
			</table>
		<%
		   	}
		   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>您當前沒有欠款。
			</font></center>			   
		<%
		   	}
		%>		
		</div>
</body>
</html>