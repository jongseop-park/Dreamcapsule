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

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">


    <link href="/static/css/datepicker/datepicker.css" rel="stylesheet">
    <style>
        form div{
            font-size: 17px;
        }
        ._inputstyle{
            margin-top: 2%;
        }
        ._inputstyle input, ._inputstyle select{
            width : 80%;
            float : right;
        }
        #btnDelete, #btnUpdate, #btnSave{
            float : right;
            margin-top: 2%;
            width: 15%;
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

            <!-- 뷰 -->
            <div class="container-fluid">

                <!-- 트리 -->


                <c:choose>
                    <c:when test="${pagecheck eq true}">
                        <p class="mb-4"><h5>홈 > <a href="/admin/management/employee/list">직원관리</a> > 관리</h5></p>
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1 ">
                        <h2 class="m-0 font-weight-bold text-primary">직원 관리하기
                        </h2>
                    </c:when>
                    <c:when test="${pagecheck eq false}">
                        <p class="mb-4"><h5>홈 > <a href="/admin/management/employee/list">직원관리</a> > 추가</h5></p>
                        <div class="card shadow mb-4">

                            <!-- 테이블 상단 바 -->
                            <div class="card-header py-sm-1 ">
                                <h2 class="m-0 font-weight-bold text-primary">직원 추가하기
                                </h2>
                    </c:when>
                </c:choose>


                <!-- 변경할 뷰 -->

                        <!-- /테이블 상단 바 -->


                    <div class="card-body">
                        <div class="table-responsive">
                            <form action="/form"  id="saveform" name="saveform" method="POST" style="margin-top: 30px">
                                <div class="form-group _inputstyle" >
                                    이름<input type="text" class="form-control" id="emplNm" name="emplNm">
                                </div>
                                <div class="form-group _inputstyle" >
                                    직무<select name="dutySeq" class="form-control" id="dutySeq" >
                                    <option> </option>
                                            <c:forEach var="dutylist" items="${dutylist}">
                                                <option value="${dutylist.dutylistSeq}">${dutylist.dutyList} 팀</option>
                                            </c:forEach>
                                        </select>
                                </div>
                                <div class="form-group _inputstyle" >
                                    직급<select name="rankSeq" id="rankSeq" class="form-control"  >
                                    <option> </option>
                                    <c:forEach var="ranklist" items="${ranklist}">

                                        <option value="${ranklist.ranklistSeq}">${ranklist.rankList}</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="form-group _inputstyle" >
                                    권한<select name="authSeq" id="authSeq" class="form-control"  >
                                    <option> </option>
                                    <c:forEach var="authlist" items="${authlist}">

                                    <option value="${authlist.authlistSeq}">${authlist.authList}</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="form-group _inputstyle" >
                                    근무지<select name="placeSeq" id="placeSeq" class="form-control"  >
                                    <option> </option>
                                    <c:forEach var="placelist" items="${placelist}">
                                        <option value="${placelist.placelistSeq}">${placelist.placeList}</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="form-group _inputstyle" >
                                    이메일<input type="email" class="form-control" id="email" name="email" >
                                </div>
                                <div class="form-group _inputstyle" >
                                    전화번호<input type="tel" class="form-control" id="tel" name="tel" >
                                </div>
                                <div class="form-group " style="margin-top: 2%">
                                    입사일
                                    <div style="width: 80%;float: right;">
                                    <i class="fa fa-calendar" STYLE="float: left;margin-top: 10px; margin-right: 10px"></i>
                                    <input type="text" class="form-control _date" id="datepicker" name="joinDt" style="width: 30%; float: left;">
                                    </div>
                                </div>

                        <!-- 테이블 하단 바 -->
                            <c:choose>
                                <c:when test="${pagecheck eq true}">
                                    <div>
                                    <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnUpdate"
                                            type="button"   >
                                        <span style="font-size: 20px">수정</span>
                                    </button>
                                    <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnDelete"
                                            type="button"   style="margin-right: 10px"  >
                                        <span style="font-size: 20px">삭제</span>
                                    </button>
                                    </div>
                                </c:when>
                                <c:when test="${pagecheck eq false}">
                                    <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnSave"
                                            type="button"    >
                                        <span style="font-size: 20px">저장</span>
                                    </button>

                                </c:when>
                            </c:choose>

                            </form>
                        </div>
                        <!-- /테이블 하단 바 -->
                    </div>
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
<script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>
<script src="/static/js/datepicker/datepicker.js"></script>
<%--데이트 피커 사용 ( 한글변환)----------------------------------------------------------------------------------------%>
<script src="/static/js/commute/ko-datepicker.js"></script>




<script type="text/javascript">
//===================================================================================================================
$(function(){
    if(!${pagecheck}){
        console.log("직원 추가하기");
        <%--$("#emplNm").innerText="${infolist.emplNm}";--%>
    }else{
        console.log("직원 관리하기");
        console.log("${infolist.dutylistSeq}");
        $("#emplNm").val("${infolist.emplNm}");
        $("#dutySeq").val("${infolist.dutylistSeq}");
        $("#rankSeq").val("${infolist.ranklistSeq}");
        $("#authSeq").val("${infolist.authlistSeq}");
        $("#placeSeq").val("${infolist.placelistSeq}");
        $("#email").val("${infolist.email}");
        $("#tel").val("${infolist.tel}");
        $("._date").val("${infolist.joinDt}");
    }
});

//===================================================================================================================
    $("#btnSave").on("click",function(){

        // var saveQuery = $("form[name=saveform]").serialize(); //saveform id를 가진 form 을 찾아 form안에 있는 id의 값을 찾아온다.
        var object = {
            "emplNm" : $("#emplNm").val(),
            "dutylistSeq" : $("#dutySeq").val(),
            "ranklistSeq" : $("#rankSeq").val(),
            "authlistSeq" : $("#authSeq").val(),
            "placelistSeq" : $("#placeSeq").val(),
            "email" : $("#email").val(),
            "tel" : $("#tel").val(),
            "joinDt" : $("._date").val()
        }
        console.log(object);
        callAjax(object,"save","회원등록");
         });

//===================================================================================================================
    $("#btnUpdate").on("click",function(){
        var object = makeJosn();
        console.log(object);
        callAjax(object,"infoUpdate","회원수정")
    });


//===================================================================================================================
    $("#btnDelete").on("click",function(){
        var object = {
            "empSeq" : ${infolist.empSeq}+""
        };
        callAjax(object,'infoDelete','회원삭제')

    });


//===================================================================================================================
function callAjax(data,url,massage) {
    console.log(data);
    $.ajax({
        type:"POST",
        url:url,
        data:JSON.stringify(data),
        contentType : "application/json",
        success : function () {
            alert(massage+"이 정상적으로 수행되었습니다.");
            history.back();
        },error : function (jqXhr) {
            alert(massage+" 실패!");
        }
    });

}
//===================================================================================================================
function makeJosn(){
    console.log(${infolist.empSeq});

    var object = {
        "empSeq" : ${infolist.empSeq}+"",
        "emplNm" : $("#emplNm").val(),
        "dutylistSeq" : $("#dutySeq").val(),
        "ranklistSeq" : $("#rankSeq").val(),
        "authlistSeq" : $("#authSeq").val(),
        "placelistSeq" : $("#placeSeq").val(),
        "email" : $("#email").val(),
        "tel" : $("#tel").val(),
        "joinDt" : $("._date").val()
    };
    return object;
}




</script>