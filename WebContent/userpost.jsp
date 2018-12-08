<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="model.bo.SubjectBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp"%>

<%
	ArrayList<Post> listpost = (ArrayList<Post>) request.getAttribute("listpost");
	User user = (User) session.getAttribute("user");
%>
<aside class="sidebar-right">
	<div class="latest-blog-posts">
		<h3>
			<i class="fa fa-rss"></i> Bài viết quan tâm
		</h3>
		<ul>
			<%
				if(listpost != null)
				for (int i = 0; i < listpost.size(); i++) {
			%>
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=listpost.get(i).getId_post()%>"><%=listpost.get(i).getTitle()%></a>
				<span><%=listpost.get(i).getDate_create()%></span></li>
			<%
				}
			%>
		</ul>

	</div>

</aside>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>

		</ul>
	</nav>

	<h1 style="font-family: Arial, Helvetica, sans-serif;">Bài viết của bạn</h1>
	<!-- <div class="social">
		<a href="#" class=""><i style="font-size: 40px;"class="fab fa-facebook-square "></i></a> 
		<a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
	</div> -->
	<ul class="menu">
			<li class="dropdown">
				<a href="#" id="dropbutton1" class="dropbtn">Tài Khoản</a>
				<div  class="dropdown_content"> 
					<a href="#">Thông báo của bạn</a>
					<a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_USER%>">Bài viết của bạn</a>
					<a href="#">Chủ đề theo dõi</a>
					<a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài viết theo dõi</a>
				</div>
			</li>
			<li class="dropdown">
				<a href="#" id="dropbutton2" class="dropbtn">Tin nhắn</a>
				<div  class="dropdown_content"> 
					<a href="#">Xem tin nhắn</a>
					<a href="#">Tạo tin nhắn mới</a>
				</div>
			</li>
			<li class="dropdown">
				<a href="#" id="dropbutton3" class="dropbtn">Cài đặt</a>
				<div  class="dropdown_content"> 
				<a href="#">Thông tin cá nhân</a>
				<a href="#">Mật khẩu</a>
				<a href="#">Đăng xuất</a>
				</div>
			</li>
		</ul>
	<%
		if (listpost != null) {
	%>
<!--<div class="labeltopic">
	 <a href=""><%=user.getUsername() %></a><br>
		<p>Khu vực thảo luận về thông tin và các sự kiện về công nghệ</p>
	</div>
-->
	<%
		for (int i = 0; i < listpost.size(); i++) {
	%>

	<div class="topic">
		<div class="writer"> 
			<i class="fas fa-comments fa-sm"
			style="font-size: 40px;"></i> <a
			href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=listpost.get(i).getId_post()%>"
			style="color: #103667; font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
			<br>
			<div class="amount">
				<dl>
					<dt>
						<a id="author" href="javascript:void(0)"><%=listpost.get(i).getUsername()%><a>
					</dt>
					<dd><%=listpost.get(i).getDate_create()%></dd>
				</dl>
			</div>
		</div>
		<p class="news">
			Mới nhất:<a href="">Máy Mac mình giờ cứ mỗi lần </a><br> <a
				href="#topic"> akiii</a>,14:20, hôm nay
		</p>
	</div>
	<hr class="linetopic">
	<%
		}
		}
	%>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
	</body>
</html>
