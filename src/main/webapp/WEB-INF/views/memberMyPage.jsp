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
<div>
    <button onclick="myUpdate()">내 정보 수정</button>
</div>
</body>
<script>
    const myUpdate = () => {
        location.href = "/member/myPage";
    }
</script>
</html>
