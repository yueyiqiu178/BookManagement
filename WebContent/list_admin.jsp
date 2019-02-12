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
		<script language="JavaScript">
			function confirmDel(){
			 return confirm("確定刪除？？？");
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "list_admin.jsp";			//換頁使用
		   	if(v!=null&&v.size()!=0){
		%>
		<br/><br/><center><font size="4">管理員列表<br/><br/>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">
			<th bgcolor="#D1D1E6">管理員名</th>
			<th bgcolor="#D1D1E6">管理員級別</th>
			<th bgcolor="#D1D1E6">刪除</th>
			
		<%
				for(int i=0;i<v.size();i++){
					Vector<String> vtemp = v.get(i);
		%>
				<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
					<td align="center"><%= vtemp.get(0) %></td>					
					<%
						if(vtemp.get(1).equals("1")){
					%>
						<td align="center">超級管理員</td>
						<td align="center">－－</td>
					<%
						}
						else{
					%>
						<td align="center">普通管理員</td>
						<td align="center">
							<a href="<%=path%>/manage/delmanage.do?mID=
							<%= vtemp.get(0) %>" onclick="return confirmDel()">
							<img src="<%=path%>/images/del.gif" border="0" width="15" height="15"/>刪除</a>
						</td>
			<%
					}
				}
			}
			%>

		</table>
		<%@ include file="navgation.jsp" %>
		</div>
</body>
</html>