<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
	
		<div class="signin_page">
			<form action="<%=request.getContextPath() %>/<%=Constants.URL.LOGIN %>" class="form_login_page" method="post">
				<h1>Login</h1>
				<% if(request.getParameter("msg") != null) {
					String msg = (String) request.getParameter("msg");
					if(msg.equals("0")) { %>
				<h4 style="color:red">Sai username hoặc mật khẩu</h4>
				<%}} %>
				<input placeholder="Username" type="text" name="username" required> <input
					placeholder="Password" type="password" name="password" required>
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
	</body>
</html>