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
		<tr><th>작성 시각</th><td>${post.created }</td></tr>
		<tr><th>제목</th><td>${post.title }</td></tr>
		<tr><th>작성자</th><td>${post.writer }</td></tr>
		<tr><th>내용</th><td>${post.content }</td></tr>
	</table>
	<a href='newpost?seqno=${post.seqbbs }'>수정</a>&nbsp;<a href='delete?seqno=${post.seqbbs }'>삭제</a>
</body>
</html>