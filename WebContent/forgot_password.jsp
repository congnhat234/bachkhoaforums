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
		 <form action="<%=request.getContextPath() %><%=Constants.URL.FORGOT_PASSWORD %>" class="forgot_password" method="post">
		 <div class="row1">
		     <p>
               <label>Nhập email của bạn
               </label>
               <input type="email" name="email" value=""/>
               </p>
             <p>
                <label>Nhập username
                </label>
                <input type="text" name="username" />
             </p>              
		 </div>
		 <button class="button" type="submit">Gửi</button>
		 </form>
		 </div>

<%@include file="/templates/public/inc/footer.jsp"%>
	 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("0")) {%>
    	<script>
		$('#snackbar').attr("type", "error");
		toast("Lỗi!");
		</script> 
		<%}}%>