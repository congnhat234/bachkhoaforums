<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp" %>
        <div class="container">
                <div class="titleBar">
                    <h2>Thông báo mới nhất</h2>
                </div>

                <div class="contentProfile">
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
					<div class="alert" >
						<a href="" class="" ><img src="https://photo2.tinhte.vn/data/avatars/s/1777/1777251.jpg?1534771146" width="40" height="40" ></a>
						<div class="alertText">
						<h4>
								<a href="members/hoangphithanh.1777251/" class="username subject" dir="auto">hoangphithanh</a> đã trả lời vào chủ đề <a href="posts/52801174/" class="PopupItemLink">Tổng hợp thông tin về Snapdragon 855 trước ngày ra mắt</a>. Có thể còn có nhiều bài nữa.
						</h4>
						</div>
					</div>
                        </div>

            </div>

            
        </div>

        <%@include file="/templates/public/inc/footer.jsp" %>

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
        
        <script>
            $(document).ready(function() {

                $("#btnProfile").on("click", function () {
                    $("#profile").css("display", "block");
                });
                window.onclick = function(event) {
                    if (event.target == document.getElementById("profile")) {
                        $("#profile").css("display", "none");
                    }                      
                }

                $('.header-search form').on('click', function(e) {

                    // If the form (which is turned into the search button) was
                    // clicked directly, toggle the visibility of the search box.

                    if(e.target == this) {
                        $(this).find('input').toggle();
                    }

                });
            });
        </script>
    </body>
</html>