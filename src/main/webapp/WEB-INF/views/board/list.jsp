<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Main board</title>
    <link rel="stylesheet" href="/resources/css/board.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $.ajax({
                url:'/detail/recommend/${boardNum}'
                type:'POST'
            });

    </script>
</head>
<body>
<!-- 네비바 영역  -->
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>메인 게시판</h3>
        </div>
    </div>
    <nav id="nav3">
        <a href="..">YourTrip</a>
        <ul>
            <li><a href="#">menu1</a></li>
            <li><a href="#">menu2</a></li>
            <li><a href="#">menu3</a></li>
            <li><a href="#">menu4</a></li>
            <li><a href="#">menu5</a></li>
        </ul>

        <select>
            <option>=test=</option>
            <option>=test=</option>
            <option>=test=</option>
        </select>
    </nav>
    <!-- 네비바 영역  -->

    <!-- 검색창 영역  -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form method="get">
                    <div class="search-wrap">
                        <select name="kind">
                            <option value="1" ${pager.kind == 1 ? 'selected' : ''} > 제목</option>
                            <option value="2" ${pager.kind == 2 ? 'selected' : ''}> 글 번호</option>
                            <option value="3" ${pager.kind == 3 ? 'selected' : ''}> 작성자</option>
                        </select>
                        <input name="keyword" placeholder="검색어를 입력해주세요." value="${pager.keyword}">
                        <button class="btn btn-dark">검색</button>
                    </div>
                        <button class="btn btn-dark"><a href="add">글쓰기</a></button>
                </form>
            </div>
        </div>
    </div>
    <!-- 검색창 영역 -->

    <!-- 게시판 리스트 영역 -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">작성자</th>
                    <th scope="col" class="th-date">조회수</th>
                    <th scope="col" class="th-date">추천수</th>
                    <th scope="col" class="th-date">등록일시</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.boardNum}</td>
                        <td><a href="detail/${item.boardNum}">${item.boardTitle}</a></td>
                        <td>${item.boardWrite}</td>
                        <td>${item.boardHit}</td>
                        <td>${item.boardRecommend}</td>
                        <td>${item.boardDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 게시판 리스트 영역 -->
</section>
<!-- 페이지네이션 -->




</body>
</html>
