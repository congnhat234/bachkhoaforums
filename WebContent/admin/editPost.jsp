<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>

    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Sửa</a></li>
                </ul>
        </nav>
        <div class="content">
     	<%
		if(request.getAttribute("post") != null) {
			Post post = (Post) request.getAttribute("post");%>
        <form class="vietbai" action="<%=request.getContextPath()%><%=Constants.URL.EDIT_POST%>" method="POST" enctype="multipart/form-data">
                       
                <div class="tieude">
                    <label>Tiêu đề bài viết:</label>
                    <input class="text1" type="text" name="title" value="<%=post.getTitle()%>">
                </div>
                <div class="tieude">
                    <label>Xem trước</label>
                    <input class="text2" type="text" name="preview_content" required>
                </div>
                <div>
                    <dl class="pre_image">
                        <dt>Preview Image</dt>
                        <dd>
                            <a href="#">
                            <img style="width:200px;height:200px;" src="<%=request.getContextPath() %>/templates/public/files/post/<%=post.getPreview_image()%>">
                            </a> <br><br>
                            <input type="file" name="preview_image" value="" class="choose_file" >
                        </dd>
                    </dl>
                </div>
                <div class="tieude">
                    <label>Chủ đề:</label>
                    <select class="select1" name="id_subject">
                    <%
                    	if(request.getAttribute("listSubject") != null){
                    		ArrayList<Subject> listSubject = (ArrayList<Subject>) request.getAttribute("listSubject");
                    		for(Subject obj : listSubject) {
                    %>
                        <option value="<%=obj.getId_subject()%> <%if(obj.getId_subject()==post.getId_subject()){ %>selected" <%}%>><%=obj.getName() %>
                        </option>
                    <%} } %>
                    </select>
                </div>
                <div class="tieude">
                    <label>Nội dung bài viết:</label>
                </div>
                <div class="text-area">
                    <textarea name="content" id="editor" ><%=post.getContent()%>
            		</textarea>
                    
                </div>
                <dl>
                    <dt></dt>
                    <dd>
                        <input class="button" type="submit" value="Sửa">
                        <input class="button" type="button" value="Trở về" onclick="javascript:history.go(-1)">
                    </dd>
                </dl>
                <div class="checkbox1">
                    <input type="checkbox" name="check1" value="TheoDoi">
                    <label>Theo dõi chủ đề này.</label> <br><br>
                    <input type="checkbox" name="check2" value="NhanThongBao">
                    <label>Nhận thông báo qua email.</label><br><br>
                </div>
            
        </form>
        <%} %>
    </div>

    </div>

    <%@include file="/templates/public/inc/footer.jsp" %>
    
</body>

</html>