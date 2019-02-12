function checkAdChangePwd(){
	var oldPwd = document.adChangePwd.oldPwd.value;
	var newPwd = document.adChangePwd.newPwd.value;
	var newPwdAgain = document.adChangePwd.newPwdAgain.value;
	if(oldPwd==""){
		alert("舊密碼為空！！！");
		adChangePwd.oldPwd.value="";
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.oldPwd.focus();
		return;
	}
	if(oldPwd.trim().length<6){
		alert("舊密碼不得包含空格且長度不得小於6位！！！");
		adChangePwd.oldPwd.value="";
		adChangePwd.oldPwd.focus();
		return;
	}
	if(newPwd==""){
		alert("新密碼為空！！！");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	if(newPwd.trim().length<6){
		alert("新密碼不得包含空格且長度不得小於6位！！！");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	if(newPwd!=newPwdAgain){
		alert("兩次輸入密碼不一致！！！");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	document.adChangePwd.submit();			   
}