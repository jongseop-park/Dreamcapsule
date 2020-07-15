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

    <%-- 기본 --%>
    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/static/css/commute/sb-admin-comm.css" rel="stylesheet">
<style>
    .table-bordered th:nth-child(1){
        width:5%;
    }
    .table-bordered th:nth-child(2){
        width:9%;
    }
    .table-bordered th:nth-child(3){
        width:5%;
    }
    .table-bordered th:nth-child(4){
        width:7%;
    }
    .table-bordered th:nth-child(n+5):nth-child(-n+11){
        width:7%;
    }
    .table-bordered th:nth-child(12) {
        width:6%;
    }



</style>
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


            <div class="container2">

                <div class="container2">
                    <a href="/home"> 홈 </a> >
                    <a>출퇴근 관리 </a> >
                    <a href="/daily">Daily</a> >
                    <a>Detail</a>
                    <div class="heighttdivspace"></div>

                    <h2>출/퇴근관리 Weekly</h2>

                    <div class="form-inline">
                        <select>
                            <option
                        </select>

                        <div style="float: right ; width:600px ">


                            <div class='col-md-3 col-xs-4' style="float: left; margin-left: 30px">
                                <div class="form-group">
                                    <div class="input-group date" id="datetimepicker1" data-target-input="nearest">


                                        <div class="input-group-append" data-target="#datetimepicker1"
                                             data-toggle="datetimepicker"
                                             style="margin-right: 30px">
                                            <div class="input-group-text"
                                                 style="background-color: #ffffff00; border: 1px solid #ffffff00">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control _date" id="datepicker"
                                                   style="width: 120px">
                                        </div>
                                    </div>
                                </div>
                            </div>



                    <%@include file="include/excel_include_commute.jsp" %>

                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                          style="float: right ; padding-top: 1px" >
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="직원 검색.."
                                   id="keyword" name="keyword" value="${pageMaker.cri.keyword}"/>
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" id="searchBtn">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
                </div>


                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>직원</th>
                        <th>직무</th>
                        <th>직급</th>
                        <th>근무지</th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                        <th>일</th>
                        <th>근무시간</th>
                    </tr>
                    </thead>
                </table>













                        </br></br></br></br></br>
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
            <%@include file="/WEB-INF/views/include/logout_cmmn.jsp"%>

            <!-- Bootstrap core JavaScript-->
            <%@include file="../include/plugins_js.jsp" %>
</body>
</html>
