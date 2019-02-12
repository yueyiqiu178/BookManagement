<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<jsp:useBean id="status" class="site.util.StatusBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="<%=path%>/trim.js"></script>
<link href="<%=path%>/css/div.css" type="text/css" rel=stylesheet> 	
<link href="<%=path%>/css/globalstyle.css" type="text/css" rel=stylesheet>
<script language="JavaScript">
 		function show(search){
 			if(search=="simple"){
 				document.getElementById(search).style.display='block'; 
 				document.getElementById('complex').style.display='none';			
 			}
 			if(search=="complex"){
 				document.getElementById(search).style.display='block';
 				document.getElementById('simple').style.display='none';	 			
 			}
 		}
 		
 		function submit_s(){
 			document.jd.submit();
 		}
 		
 		function submit_c(){
 			document.fz.submit();
 		}
 		
</script>
</head>
<body>
<div id="father">
 		<div id="condition">搜索方式：
 			<input type="radio" name="tj" checked="true" onclick="show('simple')">簡單搜索
			<input type="radio" name="tj" onclick="show('complex')">復雜搜索
 		</div>					
 		<div id="search">
			<form name="jd" action="<%=path%>/student/querybooksimple.do" method="post">
				<table border="0" id="simple">
					<tr>
						<td align="right">請輸入關鍵字：</td>
						<td><input type="text" name="key"/></td>
					</tr>
					<tr>
						<td align="right">選擇查詢條件：</td>
						<td>
							<select name="condition">
								<option value="BookName" selected>書名</option>
								<option value="Author" size="5">作者</option>
								<option value="Publish">出版社</option>
								<option value="BookIsbn">ISBN號</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img id="ssa" src="<%=path%>/images/ssa.gif" onclick="submit_s()"
							  	onmouseover="document.all.ssa.src='<%=path%>/images/ssb.gif'"
							   	onmouseout="document.all.ssa.src='<%=path%>/images/ssa.gif'"
							    onmousedown="document.all.ssa.src='<%=path%>/images/ssc.gif'"
							    style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!--<input type="submit" value="檢索"/>  
							<input type="reset" value="重置">-->
							<img src="<%=path%>/images/qka.gif" id="qka" onclick="reset()" 
								onmouseover="document.all.qka.src='<%=path%>/images/qkb.gif'"
							 	onmouseout="document.all.qka.src='<%=path%>/images/qka.gif'"
							  	onmousedown="document.all.qka.src='<%=path%>/images/qkc.gif'"
							   	onmouseup="document.all.qka.src='<%=path%>/images/qkb.gif'"
							  	style="cursor:hand" >
						</td>
					</tr>
				</table>
			</form>
			<form name="fz" action="<%=path%>/student/querybookcomplex.do" method="post">
				<table border="0" id="complex" style="display:none;">
					<tr>
						<td align="right">書名：</td>
						<td><input type="text" name="BookName" size="24" value="Ant" /></td>
					</tr>
					<tr>
						<td align="right">作者：</td>
						<td><input type="text" name="Author" size="24" value="Steve" /></td>
					</tr>
					<tr>
						<td align="right">出版社：</td>
						<td><input type="text" name="Publish" size="24" value="电子工业" /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img id="ss" src="<%=path%>/images/ssa.gif" onclick="submit_c()"
							  	onmouseover="document.all.ss.src='<%=path%>/images/ssb.gif'"
							   	onmouseout="document.all.ss.src='<%=path%>/images/ssa.gif'"
							    onmousedown="document.all.ss.src='<%=path%>/images/ssc.gif'"
							    style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
 		</div>
 		<div id="message">
 		 提示：
 		  <ul>
	 		  <li>圖書檢索在關鍵字文本框輸入關鍵字</li><br/><br/>
	 		  <li>查找方式默認為模糊搜索</li><br/><br/>
	 		  <li>關鍵字為空則默認搜索所有圖書</li><br/><br/>
	 		  <li>可在條件列表框中選擇不同查找條件進行查找</li>
 		  </ul>
 		</div>
</div>
</body>
</html>