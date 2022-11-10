<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <table class="table table-hover">
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

        <c:if test="${sessionScope.loginEmail == 'admin'}">
            <tr>
                <th>삭제</th>
                <td>
                    <button onclick="adminDelete()">삭제</button>
                </td>
            </tr>
        </c:if>

    </table>

    <div class="container mt-5">
        <div class="input-group-sm">
            <div class="container">
                <input type="text" id="commentWriter" name="commentWriter" value="${sessionScope.loginEmail}" readonly
                       class="form-control">
            </div>
            <div class="container">
                <textarea name="commentContents" id="commentContents" cols="10" rows="5"
                          class="form-control"></textarea>
            </div>
            <div class="container mt-3">
                <button onclick="commentWrites()" class="btn btn-info">댓글작성</button>
                <button onclick="backPaging()" class="btn btn-outline-info">목록으로</button>
            </div>
        </div>
    </div>
</div>

<div class="container" id="commentForm">
    <table class="table">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                    value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>

    const commentWrites = () => {
        const commentId = '${boardList.id}';
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                boardId: commentId,
                commentWriter: writer,
                commentContents: contents
            },
            dataType: "json",
            success: function (result) {
                console.log(result)

                let output = "<div class='container'>";
                output += "<table class='table table-hover mt-5'>";
                output += "<tr><th>번호</th>"
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                output += "</div>";
                document.getElementById('commentForm').innerHTML = output;
                document.getElementById('commentWriter').value = '${sessionScope.loginEmail}';
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                console.log("실패")
            }
        });
    }

    const boardUpdate = () => {
        location.href = "/board/update?id=" + '${boardList.id}';
    }

    const boardDelete = () => {
        location.href = "/board/delete?id=" + '${boardList.id}';
    }

    const adminDelete = () => {
        location.href = "/board/delete?id=" + '${boardList.id}';

    }

    const backPaging = () => {
        location.href = "/board/paging";

    }
</script>
</html>
