<%@page import="com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="container">
	<div id="subnav">
		<div class="container_12">
			<div class="grid_12">
				<ul>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>">Bài
							viết</a></li>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>">Danh
							mục</a></li>
					<li><a
						href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>">Người
							dùng</a></li>
				</ul>

			</div>
			<!-- End. .grid_12-->
		</div>
		<!-- End. .container_12 -->
		<div style="clear: both;"></div>
	</div>
	<!-- End #subnav -->
<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách tin</span></h2>
		
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
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
							<%for(int i=0;i<listSub.size();i++ ){%>
										
										  <option  index="<%=i%>" value="<%=listSub.get(i).getId_subject() %>"<% if(objPost.getId_subject()==listSub.get(i).getId_subject()) {%> selected <%  } %>><%=listSub.get(i).getName() %>  </option>
										
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
	
		 <div class="pagination">           
			<div class="numbers">
				<span>Trang:</span> 
				<%
					if(request.getAttribute("sumPage")!=null){
						int sumPage = (Integer) request.getAttribute("sumPage");
						int current_page = (Integer) request.getAttribute("page");
						String active = "";
						if(current_page>1){
				%>
				<a <%=active %> href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>?current_page=<%=current_page-1%>">&lt;</a> 	
				<span>|</span> 
				<%	} %>
				<%
						for(int i=1; i<=sumPage; i++){
							if(current_page == i){
								active = "style='color:red'";
							} else {
								active = "";
							}
				%>
				<a <%=active %> href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>?current_page=<%=i%>"><%=i %></a> 
				<span>|</span> 
				<%}
				if(current_page<sumPage){
				%>
				<a <%=active %> href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>?current_page=<%=current_page+1%>">&gt;</a> 
				<%}}  %>
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
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
		toast("Thêm thành công!");
		</script> 
		<%
	} else
	if(msg == 2){
		out.print("<h5 style='color:red'>Sửa thành công</h5>");
		} else
	if(msg == 3){
		out.print("<h5 style='color:red'>Xóa thành công</h5>");
		}
		else {
		out.print("<h5 style='color:red'>Thất bại</h5>");
	}
}
%>

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
			var index =$(self).attr("index");
			var idListSub = document.getElementsByClassName("changeSub");
			var idSub=idListSub[1].value;
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
					toast("Đã lưu thay đổi! 1");
				},
				error: function (){
					$('#snackbar').attr("type", "error");
					toast("Có lỗi trong quá trình xử lí 1");
				}
			});
			return false;
	});
</script>

</body>

</html>