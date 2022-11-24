<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이야기 공유</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
    <link href="/resources/summernote/summernote.min.css" rel="stylesheet">
    <script src="/resources/summernote/summernote.min.js"></script>
    <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/list_styles.css">

    <script>
        $(function () {
            $('#summernote').summernote({
                lang: 'ko-KR',
                height: 600
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

                const button = $("<button>");
                button.attr("type", "button");
                button.addClass("btn");
                button.addClass("btn-outline-danger");
                button.addClass("delete");
                button.text("삭제");

                div.append(input);
                div.append(button);

                $("#attachs").append(div);
            });
        });
    </script>

</head>
<body class="body">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="../" style="font-size: x-large">YourTrip</a>
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
<div class="container" style="margin-top: 30px">

    <div>
        <h3>게시글 등록</h3>
    </div>

    <div>
        <form id="form" method="post" enctype="multipart/form-data" onsubmit="return false">
            <div class="form-group">
                <label class="form-label">제목</label>
                <input type="text" name="boardTitle" class="form-control form-control-sm" id="boardTitle">
            </div>

            <div class="form-group" style="margin-bottom: 20px">
                <input placeholder="해시태그를 추가해보세요!" type="text"
                       class="form-control form-control-sm d-inline-block" id="hashList"
                       style="height: 31px; width: 200px; margin-top: 20px;">
                <button type="button" class="btn btn-sm btn-primary" id="hashAddButton">추가</button>
            </div>

            <div id="hashs">


            </div>

            <div class="form-group">
                <%--<label class="form-label">내용</label>--%>
                <textarea id="summernote" name="boardContent" style="height: 600px"></textarea>
            </div>

            <div class="form-group">
                <label>사진 등록
                </label>
                <div id="attachs">

                </div>
                <div class="input-group mb-3">
                    <input type="file" name="attach" class="form-control" id="attach">
                    <button id="add" type="button" class="btn btn-primary">추가</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </div>
            </div>

            <div class="form-group mt-3 justify-content-end d-flex" style="margin-bottom: 20px">
                <button class="btn btn-sm btn-primary" id="submitButton">등록</button>
                <a href="/">
                    <button type="button" class="btn btn-sm btn-danger">취소</button>
                </a>
            </div>
        </form>
    </div>
</div>

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
                <p style="margin-top: 20px; position: absolute; bottom: 500px" >
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

<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white" style="margin-top: 30px">Copyright &copy;
        Kr.ac.kopo</p></div>
</footer>

<script>
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