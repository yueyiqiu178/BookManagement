function checkAddBook(){
	var bNO = document.addBook.bNO.value;
	var bName = document.addBook.bName.value;
	var author = document.addBook.author.value;
	var publish = document.addBook.publish.value;
	var isbn = document.addBook.isbn.value;
	var price = document.addBook.price.value;
	if(bNO.trim()==""){
		alert("圖書編號不得為空！！！");
		return;
	}
	var reg = /^\d*$/;
	if(!reg.test(bNO)){
		alert("圖書編號格式不正確！！！");
		return;
	}
	if(bName.trim()==""){
		alert("圖書名稱不能為空！！！");
		return;
	}
	if(author.trim()==""){
		alert("作者不能為空！！！");
		return;
	}
	if(publish.trim()==""){
		alert("出版社不能為空！！！");
		return;
	}
	if(isbn.trim()==""){
		alert("ISBN號不能為空！！！");
		return;
	}
	if(!reg.test(isbn)){
		alert("ISBN號格式不正確！！！");
		return;
	}
	if(price.trim()==""){
		alert("圖書價格不能為空！！！");
		return;
	}
	var rex = /^\d{1,3}(\.\d{1,2})?$/;
	if(!rex.test(price)){
		alert("價格格式不對！！！");
		return;
	}
	document.addBook.submit();
}