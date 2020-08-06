<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /* 날짜 변환 */
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    if(startDate != null && endDate != null) {
        SimpleDateFormat source = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

        startDate = sdf.format(source.parse(startDate));
        endDate = sdf.format(source.parse(endDate));
    } else {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        startDate = year + "년 " + String.format("%02d", month) + "월 01일";
        endDate = year + "년 " + String.format("%02d", month) + "월 " + String.format("%02d일", dayOfMonth);
    }

    /* 정렬 */
    String order = request.getParameter("order") == null? "" : request.getParameter("order");
    String orderKeyword = request.getParameter("orderKeyword") == null? "": request.getParameter("orderKeyword");

    String empName= "▲";
    String hireDate= "▲";
    String registerDate= "▲";

    if(order.equals("asc")) {
        switch (orderKeyword) {
            case "emp_nm": empName="▲"; break;
            case "hire_dt": hireDate="▲"; break;
            case "reg_dt": registerDate="▲"; break;
        }
    } else {
        switch (orderKeyword) {
            case "emp_nm": empName="▼"; break;
            case "hire_dt": hireDate="▼"; break;
            case "reg_dt": registerDate="▼"; break;
        }
    }
%>
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

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.7.2.js"></script>
    <script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

    <!-- java script -->
    <script type="text/javascript">
        function sort(keyword) {
            var order = "asc";
            var orderKeyword = keyword;

            if (${scri.order.equals("asc")}) {
                order = "desc";
            } else {
                order = "asc"
            }

            location.href= "/admin/report?&keyword=${scri.keyword}"
                + "&page=${scri.page}"
                + "&startDate=${scri.startDate}"
                + "&endDate=${scri.endDate}"
                + "&order=" + order
                + "&orderKeyword=" + orderKeyword;
        }

        /* 캘린더 */
        $(function () {
            function getDateFormat(date) {
                var year = date.substr(0, 4);
                var month = date.substr(6, 2);
                var day = date.substr(10, 2);

                return year + "-" + month + "-" + day;
            }

            var startDate;

            $(".startDatepicker").datepicker({
                showOn: 'both',
                buttonImage: 'https://icons.iconarchive.com/icons/custom-icon-design/mono-business-2/32/calendar-icon.png',
                buttonText: '날짜선택',
                buttonImageOnly: true,
                maxDate: new Date(),
                showMonthAfterYear: true,
                changeYear: true,
                changeMonth: true,
                dateFormat: 'yy년 mm월 dd일',
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],// 월의 한글 형식.,
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                onSelect: function () {
                    startDate = $(".startDatepicker").val();
                }
            });

            $(".endDatepicker").datepicker({
                showOn: 'focus'
                , buttonImageOnly: false
                , showMonthAfterYear: true
                , maxDate: new Date()
                , changeYear: true
                , changeMonth: true
                , dateFormat: 'yy년 mm월 dd일'
                , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] // 월의 한글 형식.
                , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                onSelect: function () {
                    var endDate = $(".endDatepicker").val();

                    if (startDate == null) {
                        alert("시작일을 선택해주세요.");
                        $('#date1').val("");
                        $('#date2').val("");
                    } else {
                        endDate = getDateFormat(endDate);
                        startDate = getDateFormat(startDate);
                        location.href = "/admin/report?startDate=" + startDate + "&endDate="
                            + endDate + "&keyword=" + getParameter("keyword");
                    }
                }
            });
        });

        function getParameter(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $(function() {
        $("#searchBtn").click(function() {
            searchCheck();
        });

    });

    function searchCheck() {
      var innerText = $('#searchText').val();
        self.location = "/admin/report?keyword=" + innerText
            + "&page=${scri.page}"
            + "&startDate=${scri.startDate}"
            + "&endDate=${scri.endDate}";
    }
    </script>
    <!-- end -->

    <!-- css -->
    <style>
        #dateSort, #dateSort2 {
            border: 1px solid #d1d3e2;
            background: none;
            height: 30px;
            margin: 4px 10px 0 0;
            width: 30px;
            color: #d1d3e2;
            border-radius: 5px;
        }

        #date1 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 0;
            border: 1px solid #d1d3e2;
            background: none;
            border-radius: 3px;
        }

        #date2 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 10px;
            border: 1px solid #d1d3e2;
            background: none;
            border-radius: 3px;
        }
        .ui-datepicker-trigger {
            position: absolute;
            margin: 4px 0 0 -190px;
            height: 30px;
            width: 30px;
        }

        #empName, #hireDate {
            border: 1px solid #d1d3e2;
            background: none;
            height: 30px;
            margin: 4px 10px 0 15px;
            width: 30px;
            border-radius: 5px;
            color: #d1d3e2;
        }
    </style>
    <!-- end -->
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
                <h5>홈 > 리포트</h5>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1">
                        <h2 class="m-0 font-weight-bold text-primary">리포트
                            <div class="d-sm-flex align-items-center justify-content-between mb-1"
                                 style="float: right; margin: 4px 0 0 10px">
                            </div>
                            <div class="d-sm-flex align-items-center justify-content-between mb-1"
                                 style="float: right; margin: 4px 0 0 10px">

                                <a href="/admin/download/report?keyword=${scri.keyword}&order=${scri.order}&orderKeyword=${scri.orderKeyword}&startDate=${scri.startDate}&endDate=${scri.endDate}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                        class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                            </div>
                            <form onsubmit="return false" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                                <div class="input-group" >
                                    <input type="text" class="form-control bg-light border-1 small" placeholder="직원 검색"
                                           aria-label="Search" aria-describedby="basic-addon2" id="searchText"
                                           onKeyDown="javascript:if(event.keyCode == 13) searchCheck();" value="${scri.keyword}">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" id="searchBtn" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <div style="display:flex; float: right"><h6>
                                <input type="text" class="startDatepicker" id="date1" value="<%= startDate  %>">
                                <button id="dateSort" value="reg_dt" onclick="sort(dateSort.value)"><%= registerDate %></button> ~
                                <input type="text" class="endDatepicker" id="date2" value="<%= endDate %>">
                                <button id="dateSort2" value="reg_dt" onclick="sort(dateSort.value)"><%= registerDate %></button>
                            </h6></div>
                        </h2>
                        <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table style="text-align: center" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                <th rowspan="2">직원<button id="empName" value="emp_nm" onclick="sort(empName.value)"><%= empName %></button></th>
                                <th rowspan="2">입사일<button id="hireDate" value="hire_dt" onclick="sort(hireDate.value)"><%= hireDate %></button></th>
                                <th rowspan="2">실제근로일수</th>
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
                                <tfoot>
                                <tbody>
                                <!-- 리스트 내용 -->

                                <c:forEach var="data" items="${reportVOList}">
                                    <tr>
                                        <td style="display:none;">${data.sequence}</td>
                                        <td>${data.empName}</td>
                                        <td>${data.hireDate}</td>
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
                                <!--/ 리스트 내용 -->
                                </tbody>
                            </table>
                            <!-- 테이블 하단 바 -->
                            <!-- /테이블 하단 바 -->
                        </div>
                        <ul class="pagination" style="justify-content: center;">
                            <c:if test="${reportVOList.size() == 0}">
                                등록된 내용이 없습니다.
                            </c:if>
                            <c:if test="${pageMaker.totalPage != 0}">
                                <a href="report${pageMaker.makeSearch(pageMaker.cri.page -1)}">◀</a>&nbsp&nbsp&nbsp
                            </c:if>
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
                            <c:if test="${pageMaker.totalPage != pageMaker.cri.page && pageMaker.totalPage != 0}">
                                &nbsp&nbsp&nbsp<a href="report${pageMaker.makeSearch(pageMaker.cri.page + 1)}">▶</a>
                            </c:if>
                            <c:if test="${pageMaker.totalPage == pageMaker.cri.page && pageMaker.totalPage != 0}">
                                &nbsp&nbsp&nbsp<a href="report${pageMaker.makeSearch(pageMaker.endPage)}">▶</a>
                            </c:if>
                        </ul>
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
