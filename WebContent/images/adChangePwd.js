function checkAdChangePwd(){
	var oldPwd = document.adChangePwd.oldPwd.value;
	var newPwd = document.adChangePwd.newPwd.value;
	var newPwdAgain = document.adChangePwd.newPwdAgain.value;
	if(oldPwd==""){
		alert("������Ϊ�գ�����");
		adChangePwd.oldPwd.value="";
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.oldPwd.focus();
		return;
	}
	if(oldPwd.trim().length<6){
		alert("�����벻�ð����ո��ҳ��Ȳ���С��6λ������");
		adChangePwd.oldPwd.value="";
		adChangePwd.oldPwd.focus();
		return;
	}
	if(newPwd==""){
		alert("������Ϊ�գ�����");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	if(newPwd.trim().length<6){
		alert("�����벻�ð����ո��ҳ��Ȳ���С��6λ������");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	if(newPwd!=newPwdAgain){
		alert("�����������벻һ�£�����");
		adChangePwd.newPwd.value="";
		adChangePwd.newPwdAgain.value="";
		adChangePwd.newPwd.focus();
		return;
	}
	document.adChangePwd.submit();			   
}