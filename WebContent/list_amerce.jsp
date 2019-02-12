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
		<script language="JavaScript">
			function handIn(sb){
			 	if(confirm("確定交納？？？")){
			 		sb.submit();
			 	}
			}		
		</script>
</head>
<body>
		<div id="Menu">
			<%@ include file="borrow_left_menu.jsp" %>
		</div>		
		<div id="info_table">
		<%
			String stuName = (String)request.getAttribute("stuName");
		   	Vector<Vector<String>> va = (Vector<Vector<String>>)request.getAttribute("va");
		   	Vector<Vector<String>> vb = (Vector<Vector<String>>)request.getAttribute("vb");
		   	String message = (String)request.getAttribute("message");
		   	System.out.println(message);
		   	if((va!=null&&va.size()!=0)||(vb!=null&&vb.size()!=0)){
		%>
		<%= stuName %>，您當前欠款記錄如下：<br/><br/>
			<table border="0" bgcolor="black" align="center" cellspacing="1" width="90%">
				<tr bgcolor="white">
					<td align="center" colspan="5">以下是應繳罰款</td>
				</tr>
				<th bgcolor="#D1D1E6">欠款書名</th>
				<th bgcolor="#D1D1E6">欠款項目</th>
				<th bgcolor="#D1D1E6">借出日期</th>
				<th bgcolor="#D1D1E6">應還日期</th>				
				<th bgcolor="#D1D1E6">欠款金額</th>
				<%
					double totala = 0.0;			//記錄未交罰款的總額
					for(int i=0;i<va.size();i++){
						Vector<String> vtemp = va.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td align="left"><%= vtemp.get(0) %></td>
						<td align="center"><%= vtemp.get(1) %></td>
						<td align="center"><%= vtemp.get(2) %></td>
						<td align="center"><%= vtemp.get(3) %></td>
						<form name="jnfk<%=i%>" action="<%=path%>/manage/amerce.do" method="post">
							<input type="hidden" name="action" value="amerce">							
						<td align="right"><span style="vertical-align:middle">
							<%= vtemp.get(4) %></span>
							<input type="hidden" name="AmerceNO" value="<%=vtemp.get(5)%>">
							<!-- <input type="submit" value="繳納"> -->
							<img src="<%=path%>/images/jna.gif" id="jn<%=i%>" onclick="handIn(document.all.jnfk<%=i%>)" 
								onmouseover="document.all.jn<%=i%>.src='<%=path%>/images/jnb.gif'"
							 	onmouseout="document.all.jn<%=i%>.src='<%=path%>/images/jna.gif'"
							  	onmousedown="document.all.jn<%=i%>.src='<%=path%>/images/jnc.gif'"
							   	style="cursor:hand"/>								
						</td>
						</form>
					</tr>
				<% 
					totala = totala+Double.parseDouble(vtemp.get(4));
					totala = Math.round(totala*100)/100.0;
				    }
				%>
					<tr bgcolor="white">
						<td colspan="4" align="right">金額總計</td>
						<td>
							<font color="red" size="2.5"/><%= totala %>￥
						</td>
					</tr>
					<tr bgcolor="white">
						<td align="center" colspan="5">
							以下是當前借閱超期罰款請通知該生還書</td>
					</tr>					
				<%
					double totalb = 0.0;			//記錄未交罰款的總額
					for(int i=0;i<vb.size();i++){
						Vector<String> vtemp = vb.get(i);
				%>
					<tr bgcolor=<%= i%2==0?"#F0F7FF":"#FFF8F0" %>>
						<td align="center"><%= vtemp.get(0) %></td>
						<td align="center"><%= vtemp.get(1) %></td>
						<td align="center"><%= vtemp.get(2) %></td>
						<td align="center"><%= vtemp.get(3) %></td>
						<td align="center"><%= vtemp.get(4) %></td>
					</tr>
				<% 
					totalb = totalb+Double.parseDouble(vtemp.get(4));
					totalb = Math.round(totalb*100)/100.0;
				    }
				%>
					<tr bgcolor="white">
						<td colspan="4" align="right">金額總計</td>
						<td>
							<font color="red" size="2.5"/><%= totalb %>￥
						</td>
					</tr>
			</table>
		<%
		   	}
		   	else{
				if(message==null){
		%>
			<br><br><br><center><font size="3">該生沒有欠款	
		<%
				}
			}
			if(message!=null){
		%>
			<br><br><br><center><font size="3"><%= message %>
		<%
			}
		%>	
		</div>
</body>
</html>