<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate</title>
</head>
<body>
<div class="container">
    <form action="/board/update" method="post" name="updateFn">
        <input type="hidden" name="id" value="${updateResult.id}" readonly> <br>
        <input type="text" name="boardTitle" value="${updateResult.boardTitle}"> <br>
        <input type="text" name="boardWriter" value="${updateResult.boardWriter}" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${updateResult.boardContents}</textarea> <br>
        <input type="button" value="수정완료" onclick="updateAll()">
    </form>
</div>
</body>
<script>
    const updateAll = () => {
        document.updateFn.submit();
    }
</script>
</html>
