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
                            <img src="/static/img/holiday/holiday_sample_img.png" width="100px" height="100px" alt="기본사진">
                        </div>
                        <div style='width : 70%; height : 80%; float:right; margin-top:10px; vertical-align: center'>

                                <h5>${holidayDetailsInfo.name}</h5>
                                <form>
                                    <div style="width: 60%; float:left;">
                                            ${holidayDetailsInfo.task} 팀 | ${holidayDetailsInfo.jobGrade}
                                    </div>
                                    <div style="width: 40%; float:right;">
                                        <a href="/holiday_add?seq=${holidayDetailsInfo.seq}&year=${holidayDetails.get(0).holidayYear}"
                                           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">추가</a>
                                    </div>
                                </form>
                        </div>
                    </div>
                    <div style='width: 100%;height: 70%; float: bottom;' id="selectHoliday">
                        <c:forEach var="holiday" items="${holidayDetails}" varStatus="status">
                            <div id="${status.count}" style=' border-style: solid; border-radius:10px 10px 10px 10px; width: 90%; height: 150px; margin-top: 20px'>
                                <div id="state_${status.count}"style=' border-style: solid; border-radius: 30px 30px 30px 30px; width: 100px;text-align: center; float: right; margin: 10px'>
                                    <c:set var="name">${holiday.holidayDate} div_${status.count}</c:set>

                                    <c:choose>
                                        <c:when test="${holiday.stateYsn eq 'Y'.charAt(0)}">
                                            <span style="color: #4e73df">승인</span><br>
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

                    휴가 날짜 &emsp;<span id="spanDate"></span> <br><br>
                    차감 휴가 &emsp;<span id="spanUse">*</span> 일<br><br>
                    휴가 유형 &emsp;<span id="spanType"></span><br><br>
                    메모 &emsp;&emsp;&emsp;<span id="spanMemo"></span><br><br>
                    신청 날짜 &emsp;<span id="spanApTime"></span><br><br>
                    <form id="detailsUpdate" method="post">
                    <div style="float: left">
                        승인<input type="radio" value="승인" name="state">
                    </div>
                    <div style="margin-left: 300px">
                        반려<input type="radio" value="반려" name="state">
                    </div>
                    <br><br>
                    <textarea id="spanReply" name="spanReply"cols="65%" rows="5" placeholder="답변을 입력 해 주세요."></textarea>
                    <br><br>
                        <input type="hidden" id="seq" name="seq">
                        <input type="hidden" id="userNum" name="userNum">
                        <input type="hidden" id="year" name="year">
                        <input type="hidden" id="month" name="month">
                    <input id='saveBtn' type="button" value="저장" class="btn btn-sm btn-primary shadow-sm" style="float: right; display: none"/>
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

<script>
    var y = new Array(${holidayDetails.size()});
    $('#userNum').val('${holidayDetails.get(0).userNum}');
    $('#year').val('${holidayDetails.get(0).holidayYear}');
    $('#month').val('${holidayDetails.get(0).holidayMonth}');
    <c:forEach begin="1" end="${holidayDetails.size()}" varStatus="status">
        $('#${status.count}').click(function () {
            document.getElementById("spanDate").innerHTML = '${holidayDetails.get(status.count-1).holidayDate}';
            document.getElementById("spanUse").innerHTML = '${holidayDetails.get(status.count-1).useHoliday}';
            document.getElementById("spanType").innerHTML = '${holidayDetails.get(status.count-1).holidayType}';
            document.getElementById("spanMemo").innerHTML = '${holidayDetails.get(status.count-1).note}';
            document.getElementById("spanApTime").innerHTML = '${holidayDetails.get(status.count-1).applicationTime}';
            $('#seq').val('${holidayDetails.get(status.count-1).seq}');

            <c:set var="stateYsn" value="${holidayDetails.get(status.count-1).stateYsn}"/>
            if(${stateYsn eq 'Y'.charAt(0)} || ${stateYsn eq 'N'.charAt(0)}){
                if(${stateYsn eq 'Y'.charAt(0)}) {
                    $("input[type=radio][value='승인']").prop("checked",true);
                }else{
                    $("input[type=radio][value='반려']").prop("checked",true);
                }
                $('#spanReply').val("${holidayDetails.get(status.count-1).reply}");
                $('#saveBtn').css('display','inline');
                $('#saveBtn').val('수정');
            }else{
                $("input[type=radio]").prop("checked",false);
                $('#spanReply').val("");
                $('#saveBtn').css('display','inline');
                $('#saveBtn').val('저장');
            }
        });

        if(${holidayDetails.get(status.count-1).stateYsn eq 'Y'.charAt(0)}){
            $('#state_${status.count}').css('border','solid #4e73df');
        }
    </c:forEach>

    $('#saveBtn').click(function () {
        var reply = $('#spanReply').val();
        if($('input:radio[name=state]').is(':checked') && !(reply.equals(""))){
            $('#detailsUpdate').attr('action', '/holiday_update').submit();
        }else {
            alert("상태를 선택해주세요.");
        }
    });
</script>