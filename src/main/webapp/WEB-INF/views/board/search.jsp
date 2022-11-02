<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>YourTrip 여행자들의 커뮤니티</title>
    <link href="/resources/css/list_styles.css" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/detail_styles.css">
    <script src="/resources/js/detail_scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>


</head>
<body>


<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="/board/list" style="font-size: x-large">YourTrip</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <%--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>--%>
                <li class="nav-item"><a class="nav-link" style="text-decoration: none" data-bs-toggle="offcanvas"
                                        href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                    ${sessionScope.member.memberName}여행자님 </a></li>
            </ul>
        </div>
    </div>
</nav>

<c:if test="${total > 0}">
    <div style="width: 1000px; margin-left: 475px" class="card text-white bg-dark my-5 py-4 text-center">
        <div class="card-body"><h3 class="m-0 text-white"> ${HashName}에대한 검색 결과에요, ${total}건의 이야기가 있어요!</h3></div>
    </div>
</c:if>

<c:if test="${total == 0}">
    <div style="width: 1000px; margin-left: 475px" class="card text-white bg-dark my-5 py-4 text-center">
        <div class="card-body">
            <h3 class="m-0 text-white"><a href="/board/list" style="text-decoration: none" class="text-white" > ${HashName}에대한 게시글 검색 결과가 없어요 </a></h3>
        </div>
    </div>
</c:if>

<!-- Page Content-->
<c:forEach items="${list}" var="item">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 align-items-center my-5">

            <div class="col-lg-7">
                <a href="/board/detail/${item.boardNum}">
                    <img src="/images/${item.boardImage}" class="d-block w-100 img-fluid rounded mb-4 mb-lg-0">
                </a>
            </div>

            <div class="col-lg-5">
                <h3 class="font-weight-light text-black"><a class="text-black" href="/board/detail/${item.boardNum}"
                                                            style="text-decoration: none">${item.boardTitle}</a></h3>
                <p>${item.boardWrite} 여행자님의 이야기</p>
            </div>
        </div>
    </div>
</c:forEach>

<!-- sidebar area-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">YourTrip</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <c:if test="${sessionScope.member != null}">
            <div>
                <p>로그인 계정 : ${sessionScope.member.memberId}</p>
                <p>로그인 닉네임 : ${sessionScope.member.memberNick}</p>
            </div>

            <form action="/logout">
                <button class="text-black btn-primary float-end"> 로그아웃</button>
            </form>
        </c:if>

        <c:if test="${sessionScope.member == null}">
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal"
                    data-bs-target="#LoginModal">
                로그인
            </button>
        </c:if>
        <br>

        <div class="dropdown mt-3">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                Dropdown button
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
        </div>
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
                            <div style="margin-left: 350px; margin-top: 10px">
                                <button class="btn btn-danger btn-sm ">로그인</button>
                                <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer-->
<footer class="py-5 bg-dark" style="position: fixed; bottom: 0; width: 100%">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/list_scripts.js"></script>
</body>
</html>
