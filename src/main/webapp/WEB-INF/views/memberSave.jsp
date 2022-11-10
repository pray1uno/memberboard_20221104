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
    <script src="/resources/js/jquery.js"></script>
    <style>
        #saveForm {
            width: 500px;
            height: 100px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="saveForm">
    <form action="/member/save" method="post" name="saveForm" enctype="multipart/form-data">
        <label for="inputEmail" class="form-label">이메일</label>
        <input type="text" name="memberEmail" placeholder="이메일" onblur="duplicateCheck()" id="inputEmail"
               class="form-control mb-3">
        <span id="emailCheck"></span> <br>
        <span id="inputEmailCheck"></span> <br>
        <label for="inputPassword" class="form-label">비밀번호</label>
        <input type="text" name="memberPassword" placeholder="비밀번호" onblur="expCheckPW()" id="inputPassword"
               class="form-control mb-3">
        <span id="passwordCheck"></span>
        <span id="passwordExp"></span> <br> <br>
        <label for="nameCheck" class="form-label">이름</label>
        <input type="text" name="memberName" placeholder="이름" class="form-control mb-3">
        <span id="nameCheck"></span> <br> <br>
        <label for="mobileExp" class="form-label">전화번호</label>
        <input type="text" name="memberMobile" placeholder="전화번호" onblur="expCheckMobile()" id="inputMobile"
               class="form-control mb-3">
        <span id="mobileCheck"></span>
        <span id="mobileExp"></span> <br> <br>
        프로필사진
        <input type="file" name="memberFileName" class="form-control mt-3 mb-5">
    </form>
    <div class="btn btn-outline-primary d-grid gap-2 col-6 mx-auto">
        <input type="button" value="회원가입" onclick="save()" class="btn">
    </div>
</div>

</body>
<script>

    const expCheckMobile = () => {
        const checkExpMobile = /^\d{3}-\d{4}-\d{4}$/;

        const inputMobile = document.getElementById("inputMobile").value;
        const expMobile = document.getElementById("mobileExp");

        if (!inputMobile.match(checkExpMobile)) {
            expMobile.innerHTML = "'-'까지 모두 입력해 주세요.";
            expMobile.style.color = "red";
            return false;
        } else {
            expMobile.innerHTML = "";
        }

    }

    const expCheckPW = () => {
        const checkExpPW = /^(?=.*[a-z])[a-z \d -_!#]/;

        const inputExpPW = document.getElementById("inputPassword").value;
        const expPassword = document.getElementById("passwordExp");

        if (inputExpPW.match(checkExpPW)) {
            expPassword.innerHTML = "사용할 수 있는 비밀번호 입니다.";
            expPassword.style.color = "green";
            return false;
        } else {
            expPassword.innerHTML = "영문 소문자는 반드시 입력해야 합니다.";
            expPassword.style.color = "red";
        }

    }

    const duplicateCheck = () => {
        const email = document.getElementById("inputEmail").value;
        const checked = document.getElementById("emailCheck");

        if (email.length > 0) {
            $.ajax({
                type: "post",
                url: "/member/duplicateCheck",
                dataType: "text",
                data: {
                    inputEmail: email
                },
                success: function (result) {
                    if (result == "OK") {
                        checked.innerHTML = "사용할 수 있는 이메일입니다.";
                        checked.style.color = "green";
                    } else if (result == "NO") {
                        checked.innerHTML = "이미 사용중인 이메일입니다."
                        checked.style.color = "red";
                    }
                },
                error: function () {
                    console.log("실패");
                }
            });
        } else {
            checked.innerHTML = "";
        }

    }

    const save = () => {
        const emailCheck = document.getElementById("inputEmailCheck");
        const passwordCheck = document.getElementById("passwordCheck");
        const nameCheck = document.getElementById("nameCheck");
        const mobileCheck = document.getElementById("mobileCheck");

        if (document.saveForm.memberEmail.value == "") {
            emailCheck.innerHTML = "이메일을 입력해 주세요.";
            emailCheck.style.color = "red";
            return false;
        } else {
            emailCheck.innerHTML = "";

        }

        if (document.saveForm.memberPassword.value == "") {
            passwordCheck.innerHTML = "비밀번호를 입력해 주세요.";
            passwordCheck.style.color = "red";
            return false;
        } else {
            passwordCheck.innerHTML = "";
        }

        if (document.saveForm.memberName.value == "") {
            nameCheck.innerHTML = "이름을 입력해 주세요.";
            nameCheck.style.color = "red";
            return false;
        } else {
            nameCheck.innerHTML = "";
        }

        if (document.saveForm.memberMobile.value == "") {
            mobileCheck.innerHTML = "전화번호를 입력해 주세요.";
            mobileCheck.style.color = "red";
            return false;
        } else {
            mobileCheck.innerHTML = "";
        }

        document.saveForm.submit();

    }
</script>
</html>
