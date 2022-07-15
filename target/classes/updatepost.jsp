<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<form id=frmNewPost method=post action="confirmPost">
	제목: <input type=text id=title name=title value='${bDto.title }'><br>
	내용: 
	<br>
	<textarea id=content name=content rows=10 cols=70>${bDto.content }</textarea><br>
	<input type=hidden name=seqbbs value='${bDto.seqbbs }' id=btnSeqbbs>
	<input type=submit value='수정 완료'>&nbsp;
	<input type=button value='삭제' id=btnDelete>&nbsp;
	<input type=button value='취소' id=btnList>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.on('click','#btnList',function(){
	location.replace('/member')
})
.on('click','#btnDelete',function(){
	answer = confirm('삭제하시겠습니까?')
	if(answer==true){
		location.replace('deletePost?seqbbs='+$('#btnSeqbbs').val())
	}
})
</script>
</html>