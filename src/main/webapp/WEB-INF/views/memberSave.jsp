<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave</title>
</head>
<body>
<div>
    <form action="/member/save" method="post" name="saveForm" enctype="multipart/form-data">
        이메일
        <input type="text" name="memberEmail"> <br>
        비밀번호
        <input type="text" name="memberPassword"> <br>
        이름
        <input type="text" name="memberName"> <br>
        전화번호
        <input type="text" name="memberMobile"> <br>
        <input type="file" name="memberFileName"> <br>
        <input type="button" value="회원가입" onclick="save()">
    </form>
</div>
</body>
<script>
    const save = () => {
        document.saveForm.submit();
    }
</script>
</html>
