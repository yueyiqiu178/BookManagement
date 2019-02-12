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
				<li><a href="<%=path%>/student/borrowbook.do">當前借閱</a></li>
				<li><a href="<%=path%>/student/borrowhistory.do">歷史借閱</a></li>
				<li><a href="<%=path%>/student/borrowlost.do">圖書丟失</a></li>
				<li><a href="<%=path%>/student/borrowfine.do">罰款記錄</a></li>
				<li><a href="<%=path%>/student/borrowdebt.do">欠款狀態</a></li>
				<li><a href="<%=path%>/lost_card.jsp">讀者掛失</a></li>				
			</ul>
		</div>
</body>
</html>