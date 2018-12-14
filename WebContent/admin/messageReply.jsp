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
				<fieldset>
					<dl class="ctrlUnit">
						<dt> <label for="ctrl_location">From:</label></dt>
						<dd> <span>Tên người gửi</span></dd>
					</dl>
					<dl class="ctrlUnit">
						<dt> <label>Nội dung tin nhắn:</label></dt>
						<dd> <span>Nội dung</span></dd>
					</dl>	
				</fieldset>	
			<form method="post" id="#" enctype="#" action="#">
				<fieldset>
					<dl class="ctrlUnit">
						<dt> <label for="ctrl_location">Nội dung tin nhắn</label></dt>
						<dd> <textarea name="content" id="editor"></textarea> </dd>
					</dl>
				</fieldset>	
				<div class="button-bot"><button class="b1"type="button"name="button">Trả lời</button></div>
			</form>				

		    </div>
		</div>
	</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
</html>