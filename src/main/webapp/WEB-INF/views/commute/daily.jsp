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
    <%-- 기본 여기까지--%>

    <link href="/static/css/datepicker/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          crossorigin="anonymous">--%>
    <link href="/static/css/datepicker/datepicker.css" rel="stylesheet">


<style>
    ._rtable tbody tr:hover{
        background-color: #0f6848;
    }
    .table-bordered th:nth-child(1){
        width:5%;
    }
    .table-bordered th:nth-child(2){
        width:9%;
    }
    .table-bordered th:nth-child(4){
        width:9%;
    }
    .table-bordered th:nth-child(n+5):nth-child(-n+7){
        width:7%;
    }
    .table-bordered th:nth-child(8) {
        width:7%;
    }
    .table-bordered th:nth-child(9) {
        width:10%;
    }
    .table-bordered th:nth-child(10) {
        width:9%;
    }

    .table-bordered th:nth-child(n+11):nth-child(-n+12){
        width:4%;
    }
    .table-bordered th:nth-child(3){
        width:5%;
    }
  .fix td{
        height: 60px ;
        vertical-align:middle;
    }
    .sortbtn{
        border: 0px ;
        background-color: rgba(0,0,0,0);
        color: skyblue;
        padding: 5px;

    }

</style>
    <%--    dd--%>


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
                <a href="/home"> 홈 </a> >
                <a href="/home">출퇴근 관리 </a> >
                <a href="/daily">Daily</a>
                <div class="heighttdivspace"></div>






                <h2>출/퇴근관리 Daily</h2>
                    <div style="float: right ; width:600px ">


                        <div class='col-md-3 col-xs-4' style="float: left; margin-left: 30px">
                            <div class="form-group">
                                <div class="input-group date" >
                                    <div class="input-group-append"
                                         style="margin-right: 30px">
                                        <div class="input-group-text"
                                             style="background-color: #ffffff00; border: 1px solid #ffffff00">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control _date" id="datepicker"
                                               style="width: 120px" value="${pageMaker.cri.regDt}">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%@include file="include/excel_include_commute.jsp" %>

                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                              style="float: right ; padding-top: 1px" >
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="직원 검색.."
                                       id="keyword" name="keyword" value="${pageMaker.cri.keyword}"/>
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button" id="searchBtn">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>




                <table class="table table-bordered _rtable">
                    <thead>
                    <tr>
                        <th>직원
                        <button value="empl_nm" id="emplNm" class="sortbtn" onclick="sort(emplNm.value)"></button></th>
                        <th>직무
                        <button value="duty_id" id="dutyId" class="sortbtn" onclick="sort(dutyId.value)"></button></th></th>
                        <th>직급
                        <button value="rank_id" id="rankId" class="sortbtn" onclick="sort(rankId.value)"></button></th></th>
                        <th>출/퇴근 시간</th>
                        <th>근무상태
                            <button value="work_st" id="workSt" class="sortbtn" onclick="sort(workSt.value)"></button></th></th>
                        </th>
                        <th>근무시간</th>
                        <th>휴게시간</th>
                        <th>근무지</th>



                    </tr>
                    </thead>
                    <tbody class="fix" >

                    <c:forEach var="daily" items="${daily}">
                        <tr>
                         <td>${daily.emplNm}</td>
                        <td >${daily.dutyId} 팀</td>
                        <td >${daily.rankId}</td>
                            <td>${daily.commTi}</td>
                                <%--                        <td>${daily.offwTi}</td>--%>
                            <td>${daily.workSt}</td>
                            <c:choose>
                                <c:when test="${daily.workTi ne 0}">
                                    <td>${daily.workTi}시간</td>
                                </c:when>
                                <c:when test="${daily.workTi eq 0}">
                                    <td>-</td>
                                </c:when>
                            </c:choose>
                        <c:choose>
                            <c:when test="${daily.restTi ne 0}">
                                <td>${daily.restTi}시간</td>
                            </c:when>
                            <c:when test="${daily.restTi eq 0}">
                                <td>-</td>
                            </c:when>
                        </c:choose>

                            <td>${daily.workPl}</td>

                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
                <c:if test="${daily.size()<1}">
                    <div style="width: 100%;">
                    <span style="text-align: center">데이터가 없습니다.</span>
                    </div>
                </c:if>

                <div>
                    <ul class="pagination" style="justify-content: center">
<%--                        <c:if test="${pageMaker.prev}">--%>
<%--                            <li><a href="daily${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>--%>
<%--                        </c:if>--%>
<%--                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">--%>
<%--                                <li id="page${idx}"><a href="daily${pageMaker.makeQuery(idx)}">${idx}</a></li>--%>
<%--                            </c:forEach>--%>
<%--                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
<%--                            <li><a href="daily${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>--%>
<%--                        </c:if>--%>
                            <li><a href="daily${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            <li id="page${idx}"><a href="daily${pageMaker.makeQuery(idx)}">${idx}</a></li>
                        </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            <li><a href="daily${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            </br></br></br></br></br>

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
    <%@include file="/WEB-INF/views/include/logout_cmmn.jsp"%>

    <!-- Bootstrap core JavaScript-->
    <%@include file="../include/plugins_js.jsp" %>


</body>

</html>

<%--스크립트 라인 ( 데이트 피커 )--%>
<script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>
<script src="/static/js/datepicker/datepicker.js"></script>
<script src="/static/js/commute/table-click.js"></script>
<%--데이트 피커 사용 ( 한글변환)----------------------------------------------------------------------------------------%>
<script src="/static/js/commute/ko-datepicker.js"></script>
<%------------------------------------------------------------------------------------------------------------------%>


<script type="text/javascript">

//함수 호출-----------------------------------------------------------------------------------------------------------
$(document).ready(function(){
    var btnarray = new Array();
        btnarray[0]="emplNm";
        btnarray[1]="dutyId";
        btnarray[2]="rankId";
        btnarray[3]="workSt";

        for(var i = 0;i<btnarray.length;i++){
            console.log(document.getElementById(btnarray[i]).value);
            if(document.getElementById(btnarray[i]).value == "${pageMaker.cri.orderKeyword}"){
                if("${pageMaker.cri.orderMethod}"=="asc"){

                    document.getElementById(btnarray[i]).innerText = "▲";
                }else{
                    document.getElementById(btnarray[i]).innerText = "▼";
                }

            }else {
                document.getElementById(btnarray[i]).innerText = "▲";
            }

        }
    setPerPageNumSelect();
    setSearchTypeSelect();
    changeColor();
    var thisPage = '${pageMaker.cri.page}';
    $('#page'+thisPage).addClass('active');
})
function sort(orderkeyword) {

     var order; //정렬 기준(오름차순,내림차순)을 담을 변수
            var e = window.event,              //클릭한 해당 버튼의 ID 값을 추출
            btn = e.target || e.srcElement;    //클릭한 해당 버튼의 ID 값을 추출
        // document.getElementById(btn.id).innerText = "▼";
        var intext = document.getElementById(btn.id).innerText;

      if("${pageMaker.cri.orderMethod}"=="asc"){
          order = "desc";
      }else{
          order = "asc";
      }

        self.location = "/daily?page=1" +
            "&keyword=${pageMaker.cri.keyword}" +
            "&regDt=${pageMaker.cri.regDt}"+
            "&orderKeyword="+orderkeyword +
            "&orderMethod="+order;

        
}


//현재 페이지 파란색으로 활성화-------------------------------------------------------------------------------------------
function setPerPageNumSelect(){
    var perPageNum = "${pageMaker.cri.perPageNum}";
    var $perPageSel = $('#perPageSel');
    var thisPage = '${pageMaker.cri.page}';


    $perPageSel.val(perPageNum).prop("selected",true);
    //PerPageNum가 바뀌면 링크 이동
    $perPageSel.on('change',function() {
        //pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
        window.location.href = "daily?page=" + thisPage + "&perPageNum=" + $perPageSel.val();
    })
}

//직원 이름 검색과 날짜 선택에 대한 페이지 이동 함수 ------------------------------------------------------------------------
function setSearchTypeSelect(){
    var $keyword = $('#keyword');

    $('._date').change(function(){
        var date = $(this).val(); //날짜 추출
        // $('#regDt').focus();
        // return;
        var url = "daily?page=1"
        + "&perPageNum=" + "${pageMaker.cri.perPageNum}"
        +"&regDt=" + encodeURIComponent(date)
        +"&keyword=" + "${pageMaker.cri.keyword}";
        window.location.href = url;
    });
    //검색 버튼이 눌리면
    $('#searchBtn').on('click',function(){

        var keywordVal = $keyword.val();

            //검색어 입력 안했으면 검색창
        if(!keywordVal){
            alert("검색어를 입력하세요!");
            $('#keyword').focus();
            return;
        }
        var url = "daily?page=1"
            + "&perPageNum=" + "${pageMaker.cri.perPageNum}"
            + "&regDt="+ encodeURIComponent("${pageMaker.cri.regDt}")
            + "&keyword=" + encodeURIComponent(keywordVal)
        ;
        window.location.href = url;
    })
}
$(function () {
    $("._rtable tbody tr").click(function () {

        var td = $(this).children();
        var array = new Array();
        td.each(function(i){
            array.push(td.eq(i).text());
        })

        console.log(array);
         self.location = "/dailyDetail?"
        +"&keyword=" + array[0]
        + "&regDt=" + $('._date').val();
    });
});

</script>
