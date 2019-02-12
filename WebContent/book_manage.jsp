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
		<script language="JavaScript" src="<%=path%>/js/add_book.js"></script>
</head>
<body>
<div id="Menu">
			<%@ include file="book_left_menu.jsp" %>
		</div>		
		<div id="info_table"><br>			
			<div id="stuInfo"><br><br><font size="3">添加圖書<br><br>
				<form name="addBook" action="<%=path%>/manage/addboook_post.do" method="post">
					<table border="0" align="center">
						<tr>
							<td align="right">圖書編號</td>
							<td><input type="text" name="bNO" value="123456" /></td>
						</tr>
						<tr>
							<td align="right">圖書名稱</td>
							<td><input type="text" name="bName" value="新竹市" /></td>
						</tr>
						<tr>
							<td align="right">作者：</td>
							<td><input type="text" name="author" value="貶幅霞" /></td>							
						</tr>
						<tr>
							<td align="right">出版社</td>
							<td><input type="text" name="publish" value="遠流" /></td>
						</tr>
						<tr>
							<td align="right">ISBN號</td>
							<td><input type="text" name="isbn" value="65464654654" /></td>
						</tr>
						<tr>
							<td align="right">價格</td>
							<td><input type="text" name="price" value="100.854" /></td>
						</tr>
						<tr>
							<td><input type="hidden" name="action" value="add_book"></td>
							<td>
								<!-- <input type="button" value="添加" onclick="checkAddBook()"> -->
								<img src="<%=path%>/images/tja.gif" id="tj" onclick="checkAddBook()" 
									onmouseover="document.all.tj.src='<%=path%>/images/tjb.gif'"
								 	onmouseout="document.all.tj.src='<%=path%>/images/tja.gif'"
								  	onmousedown="document.all.tj.src='<%=path%>/images/tjc.gif'"
								   	style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <input type="reset" value="重置"> -->
								<img src="<%=path%>/images/qka.gif" id="qk" onclick="reset()" 
									onmouseover="document.all.qk.src='<%=path%>/images/qkb.gif'"
								 	onmouseout="document.all.qk.src='<%=path%>/images/qka.gif'"
								  	onmousedown="document.all.qk.src='<%=path%>/images/qkc.gif'"
								   	onmouseup="document.all.qk.src='<%=path%>/images/qkb.gif'"
								  	style="cursor:hand" >
							</td>
						</tr>
					</table>
				</form>
			<% 
				String message = (String)request.getAttribute("message");
				if(message!=null){
			%>
				<center><font color="red" size="3"><%= message %></font></center>
			<%
				}
			 %>
			</div>
			<div id="message">提示：<br><br>
				<li>輸入圖書信息請認真填寫</li><br><br>
				<li>圖書編號和ISBN號應為數字組成，不得包含其他字符</li><br><br>
				<li>添加圖書後，圖書的購進時間默認為當前日期，狀態為在館</li><br><br>				
			</div>
		</div>
</body>
</html>