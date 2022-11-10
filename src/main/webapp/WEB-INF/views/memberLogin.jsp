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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #loginForm {
            width: 500px;
            height: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<br>
<div class="container" id="loginForm">
    <form action="/member/login" method="post" name="loginForm">
        <label for="idInputForm" class="form-label">이메일</label>
        <input type="text" id="idInputForm" name="memberEmail" placeholder="이메일" class="form-control mb-3"> <br>
        <label for="passInputForm" class="form-label">비밀번호</label>
        <input type="text" id="passInputForm" name="memberPassword" placeholder="비밀번호" class="form-control mb-5"> <br>
        <div class="btn btn-outline-primary d-grid gap-2 col-6 mx-auto">
            <input type="button" value="로그인" onclick="login()" class="btn">
        </div>
    </form>
</div>

</body>
<script>
    const login = () => {
        document.loginForm.submit();
    }
</script>
</html>
