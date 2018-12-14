<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>

<%
	if(request.getParameter("msg")!=null){
		int msg = Integer.parseInt(request.getParameter("msg"));
		if(msg == 1){
			out.print("<h5 style='color:red'>Đăng nhập thành công</h5>");
		} 
	}
%>  
<div class="container">         

	<!-- Dashboard icons -->
	<div class="content_index_admin">
		<a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
			<span>Bài Viết</span>
		</a>
		
		<a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/Crystal_Clear_files.gif" width="64" height="64" alt="edit" />
			<span>Danh mục</span>
		</a>
		<a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/User-Account.png" width="64" height="64" alt="edit" />
			<span>Người dùng</span>
		</a>
		<a href="<%=request.getContextPath()%><%=Constants.URL.MESSAGEADMIN%>" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/Letter.png" width="64" height="64" alt="edit" />
			<span>Tin Nhắn</span>
		</a>				
		<div style="clear: both"></div>
	</div> <!-- End .grid_7 -->
	
	
</div>
<%@include file="/templates/public/inc/footer.jsp" %>           