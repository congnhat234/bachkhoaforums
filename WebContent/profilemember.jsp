<%@page import="model.bean.Post"%>
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
	<div class="mainContent">
		<%
			User user = (User) request.getAttribute("user");
		%>
		<fieldset>
			<dl class="ctrlUnit avatarEditor">
				<dt>
					<label>Hình đại diện:</label>
				</dt>
				<dd>
					<img style="width: 100px; height: 100px;"
						src="<%=request.getContextPath()%>/templates/public/files/<%=user.getAvatar()%>">
					<br>
				</dd>
			</dl>
		</fieldset>
		<fieldset>
		<dl class="ctrlUnit">
			<dt>
				<label for="ctrl_location">Tên:</label>
			</dt>
			<dd>
				<span><%=user.getFullname()%></span>
			</dd>
		</dl>
		<dl class="ctrlUnit OptOut">
			<dt>Ngày tham gia:</dt>
			<dd>
				<span><%=user.getDate_join()%></span>
			</dd>
		</dl>
		<dl class="ctrlUnit ">
			<dt>Rate:</dt>
			<dd>
				<span><%=user.getRate()%></span>
			</dd>
		</dl>
		</fieldset>
		<%
			ArrayList<Post> listpost = (ArrayList<Post>) request.getAttribute("listpost");
		%>
		<h1 style="font-family: Arial, Helvetica, sans-serif;">Bài viết:</h1>
		<%
			if (listpost != null) {
		%>
		<%
			for (int i = 0; i < listpost.size(); i++) {
		%>
		<div class="topic">
			<div class="writer">
				<i class="fas fa-comments fa-sm" style="font-size: 40px;"></i> <a
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

</div>



<%@include file="/templates/public/inc/footer.jsp"%>
</body>

</html>