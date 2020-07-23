<%--
  Created by IntelliJ IDEA.
  User: tmdgk
  Date: 2020-07-07
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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



    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link href="/static/css/datepicker/datepicker.css" rel="stylesheet">




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
                <a href="/daily">Daily</a> >
                <a>Detail</a>
                <div class="heighttdivspace"></div>

                <h2>출/퇴근관리 Monthly</h2>

                <div style="float: right ; width:800px ">


                    <div class='col-md-3 col-xs-4' style="float: left; margin-left: 30px">
                        <div class="form-group" style="margin-right: 300px">
                            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">


                                <div class="input-group-append"

                                     style="margin-right: 30px">
                                    <div class="input-group-text"
                                         style="background-color: #ffffff00; border: 1px solid #ffffff00">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control _date" id="monthpicker"
                                           style="width: 200px">
                                </div>
                            </div>
                        </div>
                    </div>


                    <%@include file="include/excel_include_commute.jsp" %>

                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                          style="float: right ; padding-top: 1px">
                        <div class="input-group">
                            <select type="text" class="form-control bg-light border-0 small" id="keyword" name="keyword" >
                                <option>All</option>
                                <c:forEach var="duty" items="${dutyid}">
                                    <option>${duty.dutyId}</option>
                                </c:forEach>

                            </select>

                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" id="searchBtn">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                </div>

                <%-------------------------------테이블 스크롤링 div--------------------------------------------%>
                <div style="width: 100%; height: 600px; overflow: auto">
                    <table class="table table-bordered" style="table-layout: fixed">

                        <thead>
                        <tr>
                            <th style="width: 110px;"> </th>
                            <c:forEach var="monthlyday" items="${monthlyday}">
                                <c:choose>
                                    <c:when test="${monthlyday.dy == '토'}">
                                        <th style="width: 100px; background-color: #2e59d9; color: #ffffff">
                                                ${monthlyday.day}(${monthlyday.dy})
                                        </th>
                                    </c:when>
                                    <c:when test="${monthlyday.dy == '일'}">
                                        <th style="width: 100px; background-color: #cd0a0a ; color: #ffffff">
                                                ${monthlyday.day}(${monthlyday.dy})
                                        </th>
                                    </c:when>
                                    <c:when test="${monthlyday.dy != '토' && monthlyday.dy != '일'}">
                                        <th style="width: 100px;">
                                                ${monthlyday.day}(${monthlyday.dy})
                                        </th>
                                    </c:when>
                                </c:choose>

                            </c:forEach>

                        </tr>
                        </thead>
                        <tbody>

                               <c:set var="lastNum" value="${lastdayNum}"/>

                    <c:forEach var="monthlyData" items="${monthlyData}">
                        <td style="height: 80px ;vertical-align:middle;">
                                ${monthlyData.emplNm}
                        </td>
                                <%-----------------문자열 ',' 기준으로 분할------------%>
                                <c:set var="regindex" value="${fn:split(monthlyData.monthlyday,',')}"/>
                                <c:set var="work" value="${fn:split(monthlyData.workSt,',' )}"/>
                                <c:set var="commTi" value="${fn:split(monthlyData.commTi,',' )}"/>
                                <%--------------날짜를 매칭하기 위한 변수 check----------------------------%>
                                <c:set var="check"></c:set>
                                <c:set var="valueindex"></c:set>
                        <c:forEach begin="1" end="${lastNum}" step="1" varStatus="n">


                                         <c:set var="check" value="-"></c:set>
                                            <%--반복 종료를 위한 변수--%>
                                         <c:set var="f" value="false"/>


                                         <c:forEach begin="0" end="${fn:length(regindex)}" step="1" varStatus="g">
                                                <%-- 문자열로 인식된 값을 정수로 파싱 --%>
                                                <fmt:formatNumber value="${regindex[g.index]}" var="gg"/>
                                           <%-- 날짜 확인후 값을 저장 --%>
                                            <c:if test="${n.index != gg} ">
                                                <c:set var="check" value="-"></c:set>
                                            </c:if>
                                            <c:if test="${n.index == gg}">
                                                <c:set var="check" value="${regindex[g.index]}"></c:set>
                                                <c:set var="valueindex" value="${g.index}"></c:set>
                                                <c:set var="f" value="true"/>

                                            </c:if>
                                           <%-------------------------------------------%>
                                         </c:forEach>

                            <c:choose>
                                <c:when test="${check == '-'}">
                                    <td style="height: 80px ;vertical-align:middle;"></td>
                                </c:when>
                                <c:when test="${check != '-'}">
                                            <c:choose>
                                                <c:when test="${work[valueindex] == '정상근무'}">
                                                    <td style="height: 80px; vertical-align:middle;">
                                                            ${commTi[valueindex]}
                                                    </td>
                                                </c:when>
                                                <c:when test="${work[valueindex] != '정상근무'}">
                                                    <td style="height: 80px;vertical-align:middle;">
                                                            ${work[valueindex]}
                                                    </td>
                                                </c:when>


                                            </c:choose>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                            </tr>
                    </c:forEach>
                        </tbody>

                    </table>
                </div>
                <%-----------------------------------------------------------------------------------------%>
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
</body>
</html>

<%--<script src="/static/js/datepicker/jquery.js" type="text/javascript"></script>--%>

<script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>

<script src="/static/js/datepicker/datepicker.js"></script>

<script type="text/javascript">


    $(function() {

        setSearchTypeSelect();
    })




    $(function () {

        $('#monthpicker').datepicker({
            format:'yyyy/mm',
            language: 'ko',
            autoHide: true,
            zIndex: 2048,
            days:[ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
            daysShort:[ "일", "월", "화", "수", "목", "금", "토" ],
            daysMin: [ "일", "월", "화", "수", "목", "금", "토" ],
            months:[ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthsShort:[ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            weekStart: 1,
            template: '<div class="datepicker-container">' + '<div class="datepicker-panel" data-view="years picker">' + '<ul>' + '<li data-view="years prev">&lsaquo;</li>' + '<li data-view="years current"></li>' + '<li data-view="years next">&rsaquo;</li>' + '</ul>' + '<ul data-view="years"></ul>' + '</div>' + '<div class="datepicker-panel" data-view="months picker">' + '<ul>' + '<li data-view="year prev">&lsaquo;</li>' + '<li data-view="year current"></li>' + '<li data-view="year next">&rsaquo;</li>' + '</ul>' + '<ul data-view="months"></ul>' + '</div>' + '<div class="datepicker-panel" data-view="days picker">' + '<ul>' + '<li data-view="month prev">&lsaquo;</li>' + '<li data-view="month current"></li>' + '<li data-view="month next">&rsaquo;</li>' + '</ul>' + '<ul data-view="week"></ul>' + '<ul data-view="days"></ul>' + '</div>' + '</div>'
        });

    });

    $('._date').change(function(){
        var date = $(this).val(); //날짜 추출
        // $('#regDt').focus();
        // return;

        var url = "monthly"

            +"?regDt=" + encodeURIComponent(date);

        window.location.href = url;
    });
    function setSearchTypeSelect(){




        //검색 버튼이 눌리면
        $('#searchBtn').on('click',function(){

            var keywordVal = $("#keyword option:selected").val();
            //검색어 입력 안했으면 검색창




            var url = "monthly"
                + "?keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;
        })
    }
</script>