<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>YourTrip</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/list_styles.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $('#ssibal :first-child').addClass('active');
        });

        $(function () {
            $('#summernote').summernote({
                lang: 'ko-KR', // default: 'en-US'
                height: 600

            })
        });
    </script>

</head>
<body class="body">
<!-- Navigation-->
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


<!-- SideBar Area-->
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
                <a class=" text-black"  href="/board/add" role="button">
                    <i style="font-size: 50px;" class="bi bi-pencil-square text-black">
                    </i></a>
                <i style="font-size: 50px; margin-left: 20px" class="bi bi-person-circle"></i>
            </div>

            <p style="margin-top: 20px">

                <a class="btn btn-dark d-flex justify-content-center" data-bs-toggle="collapse" href="#collapseExample"
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

<!--Signup Modal Area-->
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
<!-- Core theme JS-->
<script src="/resources/js/detail_scripts.js"></script>
<script>
    function loginAlert() {
        confirm('로그인이 필요한 기능입니다.')
    }

    $('#replyArea button').click(function () {
        if ($('#sessionCheck button').length) {
            $('#replyArea button').removeAttr('type');

        } else {
            if (confirm('로그인이 필요한 기능입니다.')) {
                $('.offcanvas-body button').trigger('click');
            }
        }
    });

    $('#recommendArea button.active').click(function () {
        if (confirm('추천을 취소 할까요 ? ') == true) {
            if ($('#sessionCheck button').length) {
                $('#recommendArea button').removeAttr('type');
                return;
            } else {
                loginAlert();
            }
        }
    });

    $('#recommendArea button').click(function () {
        if ($('#sessionCheck button').length) {
            $('#recommendArea button').removeAttr('type');
        } else {
            if (confirm('로그인이 필요한 기능입니다.')) {
                $('.offcanvas-body button').trigger('click');
            }
        }
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
    $("#button-addon1").click(function () {
        const value = $("#idArea input[name=memberId]").val();

        $.ajax({
            type: 'POST',
            url: '/checkId/' + value,
            success: function (result) {
                console.log(result);
                if (result == "OK") {
                    if (confirm('사용 가능한 아이디입니다')) {
                        console.log("쓸래");
                        $("#idArea input[name=memberId]").attr('readonly', true)
                        $("#button-addon1").remove();
                    } else {
                        console.log("안 쓸래");
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
                        console.log("쓸래");
                        $("#nickArea input[name=memberNick]").attr('readonly', true)
                        $("#button-addon2").remove();
                    } else {
                        console.log("안 쓸래");
                    }
                } else {
                    alert('이미 사용중인 닉네임입니다.')
                }
            }
        });
    });

    $("#button-addon1").click(function () {
        const value = $("#idArea input[name=memberId]").val();

        $.ajax({
            type: 'POST',
            url: '/checkId/' + value,
            success: function (result) {
                console.log(result);
                if (result == "OK") {
                    if (confirm('사용 가능한 아이디입니다')) {
                        console.log("쓸래");
                        $("#idArea input[name=memberId]").attr('readonly', true)
                        $("#button-addon1").remove();
                    } else {
                        console.log("안 쓸래");
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
                        console.log("쓸래");
                        $("#nickArea input[name=memberNick]").attr('readonly', true)
                        $("#button-addon2").remove();
                    } else {
                        console.log("안 쓸래");
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
    // 해시 추가하는 js
    $("#hashAddButton").on('click', function () {
        const div = $("<div>");
        div.addClass("d-inline-block");
        div.attr('style', 'margin-bottom: 10px;')

        const input = $("<input>");
        input.attr('readonly', true)
        input.attr('name', 'hashName')
        input.addClass("btn");
        input.addClass("btn-light");
        input.addClass("text-black");
        input.val($('#hashList').val());

        const deleteButton = $("<button>");
        deleteButton.addClass("btn-sm btn");
        deleteButton.text("x");
        deleteButton.attr('hash-Id', input.val());
        deleteButton.attr('id', 'deleteButton')
        div.attr('hash-Id', input.val())

        div.append(input);
        div.append(deleteButton);
        if ($("#hashList").val() == "") {
            alert('공백은 허용하지 않습니다.')
            return;
        } else if ($("#hashList").val().length < 2) {
            alert('두 글자 이상 입력해주세요.')
            return;
        }
        console.log("눌림")
        $("#hashs").append(div);
        $("#hashList").val("")
    });

    //클릭서브밋
    $("#submitButton").on('click', function () {
        const title = $('#boardTitle').val();
        const content = $('#summernote').val();
        const attach = $('#attach').val();
        console.log(title);
        console.log(content);
        console.log(attach);

        if (title == "") {
            alert("제목을 입력 해주세요")
        } else if (content == "") {
            alert("내용을 입력 해주세요")
        } else if (attach == "") {
            alert("사진을 한 장 이상 등록 해주세요")
        }

        if (title != "" && content != "" && attach != "") {
            $('form').removeAttr("onsubmit");
        }
    });


    $('#hashs').on("click", "#deleteButton", function (e) {
        const button = $(e.target).parent();
        button.remove()
    });

</script>

</body>

</html>