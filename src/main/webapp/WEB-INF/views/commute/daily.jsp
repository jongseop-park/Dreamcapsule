<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>


    <%--    데이트피커 사용 JS CSS 로드--%>

    <%-- 데이트피커   여기까지--%>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css"/>

    <%-- 기본 --%>
    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/static/css/commute/sb-admin-comm.css" rel="stylesheet">

    <%-- 기본 여기까지--%>


</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <%@include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">


    </ul>
    <!-- End of Sidebar -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="include/topbar_comm.jsp" %>

            <!-- End of Topbar -->




            <script type="text/javascript"> $(function () {
                $('#datetimepicker1').datetimepicker({format: 'L'});

            }); </script>


            <div class="container">
                <a href="/home">홈 </a> >
                <a href="/home">출퇴근 관리 </a> >
                <a href="/home">Daily</a>
                <div class="heighttdivspace"></div>


                <h2>출/퇴근관리 Daily
                    <div style="float: right ; width:600px "  >




                        <div class='col-md-3 col-xs-4' style="float: left; margin-left: 30px"  >
                            <div class="form-group" >
                                <div class="input-group date" id="datetimepicker1" data-target-input="nearest">



                                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker"style="margin-right: 30px">
                                        <div class="input-group-text" >
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text"  class="form-control datetimepicker-input" data-target="#datetimepicker1"  style="width: 120px">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%@include file="include/excel_include_commute.jsp" %>

                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                            <div class="input-group" >
                                <input type="text" class="form-control bg-light border-0 small" placeholder="직원 검색.."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </h2>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>직원</th>
                        <th>직무</th>
                        <th>직급</th>
                        <th>출근시간</th>
                        <th>퇴근시간</th>
                        <th>근무상태</th>
                        <th>근무시간</th>
                        <th>휴게시간</th>
                        <th>근무지</th>
                        <th>근무지 주소</th>
                        <th>근무시간 합계</th>
                        <th>지각</th>
                        <th>결근</th>
                        <th>등록 일시</th>


                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="daily" items="${dailyList}">
                        <tr>
                            <td>${daily.emplNm}</td>
                            <td>${daily.dutyId}</td>
                            <td>${daily.rankId}</td>
                            <td>${daily.onwTi}</td>
                            <td>${daily.offwTi}</td>
                            <td>${daily.workSt}</td>
                            <td>${daily.workTi}</td>
                            <td>${daily.restTi}</td>
                            <td>${daily.workPl}</td>
                            <td>${daily.workAd}</td>
                            <td>${daily.totalTi}</td>
                            <td>${daily.tardyCt}</td>
                            <td>${daily.abtiCt}</td>
                            <td>${daily.regDt}</td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
            </div>


            <!-- Footer -->
            <%@include file="../include/footer.jsp" %>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <%@include file="../include/plugins_js.jsp" %>
</body>

</html>
