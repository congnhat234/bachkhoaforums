<%@page import="com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="container">
	<%@include file="/templates/admin/inc/menu.jsp" %>
<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách tin</span></h2>
		
		<div class="module-table-body">
			<form action="">
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th style="width:30%">Tên tin tức</th>
						<th style="width:10%">Danh Mục</th>
						<th style="width:10%; text-align: center;">Hình ảnh</th>
						<th style="width:5%; text-align: center;">Chức năng</th>
						<th style="width:10%; text-align: center;">Trạng thái</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(request.getAttribute("listSub")!=null && request.getAttribute("listPost")!=null ){
					ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
					ArrayList<Subject> listSub = (ArrayList<Subject>) request.getAttribute("listSub");
					if(listPost.size()>0){
					for(Post objPost : listPost){
				%>
					<tr>
						<td class="idPost" class="align-center"><%=objPost.getId_post() %></td>
						<td><a href="<%=request.getContextPath() %><%=Constants.URL.VIEW_POST %>?idp=<%=objPost.getId_post()%>"><%=objPost.getTitle() %></a></td>
						<td>
						
						<select  idPost1="<%=objPost.getId_post()%>" class="changeSub"  >							
							<% 	for(Subject objSub : listSub){%>
										
										  <option value="<%=objSub.getId_subject() %>"<% if(objPost.getId_subject()==objSub.getId_subject()) {%> selected <%  } %>><%=objSub.getName() %>  </option>
										
										<%} %>
						</select>
						</td>
						<td align="center"><img src="<%=request.getContextPath() %>/templates/public/files/post/<%=objPost.getPreview_image() %>" class="hoa" /></td>
						<td align="center">
							<a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="<%=request.getContextPath()%><%=Constants.URL.DELETE_POST%>?del=<%=objPost.getId_post()%>">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
						</td>
						<td align="center">
							<label class="switch">
							<%
							String checked = "";
							if(objPost.getEnable() == 1) checked = "checked"; %>
								  <input idPost="<%=objPost.getId_post() %>" class="status" type="checkbox" <%=checked %>>
								  <span class="slider round"></span>
							</label>
						</td>
					</tr>
				  <%}}} %> 
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
	
</div> <!-- End .grid_12 -->
</div>
<%@include file="/templates/public/inc/footer.jsp" %> 
<%
if(request.getParameter("msg")!=null){
	int msg = Integer.parseInt(request.getParameter("msg"));
	if(msg == 1){
		%>
		<script>
		$('#snackbar').attr("type", "success");
		toast("Xóa thành công!");
		</script> 
		<%}}%>

<script type="text/javascript">
	$('.status').on('change', function() {
		var self = $(this);
		if($(this).attr("checked")) {
			var idPost = $(self).attr("idPost");
			$.ajax({
				url: '<%=request.getContextPath()%><%=Constants.URL.ENABLE_POST%>',
				type: 'POST',
				cache: false,
				data: {
						aid: idPost,
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
			var idPost = $(self).attr("idPost");
			$.ajax({
				url: '<%=request.getContextPath()%><%=Constants.URL.ENABLE_POST%>',
				type: 'POST',
				cache: false,
				data: {
						aid: idPost,
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
	
	$('.changeSub').on('change', function() {
			var self = $(this);
			var idPost = $(self).attr("idPost1");
			var idSub=this.value;
			$.ajax({
				url: '<%=request.getContextPath()%><%=Constants.URL.CHANGE_SUB%>',
				type: 'POST',
				cache: false,
				data: {
						sid: idSub,
						pid: idPost,
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
					
					
					//"bProcessing": true,
			        //"bServerSide": true,
			        //"sAjaxSource": "http://127.0.0.1/table.php"	,
			
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
			
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
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