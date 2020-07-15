<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Holiday_total</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        td{
            white-space: nowrap;
        }
        th{
            white-space: nowrap;
        }
        #div_table{
            width: 100%;
            overflow: auto;
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
            <%@include file="/WEB-INF/views/include/topbar.jsp" %>

            <!-- End of Topbar -->


            <div class="container">
                <div>
                    <a href="/home">홈</a> > 외근관리
                    <h4>외근관리</h4>
                    날짜 / 직원검색/ <%@include file="/WEB-INF/views/include/excel_include.jsp"%>
                    <c:forEach var="outside" items="${outsidejobDate}">
                        <script>
                            document.write(${outside});
                        </script>
                    </c:forEach>
                </div>
                <div id="div_table">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>직원</th>
                            <th>직무</th>
                            <th>직급</th>
                            <th>외근일</th>
                            <th>출/퇴근시간</th>
                            <th>출근지</th>
                            <th>퇴근지</th>
                            <th>상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="outside" items="${outsidejobList}">
                            <tr>
                                <td>${outside.name}</td>
                                <td>${outside.task}</td>
                                <td>${outside.jobGrade}</td>
                                <td>${outside.outsideDate}</td>
                                <td>${outside.startTime} ~ ${outside.endTime}</td>
                                <td>${outside.startPlace}</td>
                                <td>${outside.endPlace}</td>
                                <c:choose>
                                    <c:when test="${outside.stateYsn eq 'Y'.charAt(0)}">
                                        <td>승인</td>
                                    </c:when>
                                    <c:when test="${outside.stateYsn eq 'S'.charAt(0)}">
                                        <td>대기중</td>
                                    </c:when>
                                    <c:when test="${outside.stateYsn eq 'N'.charAt(0)}">
                                        <td>반려</td>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
            <!-- Footer -->
            <%@include file="/WEB-INF/views/include/footer.jsp" %>
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
    <%@include file="/WEB-INF/views/include/plugins_js.jsp" %>

</body>
</html>
