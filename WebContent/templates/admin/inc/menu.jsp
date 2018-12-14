<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="subnav">
    <div class="container_12">
        <div class="grid_12">
            <ul>
            	<li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_HOME%>">Home</a></li>
                <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>">Bài viết</a></li>
                <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>">Danh mục</a></li>
                <li><a href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>">Người dùng </a>
                	<span style="color:red;">(<%=request.getAttribute("countUserDisabled") %>)</span>
                </li>
                <li><a href="<%=request.getContextPath()%><%=Constants.URL.MESSAGEADMIN%>">Tin nhắn</a></li>
            </ul>
            
        </div><!-- End. .grid_12-->
    </div><!-- End. .container_12 -->
    <div style="clear: both;"></div>
</div> <!-- End #subnav -->  