function checkStuChangePwd(){
	var oldPwd = document.stuChangePwd.oldPwd.value;
	var newPwd = document.stuChangePwd.newPwd.value;
	var newPwdAgain = document.stuChangePwd.newPwdAgain.value;
	if(oldPwd==""){
		alert("������Ϊ�գ�����");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}
	if(oldPwd.trim().length<6){
		alert("�����벻�ð����ո��ҳ��Ȳ���С��6λ������");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}
	if(newPwd==""){
		alert("������Ϊ�գ�����");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	if(newPwd.trim().length<6){
		alert("�����벻�ð����ո��ҳ��Ȳ���С��6λ������");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	if(newPwd!=newPwdAgain){
		alert("�����������벻һ�£�����");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	document.stuChangePwd.submit();			   
}