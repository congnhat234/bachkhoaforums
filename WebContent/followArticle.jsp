<%@page import="utils.ConvertString"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp" %>

<%ArrayList<Post> listoutstanding = (ArrayList<Post>) request.getAttribute("listoutstanding"); %>
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
				<li><a href="#">Bài viết theo dõi</a></li>
			</ul>
		</nav>
		
<%@include file="/templates/public/inc/menu.jsp"%>

		<div class="parse">
			<div class="parse-content">
					<a href="#" class="page active">First</a>
					<a href="#" class="page">2</a>
					<a href="#" class="page">3</a>
					<a href="#" class="page">4</a>
					<a href="#" class="page">5</a>
					<a href="#" class="page">6</a>
					<a href="#" class="page">Last</a>
				</div>
		</div>
				<div class="parse">
			<div class="parse-content">
				<%
					if (request.getAttribute("sumPage") != null) {
						int sumPage = (Integer) request.getAttribute("sumPage");
						int current_page = (Integer) request.getAttribute("page");%>
						<span>Trang <%=current_page %>/<%=sumPage %> </span> 
						<%String active = "";%>
						<%
					for (int i = 1; i <= sumPage; i++) {
							if (current_page == i) {
								active = "style='border: none; background: #616161; box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);color: #f0f0f0;text-shadow: 0px 0px 3px rgba(0,0,0, .5)'";
							} else {
								active = "";
							}
				%>
				<a <%=active%> class="page"
					href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>?current_page=<%=i%>"><%=i%></a>
				
				<%
					}
					}
				%>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="contentProfile">                  
			<div class="mainContent">
			<% ArrayList<Post> listpostfl = (ArrayList<Post>) request.getAttribute("listpostfl");
				if(listpostfl.size() > 0) {%>
				<form action="#" class="form-xembaimoi">
					<table>
						<tr>
							<th class="th1"></th>
							<th>Tiêu đề</th>
							<th>Trả lời</th>
							<th>Xem</th>
							<th>Bài viết cuối</th>
						</tr>
						<%
							int [] anwserAmount= (int[]) request.getAttribute("listAmountAnswer");
							String [] lastUser= (String[]) request.getAttribute("listLastUser");
							for(int i=0; i<listpostfl.size();i++){
							String urlPost = "/threads/" + ConvertString.createSlug(listpostfl.get(i).getTitle())+"-"+listpostfl.get(i).getId_post();
						%>
						<tr>
							<td><img src="<%=listpostfl.get(i).getPreview_image()%>" width="30px"height="30px"></td>
							<td class="td1"> <a href="<%=request.getContextPath() %><%=urlPost %>"><%=listpostfl.get(i).getTitle() %></a></td>
							<td><%=anwserAmount[i] %></td>
							<td><%=listpostfl.get(i).getView()%></td>
							<% if("".equals(lastUser[i])) {%><td><a href="#"><%=listpostfl.get(i).getUsername()%></a></td><%}else{%> <td><a href="#"><%=lastUser[i]%></a></td><%} %>
						</tr>
						<%}%>
						
					</table>
				</form>
				<% } else {%>
				<h6 style="margin-left: 25px;">Chưa có bài viết.</h6>
				<%} %>
			</div>
		</div>
	</div>
<%@include file="/templates/public/inc/footer.jsp"%>
</body>
</html>