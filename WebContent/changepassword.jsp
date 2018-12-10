<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp"%>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Trang cá nhân</a></li>
		</ul>
	</nav>
	<ul class="menu">
		<li class="dropdown"><a href="#" id="dropbutton1" class="dropbtn">Tài
				Khoản</a>
			<div class="dropdown_content">
				<a href="#">Thông báo của bạn</a> 
				<a href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_BY_USER%>">Bài viết của bạn</a> 
				<a href="#">Chủ đề theo dõi</a> 
				<a href="<%=request.getContextPath()%><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài viết theo dõi</a>
			</div></li>
		<li class="dropdown"><a href="#" id="dropbutton2" class="dropbtn">Tin
				nhắn</a>
			<div class="dropdown_content">
				<a href="#">Xem tin nhắn</a> <a href="#">Tạo tin nhắn mới</a>
			</div></li>
		<li class="dropdown"><a href="#" id="dropbutton3" class="dropbtn">Cài
				đặt</a>
			<div class="dropdown_content">
				<a href="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">Thông tin cá nhân</a> 
				<a href="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>">Mật khẩu</a> 
				<a href="<%=request.getContextPath()%><%=Constants.URL.LOGOUT%>">Đăng xuất</a>
			</div></li>
	</ul>
	<div class="mainContent">
		<%
			User user = null;
			if (session.getAttribute("user") != null) {
				user = (User) session.getAttribute("user");
			}
		%>

		<form id="changepassword" method="POST"
			action="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>?uid=<%=user.getId_user()%>">
			<div>
				<label for="ctrl_location">Mật khẩu cũ:</label> <input
					type="password" name="oldpassword" value="" />
			</div>
			<div>
				<label for="ctrl_location">Mật khẩu mới:</label> <input
					type="password" id="password" name="password" value="" />
			</div>
			<div>
				<label for="ctrl_location">Nhập lại mật khẩu mới:</label> <input
					type="password" name="repassword" value="" />
			</div>
			<fieldset>
				<input class="button" type="submit" value="Lưu" /> <input
					class="button" name="reset" type="reset" value="Nhập lại" />
			</fieldset>
		</form>
	</div>
</div>

<%@include file="/templates/public/inc/footer.jsp"%>
<%
	if (request.getParameter("msg") != null) {
		String msg = request.getParameter("msg");
		if (msg.equals("1")) {
%>
<script>
	$('#snackbar').attr("type", "success");
	toast("Đã lưu thay đổi!");
</script>
<%
	} else if (msg.equals("0")) {
%>
<script>
	$('#snackbar').attr("type", "error");
	toast("Lỗi!");
</script>
<%
	} else if (msg.equals("2")) {
%>
<script>
	$('#snackbar').attr("type", "error");
	toast("Mật khẩu cũ chưa đúng!");
</script>
<%
	}
	}
%>

<script type="text/javascript">
	function previewFile() {
		var preview = document.getElementById('imgpreview');
		var file = document.getElementById('imginput').files[0];
		var reader = new FileReader();

		reader.onloadend = function() {
			preview.src = reader.result;
		}

		if (file) {
			reader.readAsDataURL(file);
		} else {
			preview.src = "";
		}
	}
	$("#imginput").change(function() {
		previewFile();
	});
</script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('defaultOpen').click();
	}
</script>

<script>
	$(document).ready(function() {

		$("#changepassword").validate({
			rules : {
				oldpassword : {
					required : true,
					minlength : 3
				},
				password : {
					required : true,
					minlength : 3
				},
				repassword : {
					required : true,
					minlength : 3,
					equalTo : "#password"
				}
			},
			messages : {
				oldpassword : {
					required : "Vui lòng điền vào trường này",
					minlength : "Ít nhất 3 kí tự"
				},
				password : {
					required : "Vui lòng điền vào trường này",
					minlength : "Ít nhất 3 kí tự"
				},
				repassword : {
					required : "Vui lòng điền vào trường này",
					minlength : "Ít nhất 3 kí tự",
					equalTo : "Vui lòng nhập lại mật khẩu mới"
				}
			}
		});
	});
</script>
</body>
</html>