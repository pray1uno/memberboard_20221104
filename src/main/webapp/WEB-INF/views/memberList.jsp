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
</head>
<body>
<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Password</th>
            <th>Name</th>
            <th>Mobile</th>
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
<div>
    <a href="/member/admin">이전으로</a>
</div>
</body>
<script>
    const memberDelete = (clickedId) => {
        location.href = "/member/delete?id=" + clickedId;
    }
</script>
</html>
