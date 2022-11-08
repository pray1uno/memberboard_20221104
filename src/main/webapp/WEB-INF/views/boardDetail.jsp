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
<div>
    <table>
        <tr>
            <th>번호</th>
            <td>${findById.id}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${findById.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${findById.boardContents}</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td>${findById.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${findById.boardHits}</td>
        </tr>
        <c:if test="${findById.storedFileName != null}">
            <tr>
                <th>첨부파일</th>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${findById.storedFileName}" alt=""
                    width="200" height="200">
                </td>
            </tr>
        </c:if>
    </table>
</div>
<div>
    <a href="/">홈으로 가기</a>
</div>
</body>
</html>