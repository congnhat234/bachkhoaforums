<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp"%>
<div class="container">
	<%@include file="/templates/admin/inc/menu.jsp" %>
	<div class="bottom-spacing">
		<!-- Button -->
		<div class="float-left">
			<a href="<%=request.getContextPath()%><%=Constants.URL.ADD_USER%>"
				class="button_add"> <span>Thêm người dùng </span>
			</a>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2>
				<span>Danh sách người dùng</span>
			</h2>
			<div class="module-table-body">
				<form action="">

					<table id="dynamic-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 5%; text-align: center;">ID</th>
								<th style="width: 20%">Tên đăng nhập</th>
								<th style="width: 35%">Họ và tên</th>
								<th style="width: 5%; text-align: center;">Sửa</th>
								<th style="width: 5%; text-align: center;">Xóa</th>
								<th style="width: 25%; text-align: center;">Khóa</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<User> listUsers = (ArrayList<User>) request.getAttribute("listUsers");
								if (listUsers.size() > 0) {

									for (User objUser : listUsers) {
										String urlUser = "/user/" + objUser.getUsername() +"-"+ objUser.getId_user();
							%>
							<tr>
								<td align="center"><%=objUser.getId_user()%></td>
								<td align="center"><a href="<%=request.getContextPath()%><%=urlUser%>"><%=objUser.getUsername()%></a></td>
								<td align="center"><%=objUser.getFullname()%></td>
								<td align="center">
									<%
										if (session.getAttribute("user") != null) {
											User userInfo = (User) session.getAttribute("user");
											if (userInfo.getId_role() == 1  ) {
									%> <a
									href="<%=request.getContextPath()%><%=Constants.URL.EDIT_USER %>?uid=<%=objUser.getId_user()%>">
										<img
										src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif"
										alt="edit" />
								</a> 
								</td>
								
								<%
 									}
								%>
 								
 								<td align="center">
 								<%if(userInfo.getId_role()==1 && objUser.getId_user()!=userInfo.getId_user()){ %>
 								<a onclick="return confirm('Bạn có chắc muốn xóa không?')"
									href="<%=request.getContextPath()%><%=Constants.URL.DELETE_USER%>?uid=<%=objUser.getId_user()%>">
										<img
										src="<%=request.getContextPath()%>/templates/admin/images/bin.gif"
										width="16" height="16" alt="delete" />
								</a> 
								<%} %>
								</td>
								<td align="center">
								<%if(userInfo.getId_role()==1 && objUser.getId_user()!=userInfo.getId_user()){ %>
								<label class="switch">
									<%
									String checked = "";
									if(objUser.getEnabled() == 1) checked = "checked"; %>
										  <input idUser="<%=objUser.getId_user() %>" class="status" type="checkbox" <%=checked %>>
								  <span class="slider round"></span>
								</label>
								<%
								}	
								 	}
								 %>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</form>
			</div>
			<!-- End .module-table-body -->
		</div>
		<!-- End .module -->
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

	</div>
	<!-- End .grid_12 -->
</div>
<%@include file="/templates/public/inc/footer.jsp"%>
	 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("1")) {%>
    	<script>
		$('#snackbar').attr("type", "success");
		toast("Thêm Thành công!");
		</script> 
    	<%}else if(msg.equals("2")){%>
    		 <script>
		$('#snackbar').attr("type", "success");
		toast("Xóa thành công!");
		</script> 
    	<%}}%>
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
					  null,
					  null, null,null, null,
					  { "bSortable": false }
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
