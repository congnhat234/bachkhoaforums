<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="container">
	<div id="subnav">
		<div class="container_12">
			<div class="grid_12">
				<ul>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>">Bài
							viết</a></li>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>">Danh
							mục</a></li>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>">Người
							dùng</a></li>
				</ul>

			</div>
			<!-- End. .grid_12-->
		</div>
		<!-- End. .container_12 -->
		<div style="clear: both;"></div>
	</div>
	<!-- End #subnav -->
	<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath() %>/admin/show-addNews" class="button">
			<span>Thêm tin</span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>
<%
if(request.getParameter("msg")!=null){
	int msg = Integer.parseInt(request.getParameter("msg"));
	if(msg == 1){
		out.print("<h5 style='color:red'>Thêm thành công</h5>");
	} else
	if(msg == 2){
		out.print("<h5 style='color:red'>Sửa thành công</h5>");
		} else
	if(msg == 3){
		out.print("<h5 style='color:red'>Xóa thành công</h5>");
		}
		else {
		out.print("<h5 style='color:red'>Thất bại</h5>");
	}
}
%>
<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách tin</span></h2>
		
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th style="width:30%">Tên tin tức</th>
						<th style="width:12%">Danh Mục</th>
						<th style="width:20%; text-align: center;">Hình ảnh</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(request.getAttribute("listPost")!=null){
					ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
					if(listPost.size()>0){
					for(Post objNews : listPost){
				%>
					<tr>
						<td class="align-center"><%=objNews.getId_post() %></td>
						<td><a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=objNews.getId_post()%>"><%=objNews.getTitle() %></a></td>
						<td><%=objNews.getId_subject() %></td>
						<td align="center"><img src="<%=request.getContextPath() %>/templates/public/files/post/<%=objNews.getPreview_image() %>" class="hoa" /></td>
						<td align="center">
							<a href="<%=request.getContextPath()%><%=Constants.URL.EDIT_POST%>?nid=<%=objNews.getId_post()%>">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="<%=request.getContextPath()%><%=Constants.URL.DELETE_POST%>?del=<%=objNews.getId_post()%>">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
						</td>
					</tr>
				  <%}}} %> 
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
		 <div class="pagination">           
			<div class="numbers">
				<span>Trang:</span> 
				<%
					if(request.getAttribute("sumPage")!=null){
						int sumPage = (Integer) request.getAttribute("sumPage");
						int current_page = (Integer) request.getAttribute("page");
						String active = "";
						if(current_page>1){
				%>
				<a <%=active %> href="<%=request.getContextPath()%>/admin/indexNews?current_page=<%=current_page-1%>"><<</a> 	
				<span>|</span> 
				<%	} %>
				 
				<%
						for(int i=1; i<=sumPage; i++){
							if(current_page == i){
								active = "style='color:red'";
							} else {
								active = "";
							}
				%>
				<a <%=active %> href="<%=request.getContextPath()%>/admin/indexNews?current_page=<%=i%>"><%=i %></a> 
				<span>|</span> 
				<%}
				if(current_page<sumPage){
				%>
				<a <%=active %> href="<%=request.getContextPath()%>/admin/indexNews?current_page=<%=current_page+1%>">>></a> 
				<%}}  %>
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
</div> <!-- End .grid_12 -->
</div>
<%@include file="/templates/public/inc/footer.jsp" %> 