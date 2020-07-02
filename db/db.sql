-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: travelblogger
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_account` (
  `id_account` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `aliases` varchar(100) NOT NULL,
  `active_flag` int(11) NOT NULL,
  PRIMARY KEY (`id_account`),
  KEY `fk_account_role` (`role`),
  CONSTRAINT `fk_account_role` FOREIGN KEY (`role`) REFERENCES `tbl_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_account`
--

LOCK TABLES `tbl_account` WRITE;
/*!40000 ALTER TABLE `tbl_account` DISABLE KEYS */;
INSERT INTO `tbl_account` VALUES (1,'admin','phamkhachoabk@gmail.com','84-968265710','admin','1234',1,'Phạm Khắc Hòa',1),(2,'user','quytunhanong@gmail.com','09090909090','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','1234',2,'Hòa Phạm',1),(3,'phamkhachoa','phamkhachoa@gmail.com','0969265710','admin','1234',3,'Bill Gates',1);
/*!40000 ALTER TABLE `tbl_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment_post`
--

DROP TABLE IF EXISTS `tbl_comment_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comment_post` (
  `id_comment_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `comment` text NOT NULL,
  `active_flag` int(11) NOT NULL,
  PRIMARY KEY (`id_comment_post`),
  KEY `fk_cmt_post` (`id_post`),
  KEY `fk_comment_account` (`id_account`),
  CONSTRAINT `fk_comment_account` FOREIGN KEY (`id_account`) REFERENCES `tbl_account` (`id_account`),
  CONSTRAINT `fk_comment_post` FOREIGN KEY (`id_post`) REFERENCES `tbl_post` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment_post`
--

LOCK TABLES `tbl_comment_post` WRITE;
/*!40000 ALTER TABLE `tbl_comment_post` DISABLE KEYS */;
INSERT INTO `tbl_comment_post` VALUES (1,4,2,'Đồ ăn ở đây rất ngon',1),(2,4,3,'Anh thích nơi này rồi đấy',1),(3,4,2,'Chú cứ đến Việt Nam rồi anh dẫn đi',1),(7,4,1,'Hay ',1),(8,4,1,'Quá hay',1),(9,1,1,'Bài Viết rất hay ',1),(12,4,1,'dfdfdf',1),(13,4,1,'asdfdf',1),(14,4,1,'Hay qua ',1),(15,3,1,'Bài viêt này rất hay',1),(16,3,1,'Có cơ hội mình sẽ đến tham quan nơi này@@',1),(17,4,1,'Tạm',1),(18,4,3,'OK do',1),(19,2,3,'Bài viết sida vc ',1);
/*!40000 ALTER TABLE `tbl_comment_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_like_post`
--

DROP TABLE IF EXISTS `tbl_like_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_like_post` (
  `id_like_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `active_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_like_post`),
  KEY `fk_like_post` (`id_post`),
  KEY `fk_like_account` (`id_account`),
  CONSTRAINT `fk_like_account` FOREIGN KEY (`id_account`) REFERENCES `tbl_account` (`id_account`),
  CONSTRAINT `fk_like_post` FOREIGN KEY (`id_post`) REFERENCES `tbl_post` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_like_post`
--

LOCK TABLES `tbl_like_post` WRITE;
/*!40000 ALTER TABLE `tbl_like_post` DISABLE KEYS */;
INSERT INTO `tbl_like_post` VALUES (28,1,4,1),(29,1,2,1);
/*!40000 ALTER TABLE `tbl_like_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_post` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `img_post` text NOT NULL,
  `create_date` date NOT NULL,
  `likes` int(11) NOT NULL,
  `district` varchar(100) NOT NULL,
  `id_province` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `name_place` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `active_flag` int(11) NOT NULL,
  PRIMARY KEY (`id_post`),
  KEY `fk_post_city` (`id_province`),
  KEY `fk_post_topic` (`id_topic`),
  CONSTRAINT `fk_post_city` FOREIGN KEY (`id_province`) REFERENCES `tbl_province` (`id_province`),
  CONSTRAINT `fk_post_topic` FOREIGN KEY (`id_topic`) REFERENCES `tbl_topics` (`id_topic`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (1,'Trải nghiệm mùa hè trên vùng núi Tây Bắc','Không có gì để hiển thị cả.','/upload/1587998763605_taybac.jpg','2020-04-28',1,'Mù căng chải',6,1,1,'Làng Mù Căng Chải','Trải Nghiệm Tây Bắc',1),(2,'Trải nghiệm du lịch Nha Trang của mình','Không có gì cả.','/upload/1587998825589_nhatrang.jpg','2020-04-27',2,'Nha Trang',2,1,1,'Nha Trang','Kinh nghiệm du lịch Nha Trang',1),(3,'Chia sẻ kinh nghiệm đi du lịch Cô Tô','Ban đầu mình đến Vườn ánh sáng là vì thấy Châu Bùi chụp nhiều ảnh đẹp ở đây quá haha. Nhưng mà đến rồi mình mới thấy không phải Châu Bùi đâu mà ai vào đây cũng có ảnh đẹp đem về hết đó. Vườn cực rộng, không gian lại đẹp và siêu lung linh. Người ta dùng công nghệ 3D chiếu các hành tinh, ngôi sao,...nên bước vào mỗi căn phòng cảm giác vi diệu vô cùng. Bên trong đã đẹp mà bên ngoài cũng xuất sắc nữa. Vườn ánh sáng có kiến trúc cực ấn tượng nhé. Kiến trúc chính là tòa nhà như một cánh hoa hồng đỏ cách điệu. Nhìn từ trên cao, cả công trình như những cánh hoa hồng đỏ trôi bồng bềnh trên một thác nước. Có phải là xịn lắm không?','/upload/1587998898934_coto.jpg','2020-04-27',3,'Cô Tô',6,1,1,'Cô Tô','Địa điểm ăn uống, tham quan khi đến Cô Tô',1),(4,'Ghé chợ Đông Ba ăn vặt','Chợ Đông Ba nằm giữ cầu Trường Tiền và cầu Gia Hội, nơi đây từ lâu đã là một niềm tự hào của người dân Huế, là nhịp sống của xứ Huế với hàng nghìn món ăn ngon làm say lòng người.\r\nChợ gồm một khu nhà 3 tầng, tầng 1 bày bán các loại hải sản khô và hàng chục loại mắm đặc sản Huế, từ mắm tôm chua đến mắm sò, mắm ruốc, …. Những loại mắm này rất ngon nên bạn có thể mua một ít về làm quà cho bạn bè hoặc người thân. Tầng 2 là nơi buôn bán những món đồ thủ công mĩ nghệ làm quà lưu niệm khi du khách đến du lịch Huế, còn tầng 3 của chợ dành cho những gian hàng vải vóc và quần áo. Bạn có thể mặc cả khi mua sắm trong chợ. Không chỉ du khách mà người dân địa phương cũng thường mặc cả. Bạn hãy trả từ 1/2 giá ban đầu sau đó nâng dần lên. Nếu may mắn và giỏi mặc cả, bạn có thể mua được hàng trong chợ Đông Ba với giá rẻ vì giá cả ở Huế rất rẻ.\r\nTới chợ Đông Ba bạn như lạc vào thiên đường ẩm thực với các món ngon như bún bò giò heo, cơm hến chuẩn vị, chè Truồi nấu gừng tươi, chè hạt sen hồ Tịnh Tâm thơm dịu, bánh tráng Sịa,... chỉ với 20-30k bạn đã được ăn đủ các món ngon rồi.','/upload/1588615462364_chodongba.jpeg','2020-05-05',0,'Huế',6,1,1,'Ghé chợ Đông Ba giữa cầu Trường Tiền và cầu Gia Hội','Chợ Đông Ba',1),(5,'Trải nghiệm mùa hè trên Sapa','dfd','/upload/1589738951168_taybac.jpg','2020-05-18',0,'Mù căng chải',2,1,2,'Làng Mù Căng Chải','Sapa Những ngày đầy nắng_2',1);
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_province`
--

DROP TABLE IF EXISTS `tbl_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_province` (
  `id_province` int(11) NOT NULL AUTO_INCREMENT,
  `name_province` varchar(50) NOT NULL,
  `img_province` text NOT NULL,
  `active_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_province`
--

LOCK TABLES `tbl_province` WRITE;
/*!40000 ALTER TABLE `tbl_province` DISABLE KEYS */;
INSERT INTO `tbl_province` VALUES (1,'Hà Nội','kjkj',1),(2,'Phú Quốc','df',1),(3,'Bắc Ninh','dfd',1),(4,'Hải Dương','dfd',1),(5,'Hải Phòng','dfd',1),(6,'Quảng Ninh','dfd',1),(7,'Hà Nam','df',1);
/*!40000 ALTER TABLE `tbl_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name_role` varchar(255) NOT NULL,
  `active_flag` int(11) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'Admin',1),(2,'UserNomarl',1),(3,'UserAdvance',1);
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_save_post`
--

DROP TABLE IF EXISTS `tbl_save_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_save_post` (
  `id_save_post` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `save_date` date NOT NULL,
  `active_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_save_post`),
  KEY `fk_save_post` (`id_post`),
  KEY `fk_save_account` (`id_account`),
  CONSTRAINT `fk_save_account` FOREIGN KEY (`id_account`) REFERENCES `tbl_account` (`id_account`),
  CONSTRAINT `fk_save_post` FOREIGN KEY (`id_post`) REFERENCES `tbl_post` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_save_post`
--

LOCK TABLES `tbl_save_post` WRITE;
/*!40000 ALTER TABLE `tbl_save_post` DISABLE KEYS */;
INSERT INTO `tbl_save_post` VALUES (1,3,4,'2020-05-31',1),(2,3,2,'2020-05-31',1);
/*!40000 ALTER TABLE `tbl_save_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_topics`
--

DROP TABLE IF EXISTS `tbl_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_topics` (
  `id_topic` int(11) NOT NULL AUTO_INCREMENT,
  `name_topic` varchar(255) NOT NULL,
  `active_flag` int(11) NOT NULL,
  PRIMARY KEY (`id_topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_topics`
--

LOCK TABLES `tbl_topics` WRITE;
/*!40000 ALTER TABLE `tbl_topics` DISABLE KEYS */;
INSERT INTO `tbl_topics` VALUES (1,'Du Lịch Biển',1),(2,'Du Lịch Vùng Núi',1),(3,'Văn Hóa',1),(4,'Ẩm Thực',1);
/*!40000 ALTER TABLE `tbl_topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-03  1:07:14
