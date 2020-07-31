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
    <!--datepicker-->

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
              <a href="/home"> 홈 </a>> <a href="/holiday"> 휴가관리 </a>> <a href="/holiday_details"> 상세 </a>> 추가<br>

                <h3 style="margin-top: 10px; margin-bottom: 10px">휴가 추가하기</h3>

                <div style="margin-left: 10px; width: fit-content; height: 100px;">
                    <div style="float: left">
                        <img src="/static/img/holiday/holiday_sample_img.png" width="100px" height="100px" alt="기본사진">
                    </div>
                    <div style=" padding-top: 20px; margin-left: 20px; float: right; height: 100%">
                        <h5>${holidayDetails.name}</h5>
                            ${holidayDetails.task} 팀 | ${holidayDetails.jobGrade}
                    </div>
                </div>

                <div style="width: fit-content; height: fit-content; margin-left: 10px; margin-top: 20px">
                    <form id="detailsInsert" method="post">
                    <i class="fa fa-calendar"></i> <span id="useDate"> 00월 00일 ~ 00월 00일</span><input type="button" id="textBtn" value="▼" style="background-color: rgba(255,255,255,0.0); border-color: rgba(255,255,255,0.0)"><br><br>
                    <span id="useDay" style="width: 500px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="use">0</span> 일 / ${holidayDetails.restHoliday-useHoliday} 일 전체 휴가 ${holidayDetails.restHoliday}일<br><br>
                    휴가 유형 <select name="select_type" id="select_type" style="margin-left: 50px; background-color: rgba(255,255,255,0.0); border-radius: 5px 5px 5px 5px">
                    <option value="정기 휴가">정기 휴가</option>
                    <option value="오전 반차">오전 반차</option>
                    <option value="오후 반차">오후 반차</option>
                    <option value="예비군">예비군</option>
                </select><br><br>
                    메모<br>
                    <textarea name="note" cols="100%" rows="5" placeholder="메모를 입력해주세요." style="margin-top: 10px"></textarea><br><br>
                        <input type="hidden" name="userNum" id="userNum"/>
                        <input type="hidden" name="year" id="year"/>
                        <input type="hidden" name="month" id="month"/>
                        <input type="hidden" name="holidayDate" id="holidayDate"/>
                        <input type="hidden" name="useHoliday" id="useHoliday"/>
                    <input id="saveBtn" type="button" value="저장" style="float: right" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"/><br><br>
                    </form>
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
    var text;
    var use = 0;
    var startDate;
    var endDate;
    var postDate;

    $(function() {
        $( "#textBtn" ).datepicker({
            dateFormat:'mm월dd일(D)',
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            changeYear : false,
            minDate : 0,
            beforeShowDay: function(date){
                var day = date.getDay();
                return [(day !=0 && day != 6)];
            },
            onSelect: function(dateText,inst) {
                $("#textBtn").val('▼');
                if(use == 0){
                    startDate = dateText;
                    endDate = dateText;
                    text = "";
                    postDate=dateText;
                    $('#useDate').text(startDate + " ~ " + endDate);
                    use += 1;
                    $('#useDay').text(text + dateText);
                    $('#use').text(use);
                }else if(use >= ${holidayDetails.restHoliday-useHoliday}) {
                    alert("잔여 휴가 내에서 사용 가능 합니다.");
                    $('#textBtn').attr("disabled",true);
                }else{
                        if(((parseInt(startDate.substring(0,2)) == parseInt(dateText.substring(0,2))) && (parseInt(startDate.substring(3,5)) < parseInt(dateText.substring(3,5)))) || (parseInt(startDate.substring(0,2)) < parseInt(dateText.substring(0,2)))){
                            endDate = dateText;
                        }else{
                            startDate = dateText;
                        }
                        text = $('#useDay').text() + " / ";
                        postDate = postDate + "," +dateText;
                        $('#useDate').text(startDate + " ~ " + endDate);
                        use += 1;
                        $('#useDay').text(text + dateText);
                        $('#use').text(use);
                    }
            }
        });
    });

    $('#saveBtn').click(function () {
        $('#userNum').val('${holidayDetails.seq}');
        $('#year').val(${year});
        $('#month').val(postDate.substring(0,2));
        $('#holidayDate').val(postDate);
        $('#useHoliday').val(use);
        $('#detailsInsert').attr('action','/holiday_insert').submit();
    });

</script>
