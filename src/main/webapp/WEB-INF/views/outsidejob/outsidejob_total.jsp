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
    <title>52TIME ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        #pagediv {
            text-align: center;
            bottom: 15%;
            left: 600px;
            right: 400px;
        }
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
        li {
            list-style: none;
            padding: 6px;
        }
        .date{
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 5px;
            border: none;
            background-color: rgba(255,255,255,0.0);
        }
        table.ui-datepicker-calendar {
            display:none;
        }
        select{
            background-color: rgba(255,255,255,0.0);
            border: none;
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
                    <p><a href="home">홈</a> > 외근관리</p>
                    <h4 style="display: inline">외근관리</h4>
                    <form id="searchForm" role="form" method="get" class="d-none d-sm-inline-block form-inline mr-0 ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                        <div class="input-group">
                            <img style="height: 30px; width: 30px; margin: 4px 2px 0 150px;"
                                 src="https://icons.iconarchive.com/icons/custom-icon-design/mono-business-2/32/calendar-icon.png">&nbsp;&nbsp;
                            <input class="date" type="text" id="startDatePicker" name="startDatePicker" value="${scri.startDate}" readonly/>&nbsp;&nbsp;<span style="margin-top: 8px;">~</span>&nbsp;&nbsp;
                            <input class="date" type="text" id="endDatePicker" name="endDatePicker" value="${scri.endDate}" readonly/>&nbsp;&nbsp;
                            <div class="input-group">
                                <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control bg-light border-1 small" placeholder="직원검색" aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                  <button class="btn btn-primary" type="button" id="searchNameBtn">
                                      <i class="fas fa-search fa-sm" ></i>
                                  </button>
                                </div>
                            </div>
                            &nbsp;&nbsp;<a href="outsideExcelDown.do" id="download" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                        </div>
                    </form>
                </div>
                <br>
                <div id="div_table">
                    <table class="table table-bordered" id="mainTable">
                        <thead>
                        <tr>
                            <th id="NAME">직원 ▼</th>
                            <th id="TASK">직무 ▼</th>
                            <th id="JOB_GRADE">직급 ▼</th>
                            <th>외근일</th>
                            <th>출/퇴근시간</th>
                            <th>출근지</th>
                            <th>퇴근지</th>
                            <th id="STATE_YSN">상태 ▼</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="outside" items="${searchList}" varStatus="status">
                            <tr>
                                <td style="display: none">${outside.seq}</td>
                                <td id="name_${status.count}">${outside.name}</td>
                                <td id="task_${status.count}">${outside.task}</td>
                                <td id="grade_${status.count}">${outside.jobGrade}</td>
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
                    <div id="pagediv">
                        <ul>
                            <c:choose>
                                <c:when test="${pageMaker.cri.page > 1}">
                                    <a href="outside${pageMaker.makeSearch(pageMaker.cri.page-1)}">◀</a>
                                </c:when>
                                <c:otherwise>
                                    ◀
                                </c:otherwise>
                            </c:choose>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                <c:choose>
                                    <c:when test="${idx == pageMaker.cri.page}">
                                        <b>&nbsp<a href="outside${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp</b>
                                    </c:when>
                                    <c:otherwise>
                                        &nbsp<a href="outside${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${pageMaker.cri.page < pageMaker.endPage}">
                                    <a href="outside${pageMaker.makeSearch(pageMaker.cri.page+1)}">▶</a>
                                </c:when>
                                <c:otherwise>
                                    ▶
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>

    $(function () {
        /* 데이트 피커 설정 부분*/
        var searchMonth;
        getToFrom();
        var datepickerSet ={
            dateFormat:'yy 년 mm 월',
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showButtonPanel: true,
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear : true
        }

        datepickerSet.closeText = "선택";
        datepickerSet.onClose = function(){
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
            $(this).datepicker('setDate', new Date(year, month, 1));
            getToFrom();
            self.location = "outside" + '${pageMaker.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchMonth=" + searchMonth;
        }

        $("#startDatePicker").datepicker(datepickerSet);
        $("#endDatePicker").datepicker(datepickerSet);

        $("#startDatePicker").datepicker("option","maxDate",$("#endDatePicker").val());
        $("#endDatePicker").datepicker("option","minDate",$("#startDatePicker").val());

        if(${scri.startDate eq null}){
            $("#startDatePicker").datepicker('setDate','today');
            $("#endDatePicker").datepicker('setDate','today');
        }

        $("#startDatePicker").val(firstDay());
        $('#endDatePicker').val(lastDay());

        function firstDay(){
            var year = ${scri.selectDate.substring(0,4)};
            var month = ${scri.selectDate.substring(5,6)};
            return year + " 년 " + month + " 월 1 일";
        }

        function lastDay(){
            var year = ${scri.selectDate.substring(7,11)};
            var month = ${scri.selectDate.substring(12,scri.selectDate.length())};
            return year + " 년 " + month + " 월 " + new Date(year,month,0).getDate() + " 일";
        }

        function getToFrom(){
            var startYear = $("#startDatePicker").val().substring(0,4);
            var endYear = $("#endDatePicker").val().substring(0,4);
            var startMonth = $("#startDatePicker").val().substring(7,9);
            var endMonth = $("#endDatePicker").val().substring(7,9);

            searchMonth = startYear + ',' + startMonth + ',' + endYear + ',' + endMonth;
        }

        $(document).on('click', '#mainTable tbody tr', function () {
            var tr = $(this);
            var td = tr.children();
            self.location = "outside_details?"
                + "seq=" + td.eq(0).text();
        });

        $('#searchNameBtn').on('click',function () {
                self.location = "outside" + '${pageMaker.makeQuery(1)}' + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchMonth=" + searchMonth;
        });

        $("#mainTable thead th").on("click",function () {
            var sortKeyword = $(this).attr('id');
            var sort;

            if(sortKeyword == "NAME" || sortKeyword  == "TASK" || sortKeyword  == "JOB_GRADE" || sortKeyword == "STATE_YSN"){
                if(${scri.sort eq "ASC"}){
                    sort = "DESC";
                }else{
                    sort = "ASC";
                }
                self.location = "outside" + '${pageMaker.makeQuery(1)}' + "&keyword=" + '${scri.keyword}' + "&searchMonth=" + '${scri.selectDate}' +"&sortKeyword=" + sortKeyword + "&sort=" +sort;
            }
        });

        if(${scri.sort.equals("ASC")}){
            $('#NAME').text('직원 ▼');
            $('#TASK').text('직무 ▼');
            $('#JOB_GRADE').text('직급 ▼');
            $('#STATE_YSN').text('상태 ▼');
        }else{
            switch('${scri.sortKeyword}'){
                case "NAME" :
                    document.getElementById("NAME").innerHTML = "직원 ▲";
                    document.getElementById('TASK').innerHTML = "직무 ▼";
                    $('#JOB_GRADE').text('직급 ▼');
                    $('#STATE_YSN').text('상태 ▼');
                    break;
                case "TASK" :
                    $('#NAME').text('직원 ▼');
                    $('#TASK').text('직무 ▲');
                    $('#JOB_GRADE').text('직급 ▼');
                    $('#STATE_YSN').text('상태 ▼');
                    break;
                case "JOB_GRADE" :
                    $('#NAME').text('직원 ▼');
                    $('#TASK').text('직무 ▼');
                    $('#JOB_GRADE').text('직급 ▲');
                    $('#STATE_YSN').text('상태 ▼');
                    break;
                case "STATE_YSN" :
                    $('#NAME').text('직원 ▼');
                    $('#TASK').text('직무 ▼');
                    $('#JOB_GRADE').text('직급 ▼');
                    $('#STATE_YSN').text('상태 ▲');
                    break;
            }
        }
    });
</script>