function checkAddStu(){
	var stuNO = document.addStu.stuNO.value;
	var stuName = document.addStu.stuName.value;
	var age = document.addStu.age.value;
	var stuCalss = document.addStu.stuClass.value;
	var dep = document.addStu.dep.value;
	if(stuNO.trim()==""){
		alert("ѧ�Ų���Ϊ�գ�����");
		return;
	}
	var rex = /^\d*$/;
	if(!rex.test(stuNO)){
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
		alert("ϵ����Ϊ�գ�����");
		return;
	}	
	if(dep.trim()==""){
		alert("ϵ����Ϊ�գ�����");
		return;
	}
	document.addStu.submit();	
}