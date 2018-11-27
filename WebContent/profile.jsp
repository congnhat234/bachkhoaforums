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
        <div class="titleBar">
            <h2>Thông tin cá nhân</h2>
        </div>
        <div class="content">
            <div class="navigationSlideBar">
                <h4>Tài khoản</h4>
                <ul class="list-group">
                    <li class="list-group-item">
                        <ul>
                            <li><a href="#">Thông báo của bạn</a></li>
                            <li><a href="#">Chủ đề theo dõi</a></li>
                            <li><a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_FOLLOW_USER%>">Bài viết theo dõi</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h4>Tin nhắn</h4>
                        <ul>
                            <li><a href="#">Xem tin nhắn</a></li>
                            <li><a href="#">Tạo tin nhắn mới</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h4>Cài đặt</h4>
                        <ul>
                            <li><a href="#">Thông tin cá nhân</a></li>
                            <li><a href="#">Mật khẩu</a></li>
                            <li><a href="#">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="mainContent">
            	<%if(request.getParameter("msg") != null) { 
            	String msg = request.getParameter("msg");
            	if(msg.equals("1")) {%>
            	<h4 style="color:red">Đã lưu thay đổi</h4>
            	<%} else {%>
            	<h4 style="color:red">Lỗi</h4>
            	<%}} %>
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
                                    <img style="width:100px;height:100px;" src="<%=request.getContextPath() %>/templates/public/files/<%=user.getAvatar() %>">
                                </a> <br>
                                <input type="file" name="avatar" value="" id="" class="textCtrl OptOut">
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
</body>

</html>