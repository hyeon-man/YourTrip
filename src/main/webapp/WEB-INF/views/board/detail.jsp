<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>YourTrip</title>
    <link rel="stylesheet" href="/resources/css/detail_styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="/" style="font-size: x-large">YourTrip</a>
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

<!-- Product section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"
                                       src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."/></div>
            <div class="col-md-6">
                <div class="small mb-1">#뉴욕 #미국 #유학</div>
                <h1 class="display-5 fw-bolder">${item.boardTitle}</h1>
                <div class="fs-5 mb-5">
                    <span>작성자 : ${item.boardWrite}</span>
                    <br>
                    <span> 작성일 : ${item.boardDate}</span>
                </div>
                <p class="lead">
                    ${item.boardContent}
                </p>
                <div class="d-flex">
                    <button class="btn btn-outline-danger flex-shrink-0" type="button">
                        <i class="bi bi-heart"></i>
                    </button>

                    <button class="btn btn-outline-primary flex-shrink-0 " type="button" style="margin-left: 5px">
                        <i class="bi bi-share"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->

<!-- Comments section-->
<section class="mb-5 container" style="width:1272px; height: 432px">
    <div class="card bg-light">
        <div class="card-body">
            <!-- Comment form-->
            <form class="mb-4">
                <textarea class="form-control" rows="3" placeholder="궁금한점이 있다면 다른 여행자에게 질문을 남겨보세요!"></textarea>
                <button class="float-end btn btn-primary" style="margin-top: 5px" onclick="Sucess()">등록</button>
            </form>
            <br>
            <!-- Comment with nested comments-->
            <div class="d-flex mb-4">
                <!-- Parent comment-->
                <div class="ms-3">
                    <div class="fw-bold">{작성자}</div>
                    {작성자의 댓글 내용}
                    <!-- Child comment 1-->
                </div>
            </div>
            <!-- Single comment-->
            <div class="d-flex">
                <%--         프로필사진 구현하면 여기다 쓰자       <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>--%>
                    <div class="ms-3">
                        <div class="fw-bold">{작성자}</div>
                        {작성자의 댓글 내용}
                    </div>
            </div>
        </div>
    </div>
</section>
</div>

<br>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/detail_scripts.js"></script>

<script>
    function Sucess(){
        alert("댓글 등록 완료!")
    }
</script>
</body>

</html>