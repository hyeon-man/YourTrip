<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <li><a href="board/list" class="icon solid fa-camera-retro text-white"><span
                            class="label"></span></a></li>
                    <!-- 세션에 정보가 있을 때 !-->
                    <c:if test="${sessionScope.member != null}">
                    <li><a class="icon solid fa-lock-open text-white nav-link btn-primary" data-bs-toggle="modal"
                           data-bs-target="#LoginModal"></a></li>
                    </c:if>
                    <!-- 세션에 정보가 있을 때 !-->

                    <!-- 세션에 정보가 없을 때 !-->
                    <c:if test="${sessionScope.member == null}">
                        <li><a class="icon solid fa-lock text-white nav-link btn-primary" data-bs-toggle="modal"
                               data-bs-target="#LoginModal"></a></li>
                        <li><a class="icon solid fa-user-plus" data-bs-toggle="modal"
                               data-bs-target="#SignupModal"></a></li>
                    </c:if>
                    <!-- 세션에 정보가 없을 때 !-->


                </ul>
            </nav>
        </header>
        <!-- Header -->


        <!-- footer 임 -->
        <footer id="footer">
            <span class="copyright">&copy; Kr.ac.kopo <a class="text-white" target="_blank"
                                                         href="https://www.kopo.ac.kr/daejeon/content.do?menu=5544">kopo</a></span>
        </footer>
        <!-- footer 임  -->
    </div>
</div>
<!-- 로그인 모달창임 -->
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
                                    <button class="btn btn-danger btn-sm ">로그인</button>
                                    <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기</button>
                                </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<!-- 회원가입 모달창임 -->
<div class="modal fade" id="SignupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content text-black">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="SignupModallaber">회원 가입</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/signup">
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
                                <label>이름:</label>
                                <input type="text" name="memberName" class="form-control">
                            </div>
                            <div>
                                <label>닉네임:</label>
                                <input type="text" name="memberNick" class="form-control">
                            </div>
                            <div>
                                <label>핸드폰 번호:</label>
                                <input type="text" name="memberPhone" class="form-control">
                            </div>
                            <div>
                                <label>이메일:</label>
                                <input type="text" name="memberMail" class="form-control">
                            </div>
                            <div>
                            </div>
                            <div style="margin-left: 335px">
                                <button class="btn btn-danger btn-sm ">회원 가입</button>
                                <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

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