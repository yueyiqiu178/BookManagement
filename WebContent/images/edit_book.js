function checkEditBook(){
	var bNO = document.editBook.newNO.value;
	var bName = document.editBook.bName.value;
	var author = document.editBook.author.value;
	var publish = document.editBook.publish.value;
	var isbn = document.editBook.isbn.value;
	var price = document.editBook.price.value;
	if(bNO.trim()==""){
		alert("ͼ���Ų���Ϊ�գ�����");
		return;
	}
	var reg = /^\d*$/;
	if(!reg.test(bNO)){
		alert("ͼ���Ÿ�ʽ����ȷ������");
		return;
	}
	if(bName.trim()==""){
		alert("ͼ�����Ʋ���Ϊ�գ�����");
		return;
	}
	if(author.trim()==""){
		alert("���߲���Ϊ�գ�����");
		return;
	}
	if(publish.trim()==""){
		alert("�����粻��Ϊ�գ�����");
		return;
	}
	if(isbn.trim()==""){
		alert("ISBN�Ų���Ϊ�գ�����");
		return;
	}
	if(!reg.test(isbn)){
		alert("ISBN�Ÿ�ʽ����ȷ������");
		return;
	}
	if(price.trim()==""){
		alert("ͼ��۸���Ϊ�գ�����");
		return;
	}
	var rex = /^\d{1,3}(\.\d{1,2})?$/;
	if(!rex.test(price)){
		alert("�۸��ʽ���ԣ�����");
		return;
	}
	document.editBook.submit();
}