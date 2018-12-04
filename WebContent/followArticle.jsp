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
                    <h2>Bài viết bạn đã theo dõi</h2>
                </div>
                <div class="parse">
                    <div class="parse-content">
                         <a href="#" class="page active">First</a>
                         <a href="#" class="page">2</a>
                         <a href="#" class="page">3</a>
                         <a href="#" class="page">4</a>
                         <a href="#" class="page">5</a>
                         <a href="#" class="page">6</a>
                         <a href="#" class="page">Last</a>
                        </div>
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
                            <form action="#" class="form-xembaimoi">
                                    <table>
                                        <tr>
                                            <th class="th1"></th>
                                            <th>Tiêu đề</th>
                                            <th>Trả lời</th>
                                            <th>Xem</th>
                                            <th>Bài viết cuối</th>
                                        </tr>
                                        <% ArrayList<Post> listpostfl =(ArrayList<Post>) request.getAttribute("listpostfl");
                                        for(int i=0; i<listpostfl.size();i++){
                                        %>
                                        <tr>
                                            <td><img src="<%=listpostfl.get(i).getPreview_image()%>" width="30px"height="30px"></td>
                                            <td class="td1"> <a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=listpostfl.get(i).getId_post()%>"><%=listpostfl.get(i).getTitle() %></a></td>
                                            <td>1000</td>
                                            <td><%=listpostfl.get(i).getView()%></td>
                                            <td><a href="#"><%=listpostfl.get(i).getUsername()%></a></td>
                                        </tr>
                                        <%}%>
                                    </table>
                                </form>

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