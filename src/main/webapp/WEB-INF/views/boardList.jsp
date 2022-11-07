<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardList</title>
</head>
<body>
<div>
    <button onclick="logout()">로그아웃</button>
</div>
</body>
<script>
    const logout = () => {
        location.href = "/member/logout";
    }
</script>
</html>
