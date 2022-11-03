<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>YourTrip 여행자들의 커뮤니티</title>
    <link href="/resources/css/list_styles.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/detail_styles.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="/resources/summernote/summernote.min.css" rel="stylesheet">
    <script src="/resources/summernote/summernote.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#ssibal :first-child').addClass('active');
        });
    </script>
    <script>
        $(function () {
            $('#summernote').summernote({
                lang: 'ko-KR' // default: 'en-US'
            });

            $("#attachs").on("click", ".delete", function () {
                const div = $(this).closest(".input-group");
                div.remove();
            });

            $("#add").click(function () {
                const div = $("<div>");
                div.addClass("input-group");
                div.addClass("mb-3");

                const input = $("<input>");

                input.attr("type", "file");
                input.attr("name", "attach");
                input.addClass("form-control");
                input.addClass("form-control-sm");

                const button = $("<button>");
                button.attr("type", "button");
                button.addClass("btn");
                button.addClass("btn-sm");
                button.addClass("btn-danger");
                button.addClass("delete");
                button.text("삭제");

                div.append(input);
                div.append(button);

                $("#attachs").append(div);
            });
        });

    </script>
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
        <div class="col-lg-7">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner" id="ssibal">
                    <c:forEach items="${hotTopicPicture}" var="hotPicture">
                        <div class="carousel-item">
                            <img src="/images/${hotPicture.attachFileName}"
                                 class="d-block w-100 img-fluid rounded mb-4 mb-lg-0" style="max-height: 500px">
                        </div>
                    </c:forEach>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <h1 class="font-weight-light">Today Rank #1</h1>
            <c:forEach items="${hash}" var="hash">
                <div class="small mb-1 d-inline">
                    <a style="text-decoration: none" href="search/${hash.hashName}">
                        #${hash.hashName}
                    </a>
                </div>
            </c:forEach>
            <h5> ${hotTopic.boardTitle} <!-- 핫토픽 내용 불러오기--> </h5>
            <a class="btn btn-secondary" href="detail/${hotTopic.boardNum}">See more</a>
        </div>
    </div>


    <!-- Call to Action-->
    <div class="card text-white bg-dark my-5 py-4 text-center ">
        <div class="card-body "><h3 class="m-0 text-white">여행자님의 이야기도 공유 해보세요, ${total}건의 이야기가 공유 되고 있어요!</h3></div>
    </div>
    <!-- Content Row-->
    <div class="row gx-4 gx-lg-5 text-center">
        <c:forEach items="${list}" var="list">
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <a href="/board/detail/${list.boardNum}"><img src="/resources/img/${list.boardImage}" width="373"
                                                                  height="280"></a>
                    <div class="card-footer text-center">
                        <div class="card-body">
                            <h4 class="card-text"><b>${list.boardTitle}</b></h4>
                        </div>
                        <div class="card-text">
                            <p class="float-left">${list.boardWrite}여행자님의 이야기 <br>(${list.boardDate})</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
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
        <c:if test="${sessionScope.member != null}">
            <div>
                <p>로그인 이름 : ${sessionScope.member.memberName}</p>
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


<!--검색모달 -->

<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">검색하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="get" action="/board/search">
                    <div class="mb-3">
                        <input class="form-control" id="message-text" name="keyword" placeholder="검색어를 입력하세요"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="WriteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">이야기 공유</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <form action="/board/add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="form-label">제목</label> <input type="text" name="boardTitle"
                                                                        class="form-control form-control-sm">
                        </div>
                        <%--                        <div class="form-group">--%>
                        <%--                            <label class="form-label">해시태그</label> <input type="text"--%>
                        <%--                                                                          name="hashName" class="form-control form-control-sm">--%>
                        <%--                        </div>--%>
                        <div class="form-group">
                            <label class="form-label">내용 작성:</label>
                            <textarea id="summernote" name="boardContent"></textarea>
                        </div>
                        <div class="form-group">
                            <label>첨부파일:
                                <button type="button" id="add" class="btn btn-sm btn-primary">추가</button>
                            </label>
                            <div id="attachs">
                            </div>
                            <div class="input-group mb-3">
                                <input type="file" name="attach" class="form-control form-control-sm">
                                <button type="button" class="btn btn-sm btn-danger">삭제</button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary">게시글 등록</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link fs-1 text-black" href="#" ><i class="bi bi-arrow-left"></i></a>
        </li>
        <li class="page-item" style="margin-left: 10px; margin-bottom: 20px">
            <a class="page-link fs-1 text-black" href="#"><i class="bi bi-arrow-right"></i></a>
        </li>
    </ul>
</nav>
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
