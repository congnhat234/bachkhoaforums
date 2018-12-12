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
	
			<div class="grid_12">
			
				<div class="module">
					 <h2><span>Đổi mật khẩu</span></h2>
					<div class="mainContent">
						<%
						User user = null;
						if (session.getAttribute("user") != null) {
						user = (User) session.getAttribute("user");
						}
						%>

		<form id="changepassword" method="POST"
			action="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>?uid=<%=user.getId_user()%>">
			<fieldset>
				<dl class="ctrlUnit">
					<dt><label for="ctrl_location">Mật khẩu cũ:</label></dt>
					<dd><input type="password" name="oldpassword" value=""/></dd>
				</dl>				
				<dl class="ctrlUnit">
					<dt><label for="ctrl_location">Mật khẩu mới:</label></dt>
					<dd><input type="password" id="password" name="password" value="" /></dd>
				</dl>
				<dl class="ctrlUnit">
					<dt><label for="ctrl_location">Nhập lại mật khẩu mới:</label></dt>
					<dd><input type="password" name="repassword" value="" /></dd>
				</dl>
				<dl>
					<input class="submit-green" type="submit" value="Lưu" />
					<input class="submit-green" name="reset" type="reset" value="Nhập lại" />
				</dl>
				 
			</fieldset>
		</form>
		</div>
	</div>
	</div>
</div>

<%@include file="/templates/public/inc/footer.jsp"%>
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