<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm tin tức</span></h2>
			
		 <div class="module-body">
			<form id="addNews" method="POST" action="<%=request.getContextPath() %>/admin/addNews" enctype="multipart/form-data">
				<p>
					<label>Tên tin</label>
					<input id="tentin" type="text" name="tentin" value="" class="input-medium" />
				</p>
				<p>
					<label>Danh mục tin</label>
					<select  name="danhmuc" class="input-short">
					<%
					ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
					for(Category objCat : listCat){
					%>
						<option value="<%=objCat.getId_cat()%>"><%=objCat.getName() %></option>
					<%} %>
					</select>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="hinhanh" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea id="mota" name="mota" value="" rows="7" cols="90" class="input-medium"></textarea>
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  name="chitiet" value="" rows="7" cols="90" class="ckeditor"></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->

<script type="text/javascript">
		var OriginalString = $('#tentin').val();
		var StrippedString = OriginalString.replace(/<\/?[^>]+(>|$)/g, "");
		$('#tentin').text(StrippedString);
		var OriginalString1 = $('#mota').val();
		var StrippedString1 = OriginalString1.replace(/<\/?[^>]+(>|$)/g, "");
		$('#mota').text(StrippedString1);
	</script>

<%@include file="/templates/admin/inc/footer.jsp" %> 