<%@page import="utils.ConvertString"%>
<%@page import="model.bean.Post"%>
<%@page import="model.bean.Subject"%>
<%@page import="model.bean.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<%@include file="/templates/public/inc/header.jsp"%>
<div class="container">
	<nav class="navbar">
		<ul class="breadcrumbs">
			<li><a
				href="<%=request.getContextPath()%><%=Constants.URL.HOME%>"><i
					class="fas fa-home fa-2x"></i></a></li>
			<li><a href="#">Thông báo</a></li>
		</ul>
	</nav>
	<%@include file="/templates/public/inc/menu.jsp"%>
		<div class="titleBar">
		<h2>Thông báo mới nhất</h2>
	</div>
	<div class=parse>           
			<div class="parse-content">
				
				<%
					if(request.getAttribute("sumPage")!=null){
						int sumPage = (Integer) request.getAttribute("sumPage");
						if(sumPage!=0){
						int current_page = (Integer) request.getAttribute("page");%>
						<span>Trang <%=current_page %>/<%=sumPage %> </span> 
						<%String active = ""; %>
				<%
						for(int i=1; i<=sumPage; i++){
							if(current_page == i){
								active = "style='border: none; background: #616161; box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);color: #f0f0f0;text-shadow: 0px 0px 3px rgba(0,0,0, .5)'";
							} else {
								active = "";
							}
							String urlPage = Constants.URL.NOTIFICATION_PAGE + "/p" + i;
				%>
				<a <%=active %> class="page" href="<%=request.getContextPath()%><%=urlPage%>"><%=i %></a> 
				
				<%}}}  %>
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
	<div class="mainContent">
		<%if(request.getAttribute("listnotify")!=null) {%>
			<%ArrayList<Notification> listNotify = (ArrayList<Notification>) request.getAttribute("listnotify");
			for(Notification obj :listNotify) {
				String urlPost = "/threads/" + ConvertString.createSlug(obj.getTitlePost()) + "-" + obj.getIdPost();
				String urlAuth = "/user/" + obj.getUsername()+"-"+obj.getIdUser();
			%>
		<div class="alert" id="<%=obj.getId_comment()%>"<%if(obj.getStatus()==1){%>style ="background-color:#8681813b"<%} else%>  style ="background-color:white" >
			<a href="" class="">
			<img src="/save/images/<%=obj.getAvatar()%>" width="40" height="40" style="border-radius:50%;"></a>
			<div class="alertText">
				<h4>
					<a href="<%=request.getContextPath()%><%=urlAuth%>" class="username subject"><%=obj.getUsername() %></a> đã trả lời vào chủ đề <a
						href="<%=request.getContextPath()%><%=urlPost%>" class="PopupItemLink"><%=obj.getTitlePost() %></a>
				</h4>
			</div>
		</div>
		<hr class="linetopic">
		<%}} %>
	</div>
</div>
<%@include file="/templates/public/inc/footer.jsp"%>
<script type="text/javascript">
<% 
ArrayList<Notification> listNotify = (ArrayList<Notification>) request.getAttribute("listnotify");
for(Notification obj :listNotify) {%>
$('#<%=obj.getId_comment()%>').on("click", function (){
    $('#<%=obj.getId_comment()%>').css("background-color", "white");
    var id_comment=<%=obj.getId_comment()%>;
    $.ajax({
		url: '<%=request.getContextPath()%><%=Constants.URL.NOTIFICATION%>',
		type: 'GET',
		cache: false,
		data: {
			id_comment: id_comment,
				},
    suscess: function (){
		$('#snackbar').attr("type", "suscess");
		toast("Thành công");
	},
    error: function (){
		$('#snackbar').attr("type", "error");
		toast("Có lỗi trong quá trình xử lí");
	}			
	});	
});
<%}%>
</script>
</body>
</html>