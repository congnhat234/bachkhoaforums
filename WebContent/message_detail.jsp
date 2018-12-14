<%@page import="model.bean.Message"%>
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
ArrayList<Subject> listsub= (ArrayList<Subject>) request.getAttribute("listsubject");
%>
    <aside class="sidebar-left">
    
        <div class="sidebar-links">
        <a class="link-red" href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_NEW %>">Bài Mới</a>
        <%for(int i=0;i<listsub.size();i++) {
        String urlSubject = "/subject/" + ConvertString.createSlug(listsub.get(i).getName())+"-"+listsub.get(i).getId_subject();%>
            <a class="link-red" href="<%=request.getContextPath() %><%=urlSubject %>">
            <%=listsub.get(i).getName()%></a>
            <%}%>
        </div>
    </aside>
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
			<li><a href="#">Chi tiết tin nhắn</a></li>
		</ul>
	</nav>
	<%@include file="/templates/public/inc/menu.jsp"%>
    <div class="mainContent">
		<%
			if (request.getAttribute("objMessage") != null) {
				Message message = (Message) request.getAttribute("objMessage");
		%>
		<fieldset>
		<dl class="ctrlUnit">
			<dt> <label for="ctrl_location"><strong>Tin nhắn từ:</strong></label></dt>
			<dd> <span>Đội ngũ ADMIN</span></dd>
		</dl>
		<dl class="ctrlUnit">
			<dt> <label for="ctrl_location"><strong>Trả lời tin nhắn của bạn:</strong></label></dt>
			<dd> <span><%=message.getMessage_content() %></span></dd>
		</dl>
		<dl class="ctrlUnit">
			<dt> <label><strong>Nội dung phản hồi:</strong></label></dt>
			<dd> <span><%=message.getReply() %></span></dd>
		</dl>	
		</fieldset>	
		<%} %>
    </div>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>

</html>