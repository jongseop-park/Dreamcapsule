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
                        <form class="user" id="form" method="post" action="/save">
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="adminEmail" name="adminEmail" placeholder="이메일">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="adminTel" name="adminTel" placeholder="연락처">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="adminNm" name="adminNm" placeholder="이름">
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="adminId" name="adminId" placeholder="아이디">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" id="adminPw" name="adminPw" placeholder="패스워드">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" id="reAdminPw" name="reAdminPw" placeholder="패스워드 확인">
                                </div>
                            </div>
                            <input class="btn btn-primary btn-user btn-block" id="join" type="submit" value="가입하기">
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
</body>
</html>
<%@include file="/WEB-INF/views/include/plugins_js.jsp" %>
<script type="text/javascript">
    $(function () {
        /*
        * var : 변수명 재선언 / 값 재할당 가능
        * let : 변수명 재선언X / 값 재할당 가능
        * const : 변수명 재선언X / 값 재할당 X (상수)
        * */

        const $form = $("#form"); // 입력 폼
        let $adminId = $form.find("#adminId"); // 아이디
        let $adminPw = $form.find("#adminPw"); // 비밀번호
        let $reAdminPw = $form.find("#reAdminPw"); // 비밀번호 확인
        let $adminNm = $form.find("#adminNm"); // 이름
        let $adminEmail = $form.find("#adminEmail"); // 이메일
        let $adminTel = $form.find("#adminTel"); // 연락처

        const $join = $form.find("#join"); // 가입하기

        $join.on("click",function () { // 추가
            var object = {
                "adminId": $adminId.val(),
                "adminPw": $adminPw.val(),
                "adminNm": $adminNm.val(),
                "adminEmail": $adminEmail.val(),
                "adminTel": $adminTel.val()
            };

                if ($adminPw.val() === $reAdminPw.val()) {
                    Save(object);
                } else {
                    alert("비밀번호를 확인하세요.")
                    return false;
                }

        });

        function Save(data) {

            $.ajax({
                url : "/save",
                type : "POST",
                contentType : "application/json",
                /*async : false, /!* async true가 기본이며 기본적으로 비동기 방식으로 처리하지만 false로 동기방식 처리 *!/*/
                data : JSON.stringify(data),
                success : function () {
                        alert("회원가입이 완료되었습니다.");
                    history.back();
                    /*
                    * history.back() : 이전페이지로 이동
                    * history.go() : go(-1) 이전 페이지 , go(1) 다음 페이지 이동
                    * history.forward() : 다음페이지로 이동
                    * */
                }, error : function(jqXhr){
                    alert("회원가입에 실패했습니다.");
                }
            });
        }

    });
</script>