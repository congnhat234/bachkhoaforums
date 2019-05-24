<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>

<div class="container"> 

<%@include file="/templates/admin/inc/menu.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Thêm người dùng</span></h2>
		 <div class="mainContent">		 
			<form id="addUser" class="form_addUser" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.ADD_USER%>">				
				<fieldset>
					<dl class="ctrlUnit">
						<dt>
						<label>Tên người dùng</label>
						</dt>
						<dd>
						<input id="username" type="text" name="username" value="" class="input-medium" />
						</dd>
					</dl>
					<dl class="ctrlUnit">
						<dt>
						<label>Quyền hạn</label>
						</dt>	
						<dd>			
				    	 <select  name="role" class="input-medium">
				     	<option  value="1">1.Admin </option>
				     	<option  value="2">2.Mod</option>
				     	<option  value="3">3.User </option>
					 	</select>
						</dd>
					</dl>
					<dl class="ctrlUnit">
						<dt>
						<label>Mật khẩu</label>
						</dt>
						<dd>
						<input type="password" name="password" value="" class="input-medium" />
						</dd>
					</dl>
					<dl class="ctrlUnit">
						<dt><label>Họ và tên</label></dt>
						<dd><input id="fullname" type="text" name="fullname" value="" class="input-medium" /></dd>
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
		toast("Tên đã sử dụng!");
		</script> 
    	<%}} %>
<script>
$( document ).ready( function () {
	$( "#addUser" ).validate( {
		rules: {
			username: {
				required: true,
				minlength: 2
			},
			role: {
				required: true
			},
			password: {
				required: true,
				minlength: 3
			},
			fullname: {
				required: true,
				minlength: 5
			}
		},
		messages: {
			username: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 2 kí tự"
			},
			role: {
				required: "Vui lòng chọn quyền",
			},
			password: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 3 kí tự"
			},
			fullname: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 5 kí tự"
			}
		}
	} );
} );
</script>