<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
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
                button.addClass("btn-outline-danger");
                button.addClass("delete");
                button.text("삭제");

                div.append(input);
                div.append(button);

                $("#attachs").append(div);
            });
        });

        function hashInsert(){
            alert('123');
        }
    </script>

</head>
<body>
<div class="container">
    <div>
        <h3>여행 후기 등록</h3>
    </div>

    <div>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label class="form-label">제목</label> <input type="text"
                                                            name="boardTitle" class="form-control form-control-sm">
            </div>

            <div class="form-group">
                <label class="form-label">해시태그</label>
                <input type="text" name="hashName" class="form-control form-control-sm" onkeyup="hashInsert()">
                <input type="text" style="display: none">
            </div>

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
                    <button type="button" class="btn-danger">삭제</button>
                </div>
            </div>

            <div class="form-group mt-3">
                <button class="btn btn-sm btn-primary">등록</button>
                <a href="../">
                    <button type="button"
                            class="btn btn-sm btn-secondary">취소
                    </button>
                </a>
            </div>
        </form>
    </div>
</div>
</body>
</html>