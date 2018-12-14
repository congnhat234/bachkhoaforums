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
	<%@include file="/templates/admin/inc/menu.jsp" %>
	<!-- Dashboard icons -->
	<div class="grid_main_l">
		<a href="<%=request.getContextPath()%>/admin/show-addNews" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
			<span>Thêm tin tức</span>
		</a>
		
		<a href="<%=request.getContextPath()%>/admin/show-addCat" class="dashboard-module">
			<img src="<%=request.getContextPath() %>/templates/admin/images/Crystal_Clear_files.gif" width="64" height="64" alt="edit" />
			<span>Thêm Danh mục</span>
		</a>
		<div style="clear: both"></div>
	</div> <!-- End .grid_7 -->
	
	
</div>
<%@include file="/templates/public/inc/footer.jsp" %>           