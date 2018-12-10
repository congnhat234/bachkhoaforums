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
            	
                <form method="post" enctype="multipart/form-data" id="form_profile" action="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>">
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
				<div id="ChangePassword" class="tabcontent">
		 	<div class="module">
		 <h2><span>Đổi mật khẩu</span></h2>
		 <div class="module-body">
			<form id="addCat" method="POST" action="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_USER%>?uid=<%=user.getId_user()%>">
				<div>		
					<label for="ctrl_location">Mật khẩu cũ:</label>
					<input type="password"  name="oldpassword" value=""  />
				</div>
				<div>		
					<label for="ctrl_location">Mật khẩu mới:</label>
					<input type="password"  id="password" name="password" value=""  />
				</div>
				<div>		
					<label for="ctrl_location">Nhập lại mật khẩu mới:</label>
					<input type="password"  name="repassword" value=""  />
				</div>
				<fieldset>
					<input class="button" type="submit" value="Thêm" /> 
					<input class="button" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
            
            
        </div>

    <%@include file="/templates/public/inc/footer.jsp"%>
	<%if(request.getParameter("msg") != null) { 
	    	String msg = request.getParameter("msg");
	    	if(msg.equals("1")) {%>
	    	<script>
			$('#snackbar').attr("type", "success");
			toast("Đã lưu thay đổi!");
			</script> 
	    	<%} else if(msg.equals("0")) {%>
	    	<script>
			$('#snackbar').attr("type", "error");
			toast("Lỗi!");
			</script> 
	    	<%} else if(msg.equals("2")){%>
	    		<script>
	    		$('#snackbar').attr("type", "error");
	    		toast("Mật khẩu cũ chưa đúng!");
	    		</script> 
	    	<%}}%>
    	
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
    <script type="text/javascript">
    window.onload = function(){
		  document.getElementById('defaultOpen').click();
		}
    </script>
    
    <script>
	$( document ).ready( function () {
	$( "#form_profile" ).validate( {
		rules: {
			birthday: {
				 required: true,
			     date: true
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
		/* 	email: {
				required: true,
				email: true
			}, */
			gender: "required"
		},
		messages: {
			birthday: {
				required: "Vui lòng điền vào trường này",
				date: "Vui lòng nhập đúng "
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
		/* 	email: {
				required: "Vui lòng điền vào trường này",
				email:"Vui lòng điền đúng email"
			}, */
			gender: "Vui lòng chọn giới tính"
		}
	} );
	
	$( "#addCat" ).validate( {
		rules: {
			oldpassword: {
				required: true,
				minlength: 3
			},
			password: {
				required: true,
				minlength: 3
			},
			repassword: {
				required: true,
				minlength: 3,
				equalTo: "#password"
			}
		},
		messages: {
			oldpassword: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 3 kí tự"
			},
			password: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 3 kí tự"
			},
			repassword: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 3 kí tự",
				equalTo: "Vui lòng nhập lại mật khẩu mới"
			}
		}
	} );
	} );
</script>
</body>
</html>