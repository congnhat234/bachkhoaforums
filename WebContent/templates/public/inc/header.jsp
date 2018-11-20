<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<title>BachKhoa</title>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/profile.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/fontawesome/css/all.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <script src="<%=request.getContextPath() %>/templates/public/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/public/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/templates/public/ckeditor/ckeditor.js"></script>
</head>

<body>
    <header class="header-search">

        <div class="header-limiter">

            <h1><a href="#">BachKhoa<span>Forum</span></a></h1>

            <nav>
                <a href="#">Home</a>
            </nav>
            <%if(session.getAttribute("user") == null) { %>
            <ul>
                <li><a id="btnSignin" href="javascript:void(0)">Login</a></li>
                <li><a id="btnSignup" href="javascript:void(0)">Sign up</a></li>
            </ul>
            <%} else {
            	User user = (User) session.getAttribute("user");%>
            <ul>
                <li class="userProfile">
                    <a id="btnProfile" href="#">
                        <span class="avatar"><img src="img/t3.jpg" alt=""></span>
                        <strong class="accountUsername"><%=user.getUsername() %></strong>
                    </a>
                </li>
                <li><a href="<%=request.getContextPath() %>/logout">Logout</a></li>
            </ul>
			<%} %>
            <form id="search" method="get" action="#">
                <input type="search" placeholder="Search!" name="search">
                <i id="searchIcon" class="fas fa-search fa"></i>
            </form>
        </div>
    </header>