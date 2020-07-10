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
                            휴가 관리하기
                        </div>
                        <div style='width : 30%; height : 80%; float:left; margin-top: 10px '>
                            <img src="/resources/static/img/holiday_sample_img.png" width="100px" height="100px" alt="기본사진">
                        </div>
                        <div style='width : 70%; height : 80%; float:right; margin-top: 10px'>
                            <c:forEach var="holiday" items="${holidayDetails}">

                                <h5>${holiday.name}</h5>
                                <form>
                                    <div style="width: 60%; float:left;">
                                            ${holiday.task} 팀 | ${holiday.jobGrade}
                                    </div>
                                    <div style="width: 40%; float:right;">
                                        <input type="button" value="추가">
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                    <div style='width: 100%;height: 70%; float: bottom;'>
                        <div style=' border-style: solid; border-radius:10px 10px 10px 10px; width: 90%; height: 150px;'>

                            <c:forEach var="holiday" items="${holidayDetails}">
                             <c:set var = "name">${holiday.holidayDate}</c:set>

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
                                기간     ${holiday.holidayDate.substring(0,7)} ~ ${holiday.holidayDate.substring(holiday.holidayDate.length()-8,holiday.holidayDate.length())} | *일 <br>
                                유형     ${holiday.holidayType}
                            
                        </div>
                    </div>
                </div>
                <div style='width: 50%;height: 100%; float:right;'>
                    
                    휴가날짜 ${holiday.holidayDate} <br><br>
                    차감휴가 일<br><br>
                    휴가유형 ${holiday.holidayType} <br><br>
                    메모 ${holiday.note}<br><br>
                    신청날짜 ${holiday.applicationTime}<br><br>
                    <form>
                        승인<input type="radio" value="승인" name="state">
                        반려<input type="radio" value="반려" name="state">
                        <br><br>
                        <input type="text" width = 100% height = 20%>
                        <br><br>
                        <input type="button" align="right" value="저장">
                    </form>

                    </c:forEach>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
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
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <%@include file="/WEB-INF/views/include/plugins_js.jsp" %>

</body>
</html>
