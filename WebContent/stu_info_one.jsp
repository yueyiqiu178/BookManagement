<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		   	String message = (String)request.getAttribute("message");
		   	if(message!=null){
		%><br><br><br><br>
			<center><%= message %></center>
		<%
		   	}
		%>
		</div>
</body>
</html>