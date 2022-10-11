<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <title>게시물 상세 보기 / ${item.boardTitle}</title>
    <script>
        var param = '${msg}';
        function recommend(){

            alert(param)
        }
    </script>
</head>
<body>
<div class="container">
    <p>글 번호 : ${item.boardNum}</p>
    <p>글 제목 : ${item.boardTitle}</p>
    <p>글 작성자 : ${item.boardWrite}</p>
    <p>글 조회수 : ${item.boardHit}</p>
    <p>글 등록일시 : ${item.boardDate}</p>
    <textarea class="form-control" readonly>${item.boardContent} </textarea>
    <p> 글 추천수 : ${item.boardRecommend} </p>
</div>
<a href="recommend/${item.boardNum}">
    <button type="button" onclick="recommend()">개추</button>
</a>
<a href="../list">
    <button>이전페이지</button>
</a>
<a href="delete/${item.boardNum}"> 삭제 </a>
<a href="update/${item.boardNum}"> 변경 </a>

</body>
</html>
