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
    </style>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <%@include file="../include/sidebar.jsp" %>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="../include/topbar.jsp" %>

            <!-- End of Topbar -->


            <div class="container">
                <h6><a href="/home"> 홈 </a>> 휴가관리</h6>
                <div>
                    <h2> 휴가관리</h2>
                    <h6 align="right">
                        <form>
                        <select name="selectyear" id="selectyear">
                            <option value="2020">2020년</option>
                            <option value="2019">2019년</option>
                            <option value="2018">2018년</option>
                            <option value="2017">2017년</option>
                            <option value="2016">2016년</option>
                        </select>
                        <select name="selecttask" id="selecttask">
                            <option value="all">회사전체</option>
                            <option value="Consulting">Consulting</option>
                            <option value="Design">Design</option>
                            <option value="Mobile">Mobile 개발</option>
                        </select>
                            <input type ="button" value = '액셀다운로드'>
                        </form>
                    </h6>
                </div>
                <div style="width:100%; overflow:auto">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>직원</th>
                            <th>직무</th>
                            <th>직급</th>
                            <th>1월</th>
                            <th>2월</th>
                            <th>3월</th>
                            <th>4월</th>
                            <th>5월</th>
                            <th>6월</th>
                            <th>7월</th>
                            <th>8월</th>
                            <th>9월</th>
                            <th>10월</th>
                            <th>11월</th>
                            <th>12월</th>
                            <th>사용휴가</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="holiday" items="${holidayList}">
                                <tr>
                                    <td>${holiday.name}</td>
                                    <td>${holiday.task}</td>
                                    <td>${holiday.job_grade}</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>${holiday.rest_holiday} 일 / 15 일</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
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
