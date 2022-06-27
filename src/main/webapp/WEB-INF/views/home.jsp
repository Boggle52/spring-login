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
		<tr><th>작성 시각</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
		<tr><th>6월 22일</th><th>aaaaa</th><th>피터팬</th><th>100</th></tr>
		<tr><th>6월 23일</th><th>bbbbb</th><th>팅커벨</th><th>200</th></tr>
	</table>
	<br>
	<c:if test="${userinfo!='' }">
	<a href='newpost'>글쓰기</a>
	</c:if>
	
</body>
</html>
