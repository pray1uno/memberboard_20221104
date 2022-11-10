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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #writeForm {
            width: 800px;
            height: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="writeForm">
    <form action="/board/newBoardWrite" method="post" name="writeForm" enctype="multipart/form-data">
        <input type="text" name="boardTitle" placeholder="제목" class="form-control"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly class="form-control"> <br>
        <textarea name="boardContents" cols="30" rows="10" class="form-control" placeholder="내용"></textarea> <br>
        <input type="file" name="boardFileName" class="form-control mb-5"> <br>
        <div class="btn btn-outline-dark d-grid gap-2 col-4 mx-auto">
            <input type="button" value="작성" onclick="writeSubmit()" class="btn">
        </div>
    </form>
</div>
</body>
<script>
    const writeSubmit = () => {
        document.writeForm.submit();
    }
</script>
</html>
