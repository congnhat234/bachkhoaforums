<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>
	
	
    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.HOME%>"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Sửa Thành Viên</a></li>
                </ul>
        </nav>
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
            	
            	
                <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%><%=Constants.URL.EDIT_USER%>?uid=<%=user.getId_user()%>">
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
		
		<div id="ChangePassword" class="tabcontent">
		 	<div class="module">
		 <h2><span>Đổi mật khẩu</span></h2>
		 <div class="module-body">
			<form id="addCat" method="POST" action="<%=request.getContextPath()%><%=Constants.URL.CHANGE_PASS_ADMIN%>?uid=<%=user.getId_user()%>">
				<div>		
					<label for="ctrl_location">Mật khẩu mới:</label>
					<input type="password"  name="password" value="" required />
				</div>
				<div>		
					<label for="ctrl_location">Nhập lại mật khẩu mới:</label>
					<input type="password"  name="repassword" value="" required />
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
    	<%} else {%>
    		<script>
    		$('#snackbar').attr("type", "error");
    		 toast("Nhập lại mật khẩu: không chính xác1!"); 		
    		</script> 
    	<%}} %>
<script>
window.onload = function(){
	  document.getElementById('defaultOpen').click();
	}
</script>

</body>
