<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
<form id=frmSignin method=get action="user_signin">
����� ���̵�:<input type=text name=userid value='${user_id }'><br>
��й�ȣ:<input type=password name=pwd  id=pwd><br>
��й�ȣ Ȯ��:<input type=password name=pwd1 id=pwd1><br>
<input type=submit value='ȸ������'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('submit','#frmSignin',function(){
	if($('#pwd').val()!=$('#pwd1').val()){
		alert('��й�ȣ�� Ȯ���Ͻʽÿ�.')
		return false
	}
	return true
})
</script>
</html>