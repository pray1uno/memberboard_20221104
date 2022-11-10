<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Password</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${memberList}" var="list">
            <tr>
                <td>${list.id}</td>
                <td>${list.memberEmail}</td>
                <td>${list.memberPassword}</td>
                <td>${list.memberName}</td>
                <td>${list.memberMobile}</td>
                <td>
                    <button onclick="memberDelete('${list.id}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <button class="btn btn-link" onclick="backHome2()">이전으로</button>
</div>
</body>
<script>
    const memberDelete = (clickedId) => {
        location.href = "/member/delete?id=" + clickedId;
    }

    const backHome2 = () => {
        location.href = "/member/admin";

    }
</script>
</html>
