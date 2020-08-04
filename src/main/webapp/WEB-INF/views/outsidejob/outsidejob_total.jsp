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
            text-align: center;
        }
        th{
            white-space: nowrap;
            text-align: center;
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
                    <p><a href="/home">홈</a> > 외근관리</p>
                    <h4 style="display: inline">외근관리</h4>
                    <form method="get" action="/overtime" class="d-none d-sm-inline-block form-inline mr-0 ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                        <div class="input-group">
                            <div class="input-group">
                                <input type="text" name="keyword" value="" class="form-control bg-light border-1 small" placeholder="직원검색" aria-label="Search" aria-describedby="basic-addon2">
                                <input type="hidden" name="startDate" value=""/>
                                <input type="hidden" name="endDate" value=""/>
                                <div class="input-group-append">
                                  <button class="btn btn-primary" type="submit">
                                      <i class="fas fa-search fa-sm"></i>
                                  </button>
                                </div>
                            </div>
                            <%@include file="/WEB-INF/views/include/excel_include.jsp"%>
                        </div>
                    </form>
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
                        <c:forEach var="outside" items="${outsideJobList}" varStatus="status">
                            <tr>
                                <td id="name_${status.count}"></td>
                                <td id="task_${status.count}"></td>
                                <td id="grade_${status.count}"></td>
                                <td>${outside.month} (총 ${outside.day}일)</td>
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

<script>
    <c:forEach begin="1" end="${outsideJobList.size()}" varStatus="listStatus">
        <c:forEach begin="1" end="${outsideJobInfo.size()}" varStatus="infoStatus">
            if(${outsideJobList.get(listStatus.count-1).userNum eq outsideJobInfo.get(infoStatus.count-1).seq}){
                document.getElementById("name_${listStatus.count}").innerHTML = "${outsideJobInfo.get(infoStatus.count-1).name}";
                document.getElementById("task_${listStatus.count}").innerHTML = "${outsideJobInfo.get(infoStatus.count-1).task}";
                document.getElementById("grade_${listStatus.count}").innerHTML = "${outsideJobInfo.get(infoStatus.count-1).jobGrade}";
            }
        </c:forEach>
    </c:forEach>

</script>
