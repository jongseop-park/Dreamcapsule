<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jongs
  Date: 2020-07-10
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>500</title>

    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top" style="background-color: #9fcdff">

<!-- Page Wrapper -->
<div id="wrapper">

    <div id="content-wrapper" class="d-flex flex-column">


        <div id="content" style="background-color: #9fcdff">




            <div class="container-fluid">


                    <div class="text-center" style="background-color: #ffffff; margin-top: 300px">
                    <div class="error mx-auto" data-text="500">500</div>
                    <p class="lead text-gray-800 mb-5">Internal Server Error</p>
                    <div>
                    <p>request_uri : <c:out value="${requestScope['javax.servlet.error.request_uri']}"/></p>
                    <p>status_code : <c:out value="${requestScope['javax.servlet.error.status_code']}"/></p>
                    <p>servlet_name : <c:out value="${requestScope['javax.servlet.error.servlet_name']}"/></p>
                    <p>exception : <c:out value="${requestScope['javax.servlet.error.exception']}"/></p>
                    <p>message : <c:out value="${requestScope['javax.servlet.error.message']}"/></p>
                    </div>

                        <input type="button" value="<- 되돌아가기" onclick="history.go(-1)" style="font-size: 30px; border: 0px solid; background-color: white">
                </div>

            </div>


        </div>




    </div>

</div>


</body>

</html>
