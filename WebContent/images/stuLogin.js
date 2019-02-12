function checkUser(){
    var uname = document.login.uname.value;//得到輸入的登錄名
    var pwd = document.login.pwd.value;    //得到輸入的密碼   
	if(uname.trim()==""){				   //用戶名為空的情況	
		alert("請填寫用戶名！！！");		   //彈出提示對話框
        login.uname.focus();			   //用戶名文本框得到輸入焦點
        return;					   		   //返回	
	}
	if(pwd==""){			   			   //密碼為空的情況
		alert("請填寫密碼！！！");	       //彈出提示對話框
		login.pwd.value="";				   //將密碼框清空
        login.pwd.focus();				   //密碼文本框得到輸入焦點
        return;					   		   //返回
	}
	if(pwd.trim().length<6){
    	alert("密碼不能包含空格且長度不得小於6位！！！");
    	login.pwd.value="";					//將密碼框清空
    	login.pwd.focus();					//密碼框得到輸入焦點
    	return;								//返回
	}
	document.login.submit();			   //提交登陸表單
}