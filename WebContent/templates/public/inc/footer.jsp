<%@page import="model.bean.User"%>
<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="snackbar" type="success">Some text some message..</div>
    <button onclick="topFunction()" id="btnBackToTop" title="Go to top"><i class="fas fa-arrow-up"></i></button>
	
    <footer class="footer-distributed">

        <div class="footer-right">

            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>

        </div>

        <div class="footer-left">

            <p class="footer-links">
                <a href="#">Trang chủ</a>
                ·
                <a href="#">Giới thiệu</a>
                ·
                <a href="#">Liên hệ</a>
            </p>

            <p>BackKhoa Forum &copy; 2018</p>
        </div>

    </footer>
	
	<%if(session.getAttribute("user") == null) { %>
    <div id="signin" class="signin">
        <form action="<%=request.getContextPath() %><%=Constants.URL.LOGIN %>" class="form_login" id="form_login" method="post">
            <h1>Đăng nhập</h1>
            <input placeholder="Tên đăng nhập" name="username" type="text" >
            <input placeholder="Mật khẩu" name="password" type="password" >
            <button>Đăng nhập</button>
            <br><br>
            <div class="bottom-text ">
                <p>Bạn chưa có tài khoản?<a href="<%=request.getContextPath() %><%=Constants.URL.REGISTER %>">Đăng kí</a></p>
                <h4> <a href="<%=request.getContextPath()%><%=Constants.URL.FORGOT_PASSWORD%>">Quên mật khẩu?</a></h4>
            </div>
        </form>
    </div>

    <div id="signup" class="signup">
        <form action="<%=request.getContextPath() %><%=Constants.URL.REGISTER %>" class="register"  id="register" method="post">
            <h1>Đăng kí</h1>
            <fieldset class="row1">
                <legend>Thông tin tài khoản
                </legend>
                <p>
                    <label>Tên đăng nhập *
                    </label>
                    <input type="text" name="username"  />
                </p>
                <p>
                    <label>Mật khẩu *
                    </label>
                    <input type="password" name="password" id="password"  />
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
                    <input type="text" name="fullname" class="long" />
                </p>
                <p>
                    <label>SĐT *
                    </label>
                    <input type="text" name="phone"  />
                </p>
                <p>
                    <label>Email *
                    </label>
                    <input type="email" name="email" />
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
                    <input type="date" name="birthday"  />
                </p>
                <p>
                    <label>Địa chỉ *
                    </label>
                    <input type="text" name="address" class="long" />
                </p>
                <p>
                    <label>Thành phố *
                    </label>
                    <input type="text" name="city" class="long" />
                </p>
            </fieldset>

            <div><button class="button">Đăng kí</button></div>
        </form>
    </div>
    <%} %>
    <%
     	User userProfile = new User();
        if (session.getAttribute("user") != null) {
        	userProfile = (User) session.getAttribute("user");
        %>
    <div id="profile" class="profile_wrap">
        <div class="profile">
            <div class="profile_header">
                <div class="image">
                    <img src="/save/images/<%=userProfile.getAvatar()%>">
                </div>
                <div class="infor">
                    <p class="username"><%=userProfile.getUsername()%></p>
                    <p class="level">Điểm: <%=userProfile.getRate() %></p>
                </div>
            </div>
            <div class="profile_content">
                <div class="element">
                    <ul>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.PROFILE%>">Thông tin cá nhân</a></li>
                        <%if(userProfile.getId_role() == 1) { %>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.ADMIN_HOME%>">Trang quản trị</a></li>
                        <%} %>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.SENDMESSAGE%>">Viết tin nhắn</a></li>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.CHANGE_PASS_USER%>">Mật khẩu</a></li>
                    </ul>
                </div>
                <div class="element">
                    <ul>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.MESSAGE%>">Tin nhắn</a><span id ="mess"></span></li>
                        <li ><a  href="<%=request.getContextPath() %><%=Constants.URL.NOTIFICATION_PAGE%>">Thông báo</a><span id ="notification"></span></li>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.SHOW_POST_BY_USER%>">Nội dung của bạn</a></li>
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.LOGOUT%>">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <% } %>    
    <script src="<%=request.getContextPath() %>/templates/public/js/basic.js"></script>
    <script src="<%=request.getContextPath() %>/templates/admin/js/admin.js"></script>
    <script src=" <%=request.getContextPath() %>/templates/admin/js/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/js/js/jquery.dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/js/js/dataTables.buttons.min.js"></script>
	<script src="<%=request.getContextPath() %>/templates/admin/js/js/dataTables.select.min.js"></script>
		
	
	<script>
	$( document ).ready( function () {
			$( "#register" ).validate( {
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
						equalTo: "#password"
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
			
			$( "#form_login" ).validate( {
				rules: {
					username: {
						required: true,
						minlength: 3
					},
					password: {
						required: true,
						minlength: 3
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
		<script>
$(document).ready(function(){ 
	var view='';
	 function notify(view){
		$.ajax({
			url: '<%=request.getContextPath()%><%=Constants.URL.NOTIFICATION%>',
			type: 'POST',
			cache: false,
			data: {
				view: view,
					},	
			success: function(responseText){
					var noti=responseText.split(',');
					if(noti[0]>0){
						$('#notification').css("color","red");
						$('#notification').text('('+noti[0]+')');
					}
					if(noti[1]>0){
					$('#mess').css("color","red");
                     
                     $('#mess').text('('+noti[1]+')');
					}
			},
       		 error: function (){
			$('#snackbar').attr("type", "error");
			toast("Có lỗi trong quá trình xử lí");
		}			
		});	
	}
	 $(document).on('click', '.dropbtn1', function(){
		 notify('yes');; 
		 });
	 setInterval(function(){ 
		 notify();; 
		 }, 5000);
	});
</script>