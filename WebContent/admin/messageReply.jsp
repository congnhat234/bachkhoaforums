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
				<span>Chi tiết tin nhắn</span>
			</h2>
		</div>
		    <div class="mainContent">
		    <%
				if (request.getAttribute("objMessage") != null) {
					Message message = (Message) request.getAttribute("objMessage");
			%>
				<fieldset>
					<dl class="ctrlUnit">
						<dt> <label for="ctrl_location">From:</label></dt>
						<dd> <span><%=message.getEmail() %></span></dd>
					</dl>
					<dl class="ctrlUnit">
						<dt> <label>Nội dung tin nhắn:</label></dt>
						<dd> <span><%=message.getMessage_content() %></span></dd>
					</dl>	
				</fieldset>	
			
			<form method="post" id="#" enctype="#" action="<%=request.getContextPath() %><%=Constants.URL.MESSAGEADMINREPLY%>?idM=<%=message.getId_message()%>">
				<fieldset>
					<dl class="ctrlUnit">
						<dt> <label for="ctrl_location">Nội dung tin nhắn trả lời</label></dt>
						<dd> <textarea rows="15" cols="70" name="content"><%=message.getReply() %></textarea> </dd>
					</dl>
				</fieldset>	
				<div class="button-bot"><button class="b1" type="submit" name="button">Trả lời</button></div>
			</form>				
			<%} %>
		    </div>
		</div>
	</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
		 <%if(request.getParameter("msg") != null) { 
    	String msg = request.getParameter("msg");
    	if(msg.equals("0")) {%>
    	<script>
		$('#snackbar').attr("type", "error");
		toast("Không gửi được tin nhắn!");
		</script> 
		<%}}%>
</html>