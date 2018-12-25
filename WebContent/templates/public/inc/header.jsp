<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Comment"%>
<%@page import="utils.Constants"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>
<title>BachKhoa <% if (request.getAttribute("title")!=null)%><%=request.getAttribute("title") %></title>

<head>
	<meta charset="utf-8">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/templates/public/css/index.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/templates/admin/css/admin.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/templates/public/css/profile.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/templates/public/css/notification.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/templates/public/fontawesome/css/all.css">
	<link href='http://fonts.googleapis.com/css?family=Cookie'
		rel='stylesheet' type='text/css'>
	<script
		src="<%=request.getContextPath()%>/templates/public/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/templates/public/js/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/templates/public/ckeditor/ckeditor.js"></script>
	<script
		src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
	<script	src="<%=request.getContextPath() %>/templates/public/js/jquery.validate.js"></script>
	<script	src="<%=request.getContextPath() %>/templates/public/js/clipboard.min.js"></script>

	
</head>

<body>
	<header class="header-search">

		<div class="header-limiter">

			<h1>
				<a href="<%=request.getContextPath()%><%=Constants.URL.HOME%>">BachKhoa<span>Forum</span></a>
			</h1>

			<nav>
				<a href="<%=request.getContextPath()%><%=Constants.URL.HOME%>">Trang chủ</a>
			</nav>
			<%
				if (session.getAttribute("user") == null) {
			%>
			<ul>
				<li><a class="btnSignin" href="javascript:void(0)">Đăng nhập</a></li>
				<li><a class="btnSignup" href="javascript:void(0)">Đăng kí</a></li>
			</ul>
			<%
				} else {
					User user = (User) session.getAttribute("user");
			%>
				<ul>
				<li class="userProfile">
	 				<a id="btnProfile" href="javascript:void(0)"> 
						<span class="avatar"><img src="/save/images/<%=user.getAvatar() %>" alt=""></span> 
						<strong class="accountUsername"><%=user.getUsername()%></strong>
					</a > 
				</li>
				<li><a
					href="<%=request.getContextPath()%><%=Constants.URL.LOGOUT%>">Đăng xuất</a></li>
			</ul>
			<%
				}
			%>
			<form id="search" method="post" action="<%=request.getContextPath()%><%=Constants.URL.SEARCH_POST %>">
				<input type="search" placeholder="Tìm kiếm..." name="search"> <i
					id="searchIcon" class="fas fa-search fa"></i>
			</form>
		</div>
	</header>
