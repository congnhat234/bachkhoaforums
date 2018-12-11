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
<!-- End #subnav -->
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm danh mục</span></h2>
		 <div class="mainContent">
			<form id="addCat" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.ADD_SUBJECT%>">
				<fieldset>
					<dl class="ctrlUnit">
						<dt>
						<label>Tên danh mục :</label>
						</dt>
						<dd>
						<input  type="text" id="name" name="newSub" value="" class="input-medium" />
						</dd>
					</dl>
					<dl>
							<input class="submit-green" type="submit" value="Thêm" /> 
							<input class="submit-green" name="reset" type="reset" value="Nhập lại" />
					</dl>
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