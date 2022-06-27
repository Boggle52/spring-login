<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>
<body>
제목: <input type=text id=title name=title><br>
내용: 
<br><textarea id=content name=content rows=10 cols=70></textarea><br>
<input type=button value='작성 완료'>&nbsp;
<input type=button value='목록으로 돌아가기' id=btnList>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(document)
    .on('click','#btnList',function(){
        document.location='/member'
    })
</script>
</html>