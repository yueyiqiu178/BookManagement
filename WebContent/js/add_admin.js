function checkAddAdmin(){
	var adID = document.addAdmin.adID.value;
	var adPwd = document.addAdmin.adPwd.value;
	if(adID.trim()==""){
		alert("管理員名不得為空！！！");
		addAdmin.adID.value="";
		addAdmin.adPwd.value="";
		addAdmin.adID.focus();
		return;
	}
	if(adID.trim().length<3){
		alert("管理員名不得包含空格且長度不得小於3位！！！");
		addAdmin.adID.value="";
		addAdmin.adPwd.value="";
		addAdmin.adID.focus();
		return;
	}
	if(adPwd==""){
		alert("管理員密碼為空！！！");
		addAdmin.adPwd.value="";	
		addAdmin.adPwd.focus();
		return;
	}
	if(adPwd.trim().length<6){
		alert("管理員密碼不得包含空格且長度不得小於6位！！！");
		addAdmin.adPwd.value="";
		addAdmin.adPwd.focus();
		return;
	}
	document.addAdmin.submit();
}