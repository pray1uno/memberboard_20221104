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
</head>
<body>
<div>
    <form action="/member/save" method="post" name="saveForm" enctype="multipart/form-data">
        이메일 <br>
        <input type="text" name="memberEmail" placeholder="이메일" onblur="duplicateCheck()" id="inputEmail">
        <span id="emailCheck"></span><br>
        <span id="inputEmailCheck"></span>
        비밀번호 <br>
        <input type="text" name="memberPassword" placeholder="비밀번호" onblur="expCheckPW()" id="inputPassword">
        <span id="passwordCheck"></span><br>
        <span id="passwordExp"></span>
        이름 <br>
        <input type="text" name="memberName" placeholder="이름">
        <span id="nameCheck"></span><br>
        전화번호 <br>
        <input type="text" name="memberMobile" placeholder="전화번호" onblur="expCheckMobile()" id="inputMobile">
        <span id="mobileCheck"></span><br>
        <span id="mobileExp"></span>
        <input type="file" name="memberFileName"> <br>
        <input type="button" value="회원가입" onclick="save()">
    </form>
</div>
<div>
    <a href="/">홈으로 가기</a>
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
