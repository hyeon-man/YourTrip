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


<!-- SideBar Trigger-->
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


    <!-- HotTopic -->
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
            <h5> ${hotTopic.boardTitle}</h5>
            <a class="btn btn-secondary" href="detail/${hotTopic.boardNum}">See more</a>
        </div>
    </div>


    <!-- 중앙 칸막이 -->
    <div class="card text-white bg-dark my-5 py-4 text-center ">
        <div class="card-body "><h3 class="m-0 text-white">여행자님의 이야기도 공유 해보세요, ${total}건의 이야기가 공유 되고 있어요!</h3></div>
    </div>
    <form action="/board/search" class="justify-content-center d-flex">
        <div class="justify-content-center d-flex" style="width: 300px; height: 50px">
            <input name="keyword" placeholder="검색어를 입력하세요" type="text" class="form-control"
                   aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
        </div>
    </form>

    <!-- List(Card) Row-->
    <div class="row gx-4 gx-lg-5 text-center" style="margin-top: 40px">
        <c:forEach items="${list}" var="list">
            <div class="col-md-4 mb-5">
                <div class="card h-auto">
                    <a href="/board/detail/${list.boardNum}"><img src="/images/${list.boardImage}" width="374px"
                                                                  height="350px"></a>
                    <div class="card-body">
                        <h4 class="card-text"><b>${list.boardTitle}</b></h4>
                    </div>
                    <div class="text-center">
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


<!-- SideBar Area-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title" id="offcanvasExampleLabel">YourTrip</h3>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <c:if test="${sessionScope.member != null}">
            <form action="/logout">
                <button class="btn btn-sm text-black btn-primary float-end"> 로그아웃</button>
            </form>
            <div>
                <p>${sessionScope.member.memberNick} (${sessionScope.member.memberId})여행자님</p>
            </div>
        </c:if>
        <c:if test="${sessionScope.member == null}">
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal"
                    data-bs-target="#LoginModal">
                로그인
            </button>
        </c:if>


    </div>
</div>

<!--Login Modal Area-->

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


</div>


<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script>
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

</script>
</body>
</html>
