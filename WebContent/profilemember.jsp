<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>

<div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="<%=request.getContextPath() %><%=Constants.URL.HOME%>"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Trang cá nhân</a></li>
                </ul>
        </nav>
            <div class="mainContent">  
                    <% 
                    User user = null;
                    if (session.getAttribute("user") != null) {
                        user = (User) session.getAttribute("user");
                        }%>     	
                <!-- <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%><%=Constants.URL.PROFILE%>"> -->
                    <fieldset>
                        <dl class="ctrlUnit avatarEditor">
                            <dt><label>Hình đại diện:</label></dt>
                            <dd>                           
                                <a href="#" class="avatar">
                                    <img style="width:100px;height:100px;" src="<%=request.getContextPath() %>/templates/public/files/<%=user.getAvatar() %>">
                                </a> <br>
                                <input type="file" name="avatar" value="" id="" class="textCtrl OptOut">
                            </dd>
                        </dl>
                    </fieldset>
                    <fieldset>
                    	<dl class="ctrlUnit">
                            <dt><label for="ctrl_location">Tên:</label></dt>
                            <dd><input type="text" name="fullname" value="<%=user.getFullname() %>" class="textCtrl OptOut"></dd>
                        </dl>
                        <dl class="ctrlUnit OptOut">
                            <dt>Ngày tham gia:</dt>
                            <dd><input type="text" name="#" value="#" class="textCtrl OptOut"></dd>
                        </dl>
                        <dl class="ctrlUnit ">
                            <dt>Rate:</dt>
                            <dd><input type="text" name="#" value="#" class="textCtrl OptOut"></dd>
                        </dl>
                    </fieldset>

                <!-- </form> -->
            </div>
        </div>
    
    <%@include file="/templates/public/inc/footer.jsp" %>
</body>

</html>