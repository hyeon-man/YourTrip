<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myPage</title>
    <link href="/resources/css/list_styles.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/detail_styles.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="/resources/summernote/summernote.min.css" rel="stylesheet">
    <script src="/resources/summernote/summernote.min.js"></script>

    <style>
        html, body {
            height: 100%
        }

        #wrapper {
            min-height: 100%;
            position: relative;
            padding-bottom: 60px;
        }

        footer {
            bottom: 0;
        }
    </style>
</head>
<body class="body">
<!-- SideBar Trigger-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="../" style="font-size: x-large">YourTrip</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item" style="font-size: 30px">
                    <a class="nav-link" style="text-decoration: none" data-bs-toggle="offcanvas"
                       href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                        <i class="bi bi-menu-button-wide"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- -->
<div id="wrapper">


</div>
<!-- -->

<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Kr.ac.kopo</p></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
