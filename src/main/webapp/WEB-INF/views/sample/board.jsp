<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
DB 테스트 입니다. ~

<div class = "container">
    <h2>Sample</h2>
    <table class = "table table-bordered">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="result" items="${result}">
            <tr>
                <td>${result.seq}</td>
                <td>${result.title}</td>
                <td><a href="#">${result.content}</a></td>
            </tr>
        </c:forEach>

        </tbody>

    </table>
</div>

</body>
</html>
