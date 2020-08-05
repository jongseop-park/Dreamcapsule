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
                <h5>홈 > 직무관리 > 추가</h5>
                <!-- TODO 상세 페이지 기능구현 시 추가 -->
                <%--<h5>홈 > 직무관리 > 상세</h5>--%>
                <!-- TODO 상세 페이지 기능구현 시 추가 -->
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1 ">
                        <h2 class="m-0 font-weight-bold text-primary">직무 추가하기</h2>
                        <!-- TODO 상세 페이지 기능구현 시 추가 -->
                        <%--<h2 class="m-0 font-weight-bold text-primary">직무 관리하기</h2>--%>
                        <!-- TODO 상세 페이지 기능구현 시 추가 -->
                        <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form class="user">
                                <div class="form-group" >
                                    이름<input type="text" class="form-control" id="_name" style="width: 80%; float: right;">
                                </div>
                                <!-- TODO 상세 페이지 기능구현 시 추가 -->
                                <div class="form-group" >
                                    부서 관리자<p id="_deptMng" style="width: 80%; float: right;">홍길동</p>
                                </div>
                                <div class="form-group" >
                                    직원 수<p id="_empNum" style="width: 80%; float: right;">100 명</p>
                                </div>
                                <!-- TODO 상세 페이지 기능구현 시 추가 -->
                                <div class="form-group" style="margin-top: 2%">
                                    메모 <textarea class="text-area" id="_memo" style="width: 80%; line-height: 500%;float: right;"></textarea>
                                </div>

                            </form>
                        </div>
                        <!-- 테이블 하단 바 -->
                        <div>
                            <button class="btn btn-dark right" type="button" style="float : right; margin-top: 2%" onclick="location.href='/admin/management/job/list'">
                                저장
                            </button>
                    <%--        <!-- TODO 상세 페이지에서 추가 -->
                            <button class="btn btn-dark right" type="button" style="float : right; margin-left: 20px; margin-top: 2%" onclick="location.href='/admin/management/job/list'">
                                수정
                            </button>
                            <button class="btn btn-dark right" type="button" style="float : right; margin-top: 2%" onclick="location.href='/admin/management/job/list'">
                                취소
                            </button>
                            <!-- TODO 상세 페이지에서 추가 -->--%>
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
