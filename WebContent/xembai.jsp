<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp"%>

<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Bài viết</a></li>
		</ul>
	</nav>
	
	<div class="content">
		<div class="xembai">
		<%
			if(request.getAttribute("post") != null) {
				Post post = (Post) request.getAttribute("post");
			
		%>
		<div style="display:none;" class="hint" id="hintId"><%=post.getId_post() %></div>
		<div class="head_title_post">
			<h4 idpost="<%=post.getId_post() %>" class="title_post"><%=post.getTitle() %></h4>
		</div>
		<div class="date_post">
				<h3><%=post.getDate_create() %></h3>
				<h3><%=post.getUsername() %></h3>
				<h3>Lượt xem <%=post.getView() %></h3>
				<h3><button id="btnFollow" type="button">Theo dõi</button></h3>	
			</div>
			<span id="result"></span>
		</div>
			<div>
				<img src="<%=request.getContextPath() %>/templates/public/files/post/<%=post.getPreview_image()%>" class="imgElement">
			</div>
					<br>
					<br>
			<div class="content_post">

				<%=post.getContent() %>

			</div>
			<%} %>
				<div class="button-bot">
				<% if (session.getAttribute("user") != null) {
					User user = (User) session.getAttribute("user");
					if((int)request.getAttribute("likedByUser") > 0) {
				%>
					<button id="likePost" idU="<%=user.getId_user() %>" class="b1 active" type="button" name="button"><%=request.getAttribute("countLikePost") %> Thích</button>
				<%} else { %>
					<button id="likePost" idU="<%=user.getId_user() %>" class="b1" type="button" name="button"><%=request.getAttribute("countLikePost") %> Thích</button>
				<%} %>
				<%} else { %>
					<button class="b1" type="button" name="button"><%=request.getAttribute("countLikePost") %> Thích</button>
				<%} %>
					<button class="b1" type="button" name="button">Chia sẻ</button>
				</div>
				<hr>
				<div class="comment-container">
				<%ArrayList<Comment> listComment= (ArrayList<Comment>) request.getAttribute("listComment"); 
				 String auth = "";
				 for(int i=0;i<listComment.size();i++){ %>
				
				<div class="comment-content">
					<div>
						<img src="<%=request.getContextPath() %>/templates/public/files/<%=listComment.get(i).getAvatar() %>" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="<%=request.getContextPath()%><%=Constants.URL.PROFILEMEMBER%>"><%=listComment.get(i).getUserName()%></a><span><%=listComment.get(i).getDate_create() %></span>
						<div><%=listComment.get(i).getContent()%></div>
						<% if (session.getAttribute("user") != null) {
							User user = (User) session.getAttribute("user");
							if (user.getId_role() == 1 || user.getId_role() == 2 || user.getId_user() == listComment.get(i).getId_user()) {
								auth = "true";
							} else {
								auth = "false";
							}
						%>
						<div class="a-comment">
							<a idcomment=<%=listComment.get(i).getId_comment()%> class="likeComment" href="javascript:void(0)">Thích</a> 
							<a auth=<%=auth %> idcomment=<%=listComment.get(i).getId_comment()%> class="deleteComment" href="javascript:void(0)">Xóa</a>						
						</div>
						<%} %>
					</div>
				</div>
				
				<%} %>
				</div>
				<%if(listComment.size()!=0) {%>
				<div class="xem-comment">
					<a href="#">Xem tất cả các câu trả lời</a>
				</div>
				<%} %>
				<br>
				<br>
				<br>
				 <%
			        if (session.getAttribute("user") != null) {%>
					<form class="text-area" action="javascript:void(0)" method="post">
					<textarea name="content" id="editor">
            		</textarea>
					<div class="button-comment">
						<input id="sendComment" class="b2" type="button" name="button" type="submit" value="Trả lời">
					</div>
					</form>
				<%} else {
					%>
					<p><a class="btnSignin" href="javascript:void(0)">Đăng nhập</a> để bình luận hoặc <a class="btnSignup" href="javascript:void(0)">Đăng kí</a></p>
				<%}%>
		</div>
	</div>

<%@include file="/templates/public/inc/footer.jsp"%>

<script type="text/javascript">
	var editor = CKEDITOR.replace('editor', {
		filebrowserBrowseUrl : '/ckfinder/ckfinder.html',
	});
	CKFinder.setupCKEditor(editor,'/forumproject/ckfinder/');
	$("#sendComment").on('click', function (){
		
		var cmt = theEditor.getData(); 
		var idPost = $(".title_post").attr("idpost");
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.COMMENT_POST%>',
			type: 'POST',
			cache: false,
			data: {
					acmt: cmt,
					aid: idPost,
					},
			success: function(responseJson){
				if(responseJson!=null){
					var commentDiv = $(".comment-container");
					commentDiv.text("");
					$.each(responseJson, function(key, value){
						
						var div = '<div class="comment-content">'
									+'<div>'
										+'<img src="<%=request.getContextPath() %>/templates/public/files/' + value["avatar"] + '" width="50px" height="50px">'
									+'</div>'
									+'<div class="comment">'
										+'<a href="#">'+ value["username"] +'</a><span>' + value["date_create"] + '</span>'
										+'<div>'+ value["content"] +'</div>'
										+'<div class="a-comment">'
											+'<a idcomment=' + value["id_comment"] + ' class="likeComment" href="javascript:void(0)">Thích</a>' 
											+'<a auth=<%=auth %> idcomment=' + value["id_comment"] + ' class="deleteComment" href="javascript:void(0)">Xóa</a>'
										+'</div>'
									+'</div>'
								+'</div>';
						commentDiv.append(div);
					})
				}
				theEditor.setData("");
			},
			error: function (){
				alert("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
	});
	
	function Confirm(title, msg, $true, $false, $thisDom) {
        var $content =  "<div class='dialog-ovelay'>" +
                        "<div class='dialog'><header>" +
                         " <h3> " + title + " </h3> " +
                         "<i class='fa fa-close'></i>" +
                     "</header>" +
                     "<div class='dialog-msg'>" +
                         " <p> " + msg + " </p> " +
                     "</div>" +
                     "<footer>" +
                         "<div class='controls'>" +
                             " <button class='button-danger doAction'>" + $true + "</button> " +
                             " <button class='button-default cancelAction'>" + $false + "</button> " +
                         "</div>" +
                     "</footer>" +
                  "</div>" +
                "</div>";
      $('body').prepend($content);
      $('.doAction').click(function () {
        deleteComment($thisDom); //function delete comment
        $(this).parents('.dialog-ovelay').fadeOut(500, function () {
          $(this).remove();
        });
      });
	$('.cancelAction, .fa-close').click(function () {
        $(this).parents('.dialog-ovelay').fadeOut(500, function () {
          $(this).remove();
        });
      });
      
   }
	
	jQuery('body').on('click', '.deleteComment', function (){
		var auth = $(this).attr("auth");
		if(auth === "true") {
			Confirm('Xóa bình luận', 'Bạn có chắc muốn xóa?', 'Xóa', 'Hủy', $(this));
		} else {
			$('#snackbar').attr("type", "error");
			toast("Bạn không có quyền xóa!");
		}
		
		
	});
	function deleteComment($thisDom) {
		var idPost = $(".title_post").attr("idpost");
		var idComment = $thisDom.attr("idcomment");
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.DELETE_COMMENT_POST%>',
			type: 'POST',
			cache: false,
			data: {
					aidPost: idPost,
					aidComment: idComment,
					},
			success: function(responseJson){
				if(typeof responseJson !== 'string'){
					var commentDiv = $(".comment-container");
					commentDiv.text("");
					$.each(responseJson, function(key, value){
						
						var div = '<div class="comment-content">'
									+'<div>'
										+'<img src="<%=request.getContextPath() %>/templates/public/files/' + value["avatar"] + '" width="50px" height="50px">'
									+'</div>'
									+'<div class="comment">'
										+'<a href="#">'+ value["username"] +'</a><span>' + value["date_create"] + '</span>'
										+'<div>'+ value["content"] +'</div>'
										+'<div class="a-comment">'
											+'<a idcomment=' + value["id_comment"] + ' class="likeComment" href="javascript:void(0)">Thích</a>' 
											+'<a auth=<%=auth %> idcomment=' + value["id_comment"] + ' class="deleteComment" href="javascript:void(0)">Xóa</a>'
										+'</div>'
									+'</div>'
								+'</div>';						
						commentDiv.append(div);
						
					})
				} else {
					notAuth();
				}
			},
			error: function (){
				$('#snackbar').attr("type", "error");
				toast("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
	}
	
	$("#likePost").on('click', function (){		
		var idPost = $(".title_post").attr("idpost");
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.LIKE_POST%>',
			type: 'POST',
			cache: false,
			data: {
					aid: idPost,
					},
			success: function(data){
				console.log(data);
				$("#likePost").html(data);
				$("#likePost").toggleClass("active");
			},
			error: function (){
				$('#snackbar').attr("type", "error");
				toast("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
	});
</script>

</body>

</html>