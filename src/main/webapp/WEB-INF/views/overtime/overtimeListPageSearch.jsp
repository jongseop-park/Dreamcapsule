<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.dreamcapsule.project.apps.overtime.domain.SearchCriteria" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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

    <!-- javascript -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.7.2.js"></script>
    <script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <script type="text/javascript">
       /* $(document).ready( function () {
            $('#myTable').DataTable({
                paging:false
                ,searching:false
                ,info:false
                ,ordering:false
            });
        } );*/

       function sortTest(keyword) {
           var order= "asc";
           var orderKeyword= keyword;

           if(${scri.order.equals("asc")}) {
               document.getElementById("dateSort").innerHTML = "▲";
               document.getElementById("dateSort2").innerHTML = "▲";
               order= "desc";
           } else {
               document.getElementById("dateSort").innerHTML = "▼";
               document.getElementById("dateSort2").innerHTML = "▼";
               order="asc"
           }

           $.ajax({
               type: "GET",
               url: "/listSearch?sequence=${searchData.sequence}" +
                   "&keyword=${scri.keyword}" +
                   "&page=${scri.page}" +
                   "&startDate=${scri.startDate}" +
                   "&endDate=${scri.endDate}" +
                   "&order=" + order +
                   "&orderKeyword=" + orderKeyword,
               dataType: "html",
               contentType: "json",
               success: function (data) {
                   $('#page-top').children().remove();
                   $('#page-top').html(data);
               },
               error: function (jqXHR, textStatus, errorThrown) {
                   //alert("에러");
               },
           });
       }

        $(function() {
            var startDate;

            $(".startDatepicker").datepicker({
                showOn: 'both'
                ,buttonImage: 'https://icons.iconarchive.com/icons/custom-icon-design/mono-business-2/32/calendar-icon.png'
                ,buttonText: '날짜선택'
                ,buttonImageOnly: true
                ,showMonthAfterYear: true
                ,changeYear: true
                ,changeMonth: true
                ,dateFormat: 'yy년 mm월 dd일'
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
                ,dayNamesMin: ['일','월','화','수','목','금','토'],
                onSelect:function() {
                    startDate = $(".startDatepicker").val();
                }});

            function getDateFormat(date) {
                var year= date.substr(0,4);
                var month= date.substr(6,2);
                var day = date.substr(10,2);

                return year + "-" + month + "-" + day;
            }

            function applyDatepicker(elem) {
                $(elem).datepicker({
                    showOn: 'focus'
                    ,buttonImageOnly: false
                    ,showMonthAfterYear: true
                    ,changeYear: true
                    ,changeMonth: true
                    ,dateFormat: 'yy년 mm월 dd일'
                    ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
                    ,dayNamesMin: ['일','월','화','수','목','금','토'],
                    onSelect:function() {
                        var endDate = $(".endDatepicker").val();

                        if(startDate == null) {
                            alert("시작일을 선택해주세요.");
                        } else {
                            endDate = getDateFormat(endDate);
                            startDate=  getDateFormat(startDate);

                            location.href="/listSearch?startDate=" + startDate + "&endDate=" + endDate + "&keyword=" + getParameter("keyword");

/*                            $.ajax({
                                type: "GET",
                                url: "/listSearch?startDate=" + startDate +
                                    "&endDate=" + endDate +
                                    "&keyword=" + getParameter("keyword"),
                                dataType: "html",
                                contentType: "json",
                                success: function (data) {
                                    $('#page-top').children().remove();
                                    $('#page-top').html(data);



                                    $(document).on('changeDate',"#date1", function(){
                                        alert('event fired');
                                    });

                                    $(".selectDt").removeClass('hasDatepicker').datepicker();

                                    $(".startDatepicker").datepicker("destroy");
                                    $(".endDatePicker").datepicker('remove');
                                    applyDatepicker(".endDatepicker");

                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    //alert("에러");
                                },
                            });*/

                        }
                    }});
            }
            $(document).ready(function() {
                applyDatepicker(".endDatepicker");
            })
        });

        function getParameter(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        // 조회
       $(function() {
        $("#myTable tbody tr").click(function() {
             var tr = $(this);
             var td = tr.children();

            self.location = "/readInfo?"
                + "sequence=" + td.eq(0).text()
                + "&keyword=${scri.keyword}"
                + "&page=${scri.page}"
                + "&startDate=${scri.startDate}"
                + "&endDate=${scri.endDate}"
                + "&order=" + getParameter("order")
                + "&orderKeyword=" + getParameter("orderKeyword");
        });
     });
    </script>
    <!-- end -->

    <!-- css -->
    <style>
        #pagediv {
            position:absolute;
            text-align: center;
            bottom:15%;
            left:600px;
            right:400px;
        }

        #top {
            display: flex;
        }

        #date1 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 19%;
            border:1px solid #d1d3e2; background: none; border-radius: 3px;
        }
        #date2 {
            width: 150px;
            height: 30px;
            margin: 4px 2px 0 10px;
            border:1px solid #d1d3e2; background: none; border-radius: 3px;
        }

        .ui-datepicker-trigger {
            position: absolute;
            margin: 4px 0 0 250px;
            height: 30px;
            width: 30px;
        }

        #tableDiv {
            height:900px;
        }

        #dateSort, #dateSort2 {
            border:1px solid #d1d3e2;
            background: none;
            height: 30px;
            margin: 4px 10px 0 0;
            width: 30px;
            color:#d1d3e2;
            border-radius: 5px;
        }

        #empName, #empJob, #empPosition, #statussort {
            border:1px solid #d1d3e2;
            background: none;
            height: 30px;
            margin: 4px 10px 0 15px;
            width: 30px;
            border-radius: 5px;
            color:#d1d3e2;
        }

        #myTable tbody{
            color:#6e707e;
        }

        #myTable tbody tr:hover {
            background-color:#4e73df;
            color:#000000;
        }
    </style>
    <!-- end -->

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
            <div class="container">
                <h6>홈 > 외근관리</h6>

                <div id="top">
                    <h5 id="title">야근관리</h5>
                    <%
                        /// 날짜 변환 출력
                       String startDate = request.getParameter("startDate");
                       String endDate = request.getParameter("endDate");

                       if(startDate != null && endDate != null) {
                           SimpleDateFormat source = new SimpleDateFormat("yyyy-MM-dd");
                           SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

                           startDate = sdf.format(source.parse(startDate));
                           endDate = sdf.format(source.parse(endDate));
                       } else {
                           startDate = "";
                           endDate = "";
                       }

                       //// 정렬
                       String order = request.getParameter("order") == null? "" : request.getParameter("order");
                       String orderKeyword = request.getParameter("orderKeyword") == null? "": request.getParameter("orderKeyword");

                        String empName= "▼";
                        String empJob= "▼";
                        String empPosition= "▼";
                        String status= "▼";
                        String requestDate= "▼";

                        if(order.equals("asc")) {
                            switch (orderKeyword) {
                                case "empName": empName="▼"; break;
                                case "empJob": empJob="▼"; break;
                                case "empPosition": empPosition="▼"; break;
                                case "status": status="▼"; break;
                                case "requestDate": requestDate="▼"; break;
                            }
                        } else {
                            switch (orderKeyword) {
                                case "empName": empName="▲"; break;
                                case "empJob": empJob="▲"; break;
                                case "empPosition": empPosition="▲"; break;
                                case "status": status="▲"; break;
                                case "requestDate": requestDate="▲"; break;
                            }
                        }
                    %>
                   <input type="text" class="startDatepicker" id="date1" value="<%= startDate  %>">
                    <button id="dateSort" value="requestDate" onClick="sortTest(dateSort.value)" ><%= requestDate %></button> ~
                    <input type="text" class="endDatepicker" id="date2" value="<%= endDate %>">
                    <button id="dateSort2" value="requestDate" onClick="sortTest(dateSort2.value)"><%= requestDate %></button>

                    <form method="get" action="/listSearch" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" name="keyword" value="${scri.keyword}" class="form-control bg-light border-1 small" placeholder="직원검색" aria-label="Search" aria-describedby="basic-addon2">
                            <input type="hidden" name="startDate" value="${scri.startDate}" />
                            <input type="hidden" name="endDate" value="${scri.endDate}" />
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <%@include file="/WEB-INF/views/include/excel_include.jsp"%>
                </div>
                <div id="tableDiv">
                <table id="myTable" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th id="직원">직원<button id="empName" value="empName" onClick="sortTest(empName.value)"><%= empName %></button></th>
                    <th id="직무">직무<button id="empJob" value="empJob" onClick="sortTest(empJob.value)"><%= empJob %></button></th>
                    <th id="직급">직급<button id="empPosition" value="empPosition" onClick="sortTest(empPosition.value)"><%= empPosition %></button></th>
                    <th>야근날짜</th>
                    <th>야근시간</th>
                    <th>석식여부</th>
                    <th id="상태">상태<button id="statussort" value="status" onClick="sortTest(statussort.value)"><%= status %></button></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="searchData" items="${searchList}">
                    <tr>
                        <td style="display:none;">${searchData.sequence}</td>
                        <td>
                        <%--<a href="/readInfo?sequence=${searchData.sequence}&keyword=${scri.keyword}&page=${scri.page}&startDate=${scri.startDate}&endDate=${scri.endDate}">--%>${searchData.empName}<%--</a>--%></td>
                        <td>${searchData.empJob}</td>
                        <td>${searchData.empPosition}</td>
                        <td>${searchData.overtimeDate}</td>
                        <td>${searchData.overtimeTime}</td>
                        <td>${searchData.eatBoolean}</td>
                        <td>${searchData.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
                </div>
            <div id="pagediv">
                   <a href="listSearch${pageMaker.makeSearch(pageMaker.cri.page -1)}">◀</a>&nbsp&nbsp&nbsp
                   <c:forEach begin="${pageMaker.startPage}"  end="${pageMaker.endPage}" var="idx">
                    <c:choose>
                        <c:when test="${idx == pageMaker.cri.page}">
                            <b>&nbsp<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp</b>
                        </c:when>
                        <c:otherwise>
                            &nbsp<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a>&nbsp
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pageMaker.totalPage != pageMaker.cri.page}">
                    &nbsp&nbsp&nbsp<a href="listSearch${pageMaker.makeSearch(pageMaker.cri.page + 1)}">▶</a>
                </c:if>
                <c:if test="${pageMaker.totalPage == pageMaker.cri.page}">
                    &nbsp&nbsp&nbsp<a href="listSearch${pageMaker.makeSearch(pageMaker.endPage)}">▶</a>
                </c:if>
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
</div><!-- plugins_js -->
<%@include file="../include/plugins_js.jsp"%>
<!-- /plugins_js -->
</body>
</html>