<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberLogin</title>
</head>
<body>
<div>
    <form action="/member/login" method="post" name="loginForm">
        <input type="text" name="memberEmail" placeholder="이메일"> <br>
        <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="button" value="로그인" onclick="login()">
    </form>
</div>
</body>
<script>
    const login = () => {
        document.loginForm.submit();
    }
</script>
</html>
