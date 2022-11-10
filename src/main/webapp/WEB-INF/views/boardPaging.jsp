<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardPaging</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
<table class="table table-hover">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성시간</th>
        <th>조회수</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/board?id=${board.id}&page${paging.page}">${board.boardTitle}</a></td>
            <td>${board.boardWriter}</td>
            <td>
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
            <td>${board.boardHits}</td>
        </tr>
    </c:forEach>
</table>
</div>

<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">이전</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page-1}">이전</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">다음</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">다음</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<div class="container">
    <button class="btn btn-outline-dark" onclick="newBoardWrite()">글쓰기</button>
</div>
</body>
<script>

    const returnToHome = () => {
        location.href = "/";
    }

    const logout = () => {
        location.href = "/member/logout";
    }

    const myPage = () => {
        location.href = "/member/myPage";
    }

    const newBoardWrite = () => {
        location.href = "/board/newBoardWrite";

    }
</script>
</html>
