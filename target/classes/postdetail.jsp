<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	table {border-collapse:collapse}
	th, td {border:1px solid black}
</style>
<body>
	<input type=hidden value=${post.seqbbs }>
	<table>
		<tr><th>�ۼ� �ð�</th><td>${post.created }</td></tr>
		<tr><th>����</th><td>${post.title }</td></tr>
		<tr><th>�ۼ���</th><td>${post.writer }</td></tr>
		<tr><th>����</th><td>${post.content }</td></tr>
	</table>
	<a href='newpost?seqno=${post.seqbbs }'>����</a>&nbsp;<a href='delete?seqno=${post.seqbbs }'>����</a>
</body>
</html>