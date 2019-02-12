function checkAddStu(){
	var stuNO = document.addStu.stuNO.value;
	var stuName = document.addStu.stuName.value;
	var age = document.addStu.age.value;
	var stuCalss = document.addStu.stuClass.value;
	var dep = document.addStu.dep.value;
	if(stuNO.trim()==""){
		alert("學號不能為空！！！");
		return;
	}
	var rex = /^\d*$/;
	if(!rex.test(stuNO)){
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
		alert("系別不能為空！！！");
		return;
	}	
	if(dep.trim()==""){
		alert("系別不能為空！！！");
		return;
	}
	document.addStu.submit();	
}