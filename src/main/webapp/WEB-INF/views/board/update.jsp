<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/add.css">
    <style>
        td {
            text-align: left !important;
        }
    </style>
</head>
<body>
<div id="wrap">
    <h2>게시글 수정</h2>
    <form method="post">
        <input type="hidden" value="board_write" name="command">
        <table>

            <tr>
                <th>제목 *</th>
                <td><input type="text" name="boardTitle" value="${item.boardTitle}"></td>
            </tr>

            <tr>
                <th>내용</th>
                <td>
          <textarea cols="100" rows="30" name="boardContent">${item.boardContent}

          </textarea>
                </td>
            </tr>

        </table>
        <input class="btn" type="submit" value="등록">
    </form>
    <button>
            <a href="/board/detail/${boardNum}" class="btn btn-secondary">취소</a>
        </button>


</div>
</body>
</html>