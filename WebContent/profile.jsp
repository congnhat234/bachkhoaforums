<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <script src="js/jquery-3.3.1.min.js"></script>
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
                        <li><a href="#">Trang cá nhân</a></li>
                </ul>
        </nav>
        <div class="titleBar">
            <h2>Thông tin cá nhân</h2>
        </div>
        <div class="content">
            <div class="navigationSlideBar">
                <h4>Tài khoản</h4>
                <ul class="list-group">
                    <li class="list-group-item">
                        <ul>
                            <li><a href="#">Thông báo của bạn</a></li>
                            <li><a href="#">Chủ đề theo dõi</a></li>
                            <li><a href="#">Bài viết theo dõi</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h4>Tin nhắn</h4>
                        <ul>
                            <li><a href="#">Xem tin nhắn</a></li>
                            <li><a href="#">Tạo tin nhắn mới</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h4>Cài đặt</h4>
                        <ul>
                            <li><a href="#">Thông tin cá nhân</a></li>
                            <li><a href="#">Mật khẩu</a></li>
                            <li><a href="#">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="mainContent">
                <form>
                    <fieldset>
                        <dl class="ctrlUnit avatarEditor">
                            <dt><label>Hình đại diện:</label></dt>
                            <dd>
                                <a href="#" class="avatar">
                                    <img style="width:100px;height:100px;" src="img/t3.jpg">
                                </a> <br>
                                <input type="file" name="avatar" value="" id="" class="textCtrl OptOut">
                            </dd>
                        </dl>
                    </fieldset>
                    <fieldset>
                        <dl class="ctrlUnit">
                            <dt><label>Giới tính:</label></dt>
                            <dd>
                                <ul style="list-style: none;">
                                    <li><label for="ctrl_gender_male"><input type="radio" name="gender" value="male" id="ctrl_gender_male">
                                            Nam</label></li>
                                    <li><label for="ctrl_gender_female"><input type="radio" name="gender" value="female"
                                                id="ctrl_gender_female"> Nữ</label></li>
                                    <li><label for="ctrl_gender_"><input type="radio" name="gender" value="" id="ctrl_gender_"
                                                checked="checked"> (Không xác định)</label></li>
                                </ul>
                            </dd>
                        </dl>

                        <dl class="ctrlUnit OptOut">
                            <dt>Ngày sinh:</dt>
                            <dd><input type="text" name="location" value="23/04/97" id="ctrl_birthday" class="textCtrl OptOut"></dd>
                        </dl>
                    </fieldset>
                    <fieldset>
                        <dl class="ctrlUnit">
                            <dt><label for="ctrl_location">Địa Chỉ:</label></dt>
                            <dd><input type="text" name="location" value="" id="ctrl_location" class="textCtrl OptOut"></dd>
                        </dl>

                        <dl class="ctrlUnit">
                            <dt><label for="ctrl_occupation">Nghề nghiệp:</label></dt>
                            <dd><input type="text" name="occupation" value="" id="ctrl_occupation" class="textCtrl OptOut"></dd>
                        </dl>

                        <dl class="ctrlUnit customFieldEditcitizenPhoneNumber ">
                            <dt>
                                <label for="ctrl_custom_field_citizenPhoneNumber">Số điện thoại:</label>
                            </dt>
                            <dd>
                                <input type="text" name="custom_fields[citizenPhoneNumber]" value="" id="ctrl_custom_field_citizenPhoneNumber"
                                    data-validatorname="custom_field_citizenPhoneNumber" class="textCtrl" maxlength="">
                                <input type="hidden" name="custom_fields_shown[]" value="citizenPhoneNumber">
                            </dd>
                        </dl>
                    </fieldset>
                    <dl class="ctrlUnit submitUnit">
                        <dt class=""></dt>
                        <dd><input type="submit" name="save" value="Lưu thay đổi" accesskey="s" class="button"></dd>
                    </dl>
                </form>
            </div>
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