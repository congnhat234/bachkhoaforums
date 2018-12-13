<%@page import="utils.ConvertString"%>
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
					String urlPost = "/threads/" + ConvertString.createSlug(listpost.get(i).getTitle())+"-"+listpost.get(i).getId_post();
			%>
			<li><a
				href="<%=request.getContextPath()%><%=urlPost%>"><%=listpost.get(i).getTitle()%></a>
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
			<li><a href="#">Bài viết của bạn</a></li>
		</ul>
	</nav>
	<!-- <div class="social">
		<a href="#" class=""><i style="font-size: 40px;"class="fab fa-facebook-square "></i></a> 
		<a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
	</div> -->
	
	<%@include file="/templates/public/inc/menu.jsp"%>
	
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
			String urlPost = "/threads/" + ConvertString.createSlug(listpost.get(i).getTitle())+"-"+listpost.get(i).getId_post();
			String urlAuth = "/user/" + listpost.get(i).getUsername()+"."+listpost.get(i).getId_user();
	%>

	<div class="topic">
		<div class="writer"> 
			<i class="fas fa-comments fa-sm"
			style="font-size: 40px;"></i> <a
			href="<%=request.getContextPath()%><%=urlPost%>%>"
			style="color: #103667; font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
			<br>
			<div class="amount">
				<dl>
					<dt>
						<a id="author" href="<%=request.getContextPath()%><%=urlAuth%>"><%=listpost.get(i).getUsername()%></a>
					</dt>
					<dd><%=listpost.get(i).getDate_create()%></dd>
				</dl>
			</div>
		</div>
		<p class="news">
		"<%=listpost.get(i).getPreview_content() %>"
		<br>
		<span style="font-size: 10px; color: #6d6c6c; font-style: italic;">Lượt xem: <%=listpost.get(i).getView() %></span>
		</p>
	</div>
	<hr class="linetopic">
	<%
		}
		} else {
	%>
	<h6 style="margin-left: 25px;">Chưa có bài viết.</h6>
	<%} %>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
	</body>
</html>
