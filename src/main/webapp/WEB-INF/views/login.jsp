<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
</head>
<body>
<p align=right><a href='/member'>Home</a>
<form method=POST action="user_check">
<h1>Login</h1>
<input type=text name=userid><br>
<input type=password name=pwd><br>
<input type=submit value='�α���'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.ready(function(){
	if(${checkUser=='false'}){
		alert('���̵�� ��й�ȣ�� Ȯ���Ͻʽÿ�.')
	}
})
</script>
</html>