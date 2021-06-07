-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: migi_project
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tiengiddy','1234','Nguyễn Văn Tiến','0399616000','Hải Dương','2021-05-20 15:27:21'),(4,'tien','1','Van Tien Nguyen','0399999999','Hà Nội','2021-05-20 17:42:27'),(5,'manh','1','nvmanh','0333333','kk','2021-05-24 14:55:33'),(6,'hiennv','1234','Vu Van Hien','0699742651','Cam Giang',NULL),(7,'nguyenanh','1234','Nguyen Tuan Anh','0366985206','Ha Noi',NULL),(9,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(10,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(11,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(12,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(13,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(14,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(15,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(16,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(17,'dsfd','fasvfghg','hghghgdf','121323254','Đồng Nai',NULL),(18,'fd','fd','fd','fdfffdfd','dfffddddd',NULL),(19,'vv','vv','vv','6555555','fdf',NULL),(20,'hi','$2a$12$uTcYeEUXHc/nymjKVL58I.VWYQlSS93U/MZJMHx1WIJaMOXKjoYC.','Concat','0333333333','Ha Long','2021-06-03 19:49:25'),(21,'aa','$2a$12$lYm6rGQHR6V4xgKTZO/Anu4L8/RXV1.wN7c.QOsJoLE.cmjSdEUOi','aa','1234','aa','2021-06-04 09:44:17'),(22,'bb','$2a$12$9S8PD8yW25fA.WKT.OjdcOHxi2ZCNzlfhFSZnrJshcj.ErpUtg2Sa','bb','0434937','bb','2021-06-04 10:32:42'),(26,'cc','$2a$12$hoJddJ1MJ2rOYCgqykKoU.AmMWv1qf/pd18f1MYEOHHK1qYvQQs6K','Van tien','1234','Tan Trieu','2021-06-06 13:46:28'),(27,'dd','$2a$12$MC2F4IILTyAHJc01oKF48.xW4itnw.vdg/s0LfDPstJYpS.iJ3W1u','dd','545454','Cam Giang','2021-06-06 16:18:45'),(33,'ee','$2a$12$3mQKsK1d4RZTXBKVGt.xFeAX3.7ATNDVEinK4PTIp52ubUEnmTpse','van tien','0399617063','Hải Dươngg','2021-06-06 16:37:20'),(34,'trang','$2a$12$FPr5cLa5fEoh/7lEPsA.FuQuPw4fwCoNZdu.6kJvotKid/zjr8Jqi','Đoàn Thị Huyền Trang','0336663652','Nghệ An','2021-06-06 18:29:49'),(35,'khanh','$2a$12$KHGqDE.eCHCJUUvck5bdtuUN4AHRHkBWhYDKZQJjl1lYeCyCDovAe','khanh','83u32329','dndnd','2021-06-07 10:04:42'),(36,'hien','$2a$12$aDkK1gQxoQ2uWnfkcb9sB.MvLpGEJsNn8UTQQ0gIo4WHe/Q47rWmy','hien','12345','hien','2021-06-07 11:24:44'),(40,'hung','$2a$12$pa3ss7L3lV2WkkbXzA1AqeipL0XWdCCBvPGaMh/BiQSUFdgeL7vjG','hung','212`','hung','2021-06-07 14:06:56');
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

-- Dump completed on 2021-06-07 15:22:48
