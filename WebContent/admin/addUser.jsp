<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
<%
	if(request.getParameter("msg")!=null){
		int msg = Integer.parseInt(request.getParameter("msg"));
		if(msg == 0){
			out.print("<h5 style='color:red'>Tên người dùng đã tồn tại, vui lòng chọn tên khác!</h5>");
		}
	}
%>
	<div class="module">
		 <h2><span>Thêm người dùng</span></h2>
		 <div class="module-body">
		 
			<form id="addUser" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.ADD_USER%>">
				
				<p>
					<label>Tên người dùng</label>
					<input id="username" type="text" name="username" value="" class="input-medium" />
					<label>Quyền hạn</label>
					<input id="username" type="text" name="role" value="" class="input-medium" />
					<label>Mật khẩu</label>
					<input type="password" name="password" value="" class="input-medium" />
					<label>Họ và tên</label>
					<input id="fullname" type="text" name="fullname" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
				
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->

	<script type="text/javascript">
		var OriginalString = $('#fullname').val();
		var StrippedString = OriginalString.replace(/<\/?[^>]+(>|$)/g, "");
		$('#fullname').text(StrippedString);
		var OriginalString1 = $('#username').val();
		var StrippedString1 = OriginalString1.replace(/<\/?[^>]+(>|$)/g, "");
		$('#username').text(StrippedString1);
	</script>

<%@include file="/templates/public/inc/footer.jsp" %> 