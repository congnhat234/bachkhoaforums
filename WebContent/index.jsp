<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO" %>
<%@page import="model.bo.SubjectBO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp" %>
    <aside class="sidebar-left">
    
        <div class="sidebar-links">
        <a class="link-blue" href="#">Bài Mới</a>
        <%
        ArrayList<Subject> listsub= (ArrayList<Subject>) request.getAttribute("listsubject");
        ArrayList<Post> listpost =(ArrayList<Post>) request.getAttribute("listpost");
        %>
        <%for(int i=0;i<listsub.size();i++) {%>
            <a class="link-red" href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_SUBJECT %>?sub=<%=listsub.get(i).getId_subject()%>">
            <%=listsub.get(i).getName()%></a>
            <%}%>
        </div>
    </aside>
    <aside class="sidebar-right">
        <div class="latest-blog-posts">
            <h3><i class="fa fa-rss"></i> Sôi động trong tuần</h3>
            <ul>
            <%for(int i=0;i<listpost.size();i++) 
            	if(listpost.get(i).getView()>500) {%>
                <li><a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=listpost.get(i).getId_post()%>"><%=listpost.get(i).getTitle() %></a>
                <span><%=listpost.get(i).getDate_create() %></span></li>
                <%}%>
            </ul>

        </div>

    </aside>
    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.HOME%>"><i class="fas fa-home fa-2x"></i></a></li>
                </ul>
        </nav>

        <h1 style=" font-family: Arial, Helvetica, sans-serif;">  BachKhoa Forum</h1>
        <div class="social">
            <div>
                    <a href="#" class=""><i style="font-size: 40px;" class="fab fa-facebook-square "></i></a>
                    <a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
            </div>

           <div><a href="<%=request.getContextPath() %><%=Constants.URL.CREATE_POST%>"><i class="fas fa-pencil-alt fa-2x"></i></a></div> 
        </div>
    	
        <% if(listsub!=null)
        for (Subject sub:listsub) {%>
        <div class="labeltopic">
            <a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_SUBJECT %>?sub=<%=sub.getId_subject()%>"><%=sub.getName() %></a><br>
            <p> Khu vực thảo luận về thông tin và các sự kiện về công nghệ</p>
        </div>
		<% for(int i=0;i<listpost.size();i++){ %>
			<%if(listpost.get(i).getId_subject() == sub.getId_subject()){  %>

        <div class="topic">
            <div class="writer">
                <i class="fas fa-comments fa-sm" style="font-size: 40px;"></i>
                <a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=listpost.get(i).getId_post()%>" style=" color:#103667;  font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
                <br>
                <div class="amount">
                  <dl>
                      <dt><a  id="author" href="javascript:void(0)" ><%=listpost.get(i).getUsername() %></a> </dt>
                      <dd><%=listpost.get(i).getDate_create()%></dd>
                    </dl>
                </div>
            </div>
            <div>
            <p class="news">Mới nhất:<a  href="">Máy Mac mình giờ cứ mỗi lần </a><br>
                <a href="#topic"> akiii</a>,14:20, hôm nay
            </p>
            </div>
        </div>
        <hr class="linetopic">
        <%}} %>
		<%} %>	 
		</div>
<%@include file="/templates/public/inc/footer.jsp" %>
</body>

</html>
