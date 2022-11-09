<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardWrite</title>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div>
    <form action="/board/newBoardWrite" method="post" name="writeForm" enctype="multipart/form-data">
        <input type="text" name="boardTitle" placeholder="제목"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
        <input type="file" name="boardFileName"> <br>
        <input type="button" value="작성" onclick="writeSubmit()">
    </form>
</div>
</body>
<script>
    const writeSubmit = () => {
        document.writeForm.submit();
    }
</script>
</html>
