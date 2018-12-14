<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
			<% User user = new User();
			if(request.getAttribute("member")!=null){
				user= (User)request.getAttribute("member");
			}
			%>
		 <div id="signup_page" class="sign_page">
			<form action="<%=request.getContextPath() %>/register" class="register_page" method="post">
            <h1>Đăng kí</h1>
            <fieldset class="row1">
                <legend>Thông tin tài khoản
                </legend>
                <p>
                    <label>Tên đăng nhập *
                    </label>
                    <input type="text" name="username" value="<%=user.getUsername() %>" />
                </p>
                <p>
                    <label>Mật khẩu *
                    </label>
                    <input type="password" name="password" id="password1"  />
                </p>
                <p>
                    <label>Nhập lại mật khẩu *
                    </label>
                    <input type="password" name="repassword"  />
                </p>
            </fieldset>
            <fieldset class="row1">
                <legend>Thông tin cá nhân
                </legend>
                <p>
                    <label>Tên *
                    </label>
                    <input type="text" name="fullname" class="long" value="<%=user.getFullname() %>" />
                </p>
                <p>
                    <label>SĐT *
                    </label>
                    <input type="text" name="phone"  value="<%=user.getPhone() %>"/>
                </p>
                <p>
                    <label>Email *
                    </label>
                    <input type="email" name="email" value="<%=user.getEmail() %>"/>
                </p>
                <p>

                    <label>Giới tính *</label>
                    <input type="radio" name="gender" value="1" />
                    <label class="gender">Nam</label>
                    <input type="radio" name="gender" value="0" />
                    <label class="gender">Nữ</label>

                </p>
                <p>
                    <label>Ngày sinh *
                    </label>
                    <input type="date" name="birthday" />
                </p>
                <p>
                    <label>Địa chỉ *
                    </label>
                    <input type="text" name="address" class="long" value="<%=user.getAddress() %>"/>
                </p>
                <p>
                    <label>Thành phố *
                    </label>
                    <input type="text" name="city" class="long" value="<%=user.getCity() %>"/>
                </p>
            </fieldset>
			 <button class="button">Đăng kí</button>
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