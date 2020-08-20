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
        <div id="content" class="overflow-auto" style="text-align: left">

            <!-- Topbar -->
            <%@include file="/WEB-INF/views/include/topbar.jsp"%>
            <!-- End of Topbar -->

            <!-- 메인 내용 -->
            <div class="container" style="display: inline-block">
                    <div id="infoTitle" style="margin-left: 10px;">
                    <h5>홈 > 야근관리 > 상세</h5>
                      <h4 class="text-primary font-weight-bold">야근 관리하기</h4>
            </div>

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
                <table width="230" height="70" style="color:#000000;">
                    <tr>
                        <td rowspan="2">
                            <img src="/static/img/overtime/testimage.png" width="80" height="80"></td>
                        <td colspan="2"><h5><b>${empInfo.empNm}</b></h5></td>
                    </tr>
                    <tr>
                        <td>${empInfo.empJob} |</td>
                        <td>${empInfo.empPos}</td>
                    </tr>
                </table>
                <br>
                <table id="rtable" style=" width: 100%; height:40%; font-size:16px; ">
                    <tr>
                        <td class="table_th" style="width:250px;">상태</td><td>${empInfo.status}</td>
                    </tr>
                    <tr>
                        <td>날짜</td><td>${empInfo.otDt}</td></tr>
                    <tr>
                        <td>시간</td><td>${empInfo.otTm}</td>
                    </tr>
                    <tr>
                        <td>석식</td>
                        <td><c:if test="${empInfo.eatYn == 'y'}">O</c:if>
                            <c:if test="${empInfo.eatYn == 'n'}">X</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>메모</td><td>${empInfo.content}</td>
                    </tr>
                    <tr>
                        <td>신청날짜</td><td>${empInfo.regDt}</td>
                    </tr>
                    <tr>

                        <c:if test="${empInfo.status}">
                        </c:if>
                        <c:choose>
                            <c:when test="${empInfo.status eq '승인'}">
                                <td>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" name="status" id="jb-radio-1" class="custom-control-input"
                                               checked="checked">
                                        <label class="custom-control-label" for="jb-radio-1">승인</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" name="status" id="jb-radio-2" class="custom-control-input"
                                               >
                                        <label class="custom-control-label" for="jb-radio-2">반려</label>
                                    </div>
                                </td>
                            </c:when>
                            <c:when test="${empInfo.status eq '반려'}">
                            <td>
                                <div class="custom-control custom-radio">
                               <input type="radio" name="status" id="jb-radio-3" class="custom-control-input">
                               <label class="custom-control-label" for="jb-radio-3">승인</label>
                                </div>
                            </td>
                            <td>
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="status" id="jb-radio-4" class="custom-control-input"
                                    checked="checked">
                                    <label class="custom-control-label" for="jb-radio-4">반려</label>
                                </div>
                            </td>
                           <%--     <td>승인&nbsp&nbsp<input type="radio"  name="status" value="승인" ></td>
                                <td>반려&nbsp&nbsp<input type="radio"  name="status" value="반려" checked="checked"></td>
                           --%>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" name="status" id="jb-radio-5" class="custom-control-input"
                                               >
                                        <label class="custom-control-label" for="jb-radio-5">승인</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" name="status" id="jb-radio-6" class="custom-control-input"
                                        >
                                        <label class="custom-control-label" for="jb-radio-6">반려</label>
                                    </div>
                                </td>
                                <%--<td>승인&nbsp&nbsp<input type="radio"  name="status" value="승인"></td>
                                <td>반려&nbsp&nbsp<input type="radio"  name="status" value="반려"></td>--%>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>

                <textarea class="form-control" id="answer" name="answer"
                          rows="4" style="width:100%; resize:none;" value="answer" placeholder="답변을 입력해주세요." >${empInfo.ans}</textarea>
                <input id="modifyButton" name="modifyButton" type="button"
                       class="btn btn-light btn-outline-primary float-right mt-3 mb-3" value="수정" style="width:120px;"/>
                 </form>
            <!-- /메인 내용 -->
        </div>
        <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->

    <!-- Footer -->
    <%@include file="/WEB-INF/views/include/footer.jsp"%>
    <!-- End of Footer -->
</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%@include file="/WEB-INF/views/include/logout_cmmn.jsp"%>
<!-- plugins_js -->
<%@include file="../include/plugins_js.jsp"%>
<!-- /plugins_js -->
</body>
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
                url: "/admin/update",
                type: "POST",
                data: JSON.stringify(object),
                contentType:"application/json",
                success:function() {
                    alert("정상적으로 등록되었습니다.");
                    location.href="/admin/overtime?"
                        + "keyword=" + getParameter("keyword")
                        + "&page=" + getParameter("page")
                        + "&startDate=" + getParameter("startDate")
                        + "&endDate=" + getParameter("endDate");
                }, error:function(jqXhr) {
                    alert("작업이 실패했습니다.");
                }
            });
        }
    });
</script>

