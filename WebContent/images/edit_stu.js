function checkEditStu(){
	var newNO = document.editStu.newNO.value;
	var stuName = document.editStu.stuName.value;
	var age = document.editStu.age.value;
	var stuCalss = document.editStu.stuClass.value;
	var dep = document.editStu.dep.value;
	if(newNO.trim()==""){
		alert("ѧ�Ų���Ϊ�գ�����");
		return;
	}
	var rex = /^\d*$/;
	if(!rex.test(newNO)){
		alert("ѧ��ֻ����������ɣ�����");
		return;
	}
	if(stuName.trim()==""){
		alert("��������Ϊ�գ�����");
		return;
	}	
	if(age.trim()==""){
		alert("���䲻��Ϊ�գ�����");
		return;
	}
	var reg = /^\d{1,2}$/;		
	if(!reg.test(age)){
		alert("�����ʽ���ԣ�����");
		return;
	}
	if(stuCalss.trim()==""){
		alert("�༶����Ϊ�գ�����");
		return;
	}
	if(dep.trim()==""){
		alert("ϵ����Ϊ�գ�����");
		return;
	}
	document.editStu.submit();	
}