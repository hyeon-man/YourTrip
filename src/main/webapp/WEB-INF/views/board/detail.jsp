<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>YourTrip</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $('#ssibal :first-child').addClass('active');
        });
    </script>

</head>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="../list" style="font-size: x-large">YourTrip</a>
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
                    ${sessionScope.member.memberName}여행자님</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner" id="ssibal">
                        <c:forEach items="${attach}" var="attach">
                            <div class="carousel-item">
                                <img src="/images/${attach.attachFileName}" class="d-block w-100">
                                    <%--<img class="card-img-top mb-5 mb-md-0"
                                     src="/images/${attach.attachFileName}"/>--%>
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

            <div class="col-md-6">
                <c:forEach items="${hash}" var="hash">
                    <div class="small mb-1 d-inline">
                        <a style="text-decoration: none" href="../search/${hash.hashName}">
                            #${hash.hashName}
                        </a>
                    </div>
                </c:forEach>
                <div>
                    <h1 class="fw-bolder">${item.boardTitle} </h1>
                </div>
                <div class="fs-5 mb-5">
                    <span>작성자 : ${item.boardWrite}</span>
                    <br>
                    <span> 작성 일시 : ${item.boardDate}</span>
                </div>
                <p class="lead">
                    ${item.boardContent}
                </p>
                <div class="d-flex float-end">

                    <c:if test="${item.recommendMemberCount == 1}">
                        <form action="/board/recommendCancel/${item.boardNum}" method="post" id="recommendArea">
                            <button class="btn btn-outline-danger flex-shrink-0 active" id="${item.boardNum}"
                                    type="button">
                                <i class="bi bi-heart"></i>
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${item.recommendMemberCount == 0}">
                        <form action="/board/recommend/${item.boardNum}" method="post" id="recommendArea">
                            <button class="btn btn-outline-danger flex-shrink-0 " id="${item.boardNum}" type="button">
                                <i class="bi bi-heart"></i>
                            </button>
                        </form>
                    </c:if>
                    <form>
                        <button class="btn btn-outline-primary flex-shrink-0 " type="button" style="margin-left: 5px">
                            <i class="bi bi-share"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->

<!-- Comments section-->
<section class="mb-5 container" style="width:1250px; height: auto">
    <div class="card bg-light">
        <div class="card-body">
            <form class="mb-4" action="/addReply/${item.boardNum}" method="post" id="replyArea">
                <textarea name="replyContent" class="form-control" rows="3" type="textarea"
                          placeholder="궁금한점이 있다면 여행자님에게 댓글을 남겨 소통해보세요!"></textarea>
                <button type="button" class="float-end btn btn-primary" style="margin-top: 5px">등록</button>
            </form>
            <br>

            <c:if test="${ReplyList.size() < 1}">
            <div class="d-flex" style="margin-top: 15px">
            </div>
            <div class="ms-3">
                <div class="fw-bold"> 아직 등록된 댓글이 없어요!</div>
                여행자님이 댓글을 남겨보세요!
            </div>
        </div>
        </c:if>

        <c:forEach var="reply" items="${ReplyList}">
            <div class="d-block" style="margin-top: 15px">
                <div class="ms-3">
                    <div class="fw-bold"> ${reply.replyWrite} (<fmt:formatDate value="${reply.replyDate}"
                                                                               pattern="yyyy-MM-dd hh:mm"></fmt:formatDate>)
                        <c:if test="${sessionScope.member.memberId == reply.replyWrite}">
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm float-end" data-bs-toggle="modal"
                                        data-bs-target="#replyUpdate">수정
                                </button>
                            </div>
                            <div class="float-end" style="margin-right: 10px">
                                <a class="btn btn-danger btn-sm" href="deleteReply/${reply.replyNum}"
                                   onclick="replyDelete()"> 삭제 </a>
                            </div>
                        </c:if>
                    </div>
                        ${reply.replyContent}
                </div>
            </div>
        </c:forEach>
    </div>
    </div>
</section>
</div>


<br>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>


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
            <form action="/logout" id="sessionCheck">
                <button class="text-black btn-primary float-end"> 로그아웃</button>
            </form>
        </c:if>

        <c:if test="${sessionScope.member == null}">
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#LoginModal">
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
                                <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<c:forEach var="reply" items="${ReplyList}">
    <div class="modal fade" id="replyUpdate" tabindex="-1" aria-labelledby="replyUpdate" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content text-black">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="replyUpdate">댓글 수정</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="../replyUpdate/${reply.replyNum}">
                    <div class="modal-body">
                        <div>
                            <div>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="replyContent"
                                           aria-label="Recipient's username with two button addons">
                                    <button class="btn btn-outline-secondary">변경</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</c:forEach>

<!-- Bootstrap core JS-->
<!-- Core theme JS-->
<script src="/resources/js/detail_scripts.js"></script>
<script>
    function loginAlert() {
        confirm('로그인이 필요한 기능입니다.')
    }

    $('#replyArea button').click(function () {
        if ($('#sessionCheck button').length) {
            console.log("세션있음");
            $('#replyArea button').removeAttr('type');
            return;
        } else {
            loginAlert();
            return;
        }
    });

    $('#recommendArea button').click(function () {
        if ($('#sessionCheck button').length) {
            $('#recommendArea button').removeAttr('type');
            console.log('추천 완')
            return;
        } else {
            loginAlert();
            return;
        }
    });
</script>

</body>

</html>