<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet>
<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
<script language="JavaScript" src="<%=path%>/js/adChangePwd.js"></script>
</head>
<body>
<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<div id="ad_manage"><font size="4"><center>修改密码
			<form name="adChangePwd" action="<%=path%>/manage/changepwd.do" method="post">
			<table>
				<tr>
					<td align="right">请输入旧密码：</td>
					<td align="left">
						<input name="oldPwd" type="password" size="20">
					</td>
				</tr>
				<tr>
					<td align="right">请输入新密码：</td>
					<td align="left">
						<input name="newPwd" type="password" size="20" value="111111" />
					</td>
				</tr>
				<tr>
					<td align="right">再次输入新密码：</td>
					<td align="left">
						<input name="newPwdAgain" type="password" size="20" value="111111" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!--<input type="button" value="修改" onclick="checkAdChangePwd()"/>  -->
						<img src="<%=path%>/images/xga.gif" id="xg" onclick="checkAdChangePwd()" 
								onmouseover="document.all.xg.src='<%=path%>/images/xgb.gif'"
							 	onmouseout="document.all.xg.src='<%=path%>/images/xga.gif'"
							  	onmousedown="document.all.xg.src='<%=path%>/images/xgc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;
						<input type="hidden" name="action" value="adChangePwd"/>						
						<!-- <input type="reset" value="清空"/> -->
						<img src="<%=path%>/images/qka.gif" id="qk" onclick="reset()" 
								onmouseover="document.all.qk.src='<%=path%>/images/qkb.gif'"
							 	onmouseout="document.all.qk.src='<%=path%>/images/qka.gif'"
							  	onmousedown="document.all.qk.src='<%=path%>/images/qkc.gif'"
							   	onmouseup="document.all.qk.src='<%=path%>/images/qkb.gif'"
							  	style="cursor:hand" >
					</td>
				</tr>
				<%
					String message = (String)request.getAttribute("message");
					if(message!=null){
				%>
				<tr>
					<td colspan="10">
						<font color="red" size="2">
							<center><%= message %></center></font>
					</td>
				</tr>
				<%
					}
				%>		
			</table>
			</form>
			</div>
		</div>
</body>
</html>