function checkAdmin(){
    var uname = document.login.uname.value;//�õ�����ĵ�¼��
    var pwd = document.login.pwd.value;    //�õ����������   
	if(uname.trim()==""){				   //�û���Ϊ�յ����	
		alert("����д�û���������");		   //������ʾ�Ի���
        login.uname.focus();			   //�û����ı���õ����뽹��
        return;					   		   //����	
	}
	if(pwd==""){			   			   //����Ϊ�յ����
		alert("����д���룡����");	       //������ʾ�Ի���
		login.pwd.value="";				   //����������
        login.pwd.focus();				   //�����ı���õ����뽹��
        return;					   		   //����
	}
	if(pwd.trim().length<6){
    	alert("���벻�ܰ����ո��ҳ��Ȳ���С��6λ������");
    	login.pwd.value="";					//����������
    	login.pwd.focus();					//�����õ����뽹��
    	return;								//����
	}
	document.login.submit();			   //�ύ��½��
}