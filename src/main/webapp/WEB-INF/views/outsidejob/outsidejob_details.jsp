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

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        td {
            white-space: nowrap;
        }

        th {
            white-space: nowrap;
        }

        #div_table {
            width: 100%;
            overflow: auto;
        }
        .infoDiv{
            display: inline-block;
            margin-top:10px;
            vertical-align: center
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
                <p><a href="/main">홈</a> > <a href="/outside">외근관리</a> > 상세</p>
                <div>
                    <div class="infoDiv">
                        <img src="/static/img/holiday/holiday_sample_img.png" width="100px" height="100px" alt="기본사진">
                    </div>
                    <div class="infoDiv">
                        <h5>${outsideJobInfo.name}</h5>
                        ${outsideJobInfo.task} 팀 | ${outsideJobInfo.jobGrade}
                    </div>
                </div>
                <div>
                    <br>
                    상태&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <c:choose>
                        <c:when test="${outsideJobList.stateYsn eq 'Y'.charAt(0)}">승인
                        </c:when>
                        <c:when test="${outsideJobList.stateYsn eq 'S'.charAt(0)}">대기중
                        </c:when>
                        <c:when test="${outsideJobList.stateYsn eq 'N'.charAt(0)}">반려
                        </c:when>
                    </c:choose><br><br>
                    기간 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.outsideDate}<br><br>
                    출/퇴근&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.startTime} ~ ${outsideJobList.endTime}<br><br>
                    출근지 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.startPlace}<br><br>
                    퇴근지 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.endPlace}<br><br>
                    메모 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.note}<br><br>
                    신청날짜 &emsp;&emsp;&emsp;&emsp;&emsp;${outsideJobList.applicationTime}<br><br>
                </div>
                <form method="post" id="detailsUpdate">
                <div style="float: left">
                    승인<input type="radio" value="승인" name="state">
                </div>
                <div style="margin-left: 300px">
                    반려<input type="radio" value="반려" name="state">
                </div><br>
                    <div style="width: fit-content; height: fit-content;">
                <textarea id="reply" name="reply" cols="100%" rows="5" placeholder="답변을 입력 해 주세요."></textarea><br><br>
                        <input type="hidden" id="seq" name="seq"/>
                <input id="saveBtn" type="button" value="수정" style="float: right" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"/><br><br>
                    </div>
                </form>
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

<script>
    $(function () {
        if(${outsideJobList.stateYsn eq 'Y'.charAt(0)}){
            $("input[type=radio][value='승인']").prop("checked",true);
            $("#reply").val('${outsideJobList.reply}');
        }else if(${outsideJobList.stateYsn eq 'N'.charAt(0)}){
            $("input[type=radio][value='반려']").prop("checked",true);
            $("#reply").val('${outsideJobList.reply}');
        }
    });

    $('#saveBtn').click(function () {
        if((document.getElementById("reply").value.length == 0) || !($('input:radio[name=state]').is(':checked'))){
            if((document.getElementById("reply").value.length == 0)) {
                alert("답변을 입력하세요.");
            }else{
                alert("상태를 선택해주세요.");
            }
        }else{
            $('#seq').val('${outsideJobList.seq}');
            $('#detailsUpdate').attr('action', '/outside_update').submit();
        }
    });
</script>