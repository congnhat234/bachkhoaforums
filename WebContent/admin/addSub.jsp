<%@page import="model.bean.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<!-- Form elements -->
<div class="container"> 

<%@include file="/templates/admin/inc/menu.jsp" %>
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm danh mục</span></h2>
		 <div class="mainContent">
			<form id="addCat" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.ADD_SUBJECT%>">
				<fieldset>
					<dl class="ctrlUnit">
						<dt>
						<label>Tên danh mục:</label>
						</dt>
						<dd>
						<input  type="text" id="name" name="newSub" value="" class="input-medium" />
						</dd>
					</dl>
						<dl class="ctrlUnit">
						<dt>
						<label>Mô tả danh mục :</label>
						</dt>
						<dd>
						<input  type="text" id="name" name="describeSub" value="" class="input-medium" />
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
		 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("0")) {%>
    	<script>
		$('#snackbar').attr("type", "error");
		toast("Trùng tên danh mục!");
		</script> 
    	<%}} %>
<script>
$( document ).ready( function () {
	$( "#addCat" ).validate( {
		rules: {
			newSub: {
				required: true,
				minlength: 2
			},
			describeSub:{
				required: true,
				minlength: 5
			}
		},
		messages: {
			newSub: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 2 kí tự"
			},
			describeSub: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 5 kí tự"
			}
		}
	} );
} );
</script>