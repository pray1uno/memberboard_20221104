<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>boardDetail</title>
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div>
    <table>
        <tr>
            <th>번호</th>
            <td>${boardList.id}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${boardList.boardTitle}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${boardList.boardWriter}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${boardList.boardContents}</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td>${boardList.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${boardList.boardHits}</td>
        </tr>
        <c:if test="${boardList.storedFileName != null}">
            <tr>
                <th>첨부파일</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${boardList.storedFileName}" alt=""
                    width="200" height="200">
                </td>
            </tr>
        </c:if>

        <c:if test="${sessionScope.loginEmail == boardList.boardWriter}">
            <tr>
                <th>수정/삭제</th>
                <td id="buttonForm">
                    <button onclick="boardUpdate()">수정</button>
                    <button onclick="boardDelete()">삭제</button>
                </td>
            </tr>
        </c:if>
    </table>
</div>
<div>
    <a href="/">홈으로 가기</a>
    <a href="/board/paging">목록으로</a>
</div>
</body>
<script>
    const boardUpdate = () => {
        location.href = "/board/update?id=" + '${boardList.id}';
    }

    const boardDelete = () => {
        location.href = "/board/delete?id=" + '${boardList.id}';
    }
</script>
</html>
