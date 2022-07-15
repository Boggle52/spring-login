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
	
	<c:if test="${username=='' }">
		<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>SignUp</a>
	</c:if>
	<c:if test="${username!='' }">
		<p align=right>${username }&nbsp;<a href='logout'>Logout</a>
	</c:if>
	<h1>Hello World</h1>
 	<table align=center>
		<tr><th>��ȣ</th><th>����</th><th>�ۼ���</th><th>�ۼ�����</th><th>�۾�</th></tr>
		<c:forEach var="p" items="${plist }">
			<tr><td>${p.seqbbs }</td><td><a href='post?seqbbs=${p.seqbbs }'>${p.title }</a></td>
				<td>${p.writer }</td><td>${p.created }</td>
				<c:if test="${username!=p.writer }">
					<td></td>
				</c:if>
				<c:if test="${username==p.writer }">
					<td><a id=a_update href="updatePost?seqbbs=${p.seqbbs }">����</a>&nbsp;
						<a id=a_del href="deletePost?seqbbs=${p.seqbbs }">����</a>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<br>
	<c:if test="${username!='' }">
		<a href='newpost'>�۾���</a>
	</c:if>
</body>
<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.on('click','a',function(){
	if(this.id=='a_del'){
		if(!confirm('������ �����Ͻðڽ��ϱ�?')) return false;
	}
	return true;
})
</script>
</html>
