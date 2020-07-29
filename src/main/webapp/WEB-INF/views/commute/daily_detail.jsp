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

    <%-- 기본 --%>
    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/static/css/commute/sb-admin-comm.css" rel="stylesheet">
    <link href="/static/css/timepicker/wickedpicker.css" rel="stylesheet">



    <style>
        .detailtable td{
            vertical-align: bottom; text-align: left;
        }
        .detailtable td select{
          width: 150px;
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
            <%@include file="include/topbar_comm.jsp" %>

            <!-- End of Topbar -->



                <div class="container2">
                    <a href="/home">홈 </a> >
                    <a>출퇴근 관리 </a> >
                    <a href="/daily">Daily</a> >
                    <a>Detail</a>

                    <div class="heighttdivspace"></div>

                    <h2>출/퇴근관리 Daily Detail</h2>

                    <c:forEach var="detail" items="${detail}">

                    </c:forEach>
                    <div style="width: 330px; height: 150px">


                        <img src="/static/img/overtime/testimage.png" alt="detailimg" width="150px" height="150px"
                             style="margin-top: 30px; float: left"/>

                        <table CLASS="detailtable" style="width: 150px; height: 150px; float: right; margin-top: 30px; margin-left: 20px;">
                            <tbody>
                            <td></br></br>
                                <h2>${detail.get(0).emplNm}</h2></td>
                            </tr>
                            <td>${detail.get(0).dutyId} 팀 | ${detail.get(0).rankId}</td>

                            </tbody>
                        </table>

                    </div>

                    <table class="detailtable" STYLE="width: 400px; height: 190px; margin-top: 40px; table-layout: fixed">
                        <tbody>
                        <td>근무지</td>
                        <td>${detail.get(0).workPl}</td>
                        </tr>
                        <td>근무시간</td>
                        <td>${detail.get(0).workTi} 시간</td>
                        </tr>
                        <td>휴게시간</td>
                        <td>${detail.get(0).restTi} 시간</td>
                        </tr>
                        <td>${detail.get(0).regDt}</td>
                        </tr>
                        </tbody>
                        </table>

                    <form action="/dailyUpdate" method="POST" id="form" >
                    <table class="detailtable" STYLE="width: 400px; height: 160px;  table-layout: fixed">
                        <input type="hidden" name="emplNm" id="emplNm" value="${detail.get(0).emplNm}" />
                        <input type="hidden" name="regDt" id="regDt" value="${detail.get(0).regDt}" />
                        <tbody>
                        <td>출근시간</td>
                        <td>
                        <input type="text" id="startTime" name="startTime" class="timepicker form-control">
                        </td>
                        </tr>
                        <td>퇴근시간</td>
                        <td><input type="text" id="endTime" name="endTime" class="offtimepicker form-control"></td>
                        </tr>
                        <td>상태</td>
                        <td><select>
                            <option>정상근무</option>
                            <option>지각</option>
                            <option>정기휴가</option>
                            <option>오전반차</option>
                            <option>오후반차</option>
                            <option>예비군</option>
                            <option>야근</option>
                            <option>결근</option>
                        </select></td>
                        </tbody>

                    </table>
                        <input type="button"
                               id="btnUpdate" style="width: 300px; height: 50px; margin-top: 40px;"
                               class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="수 정"></input>
                    </form>







                </div><%-- container end--%>
<!-- Footer -->
            <div class="heighttdivspace"></div>
            <div class="heighttdivspace"></div>
            <div class="heighttdivspace"></div>
            <div class="heighttdivspace"></div>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>
    <script src="/static/js/timepicker/wickedpicker.js"></script>
</body>
</html>

<script type="text/javascript">
$('.timepicker').wickedpicker();
$('.offtimepicker').wickedpicker();

$(function (){
    const $form = $("form")
    let $emplNm = $form.find("#emplNm");
    let $regDt = $form.find("#regDt");
    let $startTime = $form.find("#startTime");
    let $endTime = $form.find("#endTime");
    const $btnUpdate = $form.find("#btnUpdate");
    $btnUpdate.on("click",function(){
        var object = {
            "emplNm" : $emplNm.val(),
            "regDt" : $regDt.val(),
            "startTime": $startTime.val(),
            "endTime" : $endTime.val()

        };
        console.log(object);
        Update(object);
    })


    function Update(data) {

    $.ajax({
        url :  "/detailUpdate",
        type : "POST",
        data : JSON.stringify(data),
        contentType : "application/json",
        success : function(){
            console.log("ggg");
            alert("수정 되었습니다.");
            history.back();
        }, error:function(jqXhr){
            console.log("fff");
            alert("작업이 실패하였습니다.");
        }
    })

    }
})

</script>