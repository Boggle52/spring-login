<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table {border-collapse:collapse}
	th, td {border:1px solid black}
</style>
<body>
	<p align=right><a href='/member'>Home</a>
	<table>
		<tr><th>작성 시각</th><td>${post.created }</td></tr>
		<tr><th>제목</th><td>${post.title }</td></tr>
		<tr><th>작성자</th><td>${post.writer }</td></tr>
		<tr><th>내용</th><td>${post.content }</td></tr>
	</table><br>
	<c:if test="${username!='' }">
		댓글<br>
		<form id=frmNewReply method=post action="addReply">
			<input type=hidden value=${post.seqbbs } id='btnSeqbbs' name=seqbbs>
			<textarea name=content rows=2 cols=70></textarea>
		<br><input type=submit value='작성 완료'>
		</form>
	</c:if>
	<br>
	<table id=replyTable style="width:600px">
		<%-- <c:forEach var="r" items="${rlist }" varStatus="status">
			<tr><td>${r.writer }</td><td>${r.content }</td><td>${r.replydate }</td> --%>
			<c:if test="${username!='' }">	
				<td style='width:50px'><a href=# id=re>답글</a></td>
			</c:if>	
		<%-- </tr>
			<tr style='display:none'><td colspan=3>답글:<br><textarea name=content id=content rows=2 cols=70></textarea></td><td><a href=# id=add>작성</a></td></tr>
		</c:forEach> --%>
	</table>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.ready(function(){
	listReply()
})
.on('click','#re',function(){
	if($(this).closest('tr').next().attr('style')=='display:none'){
		$(this).closest('tr').next().attr('style','display:""')
	} else{
		$(this).closest('tr').next().attr('style','display:none')
	}
})
.on('click','#add',function(){
	$.ajax({
		url:'addReply',type:'post',dataType:'text',
		data:{content:$('#content').val()},
		success:function(data){
			listReply()
			$(this).closest('tr').attr('style','display:none')
		}
	})
})

function listReply(){
/* 	$('#replyTable').remove() */
 	let seqbbs = $("#btnSeqbbs").val()
 	console.log(seqbbs)
	$.ajax({
		url:'listReply',data:'seqbbs='+seqbbs,dataType:'json',type:'get',
		success:function(data){
			replyitem = data[i]
			let str = '<tr><td>'+replyitem['writer']+'</td><td>'+replyitem['content']+'</td>'
				+'<td>'+replyitem['replydate']+'</td></tr>'
				+'<tr style="display:none"><td colspan=3>답글:<br>'
				+'<textarea name=content id=content rows=2 cols=70></textarea></td>'
				+'<td><a href=# id=add>작성</a></td></tr>'
			$('#replyTable').append(str)
		}
	})
}
</script>
</html>