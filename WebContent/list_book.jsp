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
			 document.search.key.value="";
			}
			function checkSearch(){
			 var key = document.search.key.value;
			 if(key.trim()==""){
			   alert("關鍵字不能為空！！！");
			   return;
			 }
			 document.search.submit();
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>		
		<div id="info_table">
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String message = (String)request.getAttribute("message");
		   	String url = "list_book.jsp";
		%>
			<br/><center><font size="5">圖書列表</center>					
			<table border="0" align="center" width="90%" height="40"
					style="background:url(<%=path%>/images/sb.jpg) no-repeat">
				<form name="search" action="<%=path%>/manage/searchbook.do" method="post">
				<td align="left">請選擇查詢條件
				<select name="condition">
					<option value="BookNO">按圖書編號</option>
					<option value="BookName">按圖書名稱</option>
					<option value="Publish">按出版社</option>
					<option value="Author">按作者</option>
					<option value="BookIsbn">按ISBN號</option>
				</select>
				<input type="text" name="key" value="請輸入關鍵字" 
						onfocus="textclear()" size="25" style="border:0">
				<input type="hidden" name="action" value="search_book">
				</td>
				<td width="39%">
				  <img src="<%=path%>/images/sstp.jpg" id="mg" border="0"
				      style="cursor:hand"
				      onclick="checkSearch()"
				      onmousedown="document.all.mg.src='<%=path%>/images/ssax.jpg'"
				      onmouseup="document.all.mg.src='<%=path%>/images/sstp.jpg'"
				      onmouseout="document.all.mg.src='<%=path%>/images/sstp.jpg'"/>				       
				 <!--<input type="button" value="查詢" onclick="checkSearch()">-->		
				</td>
				</tr></form>
			</table>		
			<% 
				if(v!=null&&v.size()!=0){
			%>					   	
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%" style="font-size:13px">
				<th bgcolor="#D1D1E6">編號</th>
				<th bgcolor="#D1D1E6">名稱</th>
				<th bgcolor="#D1D1E6">作者</th>
				<th bgcolor="#D1D1E6">出版社</th>
				<th bgcolor="#D1D1E6">ISBN號</th>
				<!--<th bgcolor="#D1D1E6">購進時間</th>-->
				<th bgcolor="#D1D1E6">價格</th>
				<th bgcolor="#D1D1E6">狀態</th>
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
						<!--<td align="center"><%= vtemp.get(5) %></td>-->					
						<td align="center"><%= vtemp.get(5) %></td>
						<%
							int condition = Integer.parseInt(vtemp.get(6));
							switch(condition){
								case 0:
						%>
							<td align="center">在館</td>
						<%
								break;
								case 1:
						%>
							<td align="center">借出</td>
						<%
								break;
								case 2:
						%>
							<td align="center">借出並被預約</td>
						<%
								break;
								case 3:
						%>
							<td align="center">丟失</td>
						<%
								break;
							}
						%>
						<td align="center">
							<a href="<%=path%>/manage/delbook.do?bNO=<%=vtemp.get(0)%>" 
									onclick="return confirmDel()">
									<img src="<%=path%>/images/del.gif" border="0" width="15" height="15"/>刪除</a>
						</td>
						<td align="center">
							<a href="<%=path%>/manage/editbook.do?bNO=<%=vtemp.get(0)%>">
								<img src="<%=path%>/images/edit.gif" border="0"/>修改</a>
						</td>
						</tr>
					<%
					    }
					%>
			</table>
			<%@ include file="navgation.jsp" %>
		<%
		   	}
		   	else{
				if(message==null&&v.size()==0){
		%>
			<br><br><br><center>沒有圖書記錄可顯示	
		<%
				}
			}
			if(message!=null&&v==null){
		%>
			<br><br><br><center><%= message %>
		<%
			}
		%>
		</div>

</body>
</html>