<%@page import="model.bean.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa danh mục</span></h2>
		 <div class="module-body">
		 <% Subject sub = (Subject) request.getAttribute("nameSub"); %>
			<form id="addCat" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.EDIT_SUBJECT%>?cid=<%=sub.getId_subject()%>">
				<div>
						
					<label>Tên danh mục</label>
					<input type="text" id="name" name="newSub" value="<%=sub.getName() %>" class="input-medium" />
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
<script type="text/javascript">
		var OriginalString = $('#name').val();
		var StrippedString = OriginalString.replace(/<\/?[^>]+(>|$)/g, "");
		$('#name').text(StrippedString);
	</script>

<%@include file="/templates/public/inc/footer.jsp" %> 