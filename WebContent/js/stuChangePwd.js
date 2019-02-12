function checkStuChangePwd(){
	var oldPwd = document.stuChangePwd.oldPwd.value;
	var newPwd = document.stuChangePwd.newPwd.value;
	var newPwdAgain = document.stuChangePwd.newPwdAgain.value;
	if(oldPwd==""){
		alert("舊密碼為空！！！");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}
	if(oldPwd.trim().length<6){
		alert("舊密碼不得包含空格且長度不得小於6位！！！");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}
	if(newPwd==""){
		alert("新密碼為空！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	if(newPwd.trim().length<6){
		alert("新密碼不得包含空格且長度不得小於6位！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	if(newPwd!=newPwdAgain){
		alert("兩次輸入密碼不一致！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	document.stuChangePwd.submit();			   
}