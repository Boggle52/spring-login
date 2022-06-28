<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<form method=POST action="user_check">
<h1>Login</h1>
<input type=text name=userid><br>
<input type=password name=pwd><br>
<input type=submit value='로그인'>
</form>
</body>
</html>