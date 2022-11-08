<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<button onclick="memberSave()">회원가입</button>
<button onclick="memberLogin()">로그인</button>
<button onclick="boardList()">게시글 목록</button>
</body>
<script>
    const memberSave = () => {
        location.href = "/member/save";
    }

    const memberLogin = () => {
        location.href = "/member/login";
    }

    const boardList = () => {
        location.href = "/board/paging";
    }
</script>
</html>
