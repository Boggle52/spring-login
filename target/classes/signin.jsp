<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
<form id=frmSignin method=post action="user_signin">
사용자 아이디:<input type=text name=userid value='${user_id }' id=userid><br>
비밀번호:<input type=password name=pwd  id=pwd><br>
비밀번호 확인:<input type=password name=pwd1 id=pwd1><br>
이름:<input type=text name=name id=name><br>
모바일:<input type=text name=mobile id=mobile><br>
<input type=submit value='회원가입'>&nbsp;<input type=reset value='지우기'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('submit','#frmSignin',function(){
	if($('#userid').val()==''||$('#pwd').val()==''||$('#pwd1').val()==''
			||$('#name').val()==''||$('#mobile').val()==''){
		alert('값을 입력하십시오.')
		return false
	} else if($('#pwd').val()!=$('#pwd1').val()){
		alert('비밀번호를 확인하십시오.')
		return false
	}
	return true
})
</script>
</html>