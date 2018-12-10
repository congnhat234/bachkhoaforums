<%@page import="model.bean.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<!-- Form elements -->    
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
<div class="grid_12">
	<div class="module">
		 <h2><span>Sửa danh mục</span></h2>
		 <div class="module-body">
		 <% Subject sub = (Subject) request.getAttribute("nameSub"); %>
			<form id="addCat" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.EDIT_SUBJECT%>?cid=<%=sub.getId_subject()%>">
				<div class="content_addPost">
					<div class="row_addPost">					
					<label>Tên danh mục:</label>
					<input class="row_input" type="text" id="name" name="newSub" value="<%=sub.getName() %>" class="input-medium" />
					</div>
				</div>	
				<fieldset>
					<input class="submit-green" type="submit" value="Sửa" /> 
					<input class="submit-green" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
</div>

<%@include file="/templates/public/inc/footer.jsp" %> 
<script>
$( document ).ready( function () {
	$( "#addCat" ).validate( {
		rules: {
			newSub: {
				required: true,
				minlength: 2
			}
		},
		messages: {
			newSub: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 2 kí tự"
			}
		}
	} );
} );
</script>