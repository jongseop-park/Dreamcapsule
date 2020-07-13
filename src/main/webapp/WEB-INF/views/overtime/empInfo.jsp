<%--
  Created by IntelliJ IDEA.
  User: psy37
  Date: 2020-07-10
  Time: 오후 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>52TIME ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        #infoTitle {
            margin-left: 10px;
        }

        #contents {
            margin-left: 2%;
        }

        #rtable {
            width: 100%;
            height:40%;
            font-size:13px;
        }

        .table_th {
            width:250px;
        }

        #modifyButton {
            margin-top: 10px;
            width:120px;
            height:30px;
            right:25%;
            margin-left: 60%;
        }
    </style>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="/WEB-INF/views/include/sidebar.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="/WEB-INF/views/include/topbar.jsp"%>
            <!-- End of Topbar -->

            <!-- 메인 내용 -->
            <div id="infoTitle">
            <h6>홈 > 야근관리 > 상세</h6>
                <h5><b>야근 관리하기</b></h5>
            </div>
            <div id="contents">
            <form method="post" action="/updateInfo">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="modifyDate" value="${empInfo.modifyDate}" />
                <input type="hidden" name="sequence" value="${empInfo.sequence}" />
                <table width="230" height="70">
                    <tr>
                        <td rowspan="2"><img src="/img/overtime/testimage.png" width="60" height="60"></td>
                        <td colspan="2"><b>${empInfo.empName}</b></td>
                    </tr>
                    <tr>
                        <td>${empInfo.empJob} |</td>
                        <td>${empInfo.empPosition}</td>
                    </tr>
                </table>
                <br>
                <table id="rtable">
                    <tr>
                        <td class="table_th">상태</td>
                        <td>${empInfo.status}</td>
                    </tr>

                    <tr>
                        <td>날짜</td>
                        <td>${empInfo.overtimeDate}</td>
                    </tr>
                    <tr>
                        <td>시간</td>
                        <td>${empInfo.overtimeTime}</td>
                    </tr>
                    <tr>
                        <td>석식</td>
                        <td>${empInfo.eatBoolean}</td>
                    </tr>
                    <tr>
                        <td>메모</td>
                        <td>${empInfo.contents}</td>
                    </tr>
                    <tr>
                        <td>신청날짜</td>
                        <td>${empInfo.requestDate}</td>
                    </tr>
                    <tr>
                        <c:if test="${empInfo.status}">
                        </c:if>
                        <c:choose>
                            <c:when test="${empInfo.status eq '승인'}">
                                <td>승인&nbsp&nbsp<input type="radio" name="status" value="승인" checked="checked"></td>
                                <td>반려&nbsp&nbsp<input type="radio" name="status" value="반려"></td>
                            </c:when>
                            <c:when test="${empInfo.status eq '반려'}">
                                <td>승인&nbsp&nbsp<input type="radio" name="status" value="승인" ></td>
                                <td>반려&nbsp&nbsp<input type="radio" name="status" value="반려" checked="checked"></td>
                            </c:when>
                            <c:otherwise>
                                <td>승인&nbsp&nbsp<input type="radio" name="status" value="승인"></td>
                                <td>반려&nbsp&nbsp<input type="radio" name="status" value="반려"></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
                <textarea name="answer" cols="107" rows="4" value="answer" placeholder="답변을 입력해주세요.">${empInfo.answer}</textarea>
                <input id="modifyButton" type="submit" value="수정"/>

                 </form>
            </div>
            <!-- /메인 내용 -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="../include/footer.jsp"%>
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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <a class="btn btn-primary" href="/pages/login">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- plugins_js -->
<%@include file="../include/plugins_js.jsp"%>
<!-- /plugins_js -->

</body>

</html>

