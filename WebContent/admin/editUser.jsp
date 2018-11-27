<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa</span></h2>
		 <div class="module-body">
		 <%
			if(request.getAttribute("objUser")!= null){
		 	User objUser = (User)request.getAttribute("objUser");
		 %>
			<form id="editUser" method="POST" action="<%=request.getContextPath() %>/admin/editUser?uid=<%=objUser.getId() %>">
				
				<p>
					<label>Tên người dùng </label>
					<input disabled type="text" name="username" value="<%=objUser.getUsername() %>" class="input-medium" />
					<label>Mật khẩu</label>
					<input type="password" name="password" value="" class="input-medium" />
					<label>Họ và tên</label>
					<input id="fullname" type="text" name="fullname" value="<%=objUser.getFullname() %>" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" type="submit" value="Sửa" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
				
			</form>
			<%} %>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->

<script type="text/javascript">
		var OriginalString = $('#fullname').val();
		var StrippedString = OriginalString.replace(/<\/?[^>]+(>|$)/g, "");
		$('#fullname').text(StrippedString);
	</script>

<%@include file="/templates/admin/inc/footer.jsp" %> 