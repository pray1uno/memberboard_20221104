<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-07
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardList</title>
</head>
<body>
<div>
    <button onclick="logout()">로그아웃</button>
    <button onclick="myPage()">마이페이지</button>
    <button onclick="newBoardWrite()">신규 게시글 작성</button>
</div>

<div>
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <tr>
            <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardCreatedDate}</td>
            <td>${board.boardHits}</td>
        </tr>
        </c:forEach>

        </tr>
    </table>
</div>
</body>
<script>
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
