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
        <div>
            <span id="emailCheck"></span>
            <span id="inputEmailCheck"></span> <br> <br>
        </div>
        <label for="inputPassword" class="form-label">비밀번호</label>
        <input type="text" name="memberPassword" placeholder="비밀번호" onblur="expCheckPW()" id="inputPassword"
               class="form-control mb-3">
        <div>
            <span id="passwordCheck"></span>
            <span id="passwordExp"></span> <br> <br>
        </div>
        <label for="nameCheck" class="form-label">이름</label>
        <input type="text" name="memberName" placeholder="이름" class="form-control mb-3">
        <div>
            <span id="nameCheck"></span> <br> <br>
        </div>
        <label for="mobileExp" class="form-label">전화번호</label>
        <input type="text" name="memberMobile" placeholder="전화번호" onblur="expCheckMobile()" id="inputMobile"
               class="form-control mb-3">
        <div>
            <span id="mobileCheck"></span>
            <span id="mobileExp"></span> <br> <br>
        </div>
        프로필사진
        <input type="file" name="memberFileName" class="form-control mt-3 mb-5">
    </form>
    <div class="btn btn-outline-primary d-grid gap-2 col-6 mx-auto">
        <input type="button" value="회원가입" onclick="save()" class="btn">
    </div>
</div>

</body>
<script>
    const checkExpMobile = /^\d{3}-\d{4}-\d{4}$/;
    const checkExpPW = /^(?=.*[a-z])[a-z \d -_!#]/;

    const expCheckMobile = () => {

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
        } else if (email.length == 0) {
            checked.innerHTML = "이메일을 입력해 주세요.";
            checked.style.color = "red";
        } else {
            checked.innerHTML = "";
        }

    }

    const save = () => {
        const emailCheck = document.getElementById("inputEmailCheck");
        const passwordCheck = document.getElementById("inputPassword").value;
        const mobileCheck = document.getElementById("inputMobile").value;

        if (document.saveForm.memberEmail.value == "") {
            alert("이메일은 비워둘 수 없습니다!");
            return false;
        }

        if (document.saveForm.memberPassword.value == "") {
            alert("비밀번호는 비워둘 수 없습니다!");
            return false;
        }

        if (document.saveForm.memberName.value == "") {
            alert("이름은 비워둘 수 없습니다!");
            return false;
        }

        if (document.saveForm.memberMobile.value == "") {
            alert("전화번호는 비워둘 수 없습니다!")
            return false;
        }

        if (passwordCheck.match(checkExpPW) && mobileCheck.match(checkExpMobile)) {
            document.saveForm.submit()
        } else {
            alert("가입정보를 확인하세요!")
            return false;
        }
    }
</script>
</html>
