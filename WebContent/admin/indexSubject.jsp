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
				</ul>
                
            </div><!-- End. .grid_12-->
        </div><!-- End. .container_12 -->
        <div style="clear: both;"></div>
    </div> <!-- End #subnav -->  
	<div class="bottom-spacing">
		<!-- Button -->
		<div class="float-left">
			<a href="<%=request.getContextPath()%>/admin/show-addCat"
				class="button"> <span>Thêm danh mục </span>
			</a>
		</div>
		<div class="clear"></div>
	</div>
	<%
		if (request.getParameter("msg") != null) {
			int msg = Integer.parseInt(request.getParameter("msg"));
			if (msg == 1) {
				out.print("<h5 style='color:red'>Thêm thành công</h5>");
			} else if (msg == 2) {
				out.print("<h5 style='color:red'>Sửa thành công</h5>");
			} else if (msg == 3) {
				out.print("<h5 style='color:red'>Xóa thành công</h5>");
			} else {
				out.print("<h5 style='color:red'>Thất bại</h5>");
			}
		}
	%>
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
								<th style="width: 20%">Danh mục</th>
								<th style="width: 11%; text-align: center;">Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Subject> listCat = (ArrayList<Subject>) request.getAttribute("listCat");
								if (listCat.size() > 0) {
									for (Subject objCat : listCat) {
							%>
							<tr>
								<td class="align-center"><%=objCat.getId_subject()%></td>
								<td><a href=""><%=objCat.getName()%></a></td>
								<td align="center"><a
									href="<%=request.getContextPath()%>/admin/show-editCat?cid=<%=objCat.getId_subject()%>">Sửa
										<img
										src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif"
										alt="edit" />
								</a> <a onclick="return confirm('Bạn có chắc muốn xóa không?')"
									href="<%=request.getContextPath()%>/admin/delCat?cid=<%=objCat.getId_subject()%>">Xóa
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
		<div class="pagination">
			<div class="numbers">
				<span>Trang:</span>
				<%
					if (request.getAttribute("sumPage") != null) {
						int sumPage = (Integer) request.getAttribute("sumPage");
						int current_page = (Integer) request.getAttribute("page");
						String active = "";
						if (current_page > 1) {
				%>
				<a <%=active%>
					href="<%=request.getContextPath()%>/admin/indexCat?current_page=<%=current_page - 1%>"><<</a>
				<span>|</span>
				<%
					}
				%>

				<%
					for (int i = 1; i <= sumPage; i++) {
							if (current_page == i) {
								active = "style='color:red'";
							} else {
								active = "";
							}
				%>
				<a <%=active%>
					href="<%=request.getContextPath()%>/admin/indexCat?current_page=<%=i%>"><%=i%></a>
				<span>|</span>
				<%
					}
						if (current_page < sumPage) {
				%>
				<a <%=active%>
					href="<%=request.getContextPath()%>/admin/indexCat?current_page=<%=current_page + 1%>">>></a>
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
