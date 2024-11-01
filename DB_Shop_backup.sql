-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: DB_Shop
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'hom369146@gmail.com',1,1,2),(2,'nvthanhty@ittc.edu.vn',1,1,3),(3,'hom3691461@gmail.com',1,1,4),(4,'hom3691462@gmail.com',1,1,5),(5,'nvthanhty@gmail.com',1,1,6);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add loai san pham',7,'add_loaisanpham'),(26,'Can change loai san pham',7,'change_loaisanpham'),(27,'Can delete loai san pham',7,'delete_loaisanpham'),(28,'Can view loai san pham',7,'view_loaisanpham'),(29,'Can add hoa don',8,'add_hoadon'),(30,'Can change hoa don',8,'change_hoadon'),(31,'Can delete hoa don',8,'delete_hoadon'),(32,'Can view hoa don',8,'view_hoadon'),(33,'Can add nguoi dung',9,'add_nguoidung'),(34,'Can change nguoi dung',9,'change_nguoidung'),(35,'Can delete nguoi dung',9,'delete_nguoidung'),(36,'Can view nguoi dung',9,'view_nguoidung'),(37,'Can add san pham',10,'add_sanpham'),(38,'Can change san pham',10,'change_sanpham'),(39,'Can delete san pham',10,'delete_sanpham'),(40,'Can view san pham',10,'view_sanpham'),(41,'Can add ct hoa don',11,'add_cthoadon'),(42,'Can change ct hoa don',11,'change_cthoadon'),(43,'Can delete ct hoa don',11,'delete_cthoadon'),(44,'Can view ct hoa don',11,'view_cthoadon'),(45,'Can add site',12,'add_site'),(46,'Can change site',12,'change_site'),(47,'Can delete site',12,'delete_site'),(48,'Can view site',12,'view_site'),(49,'Can add email address',13,'add_emailaddress'),(50,'Can change email address',13,'change_emailaddress'),(51,'Can delete email address',13,'delete_emailaddress'),(52,'Can view email address',13,'view_emailaddress'),(53,'Can add email confirmation',14,'add_emailconfirmation'),(54,'Can change email confirmation',14,'change_emailconfirmation'),(55,'Can delete email confirmation',14,'delete_emailconfirmation'),(56,'Can view email confirmation',14,'view_emailconfirmation'),(57,'Can add social account',15,'add_socialaccount'),(58,'Can change social account',15,'change_socialaccount'),(59,'Can delete social account',15,'delete_socialaccount'),(60,'Can view social account',15,'view_socialaccount'),(61,'Can add social application',16,'add_socialapp'),(62,'Can change social application',16,'change_socialapp'),(63,'Can delete social application',16,'delete_socialapp'),(64,'Can view social application',16,'view_socialapp'),(65,'Can add social application token',17,'add_socialtoken'),(66,'Can change social application token',17,'change_socialtoken'),(67,'Can delete social application token',17,'delete_socialtoken'),(68,'Can view social application token',17,'view_socialtoken'),(69,'Can add association',18,'add_association'),(70,'Can change association',18,'change_association'),(71,'Can delete association',18,'delete_association'),(72,'Can view association',18,'view_association'),(73,'Can add code',19,'add_code'),(74,'Can change code',19,'change_code'),(75,'Can delete code',19,'delete_code'),(76,'Can view code',19,'view_code'),(77,'Can add nonce',20,'add_nonce'),(78,'Can change nonce',20,'change_nonce'),(79,'Can delete nonce',20,'delete_nonce'),(80,'Can view nonce',20,'view_nonce'),(81,'Can add user social auth',21,'add_usersocialauth'),(82,'Can change user social auth',21,'change_usersocialauth'),(83,'Can delete user social auth',21,'delete_usersocialauth'),(84,'Can view user social auth',21,'view_usersocialauth'),(85,'Can add partial',22,'add_partial'),(86,'Can change partial',22,'change_partial'),(87,'Can delete partial',22,'delete_partial'),(88,'Can view partial',22,'view_partial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'!JycCcM6E441D8impHvPoOjrOHXOa2rXCkBOtWG61','2024-10-24 06:29:31.264222',0,'minh','Minh','Ho','hom369146@gmail.com',0,1,'2024-10-24 06:10:45.236499'),(3,'!sE4GvsCsEdHdVmLu9N6Guyt14oYIpufYTomjFuZf','2024-10-24 06:45:57.806884',1,'ty','Tß╗╖','Hß╗ô Thanh','nvthanhty@ittc.edu.vn',1,1,'2024-10-24 06:29:20.000000'),(4,'!pu8lKT8IGJfT6xzn7Nnd9fMs9sU7OwYxWay18pOM','2024-10-24 06:39:32.494877',0,'minh9','Minh','Ho','hom3691461@gmail.com',0,1,'2024-10-24 06:39:32.388579'),(5,'!m7sCZYXvgALkcn3gotJgFzPbTdU1eck0eRtDD35L','2024-10-24 06:40:18.703376',0,'ho','Ho','Minh','hom3691462@gmail.com',0,1,'2024-10-24 06:40:18.665859'),(6,'!27lir8IRLNTJwHZlqX7CaBJpHs2rBJFOcqu7vZ71','2024-10-25 04:37:38.297897',1,'thanh_ty','Thanh Tß╗╖','Hß╗ô','nvthanhty@gmail.com',1,1,'2024-10-24 06:45:32.000000'),(7,'pbkdf2_sha256$870000$nquoa0vuiTWkPQcZVkbmmh$7i+jnAdWWFBlnbLJY4OcModJAld2VIlKf4hqCMkkZMM=',NULL,1,'hi','minh','dan','dannguyenhana@gmail.com',1,1,'2024-10-24 06:48:21.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,3,1),(2,3,2),(3,3,3),(4,3,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(19,3,19),(20,3,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,3,41),(42,3,42),(43,3,43),(44,3,44),(45,3,45),(46,3,46),(47,3,47),(48,3,48),(49,3,49),(50,3,50),(51,3,51),(52,3,52),(53,3,53),(54,3,54),(55,3,55),(56,3,56),(57,3,57),(58,3,58),(59,3,59),(60,3,60),(61,3,61),(62,3,62),(63,3,63),(64,3,64),(65,3,65),(66,3,66),(67,3,67),(68,3,68),(69,3,69),(70,3,70),(71,3,71),(72,3,72),(73,3,73),(74,3,74),(75,3,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,3,87),(88,3,88),(89,6,1),(90,6,2),(91,6,3),(92,6,4),(93,6,5),(94,6,6),(95,6,7),(96,6,8),(97,6,9),(98,6,10),(99,6,11),(100,6,12),(101,6,13),(102,6,14),(103,6,15),(104,6,16),(105,6,17),(106,6,18),(107,6,19),(108,6,20),(109,6,21),(110,6,22),(111,6,23),(112,6,24),(113,6,25),(114,6,26),(115,6,27),(116,6,28),(117,6,29),(118,6,30),(119,6,31),(120,6,32),(121,6,33),(122,6,34),(123,6,35),(124,6,36),(125,6,37),(126,6,38),(127,6,39),(128,6,40),(129,6,41),(130,6,42),(131,6,43),(132,6,44),(133,6,45),(134,6,46),(135,6,47),(136,6,48),(137,6,49),(138,6,50),(139,6,51),(140,6,52),(141,6,53),(142,6,54),(143,6,55),(144,6,56),(145,6,57),(146,6,58),(147,6,59),(148,6,60),(149,6,61),(150,6,62),(151,6,63),(152,6,64),(153,6,65),(154,6,66),(155,6,67),(156,6,68),(157,6,69),(158,6,70),(159,6,71),(160,6,72),(161,6,73),(162,6,74),(163,6,75),(164,6,76),(165,6,77),(166,6,78),(167,6,79),(168,6,80),(169,6,81),(170,6,82),(171,6,83),(172,6,84),(173,6,85),(174,6,86),(175,6,87),(176,6,88),(177,7,1),(178,7,2),(179,7,3),(180,7,4),(181,7,5),(182,7,6),(183,7,7),(184,7,8),(185,7,9),(186,7,10),(187,7,11),(188,7,12),(189,7,13),(190,7,14),(191,7,15),(192,7,16),(193,7,17),(194,7,18),(195,7,19),(196,7,20),(197,7,21),(198,7,22),(199,7,23),(200,7,24),(201,7,25),(202,7,26),(203,7,27),(204,7,28),(205,7,29),(206,7,30),(207,7,31),(208,7,32),(209,7,33),(210,7,34),(211,7,35),(212,7,36),(213,7,37),(214,7,38),(215,7,39),(216,7,40),(217,7,41),(218,7,42),(219,7,43),(220,7,44),(221,7,45),(222,7,46),(223,7,47),(224,7,48),(225,7,49),(226,7,50),(227,7,51),(228,7,52),(229,7,53),(230,7,54),(231,7,55),(232,7,56),(233,7,57),(234,7,58),(235,7,59),(236,7,60),(237,7,61),(238,7,62),(239,7,63),(240,7,64),(241,7,65),(242,7,66),(243,7,67),(244,7,68),(245,7,69),(246,7,70),(247,7,71),(248,7,72),(249,7,73),(250,7,74),(251,7,75),(252,7,76),(253,7,77),(254,7,78),(255,7,79),(256,7,80),(257,7,81),(258,7,82),(259,7,83),(260,7,84),(261,7,85),(262,7,86),(263,7,87),(264,7,88);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_cthoadon`
--

DROP TABLE IF EXISTS `dashboard_cthoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_cthoadon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(100) NOT NULL,
  `SoLuong` int NOT NULL,
  `DonGia` int unsigned NOT NULL,
  `MaHD_id` int NOT NULL,
  `MaSP_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_cthoadon_MaHD_id_1de9296a_fk_dashboard_hoadon_MaHD` (`MaHD_id`),
  KEY `dashboard_cthoadon_MaSP_id_6c0c14e5_fk_dashboard_sanpham_MaSP` (`MaSP_id`),
  CONSTRAINT `dashboard_cthoadon_MaHD_id_1de9296a_fk_dashboard_hoadon_MaHD` FOREIGN KEY (`MaHD_id`) REFERENCES `dashboard_hoadon` (`MaHD`),
  CONSTRAINT `dashboard_cthoadon_MaSP_id_6c0c14e5_fk_dashboard_sanpham_MaSP` FOREIGN KEY (`MaSP_id`) REFERENCES `dashboard_sanpham` (`MaSP`),
  CONSTRAINT `dashboard_cthoadon_chk_1` CHECK ((`DonGia` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_cthoadon`
--

LOCK TABLES `dashboard_cthoadon` WRITE;
/*!40000 ALTER TABLE `dashboard_cthoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_cthoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_hoadon`
--

DROP TABLE IF EXISTS `dashboard_hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_hoadon` (
  `MaHD` int NOT NULL AUTO_INCREMENT,
  `NgayDat` date NOT NULL,
  `TrangThai` varchar(100) NOT NULL,
  `NgayGiao` date DEFAULT NULL,
  `MaNV` int DEFAULT NULL,
  `Tong` bigint DEFAULT NULL,
  `DiaChiGiao` varchar(255) NOT NULL,
  `SDT` varchar(10) NOT NULL,
  PRIMARY KEY (`MaHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_hoadon`
--

LOCK TABLES `dashboard_hoadon` WRITE;
/*!40000 ALTER TABLE `dashboard_hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_loaisanpham`
--

DROP TABLE IF EXISTS `dashboard_loaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_loaisanpham` (
  `MaLoai` int NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(100) NOT NULL,
  `TrangThai` smallint NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_loaisanpham`
--

LOCK TABLES `dashboard_loaisanpham` WRITE;
/*!40000 ALTER TABLE `dashboard_loaisanpham` DISABLE KEYS */;
INSERT INTO `dashboard_loaisanpham` VALUES (1,'Thß╗¥i Trang Nam',1),(2,'Thß╗¥i Trang Nß╗»',1),(3,'Thß╗¥i trang Unisex',1);
/*!40000 ALTER TABLE `dashboard_loaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_nguoidung`
--

DROP TABLE IF EXISTS `dashboard_nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_nguoidung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `DiaChi` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `dashboard_nguoidung_user_id_4e1ece72_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_nguoidung`
--

LOCK TABLES `dashboard_nguoidung` WRITE;
/*!40000 ALTER TABLE `dashboard_nguoidung` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_sanpham`
--

DROP TABLE IF EXISTS `dashboard_sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_sanpham` (
  `MaSP` int NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(100) NOT NULL,
  `DonGia` int unsigned NOT NULL,
  `HinhAnh` varchar(100) DEFAULT NULL,
  `MoTa` longtext NOT NULL,
  `NCC` varchar(100) NOT NULL,
  `SoLuong` int NOT NULL,
  `LoaiSP_id` int NOT NULL,
  `TrangThai` smallint NOT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `dashboard_sanpham_LoaiSP_id_d7ed6d6a_fk_dashboard` (`LoaiSP_id`),
  CONSTRAINT `dashboard_sanpham_LoaiSP_id_d7ed6d6a_fk_dashboard` FOREIGN KEY (`LoaiSP_id`) REFERENCES `dashboard_loaisanpham` (`MaLoai`),
  CONSTRAINT `dashboard_sanpham_chk_1` CHECK ((`DonGia` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_sanpham`
--

LOCK TABLES `dashboard_sanpham` WRITE;
/*!40000 ALTER TABLE `dashboard_sanpham` DISABLE KEYS */;
INSERT INTO `dashboard_sanpham` VALUES (1,'├üo s╞í mi cß╗Öc tay in hß╗ìa tiß║┐t lß╗¢n',370000,'images/├üo_s╞í_mi_cß╗Öc_tay_in_hß╗ìa_tiß║┐t_lß╗¢n.png','├üo s╞í mi cß╗Öc tay phong c├ích hiß╗çn ─æß║íi vß╗¢i hß╗ìa tiß║┐t chß╗» c├íi lß╗¢n, bao gß╗ôm c├íc k├╜ tß╗▒ nh╞░ \"T\", \"S\", \"H\", ΓÇ£AΓÇ¥. ├üo c├│ hß╗ìa tiß║┐t kß║╗ sß╗ìc nhß╗Å tr├¬n nß╗ün trß║»ng, tß║ío n├¬n vß║╗ ngo├ái vß╗½a cß╗ò ─æiß╗ân vß╗½a c├í t├¡nh. Ph├╣ hß╗úp cho nhß╗»ng ai y├¬u th├¡ch phong c├ích nß╗òi bß║¡t v├á ─æß╗Öc ─æ├ío.','Tobi VN',12,1,1),(2,'├üo thß╗â thao TOBI trß║»ng ─æen',300000,'images/├üo_thß╗â_thao_TOBI_trß║»ng_─æen_lOhgw4f.png','├üo thß╗â thao TOBI thiß║┐t kß║┐ ─æ╞ín giß║ún nh╞░ng mß║ính mß║╜ vß╗¢i t├┤ng m├áu trß║»ng ─æen kß║┐t hß╗úp. Chß║Ñt liß╗çu l╞░ß╗¢i tho├íng kh├¡, ├ío c├ái n├║t ph├¡a tr╞░ß╗¢c vß╗¢i logo TOBI in nhß╗Å ph├¡a ngß╗▒c tr├íi v├á biß╗âu t╞░ß╗úng h├¼nh chß╗» \"T\" ß╗ƒ ngß╗▒c phß║úi. ├üo mang lß║íi cß║úm gi├íc thoß║úi m├íi khi vß║¡n ─æß╗Öng, th├¡ch hß╗úp cho c├íc hoß║ít ─æß╗Öng thß╗â thao hoß║╖c mß║╖c phong c├ích casual th╞░ß╗¥ng ng├áy.','Tobi VN',55,1,1),(3,'├üo thun in ─æ├¿ TOBI ',670000,'images/├üo_thun_in_─æ├¿_TOBI_Cgrh4LC.png','├üo thun m├áu ─æen vß╗¢i thiß║┐t kß║┐ h├¼nh s├ón khß║Ñu ├ính s├íng xanh c├╣ng d├▓ng chß╗» \"Like A Star\" nß╗òi bß║¡t. ├üo c├│ c├íc chß╗» k├╜ giß║ú ngß║½u nhi├¬n ph├¡a tr╞░ß╗¢c, tß║ío n├¬n phong c├ích n─âng ─æß╗Öng v├á ß║Ñn t╞░ß╗úng.','Tobi VN',53,3,1),(4,'├üo thun kh├┤ng tay \"Anh Trai Say Hi\"',370000,'images/├üo_thun_kh├┤ng_tay_POfax3d.png','├üo thun kh├┤ng tay m├áu trß║»ng vß╗¢i c├íc chi tiß║┐t m├áu ─æen dß╗ìc hai b├¬n, c├│ logo chß╗» \"A\" v├á d├▓ng chß╗» \"Anh Trai Say Hi\" ß╗ƒ giß╗»a. Thiß║┐t kß║┐ thß╗â thao, tho├íng m├ít, ph├╣ hß╗úp cho hoß║ít ─æß╗Öng ngo├ái trß╗¥i v├á thß╗â thao ','Tobi VN',57,3,1),(5,'├üo thun \"Anh Trai\"',320000,'images/├üo_thun_Anh_Trai_bpNlWRS.png','├üo thun tay ngß║»n m├áu trß║»ng vß╗¢i c├íc chi tiß║┐t m├áu xanh d╞░╞íng dß╗ìc hai b├¬n v├á tr├¬n vai. ß╗₧ giß╗»a ├ío c├│ logo chß╗» \"A\" lß╗¢n, ph├╣ hß╗úp cho c├íc hoß║ít ─æß╗Öng thß╗â thao v├á thß╗¥i trang n─âng ─æß╗Öng. ','Tobi VN',77,3,1),(6,'├üo thun robot vß╗¢i nß╗ün xanh ─æen ',180000,'images/├üo_thun_robot_vß╗¢i_nß╗ün_xanh_─æen_eIfSQ5a.png','├üo thun cß╗ò tr├▓n vß╗¢i h├¼nh ß║únh robot dß╗à th╞░╞íng m├áu trß║»ng ph├¡a tr╞░ß╗¢c. ├üo c├│ nß╗ün hß╗ìa tiß║┐t xanh ─æen pha trß╗Ön vß╗¢i c├íc ─æ╞░ß╗¥ng n├⌐t h├¼nh hß╗ìc tß║ío cß║úm gi├íc hiß╗çn ─æß║íi v├á n─âng ─æß╗Öng. Ph├¡a tr╞░ß╗¢c c├│ d├▓ng chß╗» \"Anh Trai Say Hi\" v├á logo th╞░╞íng hiß╗çu TOBI.','Tobi VN',12,3,1),(7,'Quß║ºn short ─æen vß╗¢i hß╗ìa tiß║┐t logo ',290000,'images/Quß║ºn_short_─æen_vß╗¢i_hß╗ìa_tiß║┐t_logo_qgB73rO.png','Quß║ºn short m├áu ─æen, l╞░ng thun co gi├ún thoß║úi m├íi. Phß║ºn d╞░ß╗¢i b├¬n tr├íi c├│ logo TOBI v├á d├▓ng chß╗» \"Anh Trai Say Hi\". B├¬n phß║úi c├│ th├¬m d├▓ng chß╗» m├┤ tß║ú th╞░╞íng hiß╗çu TOBI. Thiß║┐t kß║┐ ─æ╞ín giß║ún, phong c├ích thß╗â thao, ph├╣ hß╗úp cho hoß║ít ─æß╗Öng th╞░ß╗¥ng ng├áy. ','Tobi VN',42,1,1),(8,'├üo thun polo \"Regular\" hoß║í tiß║┐t hß╗ông ',880000,'images/├üo_thun_polo_Regular_hoß║í_tiß║┐t_hß╗ông_YSAQoT3.png','├üo thun polo cß╗ò bß║╗ vß╗¢i thiß║┐t kß║┐ hß╗ìa tiß║┐t ├┤ vu├┤ng hß╗ông v├á trß║»ng. Tr╞░ß╗¢c ngß╗▒c c├│ chß╗» \"Regular\" lß╗¢n m├áu ─æen, logo h├¼nh con s╞░ tß╗¡, v├á th╞░╞íng hiß╗çu TOBI nß║▒m ß╗ƒ ph├¡a tr├¬n. M├áu sß║»c hß╗ông chß╗º ─æß║ío tß║ío cß║úm gi├íc t╞░╞íi mß╗¢i v├á trß║╗ trung, th├¡ch hß╗úp cho nhß╗»ng ng╞░ß╗¥i y├¬u th├¡ch phong c├ích nß╗òi bß║¡t v├á c├í t├¡nh. ','Tobi VN',63,2,1),(9,'├üo thun \"My Home is in Heaven\"',899000,'images/├üo_thun_My_Home_is_in_Heaven_J0OIiic.png','├üo thun m├áu trß║»ng cß╗ò tr├▓n vß╗¢i d├▓ng chß╗» \"MY HOME IS IN HEAVEN\" nß╗òi bß║¡t ß╗ƒ giß╗»a ├ío vß╗¢i m├áu hß╗ông ─æß║¡m. Ph├¡a d╞░ß╗¢i c├│ chß╗» k├╜ \"Tobi Streetwear\" v├á h├¼nh ß║únh thi├¬n thß║ºn m├áu hß╗ông nhß║╣ tß║ío ─æiß╗âm nhß║Ñn. Thiß║┐t kß║┐ hiß╗çn ─æß║íi v├á thß╗¥i trang, ph├╣ hß╗úp vß╗¢i phong c├ích n─âng ─æß╗Öng v├á trß║╗ trung.','Tobi VN',82,2,1);
/*!40000 ALTER TABLE `dashboard_sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (9,'2024-10-24 06:46:38.386547','6','thanh_ty',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"User permissions\"]}}]',4,3),(10,'2024-10-24 06:48:21.643682','7','hi',1,'[{\"added\": {}}]',4,3),(11,'2024-10-24 06:49:10.833458','7','hi',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\", \"User permissions\"]}}]',4,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'account','emailaddress'),(14,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'dashboard','cthoadon'),(8,'dashboard','hoadon'),(7,'dashboard','loaisanpham'),(9,'dashboard','nguoidung'),(10,'dashboard','sanpham'),(6,'sessions','session'),(12,'sites','site'),(18,'social_django','association'),(19,'social_django','code'),(20,'social_django','nonce'),(22,'social_django','partial'),(21,'social_django','usersocialauth'),(15,'socialaccount','socialaccount'),(16,'socialaccount','socialapp'),(17,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-24 05:24:18.517177'),(2,'auth','0001_initial','2024-10-24 05:24:19.114977'),(3,'account','0001_initial','2024-10-24 05:24:19.311894'),(4,'account','0002_email_max_length','2024-10-24 05:24:19.331969'),(5,'account','0003_alter_emailaddress_create_unique_verified_email','2024-10-24 05:24:19.366371'),(6,'account','0004_alter_emailaddress_drop_unique_email','2024-10-24 05:24:19.419749'),(7,'account','0005_emailaddress_idx_upper_email','2024-10-24 05:24:19.447584'),(8,'account','0006_emailaddress_lower','2024-10-24 05:24:19.462014'),(9,'account','0007_emailaddress_idx_email','2024-10-24 05:24:19.511802'),(10,'account','0008_emailaddress_unique_primary_email_fixup','2024-10-24 05:24:19.524229'),(11,'account','0009_emailaddress_unique_primary_email','2024-10-24 05:24:19.531952'),(12,'admin','0001_initial','2024-10-24 05:24:19.676045'),(13,'admin','0002_logentry_remove_auto_add','2024-10-24 05:24:19.683429'),(14,'admin','0003_logentry_add_action_flag_choices','2024-10-24 05:24:19.690608'),(15,'contenttypes','0002_remove_content_type_name','2024-10-24 05:24:19.776921'),(16,'auth','0002_alter_permission_name_max_length','2024-10-24 05:24:19.849064'),(17,'auth','0003_alter_user_email_max_length','2024-10-24 05:24:19.875509'),(18,'auth','0004_alter_user_username_opts','2024-10-24 05:24:19.883030'),(19,'auth','0005_alter_user_last_login_null','2024-10-24 05:24:19.943865'),(20,'auth','0006_require_contenttypes_0002','2024-10-24 05:24:19.946840'),(21,'auth','0007_alter_validators_add_error_messages','2024-10-24 05:24:19.955275'),(22,'auth','0008_alter_user_username_max_length','2024-10-24 05:24:20.028062'),(23,'auth','0009_alter_user_last_name_max_length','2024-10-24 05:24:20.092276'),(24,'auth','0010_alter_group_name_max_length','2024-10-24 05:24:20.112796'),(25,'auth','0011_update_proxy_permissions','2024-10-24 05:24:20.127328'),(26,'auth','0012_alter_user_first_name_max_length','2024-10-24 05:24:20.193285'),(27,'dashboard','0001_initial','2024-10-24 05:24:20.622825'),(28,'dashboard','0002_loaisanpham_trangthai_sanpham_trangthai','2024-10-24 05:24:20.680779'),(29,'dashboard','0003_hoadon_diachigiao_hoadon_sdt','2024-10-24 05:24:20.758059'),(30,'dashboard','0004_remove_hoadon_makh','2024-10-24 05:24:20.825930'),(31,'dashboard','0005_alter_hoadon_tong','2024-10-24 05:24:20.863145'),(32,'dashboard','0006_alter_loaisanpham_trangthai_alter_sanpham_hinhanh_and_more','2024-10-24 05:24:20.948492'),(33,'dashboard','0007_alter_sanpham_hinhanh','2024-10-24 05:24:21.000625'),(34,'sessions','0001_initial','2024-10-24 05:24:21.038648'),(35,'sites','0001_initial','2024-10-24 05:24:21.056942'),(36,'sites','0002_alter_domain_unique','2024-10-24 05:24:21.073802'),(37,'default','0001_initial','2024-10-24 05:24:21.308141'),(38,'social_auth','0001_initial','2024-10-24 05:24:21.311146'),(39,'default','0002_add_related_name','2024-10-24 05:24:21.319152'),(40,'social_auth','0002_add_related_name','2024-10-24 05:24:21.322038'),(41,'default','0003_alter_email_max_length','2024-10-24 05:24:21.335706'),(42,'social_auth','0003_alter_email_max_length','2024-10-24 05:24:21.338007'),(43,'default','0004_auto_20160423_0400','2024-10-24 05:24:21.347124'),(44,'social_auth','0004_auto_20160423_0400','2024-10-24 05:24:21.349100'),(45,'social_auth','0005_auto_20160727_2333','2024-10-24 05:24:21.369293'),(46,'social_django','0006_partial','2024-10-24 05:24:21.407828'),(47,'social_django','0007_code_timestamp','2024-10-24 05:24:21.448548'),(48,'social_django','0008_partial_timestamp','2024-10-24 05:24:21.491023'),(49,'social_django','0009_auto_20191118_0520','2024-10-24 05:24:21.554728'),(50,'social_django','0010_uid_db_index','2024-10-24 05:24:21.580208'),(51,'social_django','0011_alter_id_fields','2024-10-24 05:24:21.882105'),(52,'social_django','0012_usersocialauth_extra_data_new','2024-10-24 05:24:22.005497'),(53,'social_django','0013_migrate_extra_data','2024-10-24 05:24:22.020821'),(54,'social_django','0014_remove_usersocialauth_extra_data','2024-10-24 05:24:22.059964'),(55,'social_django','0015_rename_extra_data_new_usersocialauth_extra_data','2024-10-24 05:24:22.100259'),(56,'social_django','0016_alter_usersocialauth_extra_data','2024-10-24 05:24:22.107853'),(57,'socialaccount','0001_initial','2024-10-24 05:24:22.535545'),(58,'socialaccount','0002_token_max_lengths','2024-10-24 05:24:22.597186'),(59,'socialaccount','0003_extra_data_default_dict','2024-10-24 05:24:22.607204'),(60,'socialaccount','0004_app_provider_id_settings','2024-10-24 05:24:22.750800'),(61,'socialaccount','0005_socialtoken_nullable_app','2024-10-24 05:24:22.890735'),(62,'socialaccount','0006_alter_socialaccount_extra_data','2024-10-24 05:24:22.964204'),(63,'social_django','0005_auto_20160727_2333','2024-10-24 05:24:22.969566'),(64,'social_django','0002_add_related_name','2024-10-24 05:24:22.971583'),(65,'social_django','0003_alter_email_max_length','2024-10-24 05:24:22.973580'),(66,'social_django','0001_initial','2024-10-24 05:24:22.975978'),(67,'social_django','0004_auto_20160423_0400','2024-10-24 05:24:22.977417');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xgryggnbjalffeacnehq7ji2dr6egxhs','.eJxVjstuhDAMRf_Fa4TyIg92XXXZD6iqKDGeAXWGVCR0g_j3ZphWFStb1-fY3iAnnMItIKZ1Lj6XUChDv-0N_GVhLSPNZcJQpjT7O5UxDZV53-DZQ3_eAtUt0HMjnJWcdbbl2grpGvha0vc00FKNa0rXG1V0nR4LKqas7pyQQlmjOBOdtLB_NHDc92umxR-khlMWA37S_P-Dx7RQ-5vm9nmmfT3K20vVxNkfQx6rTKgk6cuFcWSkyGlh6PGQUVo446SLQYvIIrPIeAWllLGOBFcouzgo2H8AKs9qbA:1t4C4w:iAkKd0NJDrDKQ9UExkVZc6FsEjxrz9yqxpLk_gbL8Ys','2024-11-08 04:37:38.310194');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com'),(2,'127.0.0.1','Localhost');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `data` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `extra_data` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'google','102461366176180586435','2024-10-24 06:29:31.243467','2024-10-24 06:10:45.248374','{\"aud\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"azp\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"exp\": 1729754947, \"iat\": 1729751347, \"iss\": \"https://accounts.google.com\", \"sub\": \"102461366176180586435\", \"name\": \"Minh Ho\", \"email\": \"hom369146@gmail.com\", \"at_hash\": \"bbjgoiBnLU-vLGy3WtC9-w\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocKYpH3ViTelrnvF9mOYGk3rfPQTj4TD4iB-4ybYUYZgQ7X8_Q=s96-c\", \"given_name\": \"Minh\", \"family_name\": \"Ho\", \"email_verified\": true}',2),(2,'google','100487321738506442900','2024-10-24 06:45:57.783835','2024-10-24 06:29:20.411350','{\"hd\": \"ittc.edu.vn\", \"aud\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"azp\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"exp\": 1729755933, \"iat\": 1729752333, \"iss\": \"https://accounts.google.com\", \"sub\": \"100487321738506442900\", \"name\": \"Tß╗╖ Hß╗ô Thanh\", \"email\": \"nvthanhty@ittc.edu.vn\", \"at_hash\": \"chdEixOkSXwXZYCyT1n4LA\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocI8P5W5sgOSuZgMHiGKF6cawIAjbzjvpQS9pPv1suxPgUbBiQ=s96-c\", \"given_name\": \"Tß╗╖\", \"family_name\": \"Hß╗ô Thanh\", \"email_verified\": true}',3),(3,'google','114185910850450926590','2024-10-24 06:39:32.403675','2024-10-24 06:39:32.403675','{\"aud\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"azp\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"exp\": 1729755548, \"iat\": 1729751948, \"iss\": \"https://accounts.google.com\", \"sub\": \"114185910850450926590\", \"name\": \"Minh Ho\", \"email\": \"hom3691461@gmail.com\", \"at_hash\": \"CxRDaH6NyZzJ2jJdSMwgLA\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocIRMa0lzZFLV5erxCkxAXi9viXYZrGdc1BI5UTdxIcKPMc1Xg=s96-c\", \"given_name\": \"Minh\", \"family_name\": \"Ho\", \"email_verified\": true}',4),(4,'google','114423187237961902234','2024-10-24 06:40:18.684046','2024-10-24 06:40:18.684046','{\"aud\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"azp\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"exp\": 1729755594, \"iat\": 1729751994, \"iss\": \"https://accounts.google.com\", \"sub\": \"114423187237961902234\", \"name\": \"Ho Minh\", \"email\": \"hom3691462@gmail.com\", \"at_hash\": \"AS9o96ik4lcCEfe70ZpkEQ\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocJiGCDOeCLgh-ZRVjH16xB7yGioNcYTeMB_5WKmLTQhvM5zDw=s96-c\", \"given_name\": \"Ho\", \"family_name\": \"Minh\", \"email_verified\": true}',5),(5,'google','105486592324874102538','2024-10-25 04:37:38.160948','2024-10-24 06:45:32.434860','{\"aud\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"azp\": \"400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com\", \"exp\": 1729834633, \"iat\": 1729831033, \"iss\": \"https://accounts.google.com\", \"sub\": \"105486592324874102538\", \"name\": \"Thanh Tß╗╖ Hß╗ô\", \"email\": \"nvthanhty@gmail.com\", \"at_hash\": \"lWDvdTS9FNhE-SNhFNoEyQ\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocJgkbN0O44xlvh-y4iBL_SnH8fIB7p8Vv-ojYm4-Clrwrev_g=s96-c\", \"given_name\": \"Thanh Tß╗╖\", \"family_name\": \"Hß╗ô\", \"email_verified\": true}',6);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','google','400076174856-q21lnhks0qv2folktom6o73n4jh65col.apps.googleusercontent.com','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','','google','{}');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (3,1,1),(2,1,2);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 11:51:38
