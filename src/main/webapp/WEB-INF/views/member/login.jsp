<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>YourTrip login</title>
    <link href="/resources/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="main-container">
    <header class="logo">
        <div>
            <h1> Yourtrip </h1>
        </div>
    </header>
    <form method="post">
    <contant class="login-container">
        <input name = "memberId" type="id" class="id" placeholder="전화번호,사용자 이름 또는 이메일"/>
        <input name = "memberPass" type="password" class="password" placeholder="비밀번호"/>
    </contant>
    <button class="loginBtn"> 로그인</button>
    </form>
    <footer>계정이 기억나지 않는다면? <a href="passfind"> click here </a></footer>
    <footer>계정이 없다면? <a href="signup"> click here </a></footer>

</div>
</body>
</html>