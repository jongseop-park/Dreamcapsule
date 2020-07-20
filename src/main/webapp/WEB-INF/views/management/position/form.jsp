<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Admin</title>

    <!-- Custom fonts for this template -->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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

            <!-- 뷰 -->
            <div class="container-fluid">

                <!-- 트리 -->
                <c:choose>
                    <c:when test="${isUpdate eq false}">
                        <h5>홈 > 직급관리 > 추가</h5>
                    </c:when>
                    <c:otherwise>
                        <h5>홈 > 직급관리 > 상세</h5>
                    </c:otherwise>
                </c:choose>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1 ">
                        <c:choose>
                            <c:when test="${isUpdate eq false}">
                                <h2 class="m-0 font-weight-bold text-primary">직급 추가하기</h2>
                            </c:when>
                            <c:otherwise>
                                <h2 class="m-0 font-weight-bold text-primary">직급 관리하기</h2>
                            </c:otherwise>
                        </c:choose>
                        <!-- /테이블 상단 바 -->

                    </div>

                    <%-- 추가 상세 내용 --%>
                    <form id="form">
                        <input type="hidden" value="${result.seq}" id="seq">
                        <div class="card-body">
                            <div class="table-responsive">
                                <form class="user">
                                    <div class="form-group" >
                                        직급명*<input type="text" class="form-control" id="rank" style="width: 80%; float: right;" value="${result.rank}"/>
                                    </div>
                                    <div class="form-group" style="margin-top: 2%">
                                        메모 <textarea class="text-area" id="memo" style="width: 80%; float: right; height: 200px;">${result.memo}</textarea>
                                    </div>

                                </form>
                            </div>
                            <!-- 테이블 하단 바 -->
                            <div>
                                <c:choose>
                                    <c:when test="${isUpdate eq false}">
                                        <input class="btn btn-dark right" id="btnSave" type="submit" style="float : right; margin-top: 2%" value="저장"/> <%-- onclick="location.href='/management/position/list'"--%>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-dark right " id="btnUpdate" type="button" style="float : right; margin-left: 20px; margin-top: 2%">
                                            수정
                                        </button>
                                        <button class="btn btn-dark right " id="btnDelete" type="button" style="float : right; margin-top: 2%">
                                            삭제
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- /테이블 하단 바 -->
                        </div>
                    </form>
                    <%--/ 추가 상세 내용 --%>
                </div>
                <!--  /변경할 뷰 -->

            </div>
            <!-- /뷰 -->
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="/WEB-INF/views/include/footer.jsp"%>
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


<!-- plugins_js -->
<%@include file="/WEB-INF/views/include/plugins_js.jsp"%>
<!-- /plugins_js -->
</body>
</html>

<script type="text/javascript">
$(function () {
    /*
    * var : 변수명 재선언 / 값 재할당 가능
    * let : 변수명 재선언X / 값 재할당 가능
    * const : 변수명 재선언X / 값 재할당 X (상수)
    * */

    const $form = $("#form"); // 입력 폼
    let $seq = $form.find("#seq"); // 시퀀스
    let $rank = $form.find("#rank"); // 직급명
    let $memo = $form.find("#memo"); // 메모

    const $btnSave = $form.find("#btnSave"); // 저장
    const $btnUpdate = $form.find("#btnUpdate"); // 수정
    const $btnDelete = $form.find("#btnDelete"); // 삭제

    $btnSave.on("click",function () { // 추가
        var object = {
            "rank" : $rank.val(),
            "memo" : $memo.val()
        };

        Save(object);
    });

    $btnUpdate.on("click",function () { // 수정
        var object = {
            "seq" : $seq.val(),
            "rank" : $rank.val(),
            "memo" : $memo.val()
        };

        Save(object);
    });

    $btnDelete.on("click",function () { // 삭제
        var object = {
            "seq" : $seq.val()
        };

        Delete(object);
    });

    function Save(data) {

        if($rank.val() == ""){
            alert("직급명은 필수입니다.");
            return true;
        }


        $.ajax({
            url : "/management/position/save",
            type : "POST",
            contentType : "application/json",
            /*async : false, /!* async true가 기본이며 기본적으로 비동기 방식으로 처리하지만 false로 동기방식 처리 *!/*/
            data : JSON.stringify(data),
            success : function () {
                if(${isUpdate eq false}){
                    alert("정상적으로 등록되었습니다.");
                } else {
                    alert("정상적으로 수정되었습니다.");
                }

                history.back();
                /*
                * history.back() : 이전페이지로 이동
                * history.go() : go(-1) 이전 페이지 , go(1) 다음 페이지 이동
                * history.forward() : 다음페이지로 이동
                * */
            }, error : function(jqXhr){
                alert("작업이 실패했습니다.");
            }
        });
    }

    function Delete(data) {
        $.ajax({
            url : "/management/position/delete",
            type : "POST",
            contentType : "application/json",
            data : JSON.stringify(data),
            success : function () {
                alert("정상적으로 삭제되었습니다.")
                history.back();
            }, error : function(jqXhr){
                alert("작업이 실패했습니다.");
            }
        });

    }



});
</script>
