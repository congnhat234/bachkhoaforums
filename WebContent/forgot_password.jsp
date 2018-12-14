<%@page import="utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/templates/public/inc/header.jsp"%>
			<% User user = new User();
			if(request.getAttribute("member")!=null){
				user= (User)request.getAttribute("member");
			}
			%>

		 <div class="sign_page">
		 <form action=""class="forgot_password">
		 <div class="row1">
		     <p>
               <label>Nhập email của bạn
               </label>
               <input type="email" name="email" value=""/>
               </p>
             <p>
                <label>Mật khẩu mới
                </label>
                <input type="password" name="password" id="password1"  />
             </p>
                <p>
                 <label>Nhập lại mật khẩu
                 </label>
                 <input type="password" name="repassword"  />
             </p>
		 </div>
		 <button class="button">Gửi</button>
		 </form>
		 </div>

<%@include file="/templates/public/inc/footer.jsp"%>