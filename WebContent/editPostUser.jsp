<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
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
                        <li><a href="#">Sửa bài viết</a></li>
                </ul>
        </nav>
        <% Post post = (Post) request.getAttribute("post"); %>
        <div class="content">
        <form class="vietbai" id="form_vietbai" action="<%=request.getContextPath()%><%=Constants.URL.EDIT_POST_BY_USER%>?idp=<%=post.getId_post()%>" method="POST" enctype="multipart/form-data">
                       
                <div class="tieude">
                    <label>Tiêu đề bài viết:</label>
                    <input class="text1" type="text" name="title" value="<%=post.getTitle()%>">
                </div>
                <div class="tieude">
                    <label>Xem trước</label>
                    <input class="text2" type="text" name="preview_content" value="<%=post.getPreview_content()%>" >
                </div>
                <div>
                    <dl class="pre_image">
                        <dt>Preview Image</dt>
                        <dd>
                            <a href="#">
                            <img id="imgpreview" style="width:200px;height:200px;" src="/save/images/post/<%=post.getPreview_image()%>">
                            </a> <br><br>
                            <input id="imginput" type="file" name="preview_image" value="<%=post.getPreview_image()%>" class="choose_file" >
                        </dd>
                    </dl>
                </div>
                <div class="tieude">
                    <label>Chủ đề:</label>
                    <select class="select1" name="id_subject">
                    <%
                    	if(request.getAttribute("listSubject") != null) {
                    		ArrayList<Subject> listSubject = (ArrayList<Subject>) request.getAttribute("listSubject");
                    		for(Subject obj : listSubject) {
                    %>
                        <option <%if(post.getId_subject()==obj.getId_subject()){%> selected <%}%> value="<%=obj.getId_subject()%>"><%=obj.getName() %>
                        </option>
                    <%} } %>
                    </select>
                </div>
                <div class="tieude">
                    <label>Nội dung bài viết:</label>
                </div>
                <div class="text-area">
                    <textarea name="content" id="editor">
            		</textarea>
                </div>
                <dl>
                    <dt></dt>
                    <dd>
                        <input class="button" type="submit" value="Sửa bài viêt">
                    </dd>
                </dl>
                <div class="checkbox1">
                    <input type="checkbox" name="check1" value="TheoDoi">
                    <label>Theo dõi chủ đề này.</label> <br><br>
                    <input type="checkbox" name="check2" value="NhanThongBao">
                    <label>Nhận thông báo qua email.</label><br><br>
                </div>
            
        </form>
    </div>

    </div>

    <%@include file="/templates/public/inc/footer.jsp" %>
    <%if(request.getParameter("msg")!=null){
    	String msg= request.getParameter("msg");
    	if(msg.equals("0")){%>
    	<script>
    	$('#snackbar').attr("type", "error");
    	toast("Tạo bài viết không thành công!")
    	</script>	
    <%}
    } %>
    <script type="text/javascript">
	    var editor = CKEDITOR.replace('editor', {
			filebrowserBrowseUrl : '/ckfinder/ckfinder.html',
		});
		CKFinder.setupCKEditor(editor,'/forumproject/ckfinder/');
    	function previewFile() {
    	  var preview = document.getElementById('imgpreview');
    	  var file    = document.getElementById('imginput').files[0];
    	  var reader  = new FileReader();

    	  reader.onloadend = function () {
    	    preview.src = reader.result;
    	  }

    	  if (file) {
    	    reader.readAsDataURL(file);
    	  } else {
    	    preview.src = "";
    	  }
    	}
    	$("#imginput").change(function(){
    	    previewFile();
    	});
    	$( document ).ready( function () {
    	$( "#form_vietbai" ).validate( {
			rules: {
				title: {
					required: true,
					minlength: 5
				},
				preview_content: {
					required: true,
					minlength: 3
				},
				id_subject: {
					required: true,
				}
			},
			messages: {
				title: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 3 kí tự"
				},
				preview_content: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 3 kí tự"
				},
				id_subject: {
					required: "Vui lòng chọn trường này",
				}
			}
		} );
    	} );
    </script>
    
</body>

</html>