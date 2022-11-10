<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyPage</title>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <button class="btn btn-primary" onclick="myPageUpdate()">내 정보 수정</button>
</div>
<div class="container mt-5">
    <button class="btn btn-outline-secondary" onclick="backHome()">홈으로 가기</button>
</div>
</body>
<script>
    const myPageUpdate = () => {
        location.href = "/member/toMyPage";
    }

    const backHome = () => {
        location.href = "/";

    }
</script>
</html>
