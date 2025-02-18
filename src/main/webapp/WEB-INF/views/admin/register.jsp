<%--
  Created by IntelliJ IDEA.
  User: jongs
  Date: 2020-07-09
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Admin</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

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
                            <h1 class="h4 text-gray-900 mb-4">계정 생성</h1>
                        </div>
                        <form action="/save" class="user" method="post">
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" name="email" placeholder="이메일">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="tel" placeholder="연락처">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" name="userName" placeholder="이름">
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" name="userId" placeholder="아이디">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" name="userPass" placeholder="패스워드">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" name="reuserPass" placeholder="패스워드 확인">
                                </div>
                            </div>
                            <button type="submit" id="join" class="btn btn-primary btn-user btn-block">
                                가입하기
                            </button>
                            <%--<hr>
                            <a href="index.html" class="btn btn-google btn-user btn-block">
                                <i class="fab fa-google fa-fw"></i> 구글로 회원가입
                            </a>
                            <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                <i class="fab fa-facebook-f fa-fw"></i> 페이스북으로 회원가입
                            </a>--%>
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="/forgot-password">비밀번호 찾기</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="/login">돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/static/js/sb-admin-2.min.js"></script>

</body>

</html>
<script type="text/javascript">
    // const $join = $form.find("#join");
    //
    //
    // $join.on("click",function(){
    //     $.ajax({
    //         url: "/save",
    //         type: "POST",
    //         data: JSON.stringify(object),
    //         contentType:"application/json",
    //         success:function() {
    //             alert("정상적으로 등록되었습니다.");
    //             location.href="/save?"
    //                 + "userId=" + getParameter("userId")
    //                 + "&userPass=" + getParameter("userPass")
    //                 + "&userName=" + getParameter("userName")
    //                 + "&email=" + getParameter("email")
    //                 + "&tel=" + getParameter("tel")
    //         }, error:function(jqXhr) {
    //             alert("작업이 실패했습니다.");
    //         }
    //         });
    //
    // });


</script>