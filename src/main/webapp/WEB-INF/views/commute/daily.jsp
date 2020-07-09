<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>


<%--    데이트피커 사용 JS CSS 로드--%>
    <link rel="stylesheet" href="/static/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="/static/js/bootstrap-datepicker.js"></script>
    <script src="/static/js/bootstrap-datepicker.ko.min.js"></script>
<%--    여기까지--%>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">



    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.css" rel="stylesheet">


    <script>
        $(function() {
            $('#datePicker').datepicker({
                format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
                    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

        })//여기까지가 기본 사용 방법
        .on("changeDate", function(e) {
                //이벤트의 종류
                show : //datePicker가 보이는 순간 호출
                //hide : datePicker가 숨겨지는 순간 호출
                //clearDate: clear 버튼 누르면 호출
                //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                //changeMonth : 월이 변경되면 호출
                //changeYear : 년이 변경되는 호출
                //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

                console.log(e);// 찍어보면 event 객체가 나온다.
                //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데
                // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
                // 위와 같은 형태로 보인다.
                // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다.
            });
        });//ready end
    </script>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <%@include file="/WEB-INF/views/include/sidebar.jsp"%>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">


    </ul>
    <!-- End of Sidebar -->



    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="include/topbar_comm.jsp"%>
            
            <!-- End of Topbar -->


            <input type="text" id="datePicker" class="form-control" value="2019-06-27">
            <div class = "container">
                <a href="/home">홈 </a> >
                <a href="/home">출퇴근 관리 </a> >
                <a href="/home">Daily</a> <div class="heighttdivspace"> </div>





                <h2>출/퇴근관리 Daily
                    <div style="float: right">
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"  >
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="직원 검색.." aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <div class="d-sm-flex align-items-center justify-content-between mb-4" style="float: right; margin: 4px 0 0 30px" >

                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 엑셀 다운로드</a>
                    </div>

                    </div>
                </h2>
                <table class="table table-bordered" >
                    <thead>
                    <tr >
                        <th>직원</th>
                        <th>직무</th>
                        <th>직급</th>
                        <th>출근시간</th>
                        <th>퇴근시간</th>
                        <th>근무상태</th>
                        <th>근무시간</th>
                        <th>휴게시간</th>
                        <th>근무지</th>
                        <th>근무지 주소</th>
                        <th>근무시간 합계</th>
                        <th>지각</th>
                        <th>결근</th>
                        <th>등록 일시</th>



                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="daily" items="${dailyList}">
                        <tr>
                            <td>${daily.emplNm}</td>
                            <td>${daily.dutyId}</td>
                            <td>${daily.rankId}</td>
                            <td>${daily.onwTi}</td>
                            <td>${daily.offwTi}</td>
                            <td>${daily.workSt}</td>
                            <td>${daily.workTi}</td>
                            <td>${daily.restTi}</td>
                            <td>${daily.workPl}</td>
                            <td>${daily.workAd}</td>
                            <td>${daily.totalTi}</td>
                            <td>${daily.tardyCt}</td>
                            <td>${daily.abtiCt}</td>
                            <td>${daily.regDt}</td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
            </div>



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
<%@include file="../include/plugins_js.jsp" %>
</body>

</html>
