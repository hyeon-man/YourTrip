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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">


    <style>
        html, body {
            height: 100%
        }

        #wrapper {
            min-height: 100%;
            position: relative;
            padding-bottom: 60px;
        }

        footer {
            bottom: 0;
        }
    </style>
</head>
<body class="body">
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="/board/list" style="font-size: x-large">YourTrip</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item" style="font-size: 30px">
                    <a class="nav-link" style="text-decoration: none" data-bs-toggle="offcanvas"
                       href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                        <i class="bi bi-menu-button-wide"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="wrapper">

    <c:if test="${total > 0}">
        <div style="width: 1000px; margin-left: 475px" class="card text-white bg-dark my-5 py-4 text-center">
            <div class="card-body"><h3 class="m-0 text-white"> ${HashName} 에대한 검색 결과에요, ${total}건의 이야기가 있어요!</h3></div>
        </div>
    </c:if>

    <c:if test="${total == 0}">
        <div style="width: 1000px; margin-left: 475px" class="card text-white bg-dark my-5 py-4 text-center">
            <div class="card-body">
                <h3 class="m-0 text-white"><a href="/board/list" style="text-decoration: none"
                                              class="text-white"> ${HashName}에대한 게시글 검색 결과가 없어요 </a></h3>
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
                                                                style="text-decoration: none">${item.boardTitle}</a>
                    </h3>
                    <p>${item.boardWrite} 여행자님의 이야기</p>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- sidebar area-->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h3 class="offcanvas-title" id="offcanvasExampleLabel">YourTrip</h3>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <!-- 로그인 했을 때-->
            <c:if test="${sessionScope.member != null}">
                <p class="d-flex justify-content-end">${sessionScope.member.memberNick}여행자로 로그인중</p>
                <div class="d-flex justify-content-start">
                    <a class=" text-black" href="/board/add" role="button">
                        <i style="font-size: 50px;" class="bi bi-pencil-square text-black">
                        </i></a>
                    <i style="font-size: 50px; margin-left: 20px" class="bi bi-person-circle"></i>
                </div>

                <p style="margin-top: 20px">

                    <a class="btn btn-dark d-flex justify-content-center" data-bs-toggle="collapse"
                       href="#collapseExample"
                       role="button"
                       aria-expanded="false" aria-controls="collapseExample">
                        Contact us
                    </a>
                </p>
                <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                        H.p : 010-8314-3368
                        <br>
                        E-mail : kimhyunmin34@naver.com
                        <br>
                        Address : 대전광역시 동구 가양동 우암로 352-21
                    </div>
                </div>
                <div>
                    <form action="/logout">
                        <button class="btn btn-sm text-white btn-danger float-end"> 로그아웃</button>
                    </form>
                </div>
                <!-- 로그인 했을 때 사이드바 -->

            </c:if>
            <!-- 로그인 안 했을 때-->
            <c:if test="${sessionScope.member == null}">
                <div>
                    <button type="button" class="btn btn-sm text-white btn-primary float-end" data-bs-toggle="modal"
                            data-bs-target="#LoginModal">
                        로그인
                    </button>
                </div>
                <div class="d-flex justify-content-center">
                    <p style="margin-top: 20px; position: absolute; bottom: 500px">
                        <a class="btn btn-dark d-flex justify-content-center" data-bs-toggle="collapse"
                           href="#collapseExample"
                           role="button"
                           aria-expanded="false" aria-controls="collapseExample">
                            Contact us
                        </a>
                    </p>
                </div>
                <div class="collapse" id="collapseExample" style="position: absolute; bottom: 400px">
                    <div class="card card-body">
                        H.p : 010-8314-3368
                        <br>
                        E-mail : kimhyunmin34@naver.com
                        <br>
                        Address : 대전광역시 동구 가양동 우암로 352-21
                    </div>
                </div>
            </c:if>
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
                                <input type="text" name="memberId" class="form-control" placeholder="아이디">
                            </div>

                            <div style="margin-top: 15px">
                                <input type="password" autocomplete="on" name="memberPass" class="form-control"
                                       placeholder="비밀번호">
                            </div>
                            <div class="float-start" style="margin-top: 10px">
                                <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="modal"
                                        data-bs-target="#SignupModal">
                                    회원 가입
                                </button>
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
<div class="modal fade" id="SignupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content text-black">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">회원 가입</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/signup">
                <div class="modal-body">
                    <div>
                        <div>
                            <div class="input-group mb-3" id="idArea">
                                <input type="text" name="memberId" class="form-control" placeholder="아이디">
                                <button class="btn btn-outline-secondary" type="button" id="button-addon1">중복 확인
                                </button>
                            </div>

                            <div class="input-group mb-3" id="passArea">
                                <input type="password" autocomplete="on" name="memberPass" class="form-control"
                                       placeholder="비밀번호">
                            </div>

                            <div class="input-group mb-3" id="passCheck">
                                <input type="password" autocomplete="on" name="passCheck" class="form-control"
                                       placeholder="비밀번호 확인">
                            </div>

                            <div class="input-group mb-3" id="nickArea">
                                <input type="text" name="memberNick" class="form-control" placeholder="닉네임">
                                <button class="btn btn-outline-secondary" type="button" id="button-addon2">중복 확인
                                </button>
                            </div>


                            <div style="margin-left: 330px; margin-top: 10px" id="signupForm">
                                <button type="button" class="btn btn-danger btn-sm ">회원 가입</button>
                                <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
<script>

    $("#button-addon1").click(function () {
        const value = $("#idArea input[name=memberId]").val();

        $.ajax({
            type: 'POST',
            url: '/checkId/' + value,
            success: function (result) {
                if (result == "OK") {
                    if (confirm('사용 가능한 아이디입니다')) {
                        console.log("쓸래");
                        $("#idArea input[name=memberId]").attr('readonly', true)
                        $("#button-addon1").remove();
                    } else {
                        console.log("미사용");
                    }
                } else {
                    alert('이미 사용중인 아이디입니다')
                }
            }
        });
    });

    $("#button-addon2").click(function () {
        const value = $("#nickArea input[name=memberNick]").val();
        $.ajax({
            type: 'POST',
            url: '/checkNick/' + value,
            success: function (result) {
                console.log(result);
                if (result == "OK") {
                    if (confirm('사용 가능한 닉네임입니다.')) {
                        $("#nickArea input[name=memberNick]").attr('readonly', true)
                        $("#button-addon2").remove();
                    } else {
                        console.log("미사용");
                    }
                } else {
                    alert('이미 사용중인 닉네임입니다.')
                }
            }
        });
    });

    $('#signupForm .btn-danger').click(function () {
        if ($("#idArea input[name=memberId]").val() == "" ||
            $("#nickArea input[name=memberNick]").val() == "" ||
            $("#passArea input[name=memberPass]").val() == "") {
            alert('공백은 허용하지 않습니다.');

            return;
        }

        if ($("#passArea input[name=memberPass]").val() !=
            $("#passCheck input[name=passCheck]").val()) {

            alert('비밀번호가 일치하지 않습니다.')
            return;
        }

        if ($("#idArea input[name=memberId]").attr('readonly') &&
            $("#nickArea input[name=memberNick]").attr('readonly') != null) {

            $('#signupForm button.btn-danger').attr('type', 'submit');
        } else {
            alert("중복 체크를 해주세요.")

            return;
        }
    })
</script>
</body>
</html>
