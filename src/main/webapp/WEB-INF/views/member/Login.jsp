<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인</title>

<!-- Custom fonts for this template-->
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

function forgotpw(){
	alert("관리자에게 문의하세요");
}

//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('e649516b2c829c7966b88c0a9437a5f7');
function loginWithKakao() {
    // 로그인 창을 띄웁니다.
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  };
//]]>
</script>

</head>
<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  
                  <form role="form" method="post" action="j_spring_security_check" class="user">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="j_username" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="ID" required="required">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="j_password" id="exampleInputPassword" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" name="checkId" onclick="javascript:saveid(this.form);" id="checkId">
                        <label class="custom-control-label" for="checkId">Remember Me</label>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">Login</button>
                    <hr>
                    <a href="/Join.do" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Join
                    </a>
                  </form>
                  
                  
                  <hr>
                  <div class="text-center">
                    <a class="small" onclick="forgotpw()">Forgot Password?</a>
                  </div>
<!--                   <div class="text-center"> -->
<!--                     <a class="small" href="register.html">Create an Account!</a> -->
<!--                   </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/admin/js/sb-admin-2.min.js"></script>

</body>

</html>

