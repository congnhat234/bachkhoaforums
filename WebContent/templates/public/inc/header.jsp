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
            <ul>
                <li><a id="btnSignin" href="#">Login</a></li>
                <li><a id="btnSignup" href="#">Sign up</a></li>
            </ul>

            <form id="search" method="get" action="#">
                <input type="search" placeholder="Search!" name="search">
                <i id="searchIcon" class="fas fa-search fa"></i>
            </form>
        </div>
    </header>