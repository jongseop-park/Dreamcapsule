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
                <h5>홈 > 직급관리</h5>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1">
                        <h2 class="m-0 font-weight-bold text-primary">직급관리</h2>
                    <!-- /테이블 상단 바 -->
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table style="text-align: center" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 30%"><button id="sort" value="desc" style="border: none; background: none;">직급 ▼</button></th>
                                    <th style="width: 70%">메모</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tbody>
                                <!-- 리스트 내용 -->

                                <c:forEach var="list" items="${result}" varStatus="status">
                                    <input type="hidden" id="seq" value="${list.seq}"/>
                                    <c:if test="${empty result}">
                                        <tr>
                                            <td colspan="2">데이터가 존재하지 않습니다.</td>
                                        </tr>
                                    </c:if>
                                    <tr style="cursor: pointer;" onclick="location.href='/management/position/form?seq=${list.seq}'"
                                        onmouseover="window.status='/management/position/form?seq=${list.seq}'"
                                        onmouseout="window.status='/management/position/form?seq=${list.seq}'">
                                        <td>${list.rank}</td>
                                        <td>${list.memo}</td>
                                    </tr>
                                </c:forEach>
                                <!--/ 리스트 내용 -->
                                </tbody>
                            </table>
                            <!-- 테이블 하단 바 -->
                            <div>
                                <ul class="pagination" style="justify-content: center;">
                                    <c:if test="${pageMaker.prev}">
                                        <li><a href="/management/position/list?page=${pageMaker.startPage - 1}">◀</a></li>
                                    </c:if>

                                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                        <li><a href="/management/position/list?page=${idx}">[${idx}]</a>　</li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                        <li><a href="/management/position/list?page=${pageMaker.endPage + 1}">▶</a></li>
                                    </c:if>
                                </ul>
                            </div>
                            <div style="margin-top: 5%;">
                                <button class="btn btn-dark right" type="button" style="float : right;" onclick="location.href='/management/position/form'">
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
<script type="text/javascript">
    $(function () {

        $("#sort").on("click",function () {
            let $sort = $("#sort");
            $sort.text("1234");
            switch ($sort.val()) {
               case "desc" : $sort.text("직급 ▲"); $sort.val("asc"); break;
               case "asc" : $sort.text("직급 ▼"); $sort.val("desc");
            }
        })

    });
</script>