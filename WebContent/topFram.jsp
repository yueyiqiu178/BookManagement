<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="images/navigation.css" type="text/css" rel="stylesheet">
   <link href="images/globalstyle.css" type="text/css" rel=stylesheet>
   <script language="JavaScript">
        function myMouseOver(xx){
           eval("document.all."+xx+".className='moverbutton';");
        }
        function myMouseOut(xx){
           eval("document.all."+xx+".className='mbutton';");
        }
    </script>
</head>
<body bgcolor="#FEFFE1">
 	<table border="0" width="100%">
 		<tr>
 			<td width="40"><img src="images/ico.png" width="40" height="40"></td>
 			<td><span style="vertical-align:middle">
 				<font color="black" size="5">圖書管理系統</font>
 			</span></td>
 		</tr>
 		<tr><td colspan="2" align="right"><hr size="1" width="100%">
 		</td></tr>
 	</table> 	
	<table  border="0" width="100%" bgcolor="#006000">
		<tr height="%16">
			<td width="10%">
				<a id="button1" class="mbutton" href="login.jsp" target="bottomFrame"
					onMouseOut="myMouseOut('button1')" onMouseOver="myMouseOver('button1');">登錄系統</a>
			</td>
			<td width="10%">
				<a id="button2" class="mbutton" href="<%=path%>/student/stuinfo.do" target="bottomFrame"
					onMouseOut="myMouseOut('button2')" onMouseOver="myMouseOver('button2');">讀者訊息</a>
			</td>
			<td width="10%">
				<a id="button3" class="mbutton" href="<%=path%>/student/borrowbook.do" target="bottomFrame" 
					onMouseOut="myMouseOut('button3')" onMouseOver="myMouseOver('button3');">書本借閱</a>
			</td>
			<td width="10%">
				<a id="button4" class="mbutton" href="<%=path%>/student/inform.do" target="bottomFrame" 
					onMouseOut="myMouseOut('button4')"	onMouseOver="myMouseOver('button4');">預約通知</a>
			</td>
			<td width="10%">
				<a id="button5" class="mbutton" href="<%=path%>/query_book.jsp" target="bottomFrame" 
					onMouseOut="myMouseOut('button5')" onMouseOver="myMouseOver('button5');">書刊檢索</a>
			</td>
			<td></td>
		</tr>
  	</table>
  </body>
</html>