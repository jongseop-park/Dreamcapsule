<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!-- 정렬 -->
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
        td {
            white-space: nowrap;
            text-align: center;
        }

        th {
            white-space: nowrap;
            text-align: center;
            position: relative;
        }

        #div_table {
            width: 100%;
            overflow: auto;
        }
        select{
            margin: 6px 0 0 30px;
            background-color: rgba(255,255,255,0.0);
            border-radius: 5px 5px 5px 5px;
            width: 100px
        }

        .sortTh{
            cursor:pointer;
        }

        td a{
            border-style: solid;
            border-radius: 5px 5px 5px 5px;
            padding: 3px 8px 3px 8px;
            border-width: 2px;
        }
        td{
            position : relative;
        }

        td:hover .div_tooltip{
            visibility: visible;
        }
        .newLabel{
            position : absolute;
            width: 20px;
            height: 22px;
            border-radius: 20px 20px 20px 20px;
            border-style: solid;
            border-width: 1px;
            border-color: #2E56C7;
            top: 1px;
            left: 1px;
            text-align: center;
            background-color: #2E56C7;
            color: white;
            display: none;
        }

        .div_tooltip{
           visibility: hidden;
            width: 150px;
            background-color: rgba(46,86,199,0.7);
            color: white;
            text-align: center;
            border-radius: 10px;
            padding: 10px 5px;
            position: absolute;
            z-index: 100;
            bottom: 80%;
            left: 50%;
            margin-left: -75px;
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
                <h6><a href="home"> 홈 </a>> 휴가 관리</h6>
                <div>
                    <h2> 휴가 관리 </h2>
                    <h6 align="right">
                        <!--데이터베이스에 기록된 휴가 년도를 표시-->
                        <i class="fa fa-calendar"></i>
                        <select id="selectYears" onchange="location.replace(this.value)" style="border: none;">
                            <c:forEach var="yearList" items="${holidayYear}" varStatus="yearListStatus">
                                <option id= "${yearList.holidayYear}" value="holiday?year=${yearList.holidayYear}&task=${cri.task}">${yearList.holidayYear}</option>
                            </c:forEach>
                        </select>
                        <!--info에 기록된 직무 표시-->
                        <select id="selectTasks" onchange="location.replace(this.value)">
                            <option id="0" value="holiday">회사 전체</option>
                            <c:forEach var="taskList" items="${holidayTask}" varStatus="taskListStatus">
                                <option id="${taskList.task}" value="holiday?year=${cri.year}&task=${taskList.task}">${taskList.task}</option>
                            </c:forEach>
                        </select>
                        <a href="holidayExcelDown.do" id="download" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                    </h6>
                </div>
                <div id="div_table">
                    <table class="table table-bordered" id="holidayTable">
                        <thead>
                        <tr>
                            <th id="NAME" class="sortTh">직원 ▼</th>
                            <th id="TASK" class="sortTh">직무 ▼</th>
                            <th id="JOB_GRADE" class="sortTh">직급 ▼</th>
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
                            <th>사용 휴가</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="holiday" items="${holidayList}" varStatus="status">
                            <tr id ="table_${status.count}">
                                <td id="name_${status.count}">${holiday.name}</td>
                                <td id="task_${status.count}">${holiday.task} 팀</td>
                                <td id="jobGrade_${status.count}">${holiday.jobGrade}</td>
                                <td id="1_${status.count}"></td>
                                <td id="2_${status.count}"></td>
                                <td id="3_${status.count}"></td>
                                <td id="4_${status.count}"></td>
                                <td id="5_${status.count}"></td>
                                <td id="6_${status.count}"></td>
                                <td id="7_${status.count}"></td>
                                <td id="8_${status.count}"></td>
                                <td id="9_${status.count}"></td>
                                <td id="10_${status.count}"></td>
                                <td id="11_${status.count}"></td>
                                <td id="12_${status.count}"></td>
                                <td id="useHoliday_${status.count}">${useDay[status.count-1]} 일 / ${holiday.restHoliday} 일</td>
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
    <%@include file="/WEB-INF/views/include/logout_cmmn.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <%@include file="/WEB-INF/views/include/plugins_js.jsp" %>

</body>
</html>


<script type="text/javascript">
    /*테이블 값 입력*/
    <c:set var="x" value="1"/>
    <c:forEach begin="1" end="${holidayList.size()}" varStatus="xStatus">
    <c:set var="y" value="1"/>
    <c:forEach begin="1" end="12" varStatus="status">

    <c:choose>
    <c:when test="${holidayUse[x-1][y-1] ne null}">
    document.getElementById("${status.count}_${xStatus.count}").innerHTML = "<div class='div_tooltip'>테스트<br>테스트<br>테스트<br>테스트<br></div><div id='div_${status.count}_${xStatus.count}' class='newLabel'>N</div><a href='holiday_details?seq=${holidayList.get(x-1).seq}&year=${cri.year}&month=${y}'>${holidayUse[x-1][y-1]}</a>";
    </c:when>

    <c:otherwise>
    document.getElementById("${status.count}_${xStatus.count}").innerHTML = "-";
    </c:otherwise>
    </c:choose>

    <c:set var="y" value="${y+1}"/>
    </c:forEach>
    <c:set var="x" value="${x+1}"/>
    </c:forEach>

    $(function () {
        /*휴가 신청 상태 대기 중인 월 표시*/
        <c:forEach items="${newHoliday}" var="holiday">
            $("#div_${holiday.holidayMonth}_${holiday.seq}").css("display","block");
        </c:forEach>
        /*정렬 상태 텍스트 교체*/
        /*이전 선택되어 있는 값을 선택*/
        $('#selectTasks option:contains("${cri.task}")').prop("selected","selected");
        $('#selectYears option:contains("${cri.year.toString()}")').prop("selected","selected");

        if(${cri.sortingType.equals("ASC")}){
            $('#NAME').val('직원 ▼');
            $('#TASK').val('직무 ▼');
            $('#JOB_GRADE').val('직급 ▼');
        }else{
            switch('${cri.sortingValue}'){
                case "NAME" :
                    document.getElementById("NAME").innerHTML = "직원 ▲";
                    $('#TASK').text('직무 ▼');
                    $('#JOB_GRADE').text('직급 ▼');
                    break;
                case "TASK" :
                    $('#NAME').text('직원 ▼');
                    $('#TASK').text('직무 ▲');
                    $('#JOB_GRADE').text('직급 ▼');
                    break;
                case "JOB_GRADE" :
                    $('#NAME').text('직원 ▼');
                    $('#TASK').text('직무 ▼');
                    $('#JOB_GRADE').text('직급 ▲');
                    break;
            }
        }
        /*지정된 th 클릭시 정렬*/
        $("#holidayTable thead th").on("click",function () {
            var keyword = $(this).attr('id');
            var sort;

            if(keyword == "NAME" || keyword == "TASK" || keyword == "JOB_GRADE"){

                if(${cri.sortingType.equals("ASC")}){
                    sort = "DESC";
                }else{
                    sort = "ASC";
                }
                self.location = "holiday?year=${cri.year}&task=${cri.task}&sortingValue="+ keyword +"&sortingType="+sort;
                $('#download').attr("href","holidayExcelDown.do?year=${cri.year}&task=${cri.task}&sortingValue="+ keyword +"&sortingType="+sort);
           }
        });

        $("#holidayTable thead td").hover(function () {

        });

        /*엑셀 다운로드*/
        $('#download').attr("href","holidayExcelDown.do?year=${cri.year}&task=${cri.task}");
    });
</script>