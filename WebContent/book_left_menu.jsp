<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="status" class="site.util.StatusBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
</head>
<body>
<div id="Nav">		
			<ul>
				<li><a href="<%=path%>/book_manage.jsp">添加圖書</a></li>
				<li><a href="<%=path%>/manage/listbook.do">圖書列表</a></li>				
			</ul>
		</div>
</body>
</html>