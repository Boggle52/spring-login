<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
	table {border-collapse:collapse}
	th, td {border:1px solid blue}
</style>
<body align=center>
	
	<%-- <p>${statusLine }</p>
	<p>${newbutton }</p> --%>
	
	<c:if test="${userinfo=='' }">
	<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>
	</c:if>
	<c:if test="${userinfo!='' }">
	<p align=right>${userinfo }&nbsp;<a href='logout'>Logout</a>
	</c:if>
	<h1>Hello World</h1>
	
	<table align=center>
		<tr><th>�ۼ� �ð�</th><th>����</th><th>�ۼ���</th><th>��ȸ��</th></tr>
		<tr><th>6�� 22��</th><th>aaaaa</th><th>������</th><th>100</th></tr>
		<tr><th>6�� 23��</th><th>bbbbb</th><th>��Ŀ��</th><th>200</th></tr>
	</table>
	<br>
	<c:if test="${userinfo!='' }">
	<a href='newpost'>�۾���</a>
	</c:if>
	
</body>
</html>
