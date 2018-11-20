-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: forumdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_create` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `notify` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'20-11-2018','Ngán nhất là mấy bác kêu ram nhiều để làm gì.',1),(2,1,2,'20-11-2018','bây giờ mình quan tâm tới bộ nhớ trong và màn hình thôi. lần sao mua đt có bộ nhớ 64gb và màn hình đẹp',1),(3,1,3,'21-11-2018','Ram rất quan trong nhưng khi mua 1 PC laptop hay đt hãy nên chú trọng vào CPU , vì CPU nó con quan trọng gấp nhiều lần , hy vọng 1 ngày không xa smartphone sẽ tích hợp card rời ',1),(4,2,1,'18-11-2018','Xác nhận là google là vô địch tìm kiếm. Nhưng vẫn phải nộp tiền để Apple dùng nó trên ios và macos. Chứng tỏ trình của thím Tim Cook quá khủng.',1),(5,2,2,'18-11-2018','Khen đúng. Và tui cũng thấy vậy .',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow` (
  `id_follow` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `notify` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_follow`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,1,2,1),(2,2,1,1),(3,3,1,1);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_comment`
--

DROP TABLE IF EXISTS `like_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `like_comment` (
  `id_like_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_comment` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_like_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_comment`
--

LOCK TABLES `like_comment` WRITE;
/*!40000 ALTER TABLE `like_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_post`
--

DROP TABLE IF EXISTS `like_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `like_post` (
  `id_like_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_like_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_post`
--

LOCK TABLES `like_post` WRITE;
/*!40000 ALTER TABLE `like_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_subject` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date_create` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview_image` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `view` int(11) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,2,1,'20-11-2018','Điện thoại RAM trống nhiều có phải là tốt','Iphone','Vivo nghe nói sắp ra mắt điện thoại','Nếu bạn chưa biết thì RAM là từ viết tắt của Random Access Memory, nó dùng để chứa dữ liệu của các ứng dụng đang chạy bên cạnh phần nhân của hệ điều hành. Người ta dùng RAM cho những thứ này là vì tốc độ đọc ghi của nó rất rất nhanh, nhanh hơn nhiều lần so với ổ SSD hay HDD hay thẻ nhớ. Ngay cả ổ SSD hiện nay cũng chưa nhanh bằng RAM, sắp tới thì có thể nhưng đường còn xa lắm và chi phí cho loại RAM đó cũng không rẻ chút nào. Đặc tính của RAM là khi mất điện thì dữ liệu cũng mất theo, do đó nó không được sử dụng để làm ổ lưu trữ vĩnh viễn (persistent storage) như SSD hay thẻ nhớ. Khi CPU chạy tính toán, đầu tiên nó sẽ lấy dữ liệu trong register trước. Nếu trong register không có dữ liệu mà CPU cần, nó sẽ ra lệnh lấy dữ liệu từ cache. Nếu cache không có nữa thì đi ra RAM, RAM không có mới ra tới ổ SSD / HDD / bộ nhớ trong nói chung. Cứ đi ra ngoài 1 lớp thì tốc độ càng chậm đi, thời gian xử lý càng lâu hơn, và RAM cần phải nhanh chứ không bạn sẽ phải chờ... mút chỉ. Ở trên là nguyên lý hoạt động chung cho mọi máy tính và hệ điều hành, còn giờ chúng ta sẽ tìm hiểu kĩ hơn về cách mà Android khai thác RAM trên thiết bị của bạn. Nó bao gồm những phần chính như sau:Kernel Space: Android được làm ra dựa trên nhân Linux, và kernel là một loạt các file được nén lại, khi boot máy lên nó sẽ được giải nén vào RAM. Phần kernel này giúp Android chạy được, hiểu được phần cứng đang cần gì, phần mềm cần gì, bạn cần gì và đáp ứng cho đúng. Khu vực chứa dữ liệu của kernal trên RAM gọi là kernel space.RAMdisk: có một số file và folder trong Linux không tồn tại, không phải là hàng \"thật\". Nó là những file \"ảo\" được tạo ra trong quá trình boot và chứa các thông tin như dung lượng pin còn lại, tốc độ CPU... Với Android, thư mục /proc là một trong những nơi chứa các file ảo này, và /proc (cũng như các folder tương tự) được ghi vào RAM.Trên máy tính Windows của bạn, Microsoft viết hệ điều hành của mình theo kiểu để RAM trống càng nhiều càng tốt. Khi một app mới mở ra, nó sẽ chiếm một phần của RAM, Windows sẽ cho phép nó sử dụng phần RAM app yêu cầu mà không đòi hỏi gì thêm.Tuy nhiên, Linux nói chung, Android nói riêng (và cả macOS, iOS của Apple nữa) lại hoạt động theo cách giữ app và dữ liệu trong RAM. Hệ điều hành cứ giữ như vậy cho đến khi có một app khác đòi RAM để nó hoạt động. Lúc này, hệ điều hành sẽ đánh số ưu tiên cho từng app dựa trên loại ứng dụng, cách mà ứng dụng sẽ xài tài nguyên, công việc mà nó làm là gì, các hàm nó gọi lên từ Android... Những app có mức độ ưu tiên thấp nhất sẽ bị đóng trước, giải phóng RAM và nhường phần RAM này cho app mới.Nếu không có app nào đòi RAM, những ứng dụng đang chạy sẽ được giữ hoài trong RAM để khi bạn cần là nó có sẵn, không phải khởi chạy lại từ đầu. Việc bạn để RAM trống nhiều tức là các app của bạn bị đóng nhiều, và bạn sẽ mất thời gian hơn, tốn nhiều pin hơn khi cần sử dụng lại chúng.Cái quan trọng không phải là RAM còn trống bao nhiêu, mà là phần RAM app được sử dụng là bao nhiêu. Đoạn này sẽ được thiết lập tùy theo nhà sản xuất, quay trở lại vụ minfree như mình đã nói ở trên. Nếu nhà sản xuất nhét quá nhiều thứ của riêng họ và cài đặt phần dung lượng RAM mà app được phép sử dụng thấp thì lúc đó bạn sẽ thấy các app của mình bị load lại nhiều hơn.',1000,1),(2,6,2,'18-11-2018','Tim Cook khẳng định dịch vụ tìm kiếm của google là tốt nhất','Tim Cook','Trong cuộc phỏng vấn mới đây với Axios','Trong cuộc phỏng vấn mới đây với Axios, Tim Cook đã khẳng định dịch vụ tìm kiếm của Google là tốt nhất hiện nay bất chấp những vấn đề liên quan đến việc bán dữ liệu của khách hàng. Ông cũng cho biết Safari chính là giải pháp của Apple để bảo vệ quyền riêng tư của người dùng mà vẫn cho phép họ sử dụng dịch vụ tìm kiếm của Google.Trước đó thì Apple đã bị chỉ trích khi nhận hàng tỷ USD để sử dụng dịch vụ tìm kiếm của Google làm mặc định trên các thiết bị MacOS và iOS, bất chấp chính sách của Google ảnh hưởng nghiêm trọng đến bảo mật thông tin cá nhân của khách hàng. Lý giải điều này, Tim Cook khẳng định dịch vụ tìm kiếm của Google là tốt nhất hiện nay và hãng đã có những biện pháp bảo vệ khách hàng mà vẫn giúp họ sử dụng dịch vụ của Google.Cụ thể Apple đã phát triển trình duyệt Safari riêng, công nghệ chống theo dõi và những giải pháp giúp bảo vệ thông tin người dùng. Tim Cook thừa nhận mọi thứ vẫn chưa thể xem là hoàn hảo, nhưng về cơ bản thì Apple đã có những nỗ lực để đem lại sự cân bằng giữa các dịch vụ và bảo mật thông tin cá nhân. Riêng về mặt thương mại, Apple được cho là đã nhận từ 3 - 9 tỷ USD để sử dụng dịch vụ tìm kiếm của Google làm mặc định trên các thiết bị của họ.',991,1),(3,6,4,'10-11-2018','AI có thể tạo vân tay giả vượt qua hệ thống cảm biến','AI','Các nhà nghiên cứu tại đại học New York đã tìm ra cách vượt qua các hệ thống bảo mật bằng cảm biến vân tay thông qua việc sử dụng AI.','Các nhà nghiên cứu tại đại học New York đã tìm ra cách vượt qua các hệ thống bảo mật bằng cảm biến vân tay thông qua việc sử dụng AI. Được đặt tên là DeepMasterPrints, AI này khai thác lỗ hổng về lỗi nhận diện của các hệ thống để tạo vân tay giả với tỉ lệ thành công từ 23-77%.Cụ thể thì đối với các hệ thống cảm biến vân tay có tỉ lệ nhận diện sai 1/1000, mức độ thành công của DeepMasterPrints là 23%. Trong khi con số này đối với các hệ thống có tỉ lệ nhận diện sau 1/100 lên đến 77%. Những dấu vân tay giả hiệu quả nhất khi được sử dụng dể vượt qua những thiết bị bảo mật lưu trữ nhiều dấu vân tay, giúp tỉ lệ khớp cao hơn. Về cơ bản thì nguyên tắc hoạt động của DeepMasterPrints cũng tương tự như các hệ thống phá mật khẩu, nó sẽ tạo dấu vân tay giả cho đến khi vượt khớp với vân tay lưu trong hệ thống bảo mật. Một điều may mắn là nếu như thiết bị chỉ có vài dấu vân tay, chẳng hạn như ở smartphone, thì tỉ lệ bị vượt qua sẽ thấp hơn.Trên thực tế thì các hệ thống bảo mật vân tay hiện nay có một số yếu điểm nhất định. Điển hình là phần lớn cảm biến không bao quanh ngón tay nên chỉ có thể nhận dạng một phần mà thôi, và sử dụng nó để đối chiếu với dấu vân tay đã được lưu. Điều này tạo điều kiện cho máy tính tạo ra dấu vân tay giả chỉ cần chính xác \"một phần\" chứ không cần giống hoàn toàn với vân tay người thật.Chúng ta đều biết rằng dấu vân tay của mỗi người là đặc trưng và không giống nhau, nhưng đó là khi xét toàn bộ. Còn khi xét một phần thì chúng vẫn sẽ có một số hình dạng phổ biến, và dựa trên những hình dạng này để tạo ra vân tay giả sẽ có tỉ lệ chính xác cao hơn so với việc tạo ra vân tay ngẫu nhiên hoàn toàn.Dựa trên những quy tắc trên, các nhà nghiên cứu ở đại học New York đã tạo ra hệ thống trí thông minh nhân tạo DeepMasterPrints và huấn luyện nó bằng cách sử dụng dữ liệu vân tay của con người. Kết quả cho thấy dấu vân tay giả mà DeepMasterPrints tạo ra cực kỳ tinh xảo đủ để lừa các hệ thống bảo mật và dĩ nhiên là cả mắt người.Dĩ nhiên mục tiêu của các nhà nghiên cứu với DeepMasterPrints không phải là để tạo ra AI có thể vượt qua các hệ thống bảo mật vân tay. Đây là lời cảnh báo về những lỗ hổng bảo mật, để giúp các nhà phát triển hoàn thiện hơn hệ thống của mình.',999,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Mod'),(3,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subject` (
  `id_subject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Máy Tính'),(2,'Điện Thoại'),(3,'Đồng Hồ Thông Minh'),(4,'Camera'),(5,'Xe'),(6,'Công Nghệ');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_join` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20  9:43:46
