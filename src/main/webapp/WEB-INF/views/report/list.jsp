<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: psy37
  Date: 2020-07-21
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>52TIME ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">


    <style>
        #myTable thead th {
            width:100px;
            vertical-align: middle;


        }
        #myTable thead{
            text-align: center;
            font-size:17px;
        }

        #myTable tbody {
            text-align: center;
            font-size:15px;
        }



        #pagediv {
            position:absolute;
            text-align: center;
            bottom:15%;
            left:600px;
            right:400px;
        }
        #top {
            display: flex;
        }
        #date1 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 19%;
            border:1px solid #d1d3e2; background: none; border-radius: 3px;
        }
        #date2 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 10px;
            border:1px solid #d1d3e2; background: none; border-radius: 3px;
        }
        #tableDiv {
            height:900px;
        }
        #dateSort, #dateSort2 {
            border:1px solid #d1d3e2;
            background: none;
            height: 30px;
            margin: 4px 10px 0 0;
            width: 30px;
            color:#d1d3e2;
            border-radius: 5px;
        }
    </style>
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

            <!-- 메인 내용 -->
            <div class="container">
                <h6>홈 > 리포트</h6>

                <div id="top">
                    <h5 id="title">리포트</h5>
                    <%
                        /// 날짜 변환 출력
                        String startDate = request.getParameter("startDate");
                        String endDate = request.getParameter("endDate");

                        if(startDate != null && endDate != null) {
                            SimpleDateFormat source = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

                            startDate = sdf.format(source.parse(startDate));
                            endDate = sdf.format(source.parse(endDate));
                        } else {
                            startDate = "";
                            endDate = "";
                        }

                        //// 정렬
                        String order = request.getParameter("order") == null? "" : request.getParameter("order");
                        String orderKeyword = request.getParameter("orderKeyword") == null? "": request.getParameter("orderKeyword");

                        String empName= "▼";
                        String empJob= "▼";
                        String empPosition= "▼";
                        String status= "▼";
                        String requestDate= "▼";

                        if(order.equals("asc")) {
                            switch (orderKeyword) {
                                case "empName": empName="▼"; break;
                                case "empJob": empJob="▼"; break;
                                case "empPosition": empPosition="▼"; break;
                                case "status": status="▼"; break;
                                case "requestDate": requestDate="▼"; break;
                            }
                        } else {
                            switch (orderKeyword) {
                                case "empName": empName="▲"; break;
                                case "empJob": empJob="▲"; break;
                                case "empPosition": empPosition="▲"; break;
                                case "status": status="▲"; break;
                                case "requestDate": requestDate="▲"; break;
                            }
                        }
                    %>
                    <input type="text" class="startDatepicker" id="date1" value="<%= startDate  %>">
                    <button id="dateSort" value="requestDate" onClick="sortTest(dateSort.value)" ><%= requestDate %></button> ~
                    <input type="text" class="endDatepicker" id="date2" value="<%= endDate %>">
                    <button id="dateSort2" value="requestDate" onClick="sortTest(dateSort2.value)"><%= requestDate %></button>

                    <form method="get" action="/listSearch" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" name="keyword" value="${scri.keyword}" class="form-control bg-light border-1 small" placeholder="직원검색" aria-label="Search" aria-describedby="basic-addon2">
                            <input type="hidden" name="startDate" value="${scri.startDate}" />
                            <input type="hidden" name="endDate" value="${scri.endDate}" />
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <%@include file="/WEB-INF/views/include/excel_include.jsp"%>
                </div>
                <div id="tableDiv">
                    <table id="myTable" class="table table-bordered table-hover">
                        <thead>
                            <th  id="직원" rowspan="2">직원</th>
                            <th id="직무" rowspan="2">입사일</th>
                            <th id="직급" rowspan="2">실제근로일수</th>
                            <th rowspan="2">실제근로시간</th>
                            <th rowspan="2">유급휴가시간</th>
                            <th rowspan="2">실제초과근로시간</th>
                            <th colspan="2">야간근로시간</th>
                            <th rowspan="2">휴가횟수</th>
                            <th rowspan="2">지각횟수</th>
                            <th rowspan="2">결근횟수</th>
                        </tr>
                        <tr>
                            <td>계획</td>
                            <td>실제</td>
                        </tr>
                        </thead>
                        <tbody><%--
                        <tr>
                            <td>1</td><td>1</td><td>1</td>
                            <td>1</td><td>1</td><td>1</td>
                            <td>1</td><td>1</td><td>1</td>
                            <td>1</td><td>1</td>
                        </tr>--%>
                        <c:forEach var="data" items="${reportVOList}">
                            <tr>
                                <td style="display:none;">${data.sequence}</td>
                                <td>${data.empName}</td>
                                <td>${data.hireDate.substring(0,10)}</td>
                                <td>${data.workDate}</td>
                                <td>${data.workTime}</td>
                                <td>${data.payVacationTime}</td>
                                <td>${data.overtimeWorkTime}</td>
                                <td>${data.planOvertime}</td>
                                <td>${data.actualOvertime}</td>
                                <td>${data.vacationCount} / ${data.vacationTotal}</td>
                                <td>${data.lateCount}</td>
                                <td>${data.absentCount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="pagediv">
                    <a href="report${pageMaker.makeSearch(pageMaker.cri.page -1)}">◀</a>&nbsp&nbsp&nbsp
                    <c:forEach begin="${pageMaker.startPage}"  end="${pageMaker.endPage}" var="idx">
                        <c:choose>
                            <c:when test="${idx == pageMaker.cri.page}">
                                <b>&nbsp<a href="report${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp</b>
                            </c:when>
                            <c:otherwise>
                                &nbsp<a href="report${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pageMaker.totalPage != pageMaker.cri.page}">
                        &nbsp&nbsp&nbsp<a href="report${pageMaker.makeSearch(pageMaker.cri.page + 1)}">▶</a>
                    </c:if>
                    <c:if test="${pageMaker.totalPage == pageMaker.cri.page}">
                        &nbsp&nbsp&nbsp<a href="report${pageMaker.makeSearch(pageMaker.endPage)}">▶</a>
                    </c:if>
                </div>
            <!-- /메인 내용 -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="../include/footer.jsp"%>
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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <a class="btn btn-primary" href="/pages/login">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- plugins_js -->
<%@include file="../include/plugins_js.jsp"%>
<!-- /plugins_js -->

</body>

</html>
