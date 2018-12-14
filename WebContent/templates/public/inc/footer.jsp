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
                <a href="#">Home</a>
                ·
                <a href="#">About</a>
                ·
                <a href="#">Contact</a>
            </p>

            <p>BackKhoa Forum &copy; 2018</p>
        </div>

    </footer>
	
    <div id="infomation" class="signup">
        <div class="register">
            <fieldset class="">
                <legend>Account Details
                </legend>
                    <div class="avatar">
                      <a href="#"><img src="<%=request.getContextPath() %>/templates/public/img/t3.jpg" alt="" style="left: -87px; top: 0px; "></a>
                    </div>
                    <h1>Akiii</h1>
                    <div class="formUser">
                      Nam
                      <span>form:</span>
                      <a href="#">Hà Nội</a>
                    </div>
                    <div class="userLink">
                      <a href="#">Trang hồ sơ</a>
                    </div>
                    <hr>
                    <div class="account">
                      <dl>
                          <dt>Ngày tham gia </dt>
                          <dd>6/9/1969</dd>

                            <dt>Bài viết: </dt>
                            <dd>69 </dd>

                            <dt>Được thích </dt>
                            <dd>6</dd>

                              <dt>Điểm thưởng </dt>
                              <dd>9 </dd>
                          </dl>
                    </div>
                    <hr>
                    <dl class="lastSeen">
                        <dt>Akiii lần cuối xem </dt>
                        <dd>6m ago</dd>
                      </dl>
            </fieldset>
        </div>
    </div>
	<%if(session.getAttribute("user") == null) { %>
    <div id="signin" class="signin">
        <form action="<%=request.getContextPath() %>/login" class="form_login" id="form_login" method="post">
            <h1>Login</h1>
            <input placeholder="Username" name="username" type="text" >
            <input placeholder="Password" name="password" type="password" >
            <button>Submit</button>
            <br><br>
            <div class="bottom-text ">
                <p>No account yet?<a href="#singup">Signup</a></p>
                <h4> <a href="#">Forgot your password?</a></h4>
            </div>
        </form>
    </div>

    <div id="signup" class="signup">
        <form action="<%=request.getContextPath() %>/register" class="register"  id="register" method="post">
            <h1>Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>Username *
                    </label>
                    <input type="text" name="username"  />
                </p>
                <p>
                    <label>Password*
                    </label>
                    <input type="password" name="password" id="password"  />
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
                    <input type="text" name="fullname" class="long" />
                </p>
                <p>
                    <label>Phone *
                    </label>
                    <input type="text" name="phone"  />
                </p>
                <p>
                    <label>Email *
                    </label>
                    <input type="email" name="email" />
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
                    <input type="text" name="address" class="long" />
                </p>
                <p>
                    <label>City *
                    </label>
                    <input type="text" name="city" class="long" />
                </p>
            </fieldset>

            <div><button class="button">Register</button></div>
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
                    <img src="<%=request.getContextPath() %>/templates/public/files/<%=userProfile.getAvatar()%>">
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