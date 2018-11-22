<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO" %>
<%@page import="model.bo.SubjectBO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp" %>
    <aside class="sidebar-left">
        <div class="sidebar-links">
            <a class="link-blue" href="#">Bài Mới</a>
            <a class="link-red" href="#">Điện Thoại</a>
            <a class="link-yellow selected" href="#">Máy Tính</a>
            <a class="link-green" href="#">Xe</a>
        </div>

    </aside>

    <aside class="sidebar-right">
        <div class="latest-blog-posts">
            <h3><i class="fa fa-rss"></i> Sôi động trong tuần</h3>
            <ul>
                <li><a href="#">AppStore mới được mở ở...</a><span>2 days ago</span></li>
                <li><a href="#">AppStore mới được mở ở... </a><span>one week ago</span></li>
                <li><a href="#">AppStore mới được mở ở... </a><span>2 weeks ago</span></li>
                <li><a href="#">AppStore mới được mở ở... </a><span>3 weeks ago</span></li>
            </ul>

        </div>

    </aside>

    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
                </ul>
        </nav>

        <h1 style=" font-family: Arial, Helvetica, sans-serif;">  BachKhoa Forum</h1>
        <div class="social">
            <a href="#" class=""><i style="font-size: 40px;" class="fab fa-facebook-square "></i></a>
            <a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
        </div>
        <%
        ArrayList<Subject> listsub= (ArrayList<Subject>) request.getAttribute("listsubject");
        ArrayList<Post> listpost =(ArrayList<Post>) request.getAttribute("listpost");
        %>
        <% if(listsub!=null)
        for (Subject sub:listsub) {%>
        <div class="labeltopic">
            <a href="#topic"><%=sub.getName() %></a><br>
            <p> Khu vực thảo luận về thông tin và các sự kiện về công nghệ</p>
        </div>
        
		<% for(int i=0;i<listpost.size();i++){ %>
			<%if(listpost.get(i).getId_subject() == sub.getId_subject()){  %>

        <div class="topic">
            <span>
                <i class="fas fa-comments fa-sm" style="font-size: 40px;"></i>
                <a href="#" style=" color:#103667;  font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
                <br>
                <!-- <p class="amount">Chủ đề: 999 Bài viết: 999</p> -->
                <div class="amount">
                  <dl>
                      <dt>Chủ đề: </dt>
                      <dd>9999</dd>
                    </dl>
                    <dl>
                        <dt>Bài viết: </dt>
                        <dd>9999</dd>
                    </dl>
                </div>
            </span>
            <p class="news">Mới nhất:<a href="#topic"> AppStore mới được mở ở...</a><br>
                <a href="#topic"> akiii</a>,14:20, hôm nay
            </p>
        </div>
        <hr class="linetopic">
        <%}} %>
		<%} %>
           </div>
    
<%@include file="/templates/public/inc/footer.jsp" %>
    
</body>

</html>
