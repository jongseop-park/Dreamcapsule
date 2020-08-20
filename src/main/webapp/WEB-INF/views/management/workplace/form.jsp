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
                        <h5>홈 > 근무지관리 > 추가</h5>
                    </c:when>
                    <c:otherwise>
                        <h5>홈 > 근무지관리 > 상세</h5>
                    </c:otherwise>
                </c:choose>
                <p class="mb-4"></p>

                <!-- 변경할 뷰 -->
                <div class="card shadow mb-4">

                    <!-- 테이블 상단 바 -->
                    <div class="card-header py-sm-1 ">
                        <c:choose>
                            <c:when test="${isUpdate eq false}">
                                <h2 class="m-0 font-weight-bold text-primary">근무지 추가하기</h2>
                            </c:when>
                            <c:otherwise>
                                <h2 class="m-0 font-weight-bold text-primary">근무지 관리하기</h2>
                            </c:otherwise>
                        </c:choose>
                        <!-- /테이블 상단 바 -->

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form class="user" id="form">
                                <input type="hidden" value="${result.seq}" id="seq">
                                <div class="form-group" >
                                    근무지<input type="text" class="form-control" id="place" value="${result.place}" style="width: 80%; float: right;">
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    주소<input type="text" class="form-control" id="address" value="${result.address}" style="width: 80%; float: right;">
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    출근시간
                                    <select id="workingTime" class="form-control" style="width: 80%; float: right;">
                                        <option value="09:00">09:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                    </select>
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    퇴근시간
                                    <select id="workTime" class="form-control" style="width: 80%; float: right;">
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                        <option value="22:00">22:00</option>
                                        <option value="23:00">23:00</option>
                                    </select>
                                </div>
                                <div class="form-group" style="margin-top: 2%">
                                    장비선택
                                    <label style="margin-left: 15%">없음<input type="radio" style="margin-left: 10px"  name="selectEquipment" <c:if test="${empty result.equipNm || result.equipNm eq '없음'}">checked="checked"</c:if> value="없음"></label>
                                    <label style="margin-left: 30px">비콘<input type="radio" style="margin-left: 10px"  name="selectEquipment" <c:if test="${result.equipNm eq '비콘'}">checked="checked"</c:if>value="비콘" ></label>
                                    <label style="margin-left: 30px">NFC<input type="radio" style="margin-left: 10px"  name="selectEquipment" <c:if test="${result.equipNm eq 'NFC'}">checked="checked"</c:if>value="NFC" ></label>
                                </div>
                                <!-- TODO 상세 기능  -->

                                <div  style="margin-top: 1%; <c:if test="${result.equipNm ne '비콘'}">display: none;</c:if>" name="divBeacon">
                                    <c:if test="${empty result.seq}">
                                    <div class="form-group" name="beaconBox1">
                                        사용장비
                                        <input type="button" style="float : right; margin-right: 5%;" name="addBeacon" value="추가"/>
                                        <select class="form-control" style="width: 70%; float: right; margin-right: 1%;" name="beacon">
                                            <c:forEach var="beacon" items="${beaconList}">
                                                <option value="${beacon.equipmentNm}">${beacon.equipmentNm}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    </c:if>
                                    <c:if test="${not empty result.seq}">
                                        사용장비
                                    </c:if>
                                </div>

                                <div class="form-group" style="margin-top: 1%; <c:if test="${result.equipNm ne 'NFC'}">display: none;</c:if>" name="divNFC">
                                    사용장비
                                    <input type="button" style="float : right; margin-right: 5%;" name="addNFC" value="추가"/>
                                    <select class="form-control" style="width: 70%; float: right; margin-right: 1%;" id="nfc">
                                        <c:forEach var="nfc" items="${nfcList}">
                                            <option value="${nfc.equipmentNm}">${nfc.equipmentNm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- TODO 상세 기능  -->
                                <!-- 테이블 하단 바 -->
                                <div>
                                    <c:choose>
                                        <c:when test="${isUpdate eq false}">
                                            <input class="btn btn-dark right" id="btnSave" type="button" style="float : right; margin-top: 2%" value="저장"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="btn btn-dark right " id="btnUpdate" type="button" style="float : right; margin-left: 20px; margin-top: 2%" value="수정"/>
                                            <input class="btn btn-dark right " id="btnDelete" type="button" style="float : right; margin-top: 2%" value="삭제"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <!-- /테이블 하단 바 -->
                            </form>
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

<script type="text/javascript">
    $(function () {
        /*
        * var : 변수명 재선언 / 값 재할당 가능
        * let : 변수명 재선언X / 값 재할당 가능
        * const : 변수명 재선언X / 값 재할당 X (상수)
        * */
        var beaconlist = new Array();
        var nfclist = new Array();

        <c:forEach items="${beaconList}" var="item">
            beaconlist.push({
                beacon:"${item.equipmentNm}"
            });
        </c:forEach>
        <c:forEach items="${nfcList}" var="item">
        nfclist.push({
            nfc:"${item.equipmentNm}"
        });
        </c:forEach>

        const $form = $("#form"); // 입력 폼
        let $seq = $form.find("#seq"); // 시퀀스
        let $place = $form.find("#place"); // 근무지
        let $address = $form.find("#address"); // 주소
        let $workingTime = $form.find("#workingTime"); // 출근시간
        let $workTime = $form.find("#workTime"); // 퇴근시간
        let $selectEquipment = $form.find("input[name=selectEquipment]")// 장비선택
        let $divBeacon = $form.find("[name=divBeacon]"); // 비콘 div
        let $divNFC = $form.find("[name=divNFC]"); // NFC 비콘
        let $beacon = $form.find("#beacon"); // 비콘 장비
        let $nfc = $form.find("#nfc"); // NFC 장비
        // let $beaconBox = $form.find("[name=beaconBox]"); // 사용장비

        const $btnSave = $form.find("#btnSave"); // 저장
        const $btnUpdate = $form.find("#btnUpdate"); // 수정
        const $btnDelete = $form.find("#btnDelete"); // 삭제


        $workingTime.val("${result.workingTime}").prop("selected",true);
        $workTime.val("${result.workTime}").prop("selected",true);

        $selectEquipment.click(function () {
            var selEquip = $("input[name=selectEquipment]:checked").val();
            if(selEquip == '없음'){
                $divBeacon.css("display","none");
                $divNFC.css("display","none");
            } else if(selEquip == '비콘'){
                $divBeacon.css("display","block");
                $divNFC.css("display","none");
            } else{
                $divNFC.css("display","block");
                $divBeacon.css("display","none");
            }
        });

        $(document).on("click","[name=addBeacon]",function (){ // 추가버튼 클릭 시 태그 추가
            addBeacon();
        })  ;

        $(document).on("click","[name=delBeacon]",function (){ // 삭제버튼 클릭 시 해당 사용장비 삭제
            $(this).parent().remove();
        })

        $(document).on("click","[name=addNFC]",function (){
           addNFC();
        });

        $(document).on("click","[name=delNFC]",function (){
            $(this).parent().remove();
        })


        function addBeacon(){
            var beaconCnt = $("[name=beaconBox]").length;
            var useEquipmentHtml;
            if(beaconCnt < 8) {
                useEquipmentHtml = '<div class="form-group" name="beaconBox" style="margin-top: 2%;">' +
                    '사용장비 '+
                    '<input type="button" style="float : right; margin-right: 5%;" name="delBeacon" value="삭제"/>' +
                    '<select class="form-control" style="width: 70%; float: right; margin-right: 1%;" name="beacon">';

                for(var i = 0; i < beaconlist.length; i++){
                    useEquipmentHtml += '<option value='+beaconlist[i].beacon+'>'+beaconlist[i].beacon+'</option>';
                }
                useEquipmentHtml += '</select>'+'</div>'
                $divBeacon.append(useEquipmentHtml);
            } else if (beaconCnt == 8){
                useEquipmentHtml = '<div class="form-group" name="beaconBox" style="margin-top: 2%;">' +
                    '사용장비 '+
                    '<input type="button" style="float : right; margin-right: 5%;" name="delBeacon" value="삭제"/>' +
                    '<select class="form-control" style="width: 70%; float: right; margin-right: 1%;" name="beacon">';

                for(var i = 0; i < beaconlist.length; i++){
                    useEquipmentHtml += '<option value='+beaconlist[i].beacon+'>'+beaconlist[i].beacon+'</option>';
                }
                useEquipmentHtml += '</select>'+'</div>'
                $divBeacon.append(useEquipmentHtml);
            }
        }

        function addNFC() {
            var nfcCnt = $("[name=nfcBox]").length;
            var useEquipmentHtml;
            if(nfcCnt < 8) {
                useEquipmentHtml = '<div class="form-group" name="nfcBox" style="margin-top: 2%;">' +
                    '사용장비 '+
                    '<input type="button" style="float : right; margin-right: 5%;" name="delNFC" value="삭제"/>' +
                    '<select class="form-control" style="width: 70%; float: right; margin-right: 1%;" id="nfc">';

                for(var i = 0; i < nfclist.length; i++){
                    useEquipmentHtml += '<option value='+nfclist[i].nfc+'>'+nfclist[i].nfc+'</option>';
                }
                useEquipmentHtml += '</select>'+'</div>'
                $divNFC.append(useEquipmentHtml);
                nfcCnt++;
            } else if (nfcCnt == 8){
                useEquipmentHtml = '<div class="form-group" name="nfcBox" style="margin-top: 2%;">' +
                    '사용장비 '+
                    '<input type="button" style="float : right; margin-right: 5%;" name="delNFC" value="삭제"/>' +
                    '<select class="form-control" style="width: 70%; float: right; margin-right: 1%;" id="nfc">';

                for(var i = 0; i < nfclist.length; i++){
                    useEquipmentHtml += '<option value='+nfclist[i].nfc+'>'+nfclist[i].nfc+'</option>';
                }
                useEquipmentHtml += '</select>'+'</div>'
                $divNFC.append(useEquipmentHtml);
                nfcCnt++;
            }
        }

        // 저장, 업데이트, 삭제
        $btnSave.on("click",function () { // 추가
            var equipmentList = new Array();
            var selectBeacon = $("[name=beacon] option:selected");
            var cnt = $("[name=beacon] option:selected").length;
            var selEquip = $("input[name=selectEquipment]:checked").val();
            var obj = {};




            if(selEquip == "비콘"){
                obj["equipmentSeq"] = ${result.seq}+"";
                $("[name=beacon] option:selected").each(function (i,e){ // name=beacon 개수만큼 반복.  i = index, e = $(this)
                    obj["beacon"+(i+1)] = $(this).text();
                });
                console.log(JSON.stringify(obj));
            } else if(selEquip == "NFC"){
                alert("NFC");
            }

            for(var i = 0; i<cnt; i++) {
                equipmentList[i] = selectBeacon.eq(i).val();
            }
            // console.log(JSON.stringify(equipmentList));
            var object = {
                "place" : $place.val(),
                "address" : $address.val(),
                "workingTime" : $workingTime.val(),
                "workTime" : $workTime.val(),
                "equipNm" : $selectEquipment.val(),
                "useEquipmentVO" : JSON.stringify(obj)
            };

            Save(object);
        });

        $btnUpdate.on("click",function () { // 수정
            alert("저장 클릭 ");
            var object = {
                "seq" : $seq.val()
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

            // required(data);

            $.ajax({
                url : "/admin/management/workplace/save",
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
                url : "/admin/management/workplace/delete",
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

        function required(data) {
            if($rank.val() == ""){
                alert("직급명은 필수입니다.");
                return false;
            }
        }



    });
</script>