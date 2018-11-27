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
	Subject objSub = (Subject) request.getAttribute("objSub");
%>
<aside class="sidebar-right">
	<div class="latest-blog-posts">
		<h3>
			<i class="fa fa-rss"></i> Bài viết quan tâm
		</h3>
		<ul>
			<%
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

	<h1 style="font-family: Arial, Helvetica, sans-serif;"><%=objSub.getName()%></h1>
	<div class="social">
		<a href="#" class=""><i style="font-size: 40px;"
			class="fab fa-facebook-square "></i></a> <a href="#" class=""><i
			style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
	</div>

	<%
		if (listpost != null) {
	%>
	<div class="labeltopic">
		<a href=""><%=objSub.getName()%></a><br>
		<p>Khu vực thảo luận về thông tin và các sự kiện về công nghệ</p>
	</div>
	<%
		for (int i = 0; i < listpost.size(); i++) {
	%>

	<div class="topic">
		<div class="writer"> <i class="fas fa-comments fa-sm"
			style="font-size: 40px;"></i> <a
			href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=listpost.get(i).getId_post()%>"
			style="color: #103667; font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
			<br>
			<div class="amount">
				<dl>
					<dt>
						<a id="author" href="javascript:void(0)"><%=listpost.get(i).getUsername()%></a>
					</dt>
					<dd><%=listpost.get(i).getDate_create()%></dd>
				</dl>
			</div>
		</div>
		<div>
		<p class="news">
			Mới nhất:<a href="">Máy Mac mình giờ cứ mỗi lần </a><br> <a
				href="#topic"> akiii</a>,14:20, hôm nay
		</p>
	</div>
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
