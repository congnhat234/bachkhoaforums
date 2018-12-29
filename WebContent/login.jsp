<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
	
		<div class="signin_page">
			<form action="<%=request.getContextPath() %><%=Constants.URL.LOGIN %>" class="form_login_page" method="post">
				<h1>Đăng nhập</h1>
				<input placeholder="Tên đăng nhập" type="text" name="username" > 
				<input placeholder="Mật khẩu" type="password" name="password" >
				<button>Đăng nhập</button>
				<br> <br>
				<div class="bottom-text ">
					<p>
						Bạn chưa có tài khoản?<a href="<%=request.getContextPath() %><%=Constants.URL.REGISTER%>">Đăng kí</a>
					</p>
					<h4>
						<a href="<%=request.getContextPath()%><%=Constants.URL.FORGOT_PASSWORD%>">Quên mật khẩu?</a>
					</h4>
				</div>
			</form>
		</div>
<%@include file="/templates/public/inc/footer.jsp"%>
	<%
		if (request.getParameter("msg") != null) {
			String msg = request.getParameter("msg");
			if (msg.equals("1")) {
	%>
	<script>
		$('#snackbar').attr("type", "success");
		toast("Đăng ký thành công!");
	</script>
	<%
		} else if (msg.equals("0")) {
	%>
	<script>
		$('#snackbar').attr("type", "error");
		toast("Sai username hoặc mật khẩu!");
	</script>
	<%} else if (msg.equals("2")) {
		%>
	<script>
		$('#snackbar').attr("type", "success");
		toast("Đã đổi mật khẩu!");
	</script>
		<%}
	}%>
	<script>
	$( document ).ready( function () {
	$( "#form_login" ).validate( {
				rules: {
					username: {
						required: true,
						minlength: 3
					},
					password: {
						required: true,
						minlength: 6
					},
				},
				messages: {
					username: {
						required: "Vui lòng điền vào trường này",
						minlength: "Ít nhất 3 kí tự"
					},
					password: {
						required: "Vui lòng điền vào trường này",
						minlength: "Ít nhất 6 kí tự"
					}
				}
			} );
	} );
	</script>
	</body>
</html>