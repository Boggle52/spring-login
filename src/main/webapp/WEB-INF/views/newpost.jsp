<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
</head>
<body>
����: <input type=text id=title name=title><br>
����: 
<br><textarea id=content name=content rows=10 cols=70></textarea><br>
<input type=button value='�ۼ� �Ϸ�'>&nbsp;
<input type=button value='������� ���ư���' id=btnList>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(document)
    .on('click','#btnList',function(){
        document.location='/member'
    })
</script>
</html>