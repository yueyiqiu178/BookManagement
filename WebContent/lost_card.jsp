<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
		<link href="<%=path%>/css/globalstyle.css" type="text/css" rel=stylesheet>
		<script language="JavaScript">
			function checkPwd(){
				var pwd = document.card.pwd.value;
				if(pwd==""){
					alert("密碼不能為空！！！");
					return;
				}
				if(pwd.trim()<6){
					alert("密碼不能包含空格且長度不得小與6位");
					return;
				}
				document.card.submit();
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="stu_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<center><br><br><font color="red">掛失後圖書證不可使用，需要管理員才能解除掛失狀態。</font>
			<br/><br/>確定要掛失嗎？
			請輸入密碼：
			<table border="0">		
			<form name="card" action="<%=path%>/student/lostcard.do" method="post">
				<tr>
					<td><input type="password" name="pwd"/></td>
					<td>
						<img src="<%=path%>/images/qda.gif" id="qd" onclick="checkPwd()" 
							onmouseover="document.all.qd.src='<%=path%>/images/qdb.gif'"
						 	onmouseout="document.all.qd.src='<%=path%>/images/qda.gif'"
						  	onmousedown="document.all.qd.src='<%=path%>/images/qdc.gif'"
						   	style="cursor:hand"/>
						<input type="hidden" name="action" value="gs">
					</td>
				</tr>		
			</form>
			</table>
			<% 
				String message = (String)request.getAttribute("message");
				String stuName = (String)session.getAttribute("stuName");
				if(message!=null){
			%>
				<%= stuName %>，借閱證<%= message %>
			<%
				}
			%>
			</center>
		</div> 
</body>
</html>