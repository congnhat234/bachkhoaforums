<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
	
		<div class="signin_page">
			<form action="<%=request.getContextPath() %><%=Constants.URL.LOGIN %>" class="form_login_page" id="form_login" method="post">
				<h1>Login</h1>
				<% if(request.getParameter("msg") != null) {
					String msg = (String) request.getParameter("msg");
					if(msg.equals("0")) { %>
				<h4 style="color:red">Sai username hoặc mật khẩu</h4>
				<%}} %>
				<input placeholder="Username" type="text" name="username" > <input
					placeholder="Password" type="password" name="password" >
				<button>Submit</button>
				<br> <br>
				<div class="bottom-text ">
					<p>
						No account yet?<a href="#singup">Signup</a>
					</p>
					<h4>
						<a href="#">Forgot your password?</a>
					</h4>
				</div>
			</form>
		</div>
<%@include file="/templates/public/inc/footer.jsp"%>
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