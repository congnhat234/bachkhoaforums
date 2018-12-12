<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
			<% User user = new User();
			if(request.getAttribute("member")!=null){
				user= (User)request.getAttribute("member");
			}
			%>
		 <div id="signup_page" class="signup_page">
			<form action="<%=request.getContextPath() %>/register" class="register_page"  id="register_page" method="post">
            <h1>Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>Username *
                    </label>
                    <input type="text" name="username" value="<%=user.getUsername() %>" />
                </p>
                <p>
                    <label>Password*
                    </label>
                    <input type="password" name="password" id="password1"  />
                </p>
                <p>
                    <label>Repeat Password*
                    </label>
                    <input type="password" name="repassword"  />
                </p>
            </fieldset>
            <fieldset class="row1">
                <legend>Personal Details
                </legend>
                <p>
                    <label>Name *
                    </label>
                    <input type="text" name="fullname" class="long" value="<%=user.getFullname() %>" />
                </p>
                <p>
                    <label>Phone *
                    </label>
                    <input type="text" name="phone"  value="<%=user.getPhone() %>"/>
                </p>
                <p>
                    <label>Email *
                    </label>
                    <input type="email" name="email" value="<%=user.getEmail() %>"/>
                </p>
                <p>

                    <label>Gender *</label>
                    <input type="radio" name="gender" value="1" />
                    <label class="gender">Male</label>
                    <input type="radio" name="gender" value="0" />
                    <label class="gender">Female</label>

                </p>
                <p>
                    <label>Birthdate *
                    </label>
                    <select name="day" class="day">
                    </select>
                    <select name="month" class="month">
                    </select>
                    <select name="year" class="year">
                    </select>
                </p>
                <p>
                    <label>Address *
                    </label>
                    <input type="text" name="address" class="long" value="<%=user.getAddress() %>"/>
                </p>
                <p>
                    <label>City *
                    </label>
                    <input type="text" name="city" class="long" value="<%=user.getCity() %>"/>
                </p>
            </fieldset>

            <div><button class="button">Register</button></div>
        </form>
		</div>
<%@include file="/templates/public/inc/footer.jsp"%>
		<%
		if (request.getParameter("msg") != null) {
			String msg = request.getParameter("msg");
		 if (msg.equals("0")) {
	%>
	<script>
		$('#snackbar').attr("type", "error");
		toast("Trùng username!");
	</script>
	<%	}}%>
	<% if(request.getAttribute("member")==null){ %>
	<script type="text/javascript">
		$('input').attr("value","");
	</script>
	<%}%>
	<script>
	$( document ).ready( function () {
		$( "#register_page" ).validate( {
			rules: {
				username: {
					required: true,
					minlength: 3
				},
				password: {
					required: true,
					minlength: 6
				},
				repassword: {
					required: true,
					minlength: 6,
					equalTo: "#password1"
				},
				fullname: {
					required: true,
					minlength: 6
				},
				phone: {
					required: true,
					maxlength: 10
				},
				address: {
					minlength: 5
				},
				city: {
					required: true,
					minlength: 5
				},
				email: {
					required: true,
					email: true
				},
				gender: "required",
			},
			messages: {
				username: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 3 kí tự"
				},
				password: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 6 kí tự"
				},
				fullname: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 6 kí tự"
				},
				phone: {
					required: "Vui lòng điền vào trường này",
					minlength: "Nhiều nhất 10 kí tự"
				},
				address: {
					minlength: "Ít nhất 5 kí tự"
				},
				city: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 5 kí tự"
				},
				repassword: {
					required: "Vui lòng điền vào trường này",
					minlength: "Ít nhất 6 kí tự",
					equalTo: "Vui lòng nhập lại 1"
				},
				email: "Vui lòng điền đúng email",
				gender: "Vui lòng chọn giới tính"
			}
		} );
	} );
	</script>
	</body>
</html>