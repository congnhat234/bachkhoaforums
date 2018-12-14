<%@page import="model.bean.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp"%>
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
					<li><a href="#">Tin nhắn</a></li>
				</ul>
                
            </div><!-- End. .grid_12-->
        </div><!-- End. .container_12 -->
        <div style="clear: both;"></div>
    </div> <!-- End #subnav -->  
	<div class="bottom-spacing">
		<!-- Button -->
		<div class="float-left">
			<a href="<%=request.getContextPath()%><%=Constants.URL.ADD_SUBJECT%>"
				class="button_add"> <span>Thêm danh mục </span>
			</a>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2>
				<span>Danh mục tin</span>
			</h2>

			<div class="module-table-body">
				<form action="">
					<table id="myTable" class="tablesorter">
						<thead>
							<tr>
								<th style="width: 4%; text-align: center;">ID</th>
								<th style="width: 60%">Danh mục</th>
								<th style="width: 5%; text-align: center;">Sửa</th>
								<th style="width: 5%; text-align: center;">Xóa</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Subject> listSub = (ArrayList<Subject>) request.getAttribute("listSub");
								if (listSub.size() > 0) {
									for (Subject objSub : listSub) {
							%>
							<tr>
								<td class="align-center"><%=objSub.getId_subject()%></td>
								<td><a href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_SUBJECT %>?sub=<%=objSub.getId_subject()%>"><%=objSub.getName()%></a></td>
								<td align="center"><a
									href="<%=request.getContextPath()%><%=Constants.URL.EDIT_SUBJECT %>?cid=<%=objSub.getId_subject()%>">
										<img
										src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif"
										alt="edit" />
								</a> 
								</td>
								<td align="center">
								<a onclick="return confirm('Bạn có chắc muốn xóa không?')"
									href="<%=request.getContextPath()%><%=Constants.URL.DELETE_SUBJECT %>?del=<%=objSub.getId_subject()%>">
										<img
										src="<%=request.getContextPath()%>/templates/admin/images/bin.gif"
										width="16" height="16" alt="delete" />
								</a></td>
							</tr>
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
					href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT %>?current_page=<%=i%>"><%=i%></a>
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
		toast("Thành công!");
		</script> 
    	<%}else if(msg.equals("2")){%>
    		 <script>
		$('#snackbar').attr("type", "success");
		toast("Xóa thành công!");
		</script> 
    	<%}}%>

