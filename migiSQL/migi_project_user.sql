CREATE DATABASE  IF NOT EXISTS `migi_project` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `migi_project`;
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lucuca','$2a$12$rwVsuBS6lgd/Oc.WkFK/cOsEXLgr47Afbt9HgnCy.E/.1G6hsxYAy','Nguyễn Văn Tiến','0399616000','Hải Dương','2021-05-20 15:27:21'),(4,'tien','1','Van Tien Nguyen','0399999999','Hà Nội','2021-05-20 17:42:27'),(22,'tuananh','$2a$12$hTMWWAbKmkqjRhnkgkjdFOwhwp8MBKP.8yQlqAqRz.60KP/fk9oLi','Xau Trai vcl','0434937','bb','2021-06-04 10:32:42'),(26,'ccc','$2a$12$VqPXqPZ0iyhVk2G3cqhYaO/ZLdz92czEvT5V5I..8bsOt3O7Y2loO','Van tien','1234','Tan Trieu','2021-06-06 13:46:28'),(34,'trang','$2a$12$FPr5cLa5fEoh/7lEPsA.FuQuPw4fwCoNZdu.6kJvotKid/zjr8Jqi','Đoàn Thị Huyền Trang','0336663652','Nghệ An','2021-06-06 18:29:49'),(35,'khanh','$2a$12$KHGqDE.eCHCJUUvck5bdtuUN4AHRHkBWhYDKZQJjl1lYeCyCDovAe','khanh','83u32329','dndnd','2021-06-07 10:04:42'),(36,'hienvv','$2a$12$sbcjMQZm4NqVUwaN26wBUO5cahDEOXNt3LVvEcA2rASv9.ychbuT.','hien vu van','12345','hien','2021-06-07 11:24:44'),(40,'hung','$2a$12$pa3ss7L3lV2WkkbXzA1AqeipL0XWdCCBvPGaMh/BiQSUFdgeL7vjG','hung','212`','hung','2021-06-07 14:06:56'),(42,'trangdoanthi','$2a$12$XdnkG6c48LrE8tLlS0DfNuv0EohjOvoKTIS0pP0izeL.yVbwXwBjm','tranggg','577488','nghe an','2021-06-13 16:31:02'),(43,'tien1','$2a$12$94Ha.xp7ZfRYauiUAxTAUuMUQKBz7kQrY0nuBCepOhTZXs64vhV/K','tien','466464','hd','2021-06-13 17:34:36'),(44,'huyen','$2a$12$vrYVFpxWjJpJ54ZEovSSAeTmuISEClre.JVDsFZB2K0mL46yoWgSG','ngoc huyen','0999090','hdhd','2021-06-13 18:16:13'),(45,'hj','$2a$12$TbYz3YpAui1htUshHYFrVexXSvGMIW0WLtnvX8th.PfW/wwXrGM8a','tiengiddy','54545','d','2021-06-16 23:11:05'),(46,'ngocanh','$2a$12$bcF5Dbayi5OCMOb.ecWYIOTDaZ.KzdGI50bW7GL.NOayb4AZt424a','ngocanh','55335535','shshshshs','2021-06-17 19:51:32'),(47,'tringuyen','$2a$12$rxWdKvKoSIYp.RkbqsFBFO0DcKmIi7SLlY9aERJE1RfOqUZXp8vfK','Nguyễn Văn Trí','0123456789','Cầu Giấy','2021-06-23 11:31:13');
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

-- Dump completed on 2021-06-23 15:41:49
