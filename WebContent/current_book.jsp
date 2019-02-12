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
		<script language="JavaScript">
			function confirmLost(sb){
			  if(confirm("確定掛失？？？")){
			  	sb.submit();
			  }
			}
			function confirmXuJie(sb){
			  if(confirm("確定續借？？？")){
			  	sb.submit();
			  }
			}
		</script>
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
		<%= stuName %>，您當前借閱書籍列表如下：<br/><br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="100%">
				<th bgcolor="#D1D1E6">編號</th>
				<th bgcolor="#D1D1E6">名稱</th>
				<th bgcolor="#D1D1E6">作者</th>
				<th bgcolor="#D1D1E6">出版社</th>
				<th bgcolor="#D1D1E6">借出日期</th>
				<th bgcolor="#D1D1E6">應還日期</th>				
				<th bgcolor="#D1D1E6">續借</th>
				<th bgcolor="#D1D1E6">掛失</th>
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
						<form id="xjts<%=i%>" action="<%=path%>/student/conbook.do" method="post">
							<input type="hidden" name="action" value="xujie"/>
							<input type="hidden" name="borrowNO" value="<%=vtemp.get(6)%>"/>						
							<td align="center">
							<!-- <input type="submit" value="續借"/> -->	
							<img src="<%=path%>/images/xja.gif" id="xj<%=i%>" onclick="confirmXuJie(document.all.xjts<%=i%>)" 
								onmouseover="document.all.xj<%=i%>.src='<%=path%>/images/xjb.gif'"
							 	onmouseout="document.all.xj<%=i%>.src='<%=path%>/images/xja.gif'"
							  	onmousedown="document.all.xj<%=i%>.src='<%=path%>/images/xjc.gif'"
							   	style="cursor:hand"/>	
							</td>
						</form>
						<form id="gsts<%=i%>" action="<%=path%>/student/lostbook.do" method="post">
							<input type="hidden" name="action" value="guashi"/>
							<input type="hidden" name="loseNO" value="<%=vtemp.get(6)%>"/>
							<td align="center">
							<!-- <input type="submit" value="掛失"/> -->
							<img src="<%=path%>/images/gsa.gif" id="gs<%=i%>" onclick="confirmLost(document.all.gsts<%=i%>)" 
								onmouseover="document.all.gs<%=i%>.src='<%=path%>/images/gsb.gif'"
							 	onmouseout="document.all.gs<%=i%>.src='<%=path%>/images/gsa.gif'"
							  	onmousedown="document.all.gs<%=i%>.src='<%=path%>/images/gsc.gif'"
							   	style="cursor:hand"/>		
							</td>
						</form>
					</tr>
				<%
				    }
				%>
			</table>
		<%
		   	}
		   	else{
		%><br><br>
			<center><font color="red" size="3">
				<%= stuName %>，您當前還沒有借閱書籍。
			</font></center>
		<% 
			}
		 %>
		</div>
</body>
</html>