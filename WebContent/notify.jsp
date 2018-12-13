<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Notification"%>
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
			<li><a href="#">Trang cá nhân</a></li>
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
		<div class="titleBar">
		<h2>Thông báo mới nhất</h2>
	</div>
	<div class="mainContent">
		<%if(request.getAttribute("listnotify")!=null) {%>
			<%ArrayList<Notification> listNotify = (ArrayList<Notification>) request.getAttribute("listnotify");
			for(Notification obj :listNotify) {
			%>
		<div class="alert">
			<a href="" class=""><img
				src="https://photo2.tinhte.vn/data/avatars/s/1777/1777251.jpg?1534771146"
				width="40" height="40"></a>
			<div class="alertText">
				<h4>
					<a href="" class="username subject"
						dir="auto"><%=obj.getUsername() %></a> đã trả lời vào chủ đề <a
						href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=obj.getIdPost() %>" class="PopupItemLink"><%=obj.getTitlePost() %></a>. Có thể còn có nhiều bài
					nữa.
				</h4>
			</div>
		</div>
		<%}} %>
	</div>
</div>

<%@include file="/templates/public/inc/footer.jsp"%>
</body>
</html>