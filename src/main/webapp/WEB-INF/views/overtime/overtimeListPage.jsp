<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #page {
            position:absolute;
            text-align: center;
            bottom:0px;
            left:600px;
            right:400px;
        }

        .table{
            width:100%;
            height:60%;
        }

        #top {
            display: flex;
        }

        #excel {
            margin-left:10px;
            width:150px;
            height: 30px;
            float:right;
        }

        #search {
            margin-left: 55%;
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
                <h6>홈 > 외근관리</h6>

                <div id="top">
                    <h5 id="title">야근관리</h5>
                    <form name="search" id="search">
                        <input type="text" placeholder="직원검색" />
                        <input type="submit" value="검색" />
                    </form>
                    <input id="excel" type="button" value="엑셀 다운로드"/>

                </div>

                <table class="table table-bordered">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>직원</th>
                    <th>직무</th>
                    <th>직급</th>
                    <th>야근날짜</th>
                    <th>야근시간</th>
                    <th>석식여부</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="data" items="${list}">
                    <tr>
                        <td><a href="/readInfo?sequence=${data.sequence}">${data.sequence}</a></td>
                        <td>${data.empName}</td>
                        <td>${data.empJob}</td>
                        <td>${data.empPosition}</td>
                        <td>${data.overtimeDate}</td>
                        <td>${data.overtimeTime}</td>
                        <td>${data.eatBoolean}</td>
                        <td>${data.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="page"><%--
                <c:if test="${pageMaker.prev}">
                    &nbsp<a href="overtimeListPage?page=${pageMaker.startPage -1}">◀</a>&nbsp
                </c:if>--%>
                <a href="overtimeListPage?page=${pageMaker.cri.page -1}">◀</a>&nbsp&nbsp&nbsp
                <c:forEach begin="${pageMaker.startPage}"  end="${pageMaker.endPage}" var="idx">

                    <c:choose>
                        <c:when test="${idx == pageMaker.cri.page}">
                            <b>&nbsp<a href="overtimeListPage?page=${idx}">${idx}</a>&nbsp</b>
                        </c:when>
                        <c:otherwise>
                            &nbsp<a href="overtimeListPage?page=${idx}">${idx}</a>&nbsp
                        </c:otherwise>
                    </c:choose>
                    <%--
                    <c:if test="${idx == pageMaker.cri.page}">
                        <b>&nbsp<a href="listPage?page=${idx}">${idx}</a>&nbsp</b>
                    </c:if>
                    &nbsp<a href="listPage?page=${idx}">${idx}</a>&nbsp
                --%>
                </c:forEach>

                <%--<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    &nbsp<a href="overtimeListPage?page=${pageMaker.endPage +1}">▶</a>&nbsp
                </c:if>--%>
                &nbsp&nbsp&nbsp<a href="overtimeListPage?page=${pageMaker.cri.page +1}">▶</a>
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
