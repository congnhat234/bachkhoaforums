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

<%@include file="/templates/public/inc/menu.jsp"%>

	<div class="mainContent">
		<%
			User user = null;
			if (session.getAttribute("user") != null) {
				user = (User) session.getAttribute("user");
			}
		%>

		<form method="post" id="form_profile" enctype="multipart/form-data"
			action="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">
			<fieldset>
				<dl class="ctrlUnit avatarEditor">
					<dt>
						<label>Hình đại diện:</label>
					</dt>
					<dd>
						<a href="#" class="avatar"> <img id="imgpreview"
							style="width: 100px; height: 100px;"
							src="/save/images/<%=user.getAvatar()%>">
						</a> <br> <input id="imginput" type="file" name="avatar" value=""
							id="" class="textCtrl OptOut">
					</dd>
				</dl>
			</fieldset>
			<fieldset>
				<dl class="ctrlUnit">
					<dt>
						<label for="ctrl_location">Tên:</label>
					</dt>
					<dd>
						<input type="text" name="fullname"
							value="<%=user.getFullname()%>" class="textCtrl OptOut">
					</dd>
				</dl>
				<dl class="ctrlUnit">
					<dt>
						<label>Giới tính:</label>
					</dt>
					<dd>
						<ul style="list-style: none;">
							<%
								if (user.getGender() == 1) {
							%>
							<li><label for="ctrl_gender_male"><input
									type="radio" name="gender" value="1" checked="checked">Nam</label></li>
							<li><label for="ctrl_gender_female"><input
									type="radio" name="gender" value="0"> Nữ</label></li>
							<%
								} else {
							%>
							<li><label for="ctrl_gender_male"><input
									type="radio" name="gender" value="1">Nam</label></li>
							<li><label for="ctrl_gender_female"><input
									type="radio" name="gender" value="0" checked="checked">
									Nữ</label></li>
							<%
								}
							%>
						</ul>
					</dd>
				</dl>

				<dl class="ctrlUnit OptOut">
					<dt>Ngày sinh:</dt>
					<dd>
						<input type="date" name="birthday"
							value="<%=user.getBirthhday()%>" class="textCtrl OptOut">
					</dd>
				</dl>
			</fieldset>
			<fieldset>
				<dl class="ctrlUnit">
					<dt>
						<label for="ctrl_location">Địa Chỉ:</label>
					</dt>
					<dd>
						<input type="text" name="address" value="<%=user.getAddress()%>"
							id="ctrl_location" class="textCtrl OptOut">
					</dd>
				</dl>

				<dl class="ctrlUnit">
					<dt>
						<label for="ctrl_location">Thành phố:</label>
					</dt>
					<dd>
						<input type="text" name="city" value="<%=user.getCity()%>"
							class="textCtrl OptOut">
					</dd>
				</dl>

				<dl class="ctrlUnit">
					<dt>
						<label for="">Số điện thoại:</label>
					</dt>
					<dd>
						<input type="text" name="phone" value="<%=user.getPhone()%>"
							class="textCtrl">
					</dd>
				</dl>
				<dl class="ctrlUnit">
					<dt>
						<label for="">Email:</label>
					</dt>
					<dd>
						<input type="text" name="email" value="<%=user.getEmail()%>"
							class="textCtrl">
					</dd>
				</dl>
			</fieldset>
			<dl class="ctrlUnit submitUnit">
				<dt class=""></dt>
				<dd>
					<input type="submit" name="save" value="Lưu thay đổi"
						class="button">
				</dd>
			</dl>
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
	toast("Đã lưu thay đổi");
</script>
<%
	} else if (msg.equals("0")) {
%>
<script>
	$('#snackbar').attr("type", "error");
	toast("Lỗi!");
</script>
<%
	} else if (msg.equals("3")) {
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

<script>
	$(document).ready(function() {
		$("#form_profile").validate({
			rules : {
				birthday : {
					required : true,
					date : true
				},
				fullname : {
					required : true,
					minlength : 6
				},
				phone : {
					required : true,
					maxlength : 10
				},
				address : {
					minlength : 5
				},
				city : {
					required : true,
					minlength : 5
				},
				/* 	email: {
						required: true,
						email: true
					}, */
				gender : "required"
			},
			messages : {
				birthday : {
					required : "Vui lòng điền vào trường này",
					date : "Vui lòng nhập đúng "
				},
				fullname : {
					required : "Vui lòng điền vào trường này",
					minlength : "Ít nhất 6 kí tự"
				},
				phone : {
					required : "Vui lòng điền vào trường này",
					minlength : "Nhiều nhất 10 kí tự"
				},
				address : {
					minlength : "Ít nhất 5 kí tự"
				},
				city : {
					required : "Vui lòng điền vào trường này",
					minlength : "Ít nhất 5 kí tự"
				},
				/* 	email: {
						required: "Vui lòng điền vào trường này",
						email:"Vui lòng điền đúng email"
					}, */
				gender : "Vui lòng chọn giới tính"
			}
		});

	});
</script>
</body>
</html>