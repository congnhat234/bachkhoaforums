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
	<div id="subnav">
        <div class="container_12">
            <div class="grid_12">
                <ul>
                    <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>">Bài viết</a></li>
                    <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>">Danh mục</a></li>
                    <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>">Người dùng</a></li>
                    <li><a href="#">Tin nhắn</a></li>
                </ul>
                
            </div><!-- End. .grid_12-->
        </div><!-- End. .container_12 -->
        <div style="clear: both;"></div>
    </div> <!-- End #subnav -->  
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