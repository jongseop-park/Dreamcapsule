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
    <title>Holiday_total</title>

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
                <h6><a href="/home"> 홈 </a>> 휴가 관리</h6>
                <div>
                    <h2> 휴가 관리 </h2>
                    <h6 align="right">
                        <i class="fa fa-calendar"></i>
                        <select id="selectYears" onchange="location.replace(this.value)" style="border: none;">
                            <c:forEach var="yearList" items="${holidayYear}" varStatus="yearListStatus">
                                <option value="/holiday?year=${yearList.holidayYear}&selectIndexYear=${yearListStatus.count-1}&task=${selectTask}&selectIndexTask=${selectIndexTask}">${yearList.holidayYear}</option>
                            </c:forEach>
                        </select>
                        <select id="selectTasks" onchange="location.replace(this.value)">
                            <option value="/holiday">회사 전체</option>
                            <c:forEach var="taskList" items="${holidayTask}" varStatus="taskListStatus">
                                <option value="/holiday?year= ${selectYear}&selectIndexYear=${selectIndexYear}&task=${taskList.task}&selectIndexTask=${taskListStatus.count}">${taskList.task}</option>
                            </c:forEach>
                        </select>
                        <span id="click"><%@include file="/WEB-INF/views/include/excel_include.jsp"%></span>
                    </h6>
                </div>
                <div id="div_table">
                    <table class="table table-bordered" id="holidayTable">
                        <thead>
                        <tr>
                            <th id="직원">직원 ▼</th>
                            <th id="직무">직무 ▼</th>
                            <th id="직급">직급 ▼</th>
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
                                <td id="useHoliday_${status.count}">${useDay[status.count-1]} 일 / 15 일</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <span id="trash"></span>
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

    <c:set var="x" value="1"/>
    <c:forEach begin="1" end="${holidayList.size()}" varStatus="xStatus">
    <c:set var="y" value="1"/>
    <c:forEach begin="1" end="12" varStatus="status">

    <c:choose>
    <c:when test="${holidayUse[x-1][y-1] ne '-'}">
    document.getElementById("${status.count}_${xStatus.count}").innerHTML = "<a href='/holiday_details?seq=${holidayList.get(x-1).seq}&year=${selectYear}&month=${y}'>${holidayUse[x-1][y-1]}</a>";
    </c:when>
    <c:otherwise>
    document.getElementById("${status.count}_${xStatus.count}").innerHTML = "${holidayUse[x-1][y-1]}";
    </c:otherwise>
    </c:choose>

    <c:set var="y" value="${y+1}"/>
    </c:forEach>
    <c:set var="x" value="${x+1}"/>
    </c:forEach>

    document.getElementById("selectYears").selectedIndex = ${selectIndexYear};
    document.getElementById("selectTasks").selectedIndex = ${selectIndexTask};


    $(function () {
        $("#holidayTable thead th").on("click",function () {
            var keyword = $(this).attr('id');
            var sort;

            if(keyword == "직원" || keyword == "직무" || keyword == "직급"){

                switch(keyword){
                    case '직원' :
                        keyword = "NAME";
                        break;
                    case '직무' :
                        keyword = "TASK";
                        break;
                    case '직급' :
                        keyword = "JOB_GRADE"
                        break;
                }

                if(${sorting_type.equals("ASC")}){
                    sort = "DESC";
                }else{
                    sort = "ASC";
                }
                self.location = "/holiday?year=${selectYear}&selectIndexYear=${selectIndexYear}&task=${selectTask}&selectIndexTask=${selectIndexTask}&sortingValue="+ keyword +"&sortingType="+sort;
           }
        });
    });
</script>