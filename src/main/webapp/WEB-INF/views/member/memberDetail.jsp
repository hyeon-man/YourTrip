<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>YourTrip My page</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/memberDetail.css">


</head>
<body>
<div class="wrap">
    <div class="greenContainer">
        <div>
            <div class="name">${item.memberNick} 여행자님</div>
        </div>
        <div class="modify">i</div>
    </div>
    <div class="summaryContainer">
        <div class="item">
            <div class="number" style="padding-left: 32px" ><!-- 게시글 갯수 count --> 1</div>
            <div>게시글 내역</div>
        </div>
        <div class="item">
            <div class="number" style="padding-left: 25px" ><!-- 댓글 갯수 count -->1</div>
            <div>댓글 내역</div>
        </div>
        <div class="item">
            <div class="number" style="padding-left: 20px"><!-- 추천 갯수 count -->1</div>
            <div>추천 내역</div>
        </div>
    </div>
<div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">설정</div>
    </a>
</div>

</div>


</body>
</html>
