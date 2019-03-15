<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap core JavaScript-->
 	<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
</head>
<script>
	$(document).ready(function(){
		
		var result = $("#join_result").val();
		console.log(result);
		if(result == "complete"){
			alert('가입을 축하합니다.');
		} else if(result == "waitmember"){
			alert('메일 주소로 인증메일이 발송되었습니다.');
		} else {
			alert('가입도중 오류가 발생했습니다.');
		}
		$("#result_form").submit();
	});
</script>
<body>
<form action="/LoginForm.do" id="result_form">
	<input type="hidden" id="join_result" value="${result }">
</form>
</body>
</html>