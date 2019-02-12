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
		<script language="JavaScript" src="<%=path%>/js/trim.js"></script>
		<script language="JavaScript" src="<%=path%>/js/edit_book.js"></script>
</head>
<body>
<% 
		Vector<Vector<String>> vtemp = 
				(Vector<Vector<String>>)request.getAttribute("v");
		Vector<String> v = vtemp.get(0);	//得到圖書信息
	 %>
		<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>
		<div id="info_table">
			<div id="stuInfo"><br><br><font size="3">修改圖書信息<br><br>
				<form name="editBook" action="<%=path%>/manage/savebook.do" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">圖書編號：</td>
							<td><input type="text" name="newNO" value="<%=v.get(0)%>"></td>
						</tr>
						<tr>
							<td align="right">圖書名稱：</td>
							<td><input type="text" name="bName" value="<%=v.get(1)%>"></td>
						</tr>
						<tr>
							<td align="right">作者：</td>
							<td><input type="text" name="author" value="<%=v.get(2)%>"></td>							
						</tr>
						<tr>
							<td align="right">出版社：</td>
							<td><input type="text" name="publish" value="<%=v.get(3)%>"></td>
						</tr>
						<tr>
							<td align="right">ISBN號：</td>
							<td><input type="text" name="isbn" value="<%=v.get(4)%>"></td>
						</tr>
						<tr>
							<td align="right">價格：</td>
							<td><input type="text" name="price" value="<%=v.get(5)%>"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="save_book">
							<input type="hidden" name="bNO" value="<%=v.get(0)%>"></td>
							<td>
								<!--<input type="button" value="保存" onclick="checkEditBook()">  -->
								<img src="<%=path%>/images/bca.gif" id="bc" onclick="checkEditBook()" 
									onmouseover="document.all.bc.src='<%=path%>/images/bcb.gif'"
								 	onmouseout="document.all.bc.src='<%=path%>/images/bca.gif'"
								  	onmousedown="document.all.bc.src='<%=path%>/images/bcc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <input type="reset" value="重置"> -->
								<img src="<%=path%>/images/cza.gif" id="cz" onclick="reset()" 
									onmouseover="document.all.cz.src='<%=path%>/images/czb.gif'"
								 	onmouseout="document.all.cz.src='<%=path%>/images/cza.gif'"
								  	onmousedown="document.all.cz.src='<%=path%>/images/czc.gif'"
								   	onmouseup="document.all.cz.src='<%=path%>/images/czb.gif'"
								  	style="cursor:hand" >	
							</td>
						</tr>
						<tr>
						<% 
							String message = (String)request.getAttribute("message");
							if(message!=null){
						%><br>
							<td colspan="2"><center><font color="red" size="2.5">
								<%= message %></center></td>
						<%
							}
						%>
						</tr>						
					</table>
				</form>
			</div>
			<div id="message">提示：<br><br>
				<li>輸入圖書信息請認真填寫</li><br><br>
				<li>圖書編號和ISBN號應為數字組成，不得包含其他字符</li><br><br>
				<li>添加圖書後，圖書的購進時間默認為當前日期，狀態為在館</li><br><br>					
			</div>
		</div>
</body>
</html>