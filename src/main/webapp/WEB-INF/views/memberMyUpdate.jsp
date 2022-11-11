<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오후 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myUpdate</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #myUpdateForm {
            width: 800px;
            height: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="myUpdateForm">
    <form action="/member/myUpdate" method="post" name="myUpdate">
        <input type="hidden" name="id" value="${myPage.id}" readonly> <br>
        <input type="text" name="memberEmail" value="${myPage.memberEmail}" readonly class="form-control"> <br>
        <input type="text" name="" id="updateCheck" class="form-control" placeholder="현재 비밀번호"> <br>
        <input type="text" name="" id="newPassword" class="form-control" placeholder="새로운 비밀번호"> <br>
        <input type="text" name="memberPassword" id="realPassword" class="form-control" placeholder="새로운 비밀번호 확인"> <br>
        <input type="text" name="memberName" class="form-control" id="nameData" value="${myPage.memberName}"> <br>
        <input type="text" name="memberMobile" class="form-control" id="mobileData" value="${myPage.memberMobile}"> <br>
        <input type="button" value="수정" class="btn btn-outline-primary" onclick="updateForm()">
    </form>
</div>
</body>
<script>
    const checkExpMobileAdmin = /^\d{3}-\d{4}-\d{4}$/;
    const checkExpPWAdmin = /^(?=.*[a-z])[a-z \d -_!#]/;

    const updateForm = () => {
        const nameData = document.getElementById("nameData").value;

        if (nameData.length == 0) {
            alert("이름은 비워둘 수 없습니다!");
            return false;
        }

        const mobileData = document.getElementById("mobileData").value;
        const mobileEXP = mobileData.match(checkExpMobileAdmin);

        if (!mobileEXP) {
            alert("전화번호를 정확히 입력해 주세요. '-' 도 포함해야 합니다.");
            return false;
        }

        const passwordDB = '${myPage.memberPassword}';
        const inputPW = document.getElementById("updateCheck").value;

        const newPassword = document.getElementById("newPassword").value;
        const realPassword = document.getElementById("realPassword").value;

        const test1 = passwordDB == inputPW;
        const test2 = newPassword == realPassword;

        const test3 = realPassword.match(checkExpPWAdmin);

        if (test1 && test2) {
            if (test3) {
                document.myUpdate.submit()
            } else {
                alert("영문 소문자는 반드시 작성해야 합니다.");
            }
        } else {
            alert("입력한 내용을 확인하세요!");
        }


    }
</script>
</html>
