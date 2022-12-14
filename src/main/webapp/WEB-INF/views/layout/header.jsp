<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<header class="p-3 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/" class="nav-link px-2 text-white">홈</a></li>
                <c:if test="${sessionScope.loginEmail != null}">
                    <li><a href="/member/myPage" class="nav-link px-2 text-white">마이페이지</a></li>
                </c:if>
                <c:if test="${sessionScope.loginEmail == 'admin'}">
                    <li><a href="/member/admin" class="nav-link px-2 text-white">회원관리</a></li>
                </c:if>
                <%--                <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>--%>
                <%--                <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>--%>
                <%--                <li><a href="#" class="nav-link px-2 text-white">About</a></li>--%>
            </ul>

            <form action="/board/search" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <div class="input-group">
                    <select name="type" class="form-select">
                        <option value="boardTitle" selected>제목</option>
                        <option value="boardWriter">작성자</option>
                    </select>
                    <input type="search" name="q" class="form-control form-control-dark text-bg-dark"
                           placeholder="Search..."
                           aria-label="Search">
                    <button class="btn btn-outline-light"><i class="bi bi-search"></i></button>
                </div>
            </form>

            <div class="text-end">
                <c:choose>
                    <c:when test="${sessionScope.loginEmail != null}">
                        <span>${sessionScope.loginEmail}님</span>
                        <button type="button" onclick="headerLogout()" class="btn btn-outline-light me-2">Logout
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" onclick="headerLogin()" class="btn btn-outline-light me-2">Login</button>
                        <button type="button" onclick="headerSignUp()" class="btn btn-warning">Sign-up</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>
</body>
<script>
    const headerLogout = () => {
        location.href = "/member/logout";
    }

    const headerLogin = () => {
        location.href = "/member/login";
    }

    const headerSignUp = () => {
        location.href = "/member/save";

    }
</script>
</html>
