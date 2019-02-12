<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="status" class="site.util.StatusBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/images/div.css" type="text/css" rel=stylesheet>
</head>
<body>
<div id="Nav">		
			<ul>
				<li><a href="<%=path%>/stu_manage.jsp">添加學生</a></li>
				<li><a href="<%=path%>/manage/liststu.do">學生列表</a></li>		
			</ul>
		</div>
</body>
</html>