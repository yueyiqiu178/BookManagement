function checkEditStu(){
	var newNO = document.editStu.newNO.value;
	var stuName = document.editStu.stuName.value;
	var age = document.editStu.age.value;
	var stuCalss = document.editStu.stuClass.value;
	var dep = document.editStu.dep.value;
	if(newNO.trim()==""){
		alert("學號不能為空！！！");
		return;
	}
	var rex = /^\d*$/;
	if(!rex.test(newNO)){
		alert("學號只能由數字組成！！！");
		return;
	}
	if(stuName.trim()==""){
		alert("姓名不能為空！！！");
		return;
	}	
	if(age.trim()==""){
		alert("年齡不能為空！！！");
		return;
	}
	var reg = /^\d{1,2}$/;		
	if(!reg.test(age)){
		alert("年齡格式不對！！！");
		return;
	}
	if(stuCalss.trim()==""){
		alert("班級不能為空！！！");
		return;
	}
	if(dep.trim()==""){
		alert("系別不能為空！！！");
		return;
	}
	document.editStu.submit();	
}