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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `totalprice` float DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `name_user` varchar(100) DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1370000,'Tân Triều','0399617063','tiengiddy','2021-05-20 20:29:09','2021-05-20 20:29:09',1),(2,1,300000,'Ha Noi','0399617063','tien','2021-05-21 16:18:08','2021-05-21 16:18:08',1),(20,1,440000,'Ha Noi','0399617','tiengiddy','2021-05-22 15:59:50','2021-05-20 00:00:00',1),(21,1,440000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:00:52','2021-05-20 00:00:00',1),(22,1,340000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:02:29','2021-05-20 00:00:00',1),(23,1,440000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:03:13','2021-05-20 00:00:00',1),(24,1,340000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:08:36','2021-05-20 00:00:00',1),(25,1,340000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:09:54','2021-05-20 00:00:00',1),(26,1,300000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:12:16','2021-05-20 00:00:00',1),(28,1,340000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:17:46','2021-05-20 00:00:00',1),(29,1,340000,'Ha Noi','0399617','tiengiddy','2021-05-22 16:20:41','2021-05-20 00:00:00',1),(30,1,3600000,'Ha Noi','0399617063','tiengiddy','2021-05-22 16:24:11','2021-05-20 00:00:00',1),(35,1,490000,'Ha Noi','0399617','tiengiddy','2021-05-22 22:19:28','2021-05-20 00:00:00',1),(38,1,490000,'Ha Noi','0399617','tiengiddy','2021-05-22 22:21:30','2021-05-20 00:00:00',1),(39,1,2160000,'Ha Noi','0399617063','tiengiddy','2021-05-22 22:21:44','2021-05-20 00:00:00',1),(40,1,3320000,'Ha Noi','0399617','tiengiddy','2021-05-22 22:35:55','2021-05-20 00:00:00',1),(53,1,1700000,'Ha Noi','0399617','tiengiddy','2021-05-23 02:15:17','2021-05-20 00:00:00',1),(62,4,340000,'Hai Duong','0399617063','tien','2021-05-23 02:23:47','2021-05-20 00:00:00',1),(63,1,1770000,'Ha Noi','0399617','tiengiddy','2021-05-23 10:00:52','2021-05-20 00:00:00',1),(68,4,1630000,'Hai Duong','0399617063','tien','2021-05-23 10:49:51','2021-05-20 00:00:00',1),(77,4,2340000,'Hai Duong','0399617063','tien','2021-05-23 11:23:21','2021-05-20 00:00:00',1),(78,1,6960000,'Ha Noi','0399617','tiengiddy','2021-05-23 11:23:46','2021-05-20 00:00:00',1),(82,1,5870000,'Ha Noi','0399617','tiengiddy','2021-05-23 12:04:11','2021-05-20 00:00:00',1),(85,1,2130000,'Ha Noi','0399617','tiengiddy','2021-05-23 14:23:19','2021-05-20 00:00:00',1),(86,1,4760000,'Ha Noi','0399617','tiengiddy','2021-05-23 18:20:14','2021-05-20 00:00:00',1),(89,1,3120000,'Hải Dương','0399616000','tiengiddy','2021-05-23 18:50:24','2021-05-20 00:00:00',1),(90,4,2070000,'Hải Dương','0399617063','tien','2021-05-23 18:51:04','2021-05-20 00:00:00',1),(91,4,1980000,'Hà Nội','0399999999','tien','2021-05-23 18:52:49','2021-05-20 00:00:00',0),(92,1,600000,'Hải Dương','0399616000','tiengiddy','2021-05-23 22:15:28','2021-05-20 00:00:00',1),(96,22,4250000,'bb','bb','bb','2021-06-05 17:31:25','2021-06-04 00:00:00',1),(99,22,5580000,'bb','bb','bb','2021-06-06 09:20:34','2021-06-04 00:00:00',1),(105,26,750000,'ccc','1234','ccasasasaas','2021-06-06 18:27:26','2021-06-06 00:00:00',1),(107,34,2330000,'hahaha','403489','trang','2021-06-06 18:30:40','2021-06-06 00:00:00',1),(109,34,2400000,'hahaha','403489','trang','2021-06-06 18:34:27','2021-06-06 00:00:00',1),(130,34,850000,'Nghệ An','0336663652','trang','2021-06-06 18:45:45','2021-06-06 00:00:00',1),(131,34,6500000,'Nghệ An','0336663652','trang','2021-06-06 18:45:58','2021-06-06 00:00:00',1),(133,35,340000,'dndnd','83u32329','khanh','2021-06-07 10:23:43','2021-06-07 00:00:00',0),(134,36,9260000,'hien','12345','hien','2021-06-07 13:31:22','2021-06-07 00:00:00',1),(136,26,1360000,'Tân Triều','0399617063','cc','2021-06-07 14:24:50','2021-06-06 00:00:00',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
