<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <script src="ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        .ck.ck-editor {
        max-width: 100%;
        margin: 10px;
        padding: 10px;
    }
    .ck-editor__editable {
    min-height: 200px;
    }
    </style>
</head>

<body>
    <header class="header-search">

        <div class="header-limiter">

            <h1><a href="#">BachKhoa<span>Forum</span></a></h1>

            <nav>
                <a href="index.html">Home</a>
            </nav>
            <ul>
                <li class="userProfile">
                    <a id="btnProfile" href="#">
                        <span class="avatar"><img src="img/t3.jpg" alt=""></span>
                        <strong class="accountUsername">congnhat234</strong>
                    </a>
                </li>
                <li><a id="btnSignin" href="#">Logout</a></li>
            </ul>

            <form id="search" method="get" action="#">
                <input type="search" placeholder="Search!" name="search">
                <i id="searchIcon" class="fas fa-search fa"></i>
            </form>
        </div>
    </header>
    <div class="container">
        <nav class="navbar">
            <ul class="breadcrumbs">
                <li><a href="#"><i class="fas fa-home fa-2x"></i></a></li>
                <li><a href="#">Bài viết</a></li>
            </ul>
        </nav>
        <div class="content">
            <div class="xembai">
                <div>
                    <img src="img/RAM.jpg" class="imgElement">
                </div>
                <div>

                    <h2>RAM là gì?</h2>
                    <pre>
            Nếu bạn chưa biết thì RAM là từ viết tắt của Random Access Memory, nó dùng để chứa dữ liệu của các ứng dụng đang
            chạy bên cạnh phần nhân của hệ điều hành. Người ta dùng RAM cho những thứ này là vì tốc độ đọc ghi của nó rất rất
            nhanh, nhanh hơn nhiều lần so với ổ SSD hay HDD hay thẻ nhớ. Ngay cả ổ SSD hiện nay cũng chưa nhanh bằng RAM,
            sắp tới thì có thể nhưng đường còn xa lắm và chi phí cho loại RAM đó cũng không rẻ chút nào. Đặc tính của RAM là
            khi mất điện thì dữ liệu cũng mất theo, do đó nó không được sử dụng để làm ổ lưu trữ vĩnh viễn như SSD hay thẻ nhớ.

            Bản thân CPU trong điện thoại của bạn cũng đã có bộ nhớ riêng, gọi là register và cache. Register nằm ngay gần nhân
            CPU và có tốc độ nhanh khủng khiếp nhưng dung lượng của nó thường chỉ vào khoảng chục đến trăm KB, nó tồn tại để
            đưa dữ liệu ra vào CPU. Sau đó đến cache, cũng có tốc độ rất nhanh, nhưng vẫn không có dung lượng đủ lớn như RAM.
            Ví dụ, Snapdragon 835 có 2MB cache cho các nhân hiệu năng cao và 1MB cache cho các nhân tiết kiệm điện.

            Khi CPU chạy tính toán, đầu tiên nó sẽ lấy dữ liệu trong register trước. Nếu trong register không có dữ liệu mà CPU
            cần, nó sẽ ra lệnh lấy dữ liệu từ cache. Nếu cache không có nữa thì đi ra RAM, RAM không có mới ra tới ổ SSD / HDD /
            bộ nhớ trong nói chung. Cứ đi ra ngoài 1 lớp thì tốc độ càng chậm đi, thời gian xử lý càng lâu hơn, và RAM cần phải
            nhanh chứ không bạn sẽ phải chờ... mút chỉ.

            Thứ bạn cần nhớ ở RAM có thể tóm gọn trong 4 dấu chấm sau:
               RAM dùng để chứa dữ liệu tạm thời, mất điện thì nó sẽ mất
               RAM có tốc độ đọc ghi cực nhanh
               Trên RAM vừa có dữ liệu của hệ điều hành, vừa có dữ liệu của các app đang chạy
               Điều này đúng cho gần như mọi máy tính cá nhân mà loài người trên Trái Đất đang sử dụng, và điện thoại hay máy
               tính bảng cũng không ngoại lệ.
            </pre>

                    <h3>Android sử dụng RAM như thế nào?</h3>
                    <pre>
            Ở trên là nguyên lý hoạt động chung cho mọi máy tính và hệ điều hành, còn giờ chúng ta sẽ tìm hiểu kĩ hơn về cách mà
            Android khai thác RAM trên thiết bị của bạn. Nó bao gồm những phần chính như sau:

            <strong>Kernel Space:</strong> Android được làm ra dựa trên nhân Linux, và kernel là một loạt các file được nén lại, khi boot máy lên
            nó sẽ được giải nén vào RAM. Phần kernel này giúp Android chạy được, hiểu được phần cứng đang cần gì, phần mềm
            cần gì, bạn cần gì và đáp ứng cho đúng. Khu vực chứa dữ liệu của kernal trên RAM gọi là kernel space.

            <strong>Kernel Space:</strong> có một số file và folder trong Linux không tồn tại, không phải là hàng "thật". Nó là những file "ảo" được tạo
            ra trong quá trình boot và chứa các thông tin như dung lượng pin còn lại, tốc độ CPU... Với Android, thư mục /proc là
            một trong những nơi chứa các file ảo này, và /proc (cũng như các folder tương tự) được ghi vào RAM.

            <strong>Kernel Space:</strong> Số IMEI, cấu hình bộ thu nhận sóng... được lưu trong một con chip gọi là NVRAM (Non-Volatile
            RAM, là RAM nhưng khi tắt máy, khi mất điện thì không bị mất dữ liệu). Khi bạn bật máy lên, những dữ liệu này được chép
            từ NVRAM sang RAM để truy xuất nhanh hơn cũng như phục vụ cho việc khởi động của hệ điều hành.

            <strong>Kernel Space:</strong> đa số bộ xử lý đồ họa trên di động hiện tại dùng RAM làm bộ nhớ cho nó, không như các "card đồ họa rời"
            thường có bộ nhớ riêng.

            Dung lượng của 4 phần trên cộng lại là phần mà hệ thống dùng của RAM, phần dung lượng trống còn lại để dành cho các
            app của người dùng. Đây cũng là lý do vì sao RAM của máy bạn tuy ghi trên bảng cấu hình là 4GB nhưng phần trống thật
            sự chỉ khoảng 2-3GB tùy thiết bị. Ngoài ra, nhà sản xuất vẫn có thể tinh chỉnh phần dung lượng trống này tùy theo ý muốn
            của họ, ví dụ họ có thể bổ sung thêm một số tính năng đặc thù nào đó và muốn đảm bảo nó chạy tốt chẳng hạn. Thiết lập
            này gọi là minfree.
          </pre>
          <div class="button-bot">
          <button class="b1" type="button" name="button">Thích</button>
          <button class="b1" type="button" name="button">Trả lời</button>
          <button class="b1" type="button" name="button">Chia sẻ</button>
          </div>
          <hr>
          <div class="comment-content">
            <div>
              <img src="img/apple.jpg" width="50px" height="50px">
            </div>
          <div class="comment">
              <a href="#">Nguyễn Văn Tèo</a>
              <p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
                  <div class="a-comment">
                        <a href="#">Thích</a>
                        <a href="#">Trả lời</a>
                        
                  </div>
          </div>
          </div>
          <div class="comment-content">
                <div>
                  <img src="img/apple.jpg" width="50px" height="50px">
                </div>
              <div class="comment">
                  <a href="#">Nguyễn Văn Tèo</a>
                  <p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
                  <div class="a-comment">
                        <a href="#">Thích</a>
                        <a href="#">Trả lời</a>
                        
                  </div>
              </div>
              </div>
              <div class="comment-content">
                    <div>
                      <img src="img/apple.jpg" width="50px" height="50px">
                    </div>
                  <div class="comment">
                      <a href="#">Nguyễn Văn Tèo</a>
                      <p>Bài viết rất hay. Cảm ơn bạn rất nhiều.</p>
                      <div class="a-comment">
                        <a href="#">Thích</a>
                        <a href="#">Trả lời</a>
                        
                  </div>
                  </div>
                  </div>
          <div class="xem-comment">
            <a href="#">Xem tất cả các câu trả lời</a>
            </div>
            <br><br><br>
          <div class="text-area">
            <textarea name="content" id="editor">
            </textarea>
                        
                        <div class="button-comment">
                            <button class="b2" type="button" name="button">Trả lời</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button onclick="topFunction()" id="btnBackToTop" title="Go to top"><i class="fas fa-arrow-up"></i></button>

    <footer class="footer-distributed">

        <div class="footer-right">

            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>

        </div>

        <div class="footer-left">

            <p class="footer-links">
                <a href="#">Home</a>
                ·
                <a href="#">About</a>
                ·
                <a href="#">Contact</a>
            </p>

            <p>BackKhoa Forum &copy; 2018</p>
        </div>

    </footer>

    <div id="profile" class="profile_wrap">
        <div class="profile">
            <div class="profile_header">
                <div class="image">
                    <img src="img/t3.jpg">
                </div>
                <div class="infor">
                    <p class="username">congnhat</p>
                    <p class="level">Thành viên mới</p>
                </div>
            </div>
            <div class="profile_content">
                <div class="element">
                    <ul>
                        <li><a href="#">Thông tin cá nhân</a></li>
                        <li><a href="#">Tùy chọn</a></li>
                        <li><a href="#">Mật khẩu</a></li>
                    </ul>
                </div>
                <div class="element">
                    <ul>
                        <li><a href="#">Tin nhắn</a></li>
                        <li><a href="#">Thông báo</a></li>
                        <li><a href="#">Nội dung của bạn</a></li>
                        <li><a href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="js/basic.js"></script>

</body>

</html>