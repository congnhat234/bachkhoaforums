<%@page import="model.bean.Message"%>
<%@page import="utils.ConvertString"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bo.PostBO"%>
<%@page import="model.bo.SubjectBO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp"%>


<div class="container">
	<%@include file="/templates/admin/inc/menu.jsp" %>
	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2>
				<span>Danh sách tin nhắn</span>
			</h2>
		</div>
		    <div class="mainContent">
		<fieldset>
		<!-- list tin nhắn -->
		<%if(request.getAttribute("listMessage") != null) {
			ArrayList<Message> listMessage = (ArrayList<Message>) request.getAttribute("listMessage");
			for(Message message : listMessage){
		%>
		<dl class="ctrlUnit">
			<dt> <label for="ctrl_location">
			<a href="<%=request.getContextPath()%><%=Constants.URL.MESSAGEADMINREPLY%>?idM=<%=message.getId_message()%>">
				<%if(message.getNotify_admin() == 1) {%>
				<span style="color:red;">*</span> Tin nhắn #<%=message.getId_message() %>
				<%} else { %>
				Tin nhắn #<%=message.getId_message() %>
				<%} %>
			</a>
			</label>
			<span style="font-size:10px;color:#888;font-style:italic;"><%=message.getDate_create() %></span>
			</dt>
			<dd><%=message.getEmail() %></dd>
		</dl>	
		<%}} else { %>
		<h5>Bạn không có tin nhắn nào cả.</h5>
		<%} %>
		</fieldset>	
		    </div>
	</div>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
			 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("1")) {%>
    	<script>
		$('#snackbar').attr("type", "success");
		toast("Gửi tin nhắn thành công!");
		</script> 
		<%}}%>
</html>