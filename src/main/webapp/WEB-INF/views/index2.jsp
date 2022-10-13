<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>YourTrip</title>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/test/css/main.css"/>

</head>
<body>
<body class="is-preload text-white">
<div id="wrapper">
    <div id="bg"></div>
    <div id="overlay"></div>
    <div id="main">
        <!-- Header -->
        <header id="header">
            <h1>YourTrip</h1>
            <p>당신의 여행을 공유하고 감상하세요!</p>
            <nav>
                <ul>
                    <li><a href="https://www.instagram.com/hyeon_man/" target="_blank"
                           class="icon brands fa-instagram text-white"><span
                            class="label">Instagram</span></a></li>
                    <li><a href="https://www.facebook.com/profile.php?id=100007123350295" target="_blank"
                           class="icon brands fa-facebook-f text-white"><span class="label">Facebook</span></a></li>
                    <li><a href="https://github.com/hyeon-man" target="_blank" class="icon brands fa-github text-white"><span
                            class="label">Github</span></a></li>
                    <li><a href="board/list" class="icon fa-file-image text-white"><span
                            class="label">Dribbble</span></a></li>
                    <li><a class="icon solid fa-user text-white nav-link btn-primary" data-bs-toggle="modal"
                           data-bs-target="#exampleModal"></a></li>
                </ul>
            </nav>
        </header>
        <!-- Header -->


        <!-- CopyRight -->
        <footer id="footer">
            <span class="copyright">&copy; Kr.ac.kopo <a class="text-white" target="_blank"
                                                         href="https://www.kopo.ac.kr/daejeon/content.do?menu=5544">kopo</a></span>
        </footer>
        <!-- CopyRight -->
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <label>아이디:</label>
                                    <input type="text" name="memberId" class="form-control">
                                </div>

                                <div>
                                    <label>비밀번호:</label>
                                    <input type="password" name="memberPass" class="form-control">
                                </div>
                                <div>
                                </div>
                                <div style="margin-left: 355px">
                                    <button class="btn btn-secondary btn-sm ">로그인</button>
                                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">닫기
                                    </button>
                                </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</body>
<script>
    window.onload = function () {
        document.body.classList.remove('is-preload');
    }
    window.ontouchmove = function () {
        return false;
    }
    window.onorientationchange = function () {
        document.body.scrollTop = 0;
    }
</script>
</body>

</html>