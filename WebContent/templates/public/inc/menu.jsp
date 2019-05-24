<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="menu">
	<li<%if(request.getAttribute("title").equals("account")){ %> class="dropdown selected" <%} else {%> class="dropdown"<%} %> ><a href="#" id="dropbutton1" class="dropbtn">Tài
			Khoản</a>
		<div class="dropdown_content">
			<a href="<%=request.getContextPath()%><%=Constants.URL.NOTIFICATION_PAGE%>">Thông báo của bạn</a> 
			<a href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_USER%>">Bài
				viết của bạn</a> 
			<a href="#">Chủ đề theo dõi</a> 
			<a href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài
				viết theo dõi</a>
		</div></li>
	<li <%if(request.getAttribute("title").equals("message")){ %> class="dropdown selected" <%} else {%> class="dropdown"<%} %>><a href="#" id="dropbutton2" class="dropbtn">Tin
			nhắn</a>
		<div class="dropdown_content">
			<a href="<%=request.getContextPath()%><%=Constants.URL.MESSAGE%>">Xem tin nhắn</a>
			<a href="<%=request.getContextPath()%><%=Constants.URL.SENDMESSAGE%>">Tạo tin nhắn mới</a>
		</div></li>
	<li <%if(request.getAttribute("title").equals("setting")){ %> class="dropdown selected" <%} else {%> class="dropdown"<%} %>><a href="#" id="dropbutton3" class="dropbtn">Cài đặt</a>
		<div class="dropdown_content">
			<a href="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">Thông tin cá nhân</a> 
			<a href="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>">Mật khẩu</a> 
			<a href="<%=request.getContextPath()%><%=Constants.URL.LOGOUT%>">Đăng xuất</a>
		</div></li>
</ul>