function checkAddAdmin(){
	var adID = document.addAdmin.adID.value;
	var adPwd = document.addAdmin.adPwd.value;
	if(adID.trim()==""){
		alert("����Ա������Ϊ�գ�����");
		addAdmin.adID.value="";
		addAdmin.adPwd.value="";
		addAdmin.adID.focus();
		return;
	}
	if(adID.trim().length<3){
		alert("����Ա�����ð����ո��ҳ��Ȳ���С��3λ������");
		addAdmin.adID.value="";
		addAdmin.adPwd.value="";
		addAdmin.adID.focus();
		return;
	}
	if(adPwd==""){
		alert("����Ա����Ϊ�գ�����");
		addAdmin.adPwd.value="";	
		addAdmin.adPwd.focus();
		return;
	}
	if(adPwd.trim().length<6){
		alert("����Ա���벻�ð����ո��ҳ��Ȳ���С��6λ������");
		addAdmin.adPwd.value="";
		addAdmin.adPwd.focus();
		return;
	}
	document.addAdmin.submit();
}