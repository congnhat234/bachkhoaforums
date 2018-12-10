<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>
	
	
    <div class="container">
        <div id="subnav">
			<div class="container_12">
				<div class="grid_12">
					<ul>
						<li><a
							href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_POST%>">Bài
								viết</a></li>
						<li><a
							href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_SUBJECT%>">Danh
								mục</a></li>
						<li><a
							href="<%=request.getContextPath()%><%=Constants.URL.ADMIN_USER%>">Người
								dùng</a></li>
					</ul>
		
				</div>
				<!-- End. .grid_12-->
			</div>
			<!-- End. .container_12 -->
			<div style="clear: both;"></div>
		</div>
            	<% 
            	User user = null;
            	if (request.getAttribute("user") != null) {
            		user = (User) request.getAttribute("user");
            		}%>
            		
		        <!-- Tab links -->
		<div class="tab">
		  <button class="tablinks" onclick="openActive(event, 'InfomationUser')" id="defaultOpen" >Thông tin</button>
		  <button class="tablinks" onclick="openActive(event, 'ChangePassword')" id="defaultOpen1">Đổi mật khẩu</button>
		</div>
		
		<!-- Tab content -->
		<div id="InfomationUser" class="tabcontent">
		       <div class="titleBar">
            <h2>Thông tin thành viên</h2>
        </div>
        <div class="content">
            <div class="mainContent">
            	
            	
                <form method="post" enctype="multipart/form-data" id="form_profile"action="<%=request.getContextPath()%><%=Constants.URL.EDIT_USER%>?uid=<%=user.getId_user()%>">
                    <fieldset>
                        <dl class="ctrlUnit avatarEditor">
                            <dt><label>Hình đại diện:</label></dt>
                            <dd>                           
                                <a href="#" class="avatar">
                                    <img id="imgpreview" style="width:100px; height:100px;" src="<%=request.getContextPath() %>/templates/public/files/<%=user.getAvatar() %>">
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
                        	<label>Quyền hạn</label>					
				     <select  name="role" class="input-medium" >
				     	<option  value="1" <%if(user.getId_role()==1){%> selected <%}%>>1.Admin </option>
				     	<option  value="2" <%if(user.getId_role()==2){ %> selected<%} %>>2.Mod</option>
				     	<option  value="3" <%if(user.getId_role()==3){ %> selected<%} %>>3.User </option>
				     </select>
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
                                <input type="text" name="phone" value="<%=user.getPhone() %>"  class="textCtrl" >                              
                            </dd>
                        </dl>
                        <dl class="ctrlUnit">
                            <dt>
                                <label for="">Email:</label>
                            </dt>
                            <dd>
                               <input type="text" name="email" value="<%=user.getEmail() %>"  class="textCtrl" >                              
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
		
		<div id="ChangePassword" class="tabcontent">
		 	<div class="module">
		 <div class="module-body">
			<form id="addCat" method="POST" action="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_ADMIN%>?uid=<%=user.getId_user()%>">
				<div class="content_addPost">	
				<div class="row_addPost">
					<label for="ctrl_location">Mật khẩu mới:</label>
					<input class="row_input" type="password"  name="password" value="" required />
				</div>
				</div>
				<div class="content_addPost">
				<div class="row_addPost">	
					<label for="ctrl_location">Nhập lại mật khẩu mới:</label>
					<input class="row_input" type="password"  name="repassword" value="" required />
				</div>
				</div>	
				<fieldset>
					<input class="submit-green" type="submit" value="Thêm" /> 
					<input class="submit-green" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
		</div>
<%@include file="/templates/public/inc/footer.jsp" %>		
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
    	<%}} %>
<script>
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
			role: {
				required: true
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
			role: {
				required: "Vui chọn quyền"
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
