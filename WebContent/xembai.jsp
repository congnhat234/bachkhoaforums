<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Comment"%>
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
		<div class="head_title_post">
			<h4 class="title_post"><%=post.getTitle() %></h4>
		</div>
		<div class="date_post">
				<h3><%=post.getDate_create() %></h3>
				<h3><%=post.getUsername() %></h3>
				<h3>Lượt xem <%=post.getView() %></h3>
				<h3><button id="btnFollow" type="button" ">Theo dõi</button></h3>	
			</div>
			<span id="result"></span>
		</div>
			<div>
				<img src="<%=request.getContextPath() %>/templates/public/files/post/<%=post.getPreview_image()%>" class="imgElement">
			</div>
					<br>
					<br>
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
				<%ArrayList<Comment> listComment= (ArrayList<Comment>) request.getAttribute("listComment"); 
				 for(int i=0;i<listComment.size();i++){ %>
				<div class="comment-content">
					<div>
						<img src="img/apple.jpg" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="#"><%=listComment.get(i).getUserName()%></a>
						<p><%=listComment.get(i).getContent()%></p>
						<div class="a-comment">
							<a href="#">Thích</a> <a href="#">Trả lời</a>
						</div>
					</div>
				</div>
				
				<%} %>
				<%if(listComment.size()!=0) {%>
				<div class="xem-comment">
					<a href="#">Xem tất cả các câu trả lời</a>
				</div>
				<%} %>
				<br>
				<br>
				<br>
				 <%
			        if (session.getAttribute("user") != null) {%>
					<form class="text-area" action="<%%>" method="post">
					<textarea name="content" id="editor">
            		</textarea>
					<div class="button-comment">
						<input class="b2" type="button" name="butto" type="submit" value="Trả lời">
					</div>
					</form>

				<%}%>
		</div>
	</div>
</div>

<%@include file="/templates/public/inc/footer.jsp"%>

</body>

</html>