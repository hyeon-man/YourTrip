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
    <script type="text/javascript"
            src="/resources/js/bootstrap.bundle.min.js"></script>

    <link href="/resources/summernote/summernote.min.css" rel="stylesheet">
    <script src="/resources/summernote/summernote.min.js"></script>

    <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

    <script>
        $(function () {
            $('#summernote').summernote({
                lang: 'ko-KR'
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
<body>
<div class="container">
    <div>
        <h3>이야기 등록</h3>
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
                <textarea id="summernote" name="boardContent"></textarea>
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

            <div class="form-group mt-3 justify-content-end d-flex">
                <button class="btn btn-sm btn-primary" id="submitButton">등록</button>
                <a href="/">
                    <button type="button" class="btn btn-sm btn-danger">취소</button>
                </a>
            </div>
        </form>
    </div>
</div>
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