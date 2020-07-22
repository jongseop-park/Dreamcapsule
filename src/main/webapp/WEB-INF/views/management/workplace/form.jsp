<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Admin</title>

    <!-- Custom fonts for this template -->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/views/include/sidebar.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="/WEB-INF/views/include/topbar.jsp"%>
            <!-- End of Topbar -->

            <!-- 뷰 -->
            <div class="container-fluid">

                <!-- 트리 -->
                <h5>홈 > 근무지관리 > 추가</h5>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1 ">
                        <h2 class="m-0 font-weight-bold text-primary">근무지 추가하기
                        </h2>
                        <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form class="user">
                                <div class="form-group" >
                                    근무지<input type="text" class="form-control" id="_name" style="width: 80%; float: right;">
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    주소<input type="text" class="form-control" id="_job" style="width: 80%; float: right;">
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    출근시간
                                    <select name="workingTime" class="form-control" style="width: 80%; float: right;">
                                        <option value="09:00">09:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                    </select>
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    퇴근시간
                                    <select name="workTime" class="form-control" style="width: 80%; float: right;">
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                        <option value="22:00">22:00</option>
                                        <option value="23:00">23:00</option>
                                    </select>
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    장비선택
                                    <label style="margin-left: 15%">없음<input type="radio" name="eqpt" style="margin-left: 10px" name="equipment" value="없음" checked="checked"></label>
                                    <label style="margin-left: 30px">비콘<input type="radio" name="eqpt" style="margin-left: 10px" name="equipment" value="비콘" ></label>
                                    <label style="margin-left: 30px">NFC<input type="radio" name="eqpt" style="margin-left: 10px" name="equipment" value="NFC" ></label>
                                </div>
                                <!-- TODO 상세 기능  -->
                                <div class="form-group" style="margin-top: 1%;">
                                    사용장비 1
                                    <button style="float : right;">삭제</button>
                                    <button style="float : right; margin-right: 1%;">추가</button>
                                    <select name="workTime" class="form-control" style="width: 70%; float: right; margin-right: 1%;">
                                        <option value="비콘1">비콘1</option>
                                        <option value="비콘2">비콘2</option>
                                        <option value="비콘3">비콘3</option>
                                        <option value="비콘4">비콘4</option>
                                        <option value="비콘5">비콘5</option>
                                    </select>
                                </div>
                                <!-- TODO 상세 기능  -->
                            </form>
                        </div>
                        <!-- 테이블 하단 바 -->
                        <div>
                            <button class="btn btn-dark right" type="button" style="float : right; margin-top: 2%" onclick="location.href='/management/workplace/list'">
                                저장
                            </button>
                        </div>
                        <!-- /테이블 하단 바 -->
                    </div>
                </div>
                <!--  /변경할 뷰 -->

            </div>
            <!-- /뷰 -->
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="/WEB-INF/views/include/footer.jsp"%>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<%@include file="/WEB-INF/views/include/logout_cmmn.jsp"%>


<!-- plugins_js -->
<%@include file="/WEB-INF/views/include/plugins_js.jsp"%>
<!-- /plugins_js -->

</body>

</html>
<script type="text/javascript">
    $(function () {
        $eqpt = $("input[name=eqpt]"); // 장비선택 라디오 버튼



    });

</script>