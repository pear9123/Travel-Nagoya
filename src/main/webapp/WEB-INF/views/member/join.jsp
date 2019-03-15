<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>흥청망청 회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script>
function checkjoin() {
	  
      // 비밀번호 유효성검사
      var password1 = $("#input_password_1").val();
      var password2 = $("#input_password_2").val();
      console.log(password1+"/"+password2);
      if(password1 == password2){
    	  $("#input_password_result").val(password1);
    	  return true;
      } else {
    	  alert('비밀번호가 동일하지 않습니다.');
    	  $("#input_password1").val("");
    	  $("#input_password2").val("");
    	  $("#input_password1").focus();
    	  return false;
      }
      
}
</script>
<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" action="/JoinProc.do" method="post" onsubmit="return checkjoin()">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="input_eng_firstname" name="input_eng_firstname" placeholder="English First Name" required="required">
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="input_eng_lastname" name="input_eng_lastname" placeholder="English Last Name" required="required">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="input_id" name="input_id" placeholder="ID" required="required">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="input_password_1" name="input_password_1" placeholder="Password" required="required">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="input_password_2" name="input_password_2" placeholder="Repeat Password" required="required">
                  </div>
                  <input type="hidden" id="input_password_result" name="input_password_result">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="input_kor_name" name="input_kor_name" placeholder="Korea Name" required="required">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="input_email" name="input_email" placeholder="Email address" required="required">
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">Register Account</button>
            </form>
                <hr>
                
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
