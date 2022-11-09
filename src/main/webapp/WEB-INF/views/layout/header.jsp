<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<header>
    <div class="container">
        <div>
            <ul>
                <li>
                    <a href="/">HOME</a>
                </li>
                <li>
                    <a href="/board/paging">게시글 목록</a>
                </li>
                <li>
                    <a href="/board/newBoardWrite">신규 게시글 작성</a>
                </li>
            </ul>

            <form action="/board/search" role="search">
                <div class="input-group">
                    <select name="type">
                        <option value="boardTitle" selected>제목</option>
                        <option value="boardWriter">작성자</option>
                    </select>
                    <input type="search" name="q" placeholder="search..." aria-label="search">
                    <button><i>검색</i></button>
                </div>
            </form>
        </div>
    </div>
</header>
</body>
</html>
