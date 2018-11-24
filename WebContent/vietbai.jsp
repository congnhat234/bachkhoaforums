<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@include file="/templates/public/inc/header.jsp" %>

    <div class="container">
        <nav class="navbar">
                <ul class="breadcrumbs">
                        <li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
                        <li><a href="#">Viết bài</a></li>
                </ul>
        </nav>
        <div class="content">
        <form class="vietbai" action="#" method="#">
                       
                <div class="tieude">
                    <label>Tiêu đề bài viết:</label>
                    <input class="text1" type="text" required>
                </div>
                <div class="tieude">
                    <label>Tên người viết:</label>
                    <input class="text2" type="text" required>
                </div>
                <div class="tieude">
                    <label>Chủ đề:</label>
                    <select class="select1">
                        <option value="1">Công Nghệ
                        </option>
                        <option value="2">Đời Sống
                        </option>
                    </select>
                </div>
                <div class="tieude">
                    <label>Nội dung bài viết:</label>
                </div>
                <div class="text-area">
                    <textarea name="content" id="editor">
            </textarea>
                    
                </div>
                <dl>
                    <dt></dt>
                    <dd>
                        <input class="button" type="submit" value="Gửi bài">
                    </dd>
                </dl>
                <div class="checkbox1">
                    <input type="checkbox" name="check1" value="TheoDoi">
                    <label>Theo dõi chủ đề này.</label> <br><br>
                    <input type="checkbox" name="check2" value="NhanThongBao">
                    <label>Nhận thông báo qua email.</label><br><br>
                </div>
            
        </form>
    </div>

    </div>

    <%@include file="/templates/public/inc/footer.jsp" %>
    
</body>

</html>