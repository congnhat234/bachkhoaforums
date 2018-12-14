<%@page import="utils.ConvertString"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp" %>

<%ArrayList<Post> listoutstanding = (ArrayList<Post>) request.getAttribute("listoutstanding"); %>
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
				<li><a href="#">Bài viết theo dõi</a></li>
			</ul>
		</nav>
		
<%@include file="/templates/public/inc/menu.jsp"%>

				<div class="parse">
			<div class="parse-content">
				<%
					if (request.getAttribute("sumPage") != null) {
						int sumPage = (Integer) request.getAttribute("sumPage");
						int current_page = (Integer) request.getAttribute("page");%>
						<span>Trang <%=current_page %>/<%=sumPage %> </span> 
						<%String active = "";%>
						<%
					for (int i = 1; i <= sumPage; i++) {
							if (current_page == i) {
								active = "style='border: none; background: #616161; box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);color: #f0f0f0;text-shadow: 0px 0px 3px rgba(0,0,0, .5)'";
							} else {
								active = "";
							}
				%>
				<a <%=active%> class="page"
					href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>?current_page=<%=i%>"><%=i%></a>
				
				<%
					}
					}
				%>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="contentProfile">                  
			<div class="mainContent">
			<% ArrayList<Post> listpostfl = (ArrayList<Post>) request.getAttribute("listpostfl");
				if(listpostfl.size() > 0) {%>
				<form action="#" class="form-xembaimoi">
					<table id="dynamic-table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="th1"></th>
							<th>Tiêu đề</th>
							<th>Trả lời</th>
							<th>Xem</th>
							<th>Bài viết cuối</th>
						</tr>
						</thead>
						<%
							int [] anwserAmount= (int[]) request.getAttribute("listAmountAnswer");
							String [] lastUser= (String[]) request.getAttribute("listLastUser");
							for(int i=0; i<listpostfl.size();i++){
							String urlPost = "/threads/" + ConvertString.createSlug(listpostfl.get(i).getTitle())+"-"+listpostfl.get(i).getId_post();
						%>
						<tr>
							<td><img src="<%=listpostfl.get(i).getPreview_image()%>" width="30px"height="30px"></td>
							<td class="td1"> <a href="<%=request.getContextPath() %><%=urlPost %>"><%=listpostfl.get(i).getTitle() %></a></td>
							<td><%=anwserAmount[i] %></td>
							<td><%=listpostfl.get(i).getView()%></td>
							<% if("".equals(lastUser[i])) {%><td><a href="#"><%=listpostfl.get(i).getUsername()%></a></td><%}else{%> <td><a href="#"><%=lastUser[i]%></a></td><%} %>
						</tr>
						<%}%>
						
					</table>
				</form>
				<% } else {%>
				<h6 style="margin-left: 25px;">Chưa có bài viết.</h6>
				<%} %>
			</div>
		</div>
	</div>
<%@include file="/templates/public/inc/footer.jsp"%>
<script type="text/javascript">
	$('.status').on('change', function() {
		var self = $(this);
		if($(this).attr("checked")) {
			var idUser = $(self).attr("idUser");
			$.ajax({
				url: '<%=request.getContextPath()%><%=Constants.URL.ENABLE_USER%>',
				type: 'POST',
				cache: false,
				data: {
						aid: idUser,
						},
				success: function(){
					$(self).removeAttr("checked");
					$('#snackbar').attr("type", "success");
					toast("Đã lưu thay đổi!");
				},
				error: function (){
					$('#snackbar').attr("type", "error");
					toast("Có lỗi trong quá trình xử lí");
				}
			});
			return false;
			
		} else {
			var idUser = $(self).attr("idUser");
			$.ajax({
				url: '<%=request.getContextPath()%><%=Constants.URL.ENABLE_USER%>',
				type: 'POST',
				cache: false,
				data: {
						aid: idUser,
						},
				success: function(){
					$(self).attr("checked","");
					$('#snackbar').attr("type", "success");
					toast("Đã lưu thay đổi!");
				},
				error: function (){
					$('#snackbar').attr("type", "error");
					toast("Có lỗi trong quá trình xử lí");
				}
			});
			return false;
			
		}
	});
	</script>
		<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				var myTable = 
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
						{ "bSortable": false },
					  null, null,null, null
					],
					"aaSorting": [],
			
					"iDisplayLength": 10,
			
			
					select: {
						style: 'multi'
					}
			    } );

				$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					
					defaultColvisAction(e, dt, button, config);
					
					
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});

				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});

				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});

			
			})
		</script>
</body>
</html>