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
                <h5>홈 > 연차관리</h5>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1">
                        <h2 class="m-0 font-weight-bold text-primary">연차관리

                            <div class="d-sm-flex align-items-center justify-content-between mb-1"
                                 style="float: right; margin: 4px 0 0 10px">
                                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                        class="fas fa-download fa-sm text-white-50"></i> 엑셀 업로드</a>
                            </div>
                             <%@ include file="/WEB-INF/views/include/excel_include.jsp"%>
                            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                                <div class="input-group" >
                                    <input type="text" class="form-control bg-light border-1 small" placeholder="직원 검색"
                                           aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <div class="d-sm-flex align-items-center justify-content-between mb-1"
                                 style="float: right; margin: 4px 0 0 10px">달력추가예정
                            </div>
                        </h2>
                    <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table style="text-align: center" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 25%">직원</th>
                                    <th style="width: 25%">직무</th>
                                    <th style="width: 25%">직급</th>
                                    <th style="width: 25%">전체 연차</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tbody>
                                    <tr>
                                        <td>홍길동</td>
                                        <td>컨설팅 팀</td>
                                        <td>사원</td>
                                        <td>15일</td>
                                    </tr>
                                    <tr>
                                        <td>홍길동</td>
                                        <td>컨설팅 팀</td>
                                        <td>사원</td>
                                        <td>15일</td>
                                    </tr>
                                    <tr>
                                        <td>홍길동</td>
                                        <td>컨설팅 팀</td>
                                        <td>사원</td>
                                        <td>15일</td>
                                    </tr>
                                    <tr>
                                        <td>홍길동</td>
                                        <td>컨설팅 팀</td>
                                        <td>사원</td>
                                        <td>15일</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- 테이블 하단 바 -->
                            <div>
                            <button class="btn btn-dark right" type="button" style="float : right;" onclick="location.href='/management/annual/form'">
                                추가
                            </button>
                            </div>
                            <!-- /테이블 하단 바 -->
                        </div>
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
