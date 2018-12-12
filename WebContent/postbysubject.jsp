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
    <aside class="sidebar-left">
    
        <div class="sidebar-links">
        <a class="link-red" href="<%=request.getContextPath() %><%=Constants.URL.HOME %>">Bài Mới</a>
        <%
        ArrayList<Subject> listsub= (ArrayList<Subject>) request.getAttribute("listsubject");
        %>
        <%for(int i=0;i<listsub.size();i++) {%>
        	 
        	
            <a  <%if(listsub.get(i).getId_subject()==objSub.getId_subject()) {%> class=" link-blue " <%}else {%>class="link-red" <%} %> href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_SUBJECT %>?sub=<%=listsub.get(i).getId_subject()%>">
            <%=listsub.get(i).getName()%></a>
            <%}%>
        </div>
    </aside>
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
	<div class="top-container">
       <div class="social">
               <a href="#" class=""><i style="font-size: 40px;" class="fab fa-facebook-square "></i></a>
               <a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
       </div>
		
      <div class="create-post"><a href="<%=request.getContextPath() %><%=Constants.URL.CREATE_POST%>"><i class="fas fa-pencil-alt fa-2x"></i>Tạo bài viết</a></div> 
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
					href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_SUBJECT%>?current_page=<%=i%>&sub=<%=objSub.getId_subject()%>"><%=i%></a>
				
				<%
					}
					}
				%>
			</div>
			<div style="clear: both;"></div>
		</div>
	<%
		if (listpost != null) {
	%>
	<div class="labeltopic">
		<a href=""><%=objSub.getName()%></a><br>
		<p><%=objSub.getDescribe() %></p>
	</div>
	<%
		for (int i = 0; i < listpost.size(); i++) {
	%>

	<div class="topic">
		<div class="writer"> 
			<i class="fas fa-comments fa-sm"style="font-size: 40px;"></i> 
			<a href="<%=request.getContextPath()%><%=Constants.URL.VIEW_POST%>?idp=<%=listpost.get(i).getId_post()%>"
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
