<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp"%>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Bài viết theo dõi</a></li>
		</ul>
	</nav>
	<ul class="menu">
		<li class="dropdown"><a href="#" id="dropbutton1" class="dropbtn">Tài
				Khoản</a>
			<div class="dropdown_content">
				<a href="#">Thông báo của bạn</a> <a
					href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_USER%>">Bài
					viết của bạn</a> <a href="#">Chủ đề theo dõi</a> <a
					href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài
					viết theo dõi</a>
			</div></li>
		<li class="dropdown"><a href="#" id="dropbutton2" class="dropbtn">Tin
				nhắn</a>
			<div class="dropdown_content">
				<a href="#">Xem tin nhắn</a> <a href="#">Tạo tin nhắn mới</a>
			</div></li>
		<li class="dropdown"><a href="#" id="dropbutton3" class="dropbtn">Cài
				đặt</a>
			<div class="dropdown_content">
				<a href="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">Thông
					tin cá nhân</a> <a
					href="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>">Mật
					khẩu</a> <a
					href="<%=request.getContextPath()%><%=Constants.URL.LOGOUT%>">Đăng
					xuất</a>
			</div></li>
	</ul>
	<% ArrayList<Post> listpostfl =(ArrayList<Post>) request.getAttribute("listpostfl");%>
	<%
            if (listpostfl != null) {
            %>
	<%
            for (int i = 0; i < listpostfl.size(); i++) {
            %>
	<div class="topic">
		<div class="writer">
			<i class="fas fa-comments fa-sm" style="font-size: 40px;"></i> <a
				href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=listpostfl.get(i).getId_post()%>"
				style="color: #103667; font-weight: bold;"> <%=listpostfl.get(i).getTitle()%></a>
			<br>
			<div class="amount">
				<dl>
					<dt>
						<a id="author" href="javascript:void(0)"><%=listpostfl.get(i).getUsername()%><a>
					</dt>
					<dd><%=listpostfl.get(i).getDate_create()%></dd>
				</dl>
				<%}}%>
			</div>
		</div>
		<p class="news">
			Mới nhất:<a href="">Máy Mac mình giờ cứ mỗi lần </a><br> <a
				href="#topic"> akiii</a>,14:20, hôm nay
		</p>
	</div>
	<hr class="linetopic">
</div>

</div>


</div>

<%@include file="/templates/public/inc/footer.jsp"%>

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