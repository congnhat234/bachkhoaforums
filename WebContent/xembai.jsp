<%@page import="model.bean.LikeComment"%>
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
				<% if (session.getAttribute("user") != null && request.getAttribute("followedByUser")!=null ) 
				if((int)request.getAttribute("followedByUser") == 0){%>
				<h3><button id="btnFollow" type="button"> Theo dõi </button></h3>	
				<%} else {%>
					<h3><button id="btnFollow" type="button">Đã theo dõi </button></h3>	
				<% }%>
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
					ArrayList<LikeComment> listLikedComment= (ArrayList<LikeComment>) request.getAttribute("listLikedComment");
					String auth = "";
					int idUser = 0;
					if (session.getAttribute("user") != null) {
						User user = (User) session.getAttribute("user");
						idUser = user.getId_user();
					}
					for(int i=0;i<listComment.size();i++){
						int count = 0;
						boolean checkLike = false;
						for(int j = 0; j < listLikedComment.size(); j++) {
							if(listLikedComment.get(j).getId_comment() == listComment.get(i).getId_comment()) {
								count++;
								if(idUser != 0) {
									if(idUser == listLikedComment.get(j).getId_user()) checkLike = true;
								}
							}
						}%>
				
				<div class="comment-content">
					<div>
						<img src="<%=request.getContextPath() %>/templates/public/files/<%=listComment.get(i).getAvatar() %>" width="50px" height="50px">
					</div>
					<div class="comment">
						<a href="<%=request.getContextPath()%><%=Constants.URL.PROFILEMEMBER%>?idUC=<%=listComment.get(i).getId_user()%>"><%=listComment.get(i).getUserName()%></a><span><%=listComment.get(i).getDate_create() %></span>
						<div><%=listComment.get(i).getContent()%></div>
						
						
						<div class="a-comment">
							<%if(checkLike == true) { %>
							<a idcomment=<%=listComment.get(i).getId_comment()%> class="likeComment active" href="javascript:void(0)"><%=count %> Thích</a> 
							<%} else {%>
							<a idcomment=<%=listComment.get(i).getId_comment()%> class="likeComment" href="javascript:void(0)"><%=count %> Thích</a>
							<%} %>
							<% if (session.getAttribute("user") != null) {
								User user = (User) session.getAttribute("user");
								if (user.getId_role() == 1 || user.getId_role() == 2 || user.getId_user() == listComment.get(i).getId_user()) {
									auth = "true";
								} else {
									auth = "false";
								}
							%>
							<a auth=<%=auth %> idcomment=<%=listComment.get(i).getId_comment()%> class="deleteComment" href="javascript:void(0)">Xóa</a>
							<%} %>						
						</div>
						
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
		
		var cmt = CKEDITOR.instances.editor.getData();; 
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
					<%int i = 0;%>
					$.each(responseJson, function(key, value){
					<%
						int count = 0;
						boolean checkLike = false;
						for(int j = 0; j < listLikedComment.size(); j++) {
							if(listLikedComment.get(j).getId_comment() == listComment.get(i).getId_comment()) {
								count++;
								if(idUser != 0) {
									if(idUser == listLikedComment.get(j).getId_user()) checkLike = true;
								}
							}
						}
						if(i<listComment.size()-1) i++;
					%>	
					<%if(checkLike == true) { %>
					var str = '<a idcomment=' + value["id_comment"] + ' class="likeComment active" href="javascript:void(0)">' + <%=count %> + ' Thích</a>'; 
					<%} else {%>
					var str = '<a idcomment=' + value["id_comment"] + ' class="likeComment" href="javascript:void(0)">' + <%=count %> + ' Thích</a>'; 
					<%} %>
						var div = '<div class="comment-content">'
									+'<div>'
										+'<img src="<%=request.getContextPath() %>/templates/public/files/' + value["avatar"] + '" width="50px" height="50px">'
									+'</div>'
									+'<div class="comment">'
										+'<a href="#">'+ value["username"] +'</a><span>' + value["date_create"] + '</span>'
										+'<div>'+ value["content"] +'</div>'
										+'<div class="a-comment">'
											+ str 
											+'<a auth=<%=auth %> idcomment=' + value["id_comment"] + ' class="deleteComment" href="javascript:void(0)">Xóa</a>'
										+'</div>'
									+'</div>'
								+'</div>';
						commentDiv.append(div);
					})
				}
				CKEDITOR.instances.editor.setData("");
				$('img').on('load', function(e){
				    
				}).on('error', function(e) {
				    $(this).attr('src', '/forumproject/files/noimage.jpg');
				});
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
					<%i = 0;%>
					$.each(responseJson, function(key, value){
						<%
						count = 0;
						checkLike = false;
						for(int j = 0; j < listLikedComment.size(); j++) {
							if(listLikedComment.get(j).getId_comment() == listComment.get(i).getId_comment()) {
								count++;
								if(idUser != 0) {
									if(idUser == listLikedComment.get(j).getId_user()) checkLike = true;
								}
							}
						}
						if(i<listComment.size()-1) i++;
						%>	
						<%if(checkLike == true) { %>
						var str = '<a idcomment=' + value["id_comment"] + ' class="likeComment active" href="javascript:void(0)">' + <%=count %> + ' Thích</a>'; 
						<%} else {%>
						var str = '<a idcomment=' + value["id_comment"] + ' class="likeComment" href="javascript:void(0)">' + <%=count %> + ' Thích</a>'; 
						<%} %>
						var div = '<div class="comment-content">'
									+'<div>'
										+'<img src="<%=request.getContextPath() %>/templates/public/files/' + value["avatar"] + '" width="50px" height="50px">'
									+'</div>'
									+'<div class="comment">'
										+'<a href="#">'+ value["username"] +'</a><span>' + value["date_create"] + '</span>'
										+'<div>'+ value["content"] +'</div>'
										+'<div class="a-comment">'
											+ str
											+'<a auth=<%=auth %> idcomment=' + value["id_comment"] + ' class="deleteComment" href="javascript:void(0)">Xóa</a>'
										+'</div>'
									+'</div>'
								+'</div>';						
						commentDiv.append(div);
						
					});
					$('img').on('load', function(e){
					    
					}).on('error', function(e) {
					    $(this).attr('src', '/forumproject/files/noimage.jpg');
					});
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
	
	$("#btnFollow").on('click', function (){	
		alert("click");
		var idPost = $(".title_post").attr("idpost");
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.FOLLOW_POST%>',
			type: 'POST',
			cache: false,
			data: {
					aid: idPost,
					},
			success: function(data){
				console.log(data);
				$("#btnFollow").html(data);
				$("#btnFollow").toggleClass("active");
			},
			error: function (){
				$('#snackbar').attr("type", "error");
				toast("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
	});
	
	$(".likeComment").on('click', function (){	
		<%if(session.getAttribute("user") != null) {%>
		var self = $(this);
		var idComment = $(self).attr("idcomment");
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.LIKE_COMMENT_POST%>',
			type: 'POST',
			cache: false,
			data: {
					aidcomment: idComment,
					},
			success: function(data){
				console.log(data);
				$(self).html(data);
			},
			error: function (){
				$('#snackbar').attr("type", "error");
				toast("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
		<%}%>
	});
	</script>	
</body>

</html>