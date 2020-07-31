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
        <div id="content" class="container-fluid">

            <!-- Topbar -->
            <%@include file="/WEB-INF/views/include/topbar.jsp"%>
            <!-- End of Topbar -->

            <!-- 메인 내용 -->
            <div id="infoTitle" style="margin-left: 10px;">
            <h6>홈 > 야근관리 > 상세</h6>
                <h5><b>야근 관리하기</b></h5>
            </div >
            <div id="contents" style="margin-left:2%;">
            <form action="/updateInfo" method="POST" name="modifyForm" id="modifyForm"  >
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
                <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
                <input type="hidden" id="startDate" name="startDate" value="${scri.startDate}" readonly="readonly" />
                <input type="hidden" id="endDate" name="endDate" value="${scri.endDate}" readonly="readonly" />
                <input type="hidden" id="order" name="order" value="${scri.order}" readonly="readonly" />
                <input type="hidden" id="orderKeyword" name="orderKeyword" value="${scri.orderKeyword}" readonly="readonly" />
                <input type="hidden" id="modDt" name="modifyDate" value="${empInfo.modDt}" />
                <input type="hidden" id="sequence" name="sequence" value="${empInfo.seq}" />
                <table width="230" height="70">
                    <tr>
                        <td rowspan="2">
                            <img src="/static/img/overtime/testimage.png" width="60" height="60"></td>
                        <td colspan="2"><b>${empInfo.empNm}</b></td>
                    </tr>
                    <tr>
                        <td>${empInfo.empJob} |</td>
                        <td>${empInfo.empPos}</td>
                    </tr>
                </table>
                <br>
                <table id="rtable" style=" width: 100%; height:40%; font-size:16px;">
                    <tr>
                        <td class="table_th" style="width:250px;">상태</td><td>${empInfo.status}</td>
                    </tr>
                    <tr>
                        <td>날짜</td><td>${empInfo.otDt}</td></tr>
                    <tr>
                        <td>시간</td><td>${empInfo.otTm}</td>
                    </tr>
                    <tr>
                        <td>석식</td><td>${empInfo.eatYn}</td>
                    </tr>
                    <tr>
                        <td>메모</td><td>${empInfo.content}</td>
                    </tr>
                    <tr>
                        <td>신청날짜</td><td>${empInfo.reqDt}</td>
                    </tr>
                    <tr>
                        <c:if test="${empInfo.status}">
                        </c:if>
                        <c:choose>
                            <c:when test="${empInfo.status eq '승인'}">
                                <td>승인&nbsp&nbsp<input type="radio"  name="status" value="승인" checked="checked"></td>
                                <td>반려&nbsp&nbsp<input type="radio"  name="status" value="반려"></td>
                            </c:when>
                            <c:when test="${empInfo.status eq '반려'}">
                                <td>승인&nbsp&nbsp<input type="radio"  name="status" value="승인" ></td>
                                <td>반려&nbsp&nbsp<input type="radio"  name="status" value="반려" checked="checked"></td>
                            </c:when>
                            <c:otherwise>
                                <td>승인&nbsp&nbsp<input type="radio"  name="status" value="승인"></td>
                                <td>반려&nbsp&nbsp<input type="radio"  name="status" value="반려"></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
                <textarea class="form-control" id="answer" name="answer"
                          rows="3" style="width:70%; resize:none;" value="answer" placeholder="답변을 입력해주세요." >${empInfo.ans}</textarea>
                <input id="modifyButton" name="modifyButton" type="button" class="btn bt
                n-light btn-outline-primary" value="수정" style=" margin-top: 10px; width:120px;
                height:35px; right:480px; margin-left: 55%;"<%--onclick="check()"--%>/>
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
                <a class="btn btn-primary" href="/login">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- plugins_js -->
<%@include file="../include/plugins_js.jsp"%>
<!-- /plugins_js -->
</body
</html>
<script type="text/javascript">
    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    const $form = $("#modifyForm");
    let $status = $form.find("#status");
    let $answer = $form.find("#answer");
    const $btnUpdate = $form.find("#modifyButton");

    $btnUpdate.on("click", function() {
        let status;

        if(document.getElementsByName("status")[0].checked)
            status = "승인";
        else if(document.getElementsByName("status")[1].checked)
            status = "반려";
        else
            status = "대기중";

        var object = {
            "seq" : $('#sequence').val(),
            "ans" : $('#answer').val(),
            "status" : status,
        }

        if(status == "대기중"  || $answer.val() == "") {
            alert("상태를 선택해주세요.");
        } else {
            $.ajax({
                url: "/update",
                type: "POST",
                data: JSON.stringify(object),
                contentType:"application/json",
                success:function() {
                    alert("정상적으로 등록되었습니다.");
                    location.href="/overtime?"
                        + "keyword=" + getParameter("keyword")
                        + "&page=" + getParameter("page")
                        + "&startDate=" + getParameter("startDate")
                        + "&endDate=" + getParameter("endDate")
                }, error:function(jqXhr) {
                    alert("작업이 실패했습니다.");
                }
            });
        }
    });
</script>

