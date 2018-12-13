<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Comment"%>
<%@page import="utils.Constants"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>
<title>BachKhoa</title>

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

	
</head>

<body>
	<header class="header-search">

		<div class="header-limiter">

			<h1>
				<a href="<%=request.getContextPath()%><%=Constants.URL.HOME%>">BachKhoa<span>Forum</span></a>
			</h1>

			<nav>
				<a href="<%=request.getContextPath()%><%=Constants.URL.HOME%>">Home</a>
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
				<div class="dropdown1">
					  <button class="dropbtn1">
					  <span style="background-color: #d9534f; border-radius: 5px; font-size: 17px; " id="unseen"></span>
					 <i class="fas fa-bell"></i></button>
					  <div class="dropdown-content1" id="dropdown-content1">
					  </div>
				</div>
				<ul>
				<li class="userProfile">
	 				<a id="btnProfile" href="javascript:void(0)"> 
						<span class="avatar"><img src="<%=request.getContextPath()%>/templates/public/files/<%=user.getAvatar() %>" alt=""></span> 
						<strong class="accountUsername"><%=user.getUsername()%></strong>
					</a > 
				</li>
				<li><a
					href="<%=request.getContextPath()%><%=Constants.URL.LOGOUT%>">Logout</a></li>
			</ul>
			<%
				}
			%>
			<form id="search" method="get" action="#">
				<input type="search" placeholder="Search!" name="search"> <i
					id="searchIcon" class="fas fa-search fa"></i>
			</form>
		</div>
	</header>
	<script>

$(document).ready(function(){ 
	var view='';
	 function notify(view){
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.NOTIFICATION%>',
			type: 'POST',
			cache: false,
			data: {
				view: view,
					},	
			success:
				function(responseJson){
                var dis = $('#dropdown-content1');
                dis.text("");
                if(responseJson!=null){
                $.each(responseJson, function(key, value){
                	var a='<a href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>'+'?idp='+value["idPost"]+'" style="color:black"><strong>'+value["username"]+"</strong> đã trả lời vào chủ đề <strong>"+value["titlePost"]+'</strong>'+'</a>';
                	if(value["countUnSeen"]>0)
                	 $('#unseen').text(value["countUnSeen"]);
                	dis.append(a);
                });
                }else{
                	alert('null');
                }
        }
		});	
	}
	 $(document).on('click', '.dropbtn1', function(){
		 notify('yes');; 
		 });
	 setInterval(function(){ 
		 notify();; 
		 }, 5000);
	});
</script>