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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `image` text,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Quần âu','– Chất liệu: Vải cao cấp. Đặc tính: Mềm mại, co giãn tốt, có độ thấm hút mồ hôi và hút ẩm cao, thoáng mát.',150000,'https://360boutique.vn/wp-content/uploads/2021/03/QACTK202.jpg','2021-05-19 15:14:48',NULL),(2,1,'Áo polo nam POMTK204','– Chất liệu: 95% COTTON , 5% SPANDEX',340000,'https://360boutique.vn/wp-content/uploads/2021/05/POMTK204-1.jpg','2021-05-19 15:15:24',NULL),(3,2,'Áo Croptop nữ Marvel BOOZilla','- Áo in hình logo Marvel trước ngực',440000,'https://cdn.boo.vn/products/4523/ao-croptop-nu-marvel-boozilla-solidden-blackden-1-463.jpg','2021-05-19 15:17:01',NULL),(4,3,'Áo trẻ em','Chất liệu vải 100% cotton cao cấp nhất',200000,'https://media.canifa.com/catalog/product/3/t/3ts21s002-sw001-5.jpg','2021-05-19 15:18:39',NULL),(5,3,'Quần trẻ em','Chất liệu vải 100% cotton cao cấp nhất',300000,'https://media.canifa.com/catalog/product/2/b/2bs21s010-sg150-2-thumb.jpg','2021-05-19 23:01:53',NULL),(6,3,'Bộ quần áo trẻ em','Chất liệu vải 100% cotton cao cấp nhất',400000,'https://media.canifa.com/catalog/product/2/t/2ts21s004-sg339-2.jpg','2021-05-19 23:01:53',NULL),(7,3,'Áo sơ mi','Chất liệu vải 100% cotton cao cấp nhất',500000,'https://media.canifa.com/catalog/product/1/t/1to21s005-cm034-1-thumb.jpg','2021-05-19 23:01:53',NULL),(8,3,'Áo trẻ em','Chất liệu vải 100% cotton cao cấp nhất',600000,'https://media.canifa.com/catalog/product/2/t/2tw20w005-se020-120-1.jpg','2021-05-19 23:01:53',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-07 15:22:47
