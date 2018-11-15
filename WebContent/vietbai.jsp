<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <script src="ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        .ck.ck-editor {
            max-width: 700px;
            margin: 0 auto;
        }
        .ck-editor__editable {
        min-height: 250px;
        }
        </style>
</head>

<body>
    <header class="header-search">

        <div class="header-limiter">

            <h1><a href="#">BachKhoa<span>Forum</span></a></h1>

            <nav>
                <a href="index.html">Home</a>
            </nav>
            <ul>
                <li class="userProfile">
                    <a id="btnProfile" href="#">
                        <span class="avatar"><img src="img/t3.jpg" alt=""></span>
                        <strong class="accountUsername">congnhat234</strong>
                    </a>
                </li>
                <li><a id="btnSignin" href="#">Logout</a></li>
            </ul>

            <form id="search" method="get" action="#">
                <input type="search" placeholder="Search!" name="search">
                <i id="searchIcon" class="fas fa-search fa"></i>
            </form>
        </div>
    </header>
    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Viết bài</a></li>
                </ul>
        </nav>
        <div class="content">
        <form class="vietbai" action="#" method="#">
                       
                <div class="tieude">
                    <label>Tiêu đề bài viết:</label>
                    <input class="text1" type="text" required>
                </div>
                <div class="tieude">
                    <label>Tên người viết:</label>
                    <input class="text2" type="text" required>
                </div>
                <div class="tieude">
                    <label>Chủ đề:</label>
                    <select class="month select1">
                        <option value="1">Công Nghệ
                        </option>
                        <option value="2">Đời Sống
                        </option>
                    </select>
                </div>
                <div class="tieude">
                    <label>Nội dung bài viết:</label>
                </div>
                <div class="text-area">
                    <textarea name="content" id="editor">
            </textarea>
                    <script>
                        ClassicEditor
                    .create( document.querySelector( '#editor' ) )
                    .catch( error => {
                        console.error( error );
                    } );
            </script>
                </div>
                <dl>
                    <dt></dt>
                    <dd>
                        <input class="button" type="submit" value="Gửi bài">
                    </dd>
                </dl>
                <div class="checkbox1">
                    <input type="checkbox" name="check1" value="TheoDoi">
                    <label>Theo dõi chủ đề này.</label> <br><br>
                    <input type="checkbox" name="check2" value="NhanThongBao">
                    <label>Nhận thông báo qua email.</label><br><br>
                </div>
            
        </form>
    </div>

    </div>

    <button onclick="topFunction()" id="btnBackToTop" title="Go to top"><i class="fas fa-arrow-up"></i></button>

    <footer class="footer-distributed">

        <div class="footer-right">

            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>

        </div>

        <div class="footer-left">

            <p class="footer-links">
                <a href="#">Home</a>
                ·
                <a href="#">About</a>
                ·
                <a href="#">Contact</a>
            </p>

            <p>BackKhoa Forum &copy; 2018</p>
        </div>

    </footer>

    <div id="profile" class="profile_wrap">
        <div class="profile">
            <div class="profile_header">
                <div class="image">
                    <img src="img/t3.jpg">
                </div>
                <div class="infor">
                    <p class="username">congnhat</p>
                    <p class="level">Thành viên mới</p>
                </div>
            </div>
            <div class="profile_content">
                <div class="element">
                    <ul>
                        <li><a href="#">Thông tin cá nhân</a></li>
                        <li><a href="#">Tùy chọn</a></li>
                        <li><a href="#">Mật khẩu</a></li>
                    </ul>
                </div>
                <div class="element">
                    <ul>
                        <li><a href="#">Tin nhắn</a></li>
                        <li><a href="#">Thông báo</a></li>
                        <li><a href="#">Nội dung của bạn</a></li>
                        <li><a href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="js/basic.js"></script>
</body>

</html>