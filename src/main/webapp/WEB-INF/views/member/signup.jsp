<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YourTrip SignUp</title>
    <link href="/resources/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="main-container2">
    <header class="logo">
        <div>
            <h1> signUp </h1>
        </div>
    </header>
    <form method="post">
        <contant class="login-container">
            <input name="memberId" type="id" class="id" placeholder="아이디"/>
            <input name="memberPass" type="password" class="password" placeholder="비밀번호"/>
            <input name="memberName" type="text" class="password" placeholder="이름"/>
            <input name="memberNick" type="text" class="id" placeholder="닉네임"/>
            <input name="memberPhone" type="text" class="id" placeholder="핸드폰 번호"/>
            <input name="memberMail" type="text" class="id" placeholder="이메일"/>
        </contant>
        <button class="loginBtn"> 회원 가입</button>
    </form>
    <footer>계정이 있으신가요? <a href="login"> click here </a></footer>

</div>
</body>
</html>