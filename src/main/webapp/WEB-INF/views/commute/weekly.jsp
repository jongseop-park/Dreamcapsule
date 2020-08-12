<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" media="screen"
          href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">
    <style>
        .sortbtn {
            border: 0px;
            background-color: rgba(0, 0, 0, 0);
            color: skyblue;
            padding: 5px;

        }

        .table-bordered th:nth-child(1) {
            width: 5%;
        }

        .table-bordered th:nth-child(2) {
            width: 9%;
        }

        .table-bordered th:nth-child(3) {
            width: 5%;
        }

        .table-bordered th:nth-child(4) {
            width: 7%;
        }

        .table-bordered th:nth-child(n+5):nth-child(-n+11) {
            width: 5%;

        }

        .table-bordered th:nth-child(12) {
            width: 6%;
        }

        .fix td {
            height: 80px;
            vertical-align: middle;
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


                <a href="/home"> 홈 </a> >
                <a>출퇴근 관리 </a> >
                <a href="/weekly">Weekly</a>
                <div class="heighttdivspace"></div>

                <h2>출/퇴근관리 Weekly</h2>

                <div style="float: right ; width:800px ">


                    <div class='col-md-3 col-xs-4' style="float: left; margin-left: 30px">
                        <div class="form-group" style="margin-right: 300px">
                            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">


                                <div class="input-group-append" data-target="#datetimepicker1"
                                     data-toggle="datetimepicker"
                                     style="margin-right: 30px">
                                    <div class="input-group-text"
                                         style="background-color: #ffffff00; border: 1px solid #ffffff00">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control _date" id="week-picker"
                                           style="width: 250px; text-align: center"
                                           value="${pageMaker.cri.startDate} ~ ${pageMaker.cri.endDate}">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="d-sm-flex align-items-center justify-content-between mb-1"
                         style="float: right; margin: 4px 0 0 10px">

                        <a href="download/weeklydown?startDate=${pageMaker.cri.startDate}&endDate=${pageMaker.cri.endDate}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                    </div>

                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                          style="float: right ; padding-top: 1px">
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


                <table class="table table-bordered" id="tblExport">
                    <thead>
                    <tr>
                        <th>직원
                            <button value="empl_nm" id="emplNm" class="sortbtn" onclick="sort(emplNm.value)"></button>
                        </th>
                        <th>직무
                            <button value="duty_nm" id="dutyNm" class="sortbtn" onclick="sort(dutyNm.value)"></button>
                        </th>
                        <th>직급
                            <button value="rank_nm" id="rankNm" class="sortbtn" onclick="sort(rankNm.value)"></button>
                        </th>
                        <th>근무지
                            <button value="work_pl" id="workPl" class="sortbtn" onclick="sort(workPl.value)"></button>
                        </th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                        <th>일</th>
                        <th>(주) 근무시간</th>
                    </tr>
                    </thead>
                    <tbody class="fix">

                    <c:forEach var="weekly" items="${weekly}">

                        <td>${weekly.emplNm}</td>

                        <td>${weekly.dutyNm} 팀</td>
                        <td>${weekly.rankNm}</td>
                        <td>${weekly.workPl}</td>

                        <c:set var="array">월,화,수,목,금,토,일</c:set>
                        <c:set var="wDate" value="${fn:split(weekly.weekDate,',')}"></c:set>
                        <c:set var="comData" value="${fn:split(weekly.commTi,',')}"></c:set>
                        <c:set var="workData" value="${fn:split(weekly.workSt,',' )}"></c:set>
                        <c:set var="check"></c:set>
                        <c:set var="valueindex"></c:set>
                        <c:forEach var="array" items="${array}" varStatus="idx">

                            <c:set var="f" value="false"/>

                            <c:forEach begin="0" end="${fn:length(wDate)}" step="1" varStatus="g">
                                <c:if test="${f eq false}">
                                    <c:if test="${wDate[g.index] != array}">
                                        <c:set var="check" value="-"></c:set>
                                    </c:if>
                                    <c:if test="${wDate[g.index] == array}">

                                        <c:set var="check" value="${wdate[g.index]}"></c:set>
                                        <c:set var="valueindex" value="${g.index}"></c:set>
                                        <c:set var="f" value="true"/>
                                    </c:if>
                                </c:if>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${check == '-'}">
                                    <td>-</td>
                                </c:when>
                                <c:when test="${check != '-'}">
                                    <c:choose>
                                        <c:when test="${workData[valueindex] == '정상근무' || workData[valueindex] == '지각'}">
                                            <td>${comData[valueindex]}</td>
                                        </c:when>
                                        <c:when test="${workData[valueindex] != '정상근무' && workData[valueindex] != '지각'}">
                                            <td>${work[valueindex]}</td>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                            </c:choose>

                        </c:forEach>
                        <td>${weekly.totalTi} 시간</td>

                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
                <c:if test="${weekly.size()<1}">
                    <div style="width: 100%;text-align: center; font-size: 30px">
                        <span>데이터가 없습니다.</span>
                    </div>
                </c:if>
                <div>
                    <ul class="pagination" style="justify-content: center">
                        <%--                        <c:if test="${pageMaker.prev}">--%>
                        <%--                            <li><a href="daily${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>--%>
                        <%--                        </c:if>--%>
                        <%--                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">--%>
                        <%--                                <li id="page${idx}"><a href="daily${pageMaker.makeQuery(idx)}">${idx}</a></li>--%>
                        <%--                            </c:forEach>--%>
                        <%--                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
                        <%--                            <li><a href="daily${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>--%>
                        <%--                        </c:if>--%>
                        <li><a href="weekly${pageMaker.weekmakeQuery(pageMaker.startPage - 1)}">이전</a></li>
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            <li id="page${idx}"><a href="weekly${pageMaker.weekmakeQuery(idx)}">${idx}</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            <li><a href="weekly${pageMaker.weekmakeQuery(pageMaker.endPage + 1)}">다음</a></li>
                        </c:if>

                    </ul>
                </div>
            </div>


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
    <%@include file="/WEB-INF/views/include/logout_cmmn.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <%@include file="../include/plugins_js.jsp" %>


<%--    --%>
<%--    <script type="text/javascript">$(document).ready(function () {--%>
<%--        $("#btnExport").click(function () {--%>
<%--     --%>
<%--            --%>
<%--            var uri =--%>
<%--                $("#tblExport").load("weekly?page=3&perPageNum=10&orderKeyword=reg_dt&orderMethod=asc#tblExport").excelexportjs({--%>
<%--                containerid: "tblExport",--%>
<%--                datatype: 'table',--%>
<%--                returnUri:true--%>
<%--            });--%>
<%--            $(this).attr('download','ExportToExcel.xls').attr('href',uri).attr('target','_blank');--%>
<%--        });--%>
<%--    });</script>--%>


</body>
</html>

<%--<script src="/static/js/datepicker/jquery.js"></script>--%>
<!-----------------------데이트피커 (달력)------------------->
<%--<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>--%>


<script src="/static/js/datepicker/jquery-ui.min.js" type="text/javascript"></script>
<script src="/static/js/datepicker/jquery.ui.datepicker-ko.js" type="text/javascript"></script>
<!-----------------------excel다운로드------------------->

<script src="/static/js/excel/jquery.techbytarun.excelexportjs.js"></script>
<!--------------------------------------------------------------->
<script type="text/javascript">


    $(function () {
        var btnarray = new Array();
        btnarray[0] = "emplNm";
        btnarray[1] = "dutyNm";
        btnarray[2] = "rankNm";
        btnarray[3] = "workPl";

        for (var i = 0; i < btnarray.length; i++) {
            console.log(document.getElementById(btnarray[i]).value);
            if (document.getElementById(btnarray[i]).value == "${pageMaker.cri.worderKeyword}") {
                if ("${pageMaker.cri.orderMethod}" == "asc") {

                    document.getElementById(btnarray[i]).innerText = "▲";
                } else {
                    document.getElementById(btnarray[i]).innerText = "▼";
                }

            } else {
                document.getElementById(btnarray[i]).innerText = "▲";
            }

        }
        setPerPageNumSelect();
        setSearchTypeSelect();
        var thisPage = '${pageMaker.cri.page}';
        $('#page' + thisPage).addClass('active');


    })

    function sort(orderkeyword) {

        var order; //정렬 기준(오름차순,내림차순)을 담을 변수
        var e = window.event,              //클릭한 해당 버튼의 ID 값을 추출
            btn = e.target || e.srcElement;    //클릭한 해당 버튼의 ID 값을 추출
        // document.getElementById(btn.id).innerText = "▼";
        var intext = document.getElementById(btn.id).innerText;

        if ("${pageMaker.cri.orderMethod}" == "asc") {
            order = "desc";
        } else {
            order = "asc";
        }

        self.location = "weekly?page=1" +
            "&keyword=" + "${pageMaker.cri.keyword}" +
            "&startDate=" + "${pageMaker.cri.startDate}" +
            "&endDate=" + "${pageMaker.cri.endDate}" +
            "&worderKeyword=" + orderkeyword +
            "&orderMethod=" + order;


    }


    function setPerPageNumSelect() {
        var perPageNum = "${pageMaker.cri.perPageNum}";
        var $perPageSel = $('#perPageSel');
        var thisPage = '${pageMaker.cri.page}';
        $perPageSel.val(perPageNum).prop("selected", true);
        //PerPageNum가 바뀌면 링크 이동
        $perPageSel.on('change', function () {
            //pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
            window.location.href = "weekly?page=" + thisPage + "&perPageNum=" + $perPageSel.val();
        });
    }


    $('#week-picker').datepicker({
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
            '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
        monthNamesShort: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
            '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: '년',
        selectWeek: true,
        onSelect: function (dateText, inst) {
            var date = $(this).datepicker('getDate');
            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 1);
            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 7);
            var dateFormat = 'yy/mm/dd'
            startDate = $.datepicker.formatDate(dateFormat, startDate, inst.settings);
            endDate = $.datepicker.formatDate(dateFormat, endDate, inst.settings);

            $('#week-picker').val(startDate + '~' + endDate);
            console.log(startDate + '~' + endDate);
            var url = "weekly?page=1"
                + "&perPageNum=" + "${pageMaker.cri.perPageNum}"
                + "&startDate=" + encodeURIComponent(startDate)
                + "&endDate=" + encodeURIComponent(endDate);
            window.location.href = url;
            setTimeout("applyWeeklyHighlight()", 100);
        },
        beforeShow: function () {
            setTimeout("applyWeeklyHighlight()", 100);
        }

    })

    function setSearchTypeSelect() {


        var $keyword = $('#keyword');

        //검색 버튼이 눌리면
        $('#searchBtn').on('click', function () {

            var keywordVal = $keyword.val();

            //검색어 입력 안했으면 검색창
            if (!keywordVal) {
                alert("검색어를 입력하세요!");
                $('#keyword').focus();
                return;
            }
            var url = "weekly?page=1"
                + "&perPageNum=" + "${pageMaker.cri.perPageNum}"
                + "&startDate=" + "${pageMaker.cri.startDate}"
                + "&endDate=" + "${pageMaker.cri.endDate}"
                + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;
        })
        $('#keyword').keydown(function(key){
            if(key.keyCode==13) {
                key.preventDefault();//input의 enter 기능을 막는다.
                $("#searchBtn").trigger("click"); //seachBtn의 클릭 이벤트를 발생시킨다.
            }
        });

    }


</script>
