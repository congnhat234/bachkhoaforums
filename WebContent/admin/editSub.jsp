<%@page import="model.bean.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<!-- Form elements -->    
<div class="container">
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa danh mục</span></h2>
		 <div class="mainContent">
		 <% Subject sub = (Subject) request.getAttribute("nameSub"); %>
			<form id="addCat" method="POST" action="<%=request.getContextPath() %><%=Constants.URL.EDIT_SUBJECT%>?cid=<%=sub.getId_subject()%>">
				<fieldset>
					<dl class="ctrlUnit">
						<dt><label>Tên danh mục:</label></dt>
						<dd>
							<input class="row_input" type="text" id="name" name="newSub" value="<%=sub.getName() %>" class="input-medium" />
						</dd>
					</dl>
					<dl>
					<input class="submit-green" type="submit" value="Sửa" /> 
					<input class="submit-green" name="reset" type="reset" value="Nhập lại" />
					</dl>
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
</div>

<%@include file="/templates/public/inc/footer.jsp" %> 
<script>
$( document ).ready( function () {
	$( "#addCat" ).validate( {
		rules: {
			newSub: {
				required: true,
				minlength: 2
			}
		},
		messages: {
			newSub: {
				required: "Vui lòng điền vào trường này",
				minlength: "Ít nhất 2 kí tự"
			}
		}
	} );
} );
</script>