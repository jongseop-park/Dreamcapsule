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

    <link href="/static/css/commute/pagination.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" media="screen"
          href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <style>
        .table-bordered tbody tr:hover{
            background-color: #8fd19e;
        }
        .sortbtn {
            border: 0px;
            background-color: rgba(0, 0, 0, 0);
            color: skyblue;
            padding: 5px;

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



                <p class="mb-4"><h5>홈 > 직원관리</h5></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1">
                        <h2 class="m-0 font-weight-bold text-primary">직원관리
                            <div class="d-sm-flex align-items-center justify-content-between mb-1"
                                 style="float: right; margin: 4px 0 0 10px">
                                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                        class="fas fa-download fa-sm text-white-50"></i> 엑셀 업로드</a>
                            </div>
                             <%@ include file="/WEB-INF/views/include/excel_include.jsp"%>
                            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float: right">
                                <div class="input-group" >
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="직원 검색.."
                                           id="keyword" name="keyword" value="${pageMaker.cri.keyword}"/>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" id="searchBtn">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </h2>
                    <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table style="text-align: center" class="table table-bordered _listtable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 20%">직원<button id="emplNm" value="empl_Nm" class="sortBtn" onclick="sort(emplNm.value)"></button> </th>
                                    <th style="width: 20%">근무지<button id="placeNm" value="place_Nm" class="sortBtn" onclick="sort(placeNm.value)"></button></th>
                                    <th style="width: 20%">직무<button id="dutyNm" value="duty_Nm" class="sortBtn" onclick="sort(dutyNm.value)"></button></th>
                                    <th style="width: 20%">직급<button id="rankNm" value="rank_Nm" class="sortBtn" onclick="sort(rankNm.value)"></button></th>
                                    <th style="width: 20%">권한<button id="authNm" value="auth_Nm" class="sortBtn" onclick="sort(authNm.value)"></button></th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tbody>
                                    <tr>
                                        <c:forEach var="emplist"  items="${emplist}">
                                            <td style="display: none">${emplist.empSeq}</td>
                                            <td>${emplist.emplNm}</td>
                                            <td>${emplist.placeNm}</td>
                                            <td>${emplist.dutyNm} 팀</td>
                                            <td>${emplist.rankNm}</td>
                                            <td>${emplist.authNm}</td>
                                    </tr>
                                        </c:forEach>


                                </tbody>
                            </table>
                                <div>
                                    <ul class="pagination" style="justify-content: center">
                                        <li><a href="list${pageMaker.empmakeQuery(pageMaker.startPage - 1)}">이전</a></li>
                                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                            <li id="page${idx}"><a href="list${pageMaker.empmakeQuery(idx)}">${idx}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                            <li><a href="list${pageMaker.empmakeQuery(pageMaker.endPage + 1)}">다음</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            <!-- 테이블 하단 바 -->
                            <div>
                            <button class="btn btn-dark right" type="button" style="float : right;" onclick="location.href='/admin/management/employee/form'">
                                추가
                            </button>
                            </div>
                            <!-- /테이블 하단 바 -->
                        </div>
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
<script type="text/javascript">
    $(document).ready(function(){
        var thisPage = '${pageMaker.cri.page}';
        $('#page'+thisPage).addClass('active');

        var btnarray = new Array();
        btnarray[0]="emplNm";
        btnarray[1]="dutyNm";
        btnarray[2]="rankNm";
        btnarray[3]="placeNm";
        btnarray[4]="authNm";

        for(var i = 0;i<btnarray.length;i++){
            console.log(document.getElementById(btnarray[i]).value);
            if(document.getElementById(btnarray[i]).value == "${pageMaker.cri.eorderKeyword}"){
                if("${pageMaker.cri.orderMethod}"=="asc"){

                    document.getElementById(btnarray[i]).innerText = "▲";
                }else{
                    document.getElementById(btnarray[i]).innerText = "▼";
                }

            }else {
                document.getElementById(btnarray[i]).innerText = "▲";
            }
        }

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

        self.location = "list?page=1" +
            "&keyword=${pageMaker.cri.keyword}" +
            "&eorderKeyword="+orderkeyword +
            "&orderMethod="+order;


    }



    $(function () {
        $("._listtable tbody tr").click(function () {

            var td = $(this).children();
            var array = new Array();
            td.each(function(i){
                array.push(td.eq(i).text());
            })

            console.log(array);
            self.location = "form?"
                +"&empSeq=" + array[0]
                ;
        });
    });





        $('#searchBtn').on('click',function(){
            var $keyword = $('#keyword');
            var keywordVal = $keyword.val();

            //검색어 입력 안했으면 검색창
            if(!keywordVal){
                alert("검색어를 입력하세요!");
                $('#keyword').focus();
                return;
            }
            var url = "list?page=1"
                + "&perPageNum=" + "${pageMaker.cri.perPageNum}"
                + "&keyword=" + encodeURIComponent(keywordVal)
            ;

            window.location.href = url;

        });




</script>