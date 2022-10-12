<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/test/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="/resources/test/css/noscript.css"/>
    </noscript>
</head>
<body>
<body class="is-preload">
<div id="wrapper">
    <div id="bg"></div>
    <div id="overlay"></div>
    <div id="main">

        <!-- Header -->
        <header id="header">
            <h1>Adam Jensen</h1>
            <p>Security Chief &nbsp;&bull;&nbsp; Cyborg &nbsp;&bull;&nbsp; Never asked for this</p>
            <nav>
                <ul>
                    <li><a href="https://www.instagram.com/hyeon_man/" target="_blank" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="https://www.facebook.com/profile.php?id=100007123350295" target="_blank" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon fa-paper-plane"><span class="label">Dribbble</span></a></li>
                    <li><a href="https://github.com/hyeon-man" target="_blank" class="icon brands fa-github"><span class="label">Github</span></a></li>
                    <li><a href="#" class="icon solid fa-user"><span class="label">Login</span></a></li>
                </ul>
            </nav>
        </header>

        <!-- Footer -->
        <footer id="footer">
            <span class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.</span>
        </footer>

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