<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="status" class="site.util.StatusBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
		<link href="<%=path%>/css/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript">
			function checkSearch(){
				var stuNO = document.smo.stuNO.value;
				if(stuNO==""){
					alert("請輸入學號！！！");
					return;
				}
				if(stuNO.trim()==""){
					alert("學號不能包含空格並且長度不得小於6位");
					return;
				}
				var reg = /^\d+$/;	<!-- 匹配數字字符串的正則式 -->
				if(!reg.test(stuNO)){
					alert("學號只能是數字類型！！！");
					return;
				}
				document.smo.submit();
			}
		</script>
</head>
<body>
		<div id="father">
		<!--  -->
		<%
		   	Vector<Vector<String>> v = (Vector<Vector<String>>)request.getAttribute("v");
		   	String url = "order_list.jsp";					//換頁使用
		   	if(v!=null&&v.size()!=0){
		%><br>
		<table width="90%" align="center" border="0">
			<tr>
				<td>				
				<table style="background:url(<%=path%>/images/search.jpg) no-repeat" border="0" height="40" width="100%">
				  <form name="smo" action="<%=path%>/student/searchorder.do" method="post"><tr>
				    <td width="28%">
				   &nbsp;<input name="stuNO" id="st" value="請輸入學號搜索" style="border:0"
				      		 size="23" onfocus="document.all.st.value=''"/>		    
				    </td>
				    <td width="100" align="left">
					   <img src="<%=path%>/images/sstp.jpg" id="mg" border="0"
					      style="cursor:hand"
					      onclick="checkSearch()"
					      onmousedown="document.all.mg.src='<%=path%>/images/ssax.jpg'"
					      onmouseup="document.all.mg.src='<%=path%>/images/sstp.jpg'"
					      onmouseout="document.all.mg.src='<%=path%>/images/sstp.jpg'"/>
				    </td>		     	
				    <input type="hidden" name="action" value="sarchMyOrder">
				  </tr></form>
				</table>
					<!--  
					<table height="40" 
						style="background:url(images/search.jpg) no-repeat">
						<form name="smo" action="StudentServlet" method="post">	
						<tr>							
							<td>&nbsp;
								<input type="text" name="stuNO" size="23"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img src="images/sstp.jpg" id="ss" onclick="checkSearch()"
								  	onmousedown="document.all.ss.src='images/ssax.jpg'"
								   	onmouseup="document.all.ss.src='images/sstp.jpg'"
								    onmouseout="document.all.ss.src='images/sstp.jpg'"
									style="cursor:hand">
								<input type="hidden" name="action" value="sarchMyOrder">
							</td>
								
						</tr></form>			
					</table>-->
				</td>
			</tr>
			<tr>
				<td>
					<table border="0" bgcolor="black" align="center" width="100%" cellspacing="1">
						<th bgcolor="#D1D1E6">學號</th>
						<th bgcolor="#D1D1E6">班級</th>				
						<th bgcolor="#D1D1E6">預訂書名</th>
						<th bgcolor="#D1D1E6">作者</th>
						<th bgcolor="#D1D1E6">圖書編號</th>
						<th bgcolor="#D1D1E6">截止日期</th>
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
							</tr>
						<%
						    }
						%>
					</table>
					<%@ include file="navgation.jsp" %>
				</td>
			</tr>		
		</table>	
	<%
	   	}
	   	else{
	%><br><br><br><br><br><br><br><center>
		<font color="red" size="3">提示：預訂列表為空</font>
	<% 
		}
	 %>
	</div>
</body>
</html>