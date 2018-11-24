<%@page import="model.bean.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp"%>

<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Bài viết</a></li>
		</ul>
	</nav>
	
	<div class="content">
		<div class="xembai">
		<%
			if(request.getAttribute("post") != null) {
				Post post = (Post) request.getAttribute("post");
			
		%>
			<div class="title_post">
				<h4><%=post.getTitle() %></h4>
			</div>
			<div class="date_post">
				<h3><%=post.getDate_create() %></h3>
				<h3><%=post.getUsername() %></h3>
				<h3>Lượt xem <%=post.getView() %></h3>
			</div>
			<div>
				<img src="<%=request.getContextPath() %>/templates/public/files/<%=post.getPreview_image() %>" class="imgElement">
			</div>
			<div class="content_post">

				<%=post.getContent() %>

			</div>
			<%} %>
				<div class="button-bot">
					<button class="b1" type="button" name="button">Thích</button>
					<button class="b1" type="button" name="button">Trả lời</button>
					<button class="b1" type="button" name="button">Chia sẻ</button>
				</div>
				<hr>
				<div class="comment-content">
					<div>
						<img src="img/apple.jpg" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="#">Nguyễn Văn Tèo</a>
						<p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
						<div class="a-comment">
							<a href="#">Thích</a> <a href="#">Trả lời</a>

						</div>
					</div>
				</div>
				<div class="comment-content">
					<div>
						<img src="img/apple.jpg" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="#">Nguyễn Văn Tèo</a>
						<p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
						<div class="a-comment">
							<a href="#">Thích</a> <a href="#">Trả lời</a>

						</div>
					</div>
				</div>
				<div class="comment-content">
					<div>
						<img src="img/apple.jpg" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="#">Nguyễn Văn Tèo</a>
						<p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
						<div class="a-comment">
							<a href="#">Thích</a> <a href="#">Trả lời</a>

						</div>
					</div>
				</div>
				<div class="xem-comment">
					<a href="#">Xem tất cả các câu trả lời</a>
				</div>
				<br>
				<br>
				<br>
				<div class="text-area">
					<textarea name="content" id="editor">
            		</textarea>

					<div class="button-comment">
						<button class="b2" type="button" name="button">Trả lời</button>
					</div>
				</div>
			
		</div>
	</div>
</div>

<%@include file="/templates/public/inc/footer.jsp"%>

</body>

</html>