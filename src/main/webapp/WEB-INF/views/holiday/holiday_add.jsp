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
 <%--           <a href="/home"> 홈 </a>> <a href="/holiday"> 휴가관리 </a>> <a href="/holiday_details"> 상세 </a>> 추가<br>

                <h3 style="margin-top: 10px; margin-bottom: 10px">휴가 추가하기</h3>

                <div style="margin-left: 10px; width: fit-content; height: 100px;">
                    <div style="float: left">
                        <img src="" width="100px" height="100px" alt="기본사진">
                    </div>
                    <c:forEach var="holiday" items="${holidayDetails}">
                    <div style=" padding-top: 20px; margin-left: 20px; float: right; height: 100%">
                        <h5>${holiday.name}</h5>
                            ${holiday.task} 팀 | ${holiday.jobGrade}
                    </div>
                </div>

                <div style="width: fit-content; height: fit-content; margin-left: 10px; margin-top: 20px">
                    <input type="text" id="testDatepicker"/>2020년 00월 00일 ~ 2020년 00월 00일<br><br>
                    (선택된 날짜 표시) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (사용하는 휴가) 일 / ${holiday.restHoliday} 일 전체휴가 15일<br><br>
                    휴가유형 <select name="select_type" id="select_type" style="margin-left: 50px; background-color: rgba(255,255,255,0.0); border-radius: 5px 5px 5px 5px">
                    <option value="regular_holiday">정기휴가</option>
                    <option value="morning_holiday">오전반차</option>
                    <option value="afternoon_holiday">오후반차</option>
                    <option value="reservist">예비군</option>
                </select><br><br>
                    메모<br>
                    <textarea cols="100%" rows="5" placeholder="메모를 입력해주세요." style="margin-top: 10px"></textarea><br><br>
                    <input type="button" value="저장" style="float: right" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"/><br><br>
                </div>
            </div>
            </c:forEach>--%>

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
    $(function(){
        $("#testDatepicker").datepicker({

        });
    });
</script>
