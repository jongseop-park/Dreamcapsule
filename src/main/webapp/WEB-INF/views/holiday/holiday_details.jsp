<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Holiday_details</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">
    <script>
        document.getElementById("div_1").addEventListener('click',function(event){
            alert("dd");
        });
    </script>

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
                <div style='width: 50%;height: 100%; float:left;'>
                    <div style='width: 100%;height: 30%; float:top;'>
                        <div style='width : 100%; height : 20%; float:top;'>
                            <a href="/home"> 홈 </a>> <a href="/holiday"> 휴가관리 </a>> 상세<br>
                            <h3 style="margin-top: 10px; margin-bottom: 30px">휴가 관리하기</h3>
                        </div>
                        <div style='width : 30%; height : 80%; float:left; margin-top: 10px '>
                            <img src="" width="100px" height="100px"
                                 alt="기본사진">
                        </div>
                        <div style='width : 70%; height : 80%; float:right; margin-top:10px; vertical-align: center'>

                                <h5>${holidayDetailsInfo.name}</h5>
                                <form>
                                    <div style="width: 60%; float:left;">
                                            ${holidayDetailsInfo.task} 팀 | ${holidayDetailsInfo.jobGrade}
                                    </div>
                                    <div style="width: 40%; float:right;">
                                        <a href="/holiday_add"
                                           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">추가</a>
                                    </div>
                                </form>
                        </div>
                    </div>
                    <div style='width: 100%;height: 70%; float: bottom;' id="selectHoliday">
                        <c:forEach var="holiday" items="${holidayDetails}" varStatus="status">
                            <div id="div_${status.count}" style=' border-style: solid; border-radius:10px 10px 10px 10px; width: 90%; height: 150px; margin-top: 20px'>
                                <div style=' border-style: solid; border-radius: 30px 30px 30px 30px; width: 100px;text-align: center; float: right; margin: 10px'>
                                    <c:set var="name">${holiday.holidayDate} div_${status.count}</c:set>

                                    <c:choose>
                                        <c:when test="${holiday.stateYsn eq 'Y'.charAt(0)}">
                                            승인<br>
                                        </c:when>
                                        <c:when test="${holiday.stateYsn eq 'S'.charAt(0)}">
                                            대기중<br>
                                        </c:when>
                                        <c:when test="${holiday.stateYsn eq 'N'.charAt(0)}">
                                            반려<br>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <br>
                                <div style="vertical-align: middle; padding-left: 10px">
                                    기간 ${holiday.holidayDate.substring(0,9)} ~ ${holiday.holidayDate.substring(holiday.holidayDate.length()-9,holiday.holidayDate.length())} | ${holiday.useHoliday}일 <br><br>
                                    유형 ${holiday.holidayType}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div style='width: 50%;height: 100%; float:right; padding-top: 50px;'>

                    휴가날짜 <span id="spanDate"></span> <br><br>
                    차감휴가 <span id="spanUse"></span> 일<br><br>
                    휴가유형 <span id="spanType"></span><br><br>
                    메모 <span id="spanMemo"></span><br><br>
                    신청날짜 <span id="spanApTime"></span><br><br>
                    <div style="float: left">
                        승인<input type="radio" value="승인" name="state">
                    </div>
                    <div style="margin-left: 300px">
                        반려<input type="radio" value="반려" name="state">
                    </div>
                    <br><br>
                    <textarea cols="65%" rows="5" placeholder="답변을 입력 해 주세요."></textarea>
                    <br><br>
                    <input id='btn' type="button" value="저장" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                           style="float: right; ">
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
<script>

    var y = new Array();
    for(var x = 0; x < ${holidayDetails.size()}; x++) {
        y = document.getElementById("div_" + (x+1);
        $(y[x]).click(function () {
            alert("클릭");
        });
    }
</script>


