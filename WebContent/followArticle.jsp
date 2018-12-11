<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp" %>
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
							int [] anwserAmount= (int[]) request.getAttribute("listAmountAnswer");
							String [] lastUser= (String[]) request.getAttribute("listLastUser");
						for(int i=0; i<listpostfl.size();i++){
						%>
						<tr>
							<td><img src="<%=listpostfl.get(i).getPreview_image()%>" width="30px"height="30px"></td>
							<td class="td1"> <a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=listpostfl.get(i).getId_post()%>"><%=listpostfl.get(i).getTitle() %></a></td>
							<td><%=anwserAmount[i] %></td>
							<td><%=listpostfl.get(i).getView()%></td>
							<% if("".equals(lastUser[i])) {%><td><a href="#"><%=listpostfl.get(i).getUsername()%></a></td><%}else{%> <td><a href="#"><%=lastUser[i]%></a></td><%} %>
						</tr>
						<%}%>
					</table>
				</form>
			</div>
		</div>
	</div>
<%@include file="/templates/public/inc/footer.jsp"%>
</body>
</html>