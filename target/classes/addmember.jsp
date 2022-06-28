<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
td{border:1px solid blue}
</style>
<body>
<form id=frmAddMember method=POST action="addMember">
USER ID: <input type=text name=id><br>
Password: <input type=password name=pwd><br>
Password 확인: <input type=password name=pwd2><br>
이름: <input type=text name=name><br>
모바일: <input type=text name=mobile><br>
<input type=submit value='추가'>&nbsp;<input type=reset value='비우기'>
</form>
<table style='border-collapse:collapse'>
<tr><th>User ID</th><th>비밀번호</th><th>이름</th><th>모바일</th><th>가입일</th></tr>
<c:forEach var="m" items="${list }">
	<tr><td>${m.id}</td><td>${m.pwd }</td><td>${m.name }</td>
		<td>${m.mobile }</td><td>${m.joindate }</td></tr>
</c:forEach>
</table>
</body>
</html>