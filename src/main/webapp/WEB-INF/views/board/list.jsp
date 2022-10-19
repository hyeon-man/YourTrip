<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>YourTrip 여행자들의 커뮤니티</title>
    <link href="/resources/css/list_styles.css" rel="stylesheet">
</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="../" style="font-size: x-large">YourTrip</a>
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
<!-- Page Content-->
<div class="container px-4 px-lg-5">
    <!-- Heading Row-->
    <div class="row gx-4 gx-lg-5 align-items-center my-5">
        <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0"
                                   src="/resources/img/2.jpg" alt="..."/></div>
        <div class="col-lg-5">
            <h1 class="font-weight-light">Today Rank #1</h1>

            <p> #뉴욕 #유학 #해외</p>
            <p> ${hotTopic.boardContent} ... "
                "더보기 예정 ㅋㅋ. </p>
            <a class="btn btn-primary" href="">See more</a>
        </div>
    </div>
    <!-- Call to Action-->
    <div class="card text-white bg-info my-5 py-4 text-center ">
        <div class="card-body "><h3 class="m-0 text-black">여행자님의 이야기도 공유 해보세요, ${total}건의 이야기가 공유 되고 있어요!</h3></div>
    </div>
    <!-- Content Row-->
    <div class="row gx-4 gx-lg-5">
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">국내 여행 갤러리</h2>
                    <p class="card-text">국내 여행의 이야기를 모아놨어요 !</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">See more</a></div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title"> International Hot Topic </h2>
                    <p class="card-text">해외 여행의 이야기를 모아놨어요 !</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">See more</a></div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">QnA</h2>
                    <p class="card-text"> 여행 전 궁금점이 생겼다면 ?
                        다른 여행자분들에게 질문을 남겨보세요!</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">See more</a></div>
            </div>
        </div>
    </div>
</div>


<!-- sidebar area-->

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">YourTrip</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <form action="/logout">
            <button> 로그아웃 </button>
        </form>
        <div>
            Some text as placeholder. In real life you can have the elements you have chosen. Like, text, images, lists,
            etc.
        </div>
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
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/list_scripts.js"></script>
</body>
</html>
