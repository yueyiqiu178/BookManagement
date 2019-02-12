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
		<script language="JavaScript">
			function checkReset(){
				var adID = document.resetPwd.adID.value;
				var adPwd = document.resetPwd.adPwd.value;
				if(adID.trim()==""){
					alert("管理員名不得為空！！！");
					return;
				}
				if(adPwd.trim().length<6){
					alert("管理員密碼不得包含空格且長度不得小於6");
					return;
				}
				document.resetPwd.submit();
			}
		</script>
</head>
<body>
<div id="Menu">
			<%@ include file="adm_left_menu.jsp" %>
		</div>
		<div id="info_table">			
			<div id="ad_manage"><font size="4"><center>重置密碼			
			<form name="resetPwd" action="<%=path%>/manage/resetpwd_post.do" method="post">
			<table>
				<tr>
					<td align="right">管理員ID：</td>
					<td align="left">
						<input name="adID" type="text" size="20">
					</td>
				</tr>
				<tr>
					<td align="right">管理員密碼：</td>
					<td align="left">
						<input name="adPwd" type="text" size="20">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<!-- <input type="button" value="提交" onclick="checkReset()"/> -->
						<img src="<%=path%>/images/tjaa.gif" id="tja" onclick="checkReset()" 
								onmouseover="document.all.tja.src='<%=path%>/images/tjbb.gif'"
							 	onmouseout="document.all.tja.src='<%=path%>/images/tjaa.gif'"
							  	onmousedown="document.all.tja.src='<%=path%>/images/tjcc.gif'"
							   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="action" value="reset_admin_pwd"/>
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
						<font color="red" size="3">
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