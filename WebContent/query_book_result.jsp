<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="common.jsp"%>
<jsp:useBean id="status" class="site.util.StatusBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/images/div.css" type="text/css" rel=stylesheet>
		<link href="<%=path%>/images/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript">
			function confirmOrder(sb){
			 	if(confirm("确定要预约此书吗？")){
			 		sb.submit();
			 	}
			}
		</script>
</head>
<body>
<div>
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "query_book_result.jsp";						//换页使用
		   	String stuNO = (String)session.getAttribute("stuNO");		//得到登陆的学生学号
		   	if(v!=null&&v.size()!=0){
		%>
		<table border="0" bgcolor="black" width="90%" cellspacing="1" align="center">
			<th bgcolor="#D1D1E6">编号</th>
			<th bgcolor="#D1D1E6">名称</th>
			<th bgcolor="#D1D1E6">作者</th>
			<th bgcolor="#D1D1E6">出版社</th>
			<th bgcolor="#D1D1E6">ISBN号</th>			
			<th bgcolor="#D1D1E6">购买时间</th>
			<th bgcolor="#D1D1E6">价格</th>
			<th bgcolor="#D1D1E6">状态</th>
			<% 
				if(stuNO!=null){
			%>
				<th bgcolor="D1D1E6">预约</th>
			<%
				}
			%>
			
			<%
				for(int i=0;i<v.size();i++){
					Vector<String> vtemp = v.get(i);
			%>
				<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
					<td><%= vtemp.get(0).toString() %></td>
					<td><%= vtemp.get(1).toString() %></td>
					<td><%= vtemp.get(2).toString() %></td>
					<td><%= vtemp.get(3).toString() %></td>
					<td><%= vtemp.get(4).toString() %></td>
					<td><%= vtemp.get(5).toString() %></td>
					<td><%= vtemp.get(6).toString() %></td>					
					<%
						int condition = Integer.parseInt(vtemp.get(7));
						
						switch(condition){
							case 0:
					%>
						<td>在馆</td>
					<%
							break;
							case 1:
					%>
						<td>借出</td>
					<%
							break;
							case 2:
					%>
						<td>丢失</td>
					<%
							break;
						}
						if(stuNO!=null){					
							if(condition==1){
					%>
							<form name="yyts<%=i%>" action="<%=path%>/student/order.do" method="post" "confirmOrder();">
								<input type="hidden" name="action" value="order"/>
								<input type="hidden" name="bookNO" value="<%=vtemp.get(0)%>"/>
								<td align="center">
								<!-- <input type="submit" value="预约"/> -->
								<img src="<%=path%>/images/yya.gif" id="yy<%=i%>" onclick="confirmOrder(document.all.yyts<%=i%>)" 
									onmouseover="document.all.yy<%=i%>.src='<%=path%>/images/yyb.gif'"
								 	onmouseout="document.all.yy<%=i%>.src='<%=path%>/images/yya.gif'"
								  	onmousedown="document.all.yy<%=i%>.src='<%=path%>/images/yyc.gif'"
								   	style="cursor:hand"/>
								</td>
							</form>
						<%
							}
							else{
						%>
							<td align="center">－－</td>
						<%
							}
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
		%>
			   <font color="red" size="3">
			   	<center>没有查找到相关书籍。</center>			   
			   </font> 
		<%
			 }
		%>
		</div>
</body>
</html>