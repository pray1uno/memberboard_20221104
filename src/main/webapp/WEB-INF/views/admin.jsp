<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin</title>
</head>
<body>
<div>
    <button onclick="memberList()" >회원목록</button>
    <button onclick="adminBoardList()">게시글목록</button>
</div>
</body>
<script>
    const memberList = () => {
        location.href = "/member/memberList";
    }
    const adminBoardList = () => {
        location.href = "/board/paging";
    }
</script>
</html>
