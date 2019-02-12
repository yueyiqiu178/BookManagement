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
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript">
			function confirmDel(){
			 return confirm("確定刪除？？？");
			}
			function textclear(){
			 document.search.stuNO.value="";
			}
			function checkSearch(){
			 var stuNO = document.search.stuNO.value;
			 if(stuNO.trim()==""){
			   alert("學號不能為空！！！");
			   return;
			 }
			 var reg = /^\d*$/
			 if(!reg.test(stuNO)){
			   alert("學號格式不正確！！！");
			   return;
			 }
			 document.search.submit();
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="stum_left_menu.jsp" %>
		</div>
		<div id="info_table">
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "list_stu.jsp";			//換頁使用
		   	if(v!=null&&v.size()!=0){
		%>
		<center><font size="3">學生列表</font></center>
		<form name="search" action="<%=path%>/manage/search_stu.do" method="post">		
		<table style="background:url(<%=path%>/images/search.jpg) no-repeat" height="40" width="90%" align="center">
			
			<tr><td width="28%">
			&nbsp;<input name="stuNO" id="st" value="請輸入學號搜索" style="border:0"
				      		 size="19" onfocus="textclear()"/>		    
			</td>
		    <td width="100" align="left">
			   <img src="<%=path%>/images/sstp.jpg" id="mg" border="0"
			      style="cursor:hand"
			      onclick="checkSearch()"
			      onmousedown="document.all.mg.src='<%=path%>/images/ssax.jpg'"
			      onmouseup="document.all.mg.src='<%=path%>/images/sstp.jpg'"
			      onmouseout="document.all.mg.src='<%=path%>/images/sstp.jpg'"/>
		    </td>		     	
		
		  </tr>
		</table>
</form>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">								
			<th bgcolor="#D1D1E6">學號</th>
			<th bgcolor="#D1D1E6">密碼</th>
			<th bgcolor="#D1D1E6">姓名</th>
			<th bgcolor="#D1D1E6">年齡</th>
			<th bgcolor="#D1D1E6">性別</th>
			<th bgcolor="#D1D1E6">班級</th>
			<th bgcolor="#D1D1E6">學院</th>
			<th bgcolor="#D1D1E6">借書權限</th>
			<th bgcolor="#D1D1E6" width="60">刪除</th>
			<th bgcolor="#D1D1E6" width="60">修改</th>
		<%
				for(int i=0;i<v.size();i++){
					Vector<String> vtemp = v.get(i);
		%>
				<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
					<td align="center"><%= vtemp.get(0) %></td>
					<td align="center"><%= vtemp.get(1) %></td>
					<td align="center"><%= vtemp.get(2) %></td>
					<td align="center"><%= vtemp.get(3) %></td>
					<td align="center"><%= vtemp.get(4) %></td>
					<td align="center"><%= vtemp.get(5) %></td>
					<td align="center"><%= vtemp.get(6) %></td>
					<td align="center">
		<%
					if(vtemp.get(7).equals("1")){
		%>
					可以借書
		<%
					}
					else{
		%>
					不可借書
		<%
					}
		%>
					</td>
					<td align="center">
						<a href="<%=path%>/manage/delstu.do?stuNO=<%= vtemp.get(0) %>" 
							onclick="return confirmDel()">
							<img src="<%=path%>/images/del.gif" border="0" width="15" height="15"/>刪除</a></td>
					<td align="center">
						<a href="<%=path%>/manage/editstu.do?stuNO=<%= vtemp.get(0) %>">
							<img src="<%=path%>/images/edit.gif" border="0"/>修改</a></td>
					</td>
		<%
			   	}
		%>
		</table>		

			<%@ include file="navgation.jsp" %>
		<%
			 }
			 else{
		%>
			<center><font color="red" size="3"><br>沒有學生記錄</font></center>
		<%
			 }
		%>
		</div>
</body>
</html>