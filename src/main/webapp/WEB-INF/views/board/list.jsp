<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Main board</title>
    <link rel="stylesheet" href="/resources/css/board.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


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
                    <button class="btn btn-dark"><a href="add" style="text-decoration: none">글쓰기</a></button>
                    <div>
                        <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
                           aria-controls="offcanvasExample">
                            <i class="bi bi-list"></i>
                        </a>
                    </div>
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


<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title" id="offcanvasExampleLabel">회원 정보</h3>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <c:if test="${sessionScope.member != null}">
        <div class="float-start">
            <a href="/logout" style="text-decoration: none black">
                로그아웃
            </a>
        </div>
    </c:if>
    <c:if test="${sessionScope.member == null}">
        <div class="float-start">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#LoginModal">
                로그인
            </button>
        </div>
    </c:if>


<%--    이거 나중에 수정 할 때 살리면 됨--%>
<%--    <div class="offcanvas-body">--%>
<%--        <div class="justify-content-center" >--%>
<%--            <i class="bi bi-person"></i>--%>
<%--            <p>${sessionScope.member.memberName} (${sessionScope.member.memberNick})님</p>--%>
<%--        </div>--%>
<%--        <div class="dropdown mt-3">--%>
<%--            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">--%>
<%--                Dropdown button--%>
<%--            </button>--%>
<%--            <ul class="dropdown-menu">--%>
<%--                <li><a class="dropdown-item" href="#">Action</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Another action</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
    </div>
</div>


<div class="modal fade" id="LoginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content text-black">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/login">
                <div class="modal-body">
                    <div>
                        <div>
                            <div>
                                <label>아이디:</label>
                                <input type="text" name="memberId" class="form-control">
                            </div>

                            <div>
                                <label>비밀번호:</label>
                                <input type="password" name="memberPass" class="form-control">
                            </div>
                            <div>
                            </div>
                            <div style="margin-left: 355px">
                                <button class="btn btn-danger btn-sm ">로그인</button>
                                <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
