<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>porn</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row ">
    <table class="table">
        <th>书名</th>
        <c:forEach var="item" items="${list}">
            <tr>
                <td><a href="${pageContext.request.contextPath}/porn/porntime?title=${item}">${item}</a></td>
            </tr>
        </c:forEach>
    </table>
    </div>
</div>
</body>
</html>
