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
	th, td {border:1px solid black}
</style>
<body align=center>
	
	<%-- <p>${statusLine }</p>
	<p>${newbutton }</p> --%>
	
	<c:if test="${userinfo=='' }">
		<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>SignUp</a>
	</c:if>
	<c:if test="${userinfo!='' }">
		<p align=right>${userinfo }&nbsp;<a href='logout'>Logout</a>
	</c:if>
	<h1>Hello World</h1>
	
 	<table align=center>
		<tr><th>�ۼ� �ð�</th><th>����</th><th>�ۼ���</th></tr>
		<c:forEach var="p" items="${plist }">
			<tr><td>${p.created }</td><td><a href='post?seqbbs=${p.seqbbs }'>${p.title }</a></td>
				<td>${p.writer }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<c:if test="${userinfo!='' }">
		<a href='newpost'>�۾���</a>
	</c:if>
</body>
</html>
