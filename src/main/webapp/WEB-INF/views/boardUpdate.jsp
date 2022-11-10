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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #updateWriteForm {
            width: 800px;
            height: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5" id="updateWriteForm">
    <form action="/board/update" method="post" name="updateFn">
        <input type="hidden" name="id" class="form-control" value="${updateResult.id}" readonly> <br>
        <input type="text" name="boardTitle" class="form-control" value="${updateResult.boardTitle}"> <br>
        <input type="text" name="boardWriter" class="form-control" value="${updateResult.boardWriter}" readonly> <br>
        <textarea name="boardContents" class="form-control" cols="30" rows="10">${updateResult.boardContents}</textarea>
        <br>
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
