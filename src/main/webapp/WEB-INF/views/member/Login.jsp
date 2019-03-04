<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 7); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.j_username.value, expdate);
}

$(document).ready(function(){
// 	document.form.checkId.checked = ((document.form.j_username.value = getCookie("saveid")) != "");
	 // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("saveid");
    $("input[name='j_username']").val(userInputId); 
     
    if($("input[name='j_username']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='j_username']").val();
            setCookie("saveid", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("saveid");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='j_username']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='j_username']").val();
            setCookie("saveid", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
</script>

</head>
<body>
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="padding: 35px 50px;">
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 로그인
				</h4>
				<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form" method="post" action="j_spring_security_check">
					<div class="form-group">
						<label for="id"> ID :</label> 
						<input type="text" class="form-control" id="id" name="j_username" placeholder="Enter ID" required="required">
					</div>
					<div class="form-group">
						<label for="pw"> Password :</label>
						<input type="password" class="form-control" id="pw" name="j_password" placeholder="Enter Password" required="required">
					</div>
					
					<%-- 관리자 옵션 추가 --%>
					<div class="checkbox">
						<label for="checkId"><input type="checkbox" name="checkId" onclick="javascript:saveid(this.form);" id="checkId" > ID정보저장</label>
					</div>
					<button type="submit" class="btn btn-default btn-block">Login</button>
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</body>
</html>