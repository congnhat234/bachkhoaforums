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
	ArrayList<Post> listoutstanding = (ArrayList<Post>) request.getAttribute("listoutstanding");
%>

    <aside class="sidebar-right">
	<div class="latest-blog-posts">
		<h3>
			<i class="fa fa-rss"></i> Sôi động trong tuần
		</h3>
		<ul>
            <%if(listoutstanding!=null) %>
            <%for(Post post : listoutstanding) {
                String urlPost = "/threads/" + ConvertString.createSlug(post.getTitle()) + "-" + post.getId_post();%>
                <li><a href="<%=request.getContextPath() %><%=urlPost %>"><%=post.getTitle() %></a>
                <span><%=post.getDate_create() %></span></li>
                <%}%>
		</ul>

	</div>

</aside>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Tạo tin nhắn mới</a></li>
		</ul>
	</nav>
    <div class="mainContent">
		<%
			User user = null;
			if (session.getAttribute("user") != null) {
				user = (User) session.getAttribute("user");
			}
		%>
		<form method="post" id="#" enctype="#" action="#">
		<fieldset>
		<dl class="ctrlUnit">
			<dt> <label for="ctrl_location">Email :</label>	</dt>
			<dd> <input type="text" name="email" value="#" class="textCtrl OptOut"></dd>
		</dl>	
		<dl class="ctrlUnit">
			<dt> <label for="ctrl_location">Nội dung tin nhắn</label></dt>
			<dd> <textarea name="content" id="editor"></textarea> </dd>
		</dl>
		</fieldset>	
		<div class="button-bot"><button class="b1"type="button"name="button">Gửi</button></div>
		</form>	
    </div>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>

</html>