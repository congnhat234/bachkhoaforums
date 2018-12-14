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
					<dl class="ctrlUnit">
						<dt> <label for="ctrl_location">Tin nhắn của:???</label></dt>
					</dl>	
				</fieldset>	
		    </div>
	</div>
</div>
	<%@include file="/templates/public/inc/footer.jsp"%>
</html>