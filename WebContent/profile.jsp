<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>
    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.HOME%>"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Trang cá nhân</a></li>
                </ul>
        </nav>
            <ul class="menu">
                <li class="dropdown">
                    <a href="#" id="dropbutton1" class="dropbtn">Tài Khoản</a>
                    <div  class="dropdown_content"> 
                        <a href="#">Thông báo của bạn</a>
                        <a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_USER%>">Bài viết của bạn</a>
                        <a href="#">Chủ đề theo dõi</a>
                        <a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài viết theo dõi</a>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" id="dropbutton2" class="dropbtn">Tin nhắn</a>
                    <div  class="dropdown_content"> 
                        <a href="#">Xem tin nhắn</a>
                        <a href="#">Tạo tin nhắn mới</a>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" id="dropbutton3" class="dropbtn">Cài đặt</a>
                    <div  class="dropdown_content"> 
                    <a href="#">Thông tin cá nhân</a>
                    <a href="#">Mật khẩu</a>
                    <a href="#">Đăng xuất</a>
                    </div>
                </li>
            </ul>

            <div class="mainContent">
            	<%
            	User user = null;
            	if (session.getAttribute("user") != null) {
            		user = (User) session.getAttribute("user");
            		}%>
            	
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">
                    <fieldset>
                        <dl class="ctrlUnit avatarEditor">
                            <dt><label>Hình đại diện:</label></dt>
                            <dd>                           
                                <a href="#" class="avatar">
                                    <img id="imgpreview" style="width:100px;height:100px;" src="<%=request.getContextPath()%>/templates/public/files/<%=user.getAvatar() %>">
                                </a> <br>
                                <input id="imginput" type="file" name="avatar" value="" id="" class="textCtrl OptOut">
                            </dd>
                        </dl>
                    </fieldset>
                    <fieldset>
                    	<dl class="ctrlUnit">
                            <dt><label for="ctrl_location">Tên:</label></dt>
                            <dd><input type="text" name="fullname" value="<%=user.getFullname() %>" class="textCtrl OptOut"></dd>
                        </dl>
                        <dl class="ctrlUnit">
                            <dt><label>Giới tính:</label></dt>
                            <dd>
                                <ul style="list-style: none;">
                                <%if(user.getGender() == 1) {%>
                                    <li><label for="ctrl_gender_male"><input type="radio" name="gender" value="1" checked="checked">Nam</label></li>
                                    <li><label for="ctrl_gender_female"><input type="radio" name="gender" value="0"> Nữ</label></li>
                                <%} else { %>
                                	<li><label for="ctrl_gender_male"><input type="radio" name="gender" value="1">Nam</label></li>
                                    <li><label for="ctrl_gender_female"><input type="radio" name="gender" value="0" checked="checked"> Nữ</label></li>
                                <%} %>
                                </ul>
                            </dd>
                        </dl>

                        <dl class="ctrlUnit OptOut">
                            <dt>Ngày sinh:</dt>
                            <dd><input type="text" name="birthday" value="<%=user.getBirthhday() %>" class="textCtrl OptOut"></dd>
                        </dl>
                    </fieldset>
                    <fieldset>
                        <dl class="ctrlUnit">
                            <dt><label for="ctrl_location">Địa Chỉ:</label></dt>
                            <dd><input type="text" name="address" value="<%=user.getAddress() %>" id="ctrl_location" class="textCtrl OptOut"></dd>
                        </dl>
						
						<dl class="ctrlUnit">
                            <dt><label for="ctrl_location">Thành phố:</label></dt>
                            <dd><input type="text" name="city" value="<%=user.getCity() %>" class="textCtrl OptOut"></dd>
                        </dl>

                        <dl class="ctrlUnit">
                            <dt>
                                <label for="">Số điện thoại:</label>
                            </dt>
                            <dd>
                                <input type="text" name="phone" value="<%=user.getPhone() %>"  class="textCtrl" maxlength="">                              
                            </dd>
                        </dl>
                        <dl class="ctrlUnit">
                            <dt>
                                <label for="">Email:</label>
                            </dt>
                            <dd>
                                <input type="text" name="email" value="<%=user.getEmail() %>"  class="textCtrl" maxlength="">                              
                            </dd>
                        </dl>
                    </fieldset>
                    <dl class="ctrlUnit submitUnit">
                        <dt class=""></dt>
                        <dd><input type="submit" name="save" value="Lưu thay đổi" class="button"></dd>
                    </dl>
                </form>
            </div>
        </div>
    </div>
    <%@include file="/templates/public/inc/footer.jsp" %>
    <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("1")) {%>
    	<script>
		$('#snackbar').attr("type", "success");
		toast("Đã lưu thay đổi!");
		</script> 
    	<%} else {%>
    	<script>
		$('#snackbar').attr("type", "error");
		toast("Lỗi!");
		</script> 
    	<%}} %>
    <script type="text/javascript">
    	function previewFile() {
    	  var preview = document.getElementById('imgpreview');
    	  var file    = document.getElementById('imginput').files[0];
    	  var reader  = new FileReader();

    	  reader.onloadend = function () {
    	    preview.src = reader.result;
    	  }

    	  if (file) {
    	    reader.readAsDataURL(file);
    	  } else {
    	    preview.src = "";
    	  }
    	}
    	$("#imginput").change(function(){
    	    previewFile();
    	});
    </script>
</body>

</html>