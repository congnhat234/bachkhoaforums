<%@page import="utils.ConvertString"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="model.bo.SubjectBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp"%>

<%
	ArrayList<Post> listoutstanding = (ArrayList<Post>) request.getAttribute("listoutstanding"); 
	ArrayList<Post> listpost = (ArrayList<Post>) request.getAttribute("listpost");
	User user = (User) session.getAttribute("user");
%>
<aside class="sidebar-right">
	<div class="latest-blog-posts">
		<h3>
			<i class="fa fa-rss"></i> Sôi động trong tuần
		</h3>
		<ul>
			<%if(listoutstanding!=null) %>
			<%for(Post post : listoutstanding) {
                String urlPost = "/threads/" + ConvertString.createSlug(post.getTitle()) + "-" + post.getId_post();%>
			<li><a href="<%=request.getContextPath() %><%=urlPost %>"><%=post.getTitle() %></a>
				<span><%=post.getDate_create() %></span></li>
			<%}%>
		</ul>

	</div>

</aside>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Bài viết của bạn</a></li>
		</ul>
	</nav>
	<!-- <div class="social">
		<a href="#" class=""><i style="font-size: 40px;"class="fab fa-facebook-square "></i></a> 
		<a href="#" class=""><i style="font-size: 40px;" class="fab fa-twitter-square "></i></a>
	</div> -->

	
	<%@include file="/templates/public/inc/menu.jsp"%>
	
	<div class=parse>           
			<div class="parse-content">
				
				<%
					if(request.getAttribute("sumPage")!=null){
						int sumPage = (Integer) request.getAttribute("sumPage");
						if(sumPage!=0){
						int current_page = (Integer) request.getAttribute("page");%>
						<span>Trang <%=current_page %>/<%=sumPage %> </span> 
						<%String active = ""; %>
				<%
						for(int i=1; i<=sumPage; i++){
							if(current_page == i){
								active = "style='border: none; background: #616161; box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);color: #f0f0f0;text-shadow: 0px 0px 3px rgba(0,0,0, .5)'";
							} else {
								active = "";
							}
				%>
				<a <%=active %> class="page" href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_USER%>?current_page=<%=i%>"><%=i %></a> 
				
				<%}}}  %>
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	<%
		if (listpost != null) {
	%>
<!--<div class="labeltopic">
	 <a href=""><%=user.getUsername() %></a><br>
		<p>Khu vực thảo luận về thông tin và các sự kiện về công nghệ</p>
	</div>
-->
	<%
		for (int i = 0; i < listpost.size(); i++) {
			String urlPost = "/threads/" + ConvertString.createSlug(listpost.get(i).getTitle())+"-"+listpost.get(i).getId_post();
			String urlAuth = "/user/" + listpost.get(i).getUsername()+"-"+listpost.get(i).getId_user();
	%>

	<div class="topic" id="<%=listpost.get(i).getId_post()%>">
		<div class="writer"> 
			<i class="fas fa-comments fa-sm"
			style="font-size: 40px;"></i> <a
			href="<%=request.getContextPath()%><%=urlPost%>"
			style="color: #103667; font-weight: bold;"> <%=listpost.get(i).getTitle()%></a>
			<br>
			<div class="amount">
				<dl>
					<dt>
						<a id="author" href="<%=request.getContextPath()%><%=urlAuth%>"><%=listpost.get(i).getUsername()%></a>
					</dt>
					<dd><%=listpost.get(i).getDate_create()%></dd>
				</dl>
			</div>
		</div>
		<p class="news">
		"<%=listpost.get(i).getPreview_content() %>"
		<br>
		<span style="font-size: 10px; color: #6d6c6c; font-style: italic;">Lượt xem: <%=listpost.get(i).getView() %></span>
		</p>
			<ul class="menu1">
			<li  class="dropdown">
			 <a href="#" class=""><i class="fas fa-ellipsis-v"></i></a>
				<div class="dropdown_content">
					<a href="<%=request.getContextPath()%><%=Constants.URL.EDIT_POST_BY_USER%>?idp=<%=listpost.get(i).getId_post()%>">Sửa bài viết</a> 
					<a class="delete_post" idpost=<%=listpost.get(i).getId_post()%> href="javascript:void(0)">Xóa bài viết</a> 
				</div>
			</li>
			</ul>
		 
	</div>
	
	<hr class="linetopic">
	<%
		}
		} else {
	%>
	<h6 style="margin-left: 25px;">Chưa có bài viết.</h6>
	<%} %>
</div>
<%@include file="/templates/public/inc/footer.jsp" %> 
		 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("0")) {%>
    	<script>
		$('#snackbar').attr("type", "error");
		toast("Không thành công!");
		</script> 
    	<%}else if(msg.equals("1")) {%>
    		<script>
    		$('#snackbar').attr("type", "success");
    		toast("Xóa thành công!");
    		</script> 
    		<%}else if(msg.equals("2")) {%>
    		<script>
    		$('#snackbar').attr("type", "success");
    		toast("Sửa thành công!");
    		</script> 
    		 <%}}%>
    		 
    <script type="text/javascript">
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
        deletePost($thisDom); //function delete post
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
	jQuery('body').on('click', '.delete_post', function (){
			Confirm('Xóa bình luận', 'Bạn có chắc muốn xóa?', 'Xóa', 'Hủy', $(this));		
	});
	
    function deletePost($thisDom) {
		var idPost = $(".delete_post").attr("idpost");
		var user= 1;
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.DELETE_POST%>',
			type: 'GET',
			cache: false,
			data: {
					del: idPost,
					user: user,
					},
			success: function(responseJson){
				$("#"+idPost).css("display", "none");
				$('#snackbar').attr("type", "success");
				toast("Xóa thành công");
			},
			error: function (){
				$('#snackbar').attr("type", "error");
				toast("Có lỗi trong quá trình xử lí");
			}
		});
		return false;
	}
    </script>
	</body>
	
</html>
