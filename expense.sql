-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: expense
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_document`
--

DROP TABLE IF EXISTS `accounts_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docfile` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_document`
--

LOCK TABLES `accounts_document` WRITE;
/*!40000 ALTER TABLE `accounts_document` DISABLE KEYS */;
INSERT INTO `accounts_document` VALUES (1,'documents/2016/09/09/rajiv.jpeg'),(2,'documents/2016/09/09/rajivbhai.jpeg'),(3,'documents/2016/09/09/rajivbhaijaynti.jpeg'),(4,'documents/2016/09/09/rajiv_iUb8YWl.jpeg'),(5,'documents/2016/09/09/amit.png'),(6,'documents/2016/09/09/rajiv_i3RB2gy.jpeg'),(7,'documents/2016/09/09/rajivbhai_kXOfM29.jpeg'),(8,'documents/2016/09/10/rajiv.jpeg'),(9,'documents/2016/09/10/rajiv_UXjFLXp.jpeg'),(10,'documents/2016/09/10/rajiv_m3O7zEu.jpeg'),(11,'documents/2016/09/10/rajiv_wb3xlF6.jpeg'),(12,'documents/2016/09/10/rajivbhai.jpeg'),(13,'documents/2016/09/11/rajiv.jpeg');
/*!40000 ALTER TABLE `accounts_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_userprofile_user_id_3c4c1a3843c1abe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add cash',7,'add_cash'),(20,'Can change cash',7,'change_cash'),(21,'Can delete cash',7,'delete_cash'),(22,'Can add item',8,'add_item'),(23,'Can change item',8,'change_item'),(24,'Can delete item',8,'delete_item'),(25,'Can add spent',9,'add_spent'),(26,'Can change spent',9,'change_spent'),(27,'Can delete spent',9,'delete_spent'),(28,'Can add user profile',10,'add_userprofile'),(29,'Can change user profile',10,'change_userprofile'),(30,'Can delete user profile',10,'delete_userprofile'),(31,'Can add document',11,'add_document'),(32,'Can change document',11,'change_document'),(33,'Can delete document',11,'delete_document');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$1hPfHMqfyORK$eVWEpkhVMFcbAzGI8/eIj6VT69lyyNOZLxnvAVaGKRk=','2016-09-11 06:15:38',1,'amit','','','',1,1,'2016-09-07 06:36:02');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-09-07 06:41:26','3','Shimla',2,'Changed inherited_by.',8,1),(2,'2016-09-08 04:39:53','29','Software 3432.0',3,'',9,1),(3,'2016-09-08 04:39:53','28','Bhindi 40.0',3,'',9,1),(4,'2016-09-08 04:39:53','27','Condom 20.0',3,'',9,1),(5,'2016-09-08 04:39:53','26','Kartoon 20.0',3,'',9,1),(6,'2016-09-08 04:39:53','25','Kartoon 20.0',3,'',9,1),(7,'2016-09-08 04:39:53','24','Kela 60.0',3,'',9,1),(8,'2016-09-08 04:39:53','23','Pyaj 40.0',3,'',9,1),(9,'2016-09-08 04:39:53','22','Paneer 40.0',3,'',9,1),(10,'2016-09-08 04:39:53','21','Pyaj 40.0',3,'',9,1),(11,'2016-09-08 04:39:53','20','Paneer 40.0',3,'',9,1),(12,'2016-09-08 04:39:53','19','Anda 30.0',3,'',9,1),(13,'2016-09-08 04:39:53','18','Anda 30.0',3,'',9,1),(14,'2016-09-08 04:39:53','17','Anda 30.0',3,'',9,1),(15,'2016-09-08 04:39:54','16','Anda 30.0',3,'',9,1),(16,'2016-09-08 04:39:54','15','Anda 30.0',3,'',9,1),(17,'2016-09-08 04:39:54','14','Anda 30.0',3,'',9,1),(18,'2016-09-08 04:39:54','13','Anda 30.0',3,'',9,1),(19,'2016-09-08 04:39:54','12','Anda 30.0',3,'',9,1),(20,'2016-09-08 04:39:54','11','Anda 30.0',3,'',9,1),(21,'2016-09-08 04:39:54','10','Software 3432.0',3,'',9,1),(22,'2016-09-08 04:39:54','9','Shimla 40.0',3,'',9,1),(23,'2016-09-08 04:39:54','8','Software 3432.0',3,'',9,1),(24,'2016-09-08 04:39:54','7','Software 3432.0',3,'',9,1),(25,'2016-09-08 04:39:54','6','Shimla 40.0',3,'',9,1),(26,'2016-09-08 04:39:54','5','Software 3432.0',3,'',9,1),(27,'2016-09-08 04:39:54','4','Shimla 40.0',3,'',9,1),(28,'2016-09-08 04:39:54','3','Shimla 40.0',3,'',9,1),(29,'2016-09-08 04:39:54','2','Shimla 40.0',3,'',9,1),(30,'2016-09-08 04:39:54','1','Shimla 40.0',3,'',9,1),(31,'2016-09-08 04:40:01','3','9000',3,'',7,1),(32,'2016-09-08 04:40:02','2','23454',3,'',7,1),(33,'2016-09-08 04:40:02','1','2000',3,'',7,1),(34,'2016-09-08 07:16:03','11','23',3,'',7,1),(35,'2016-09-08 07:16:03','10','23',3,'',7,1),(36,'2016-09-08 07:16:03','9','23',3,'',7,1),(37,'2016-09-08 07:16:03','8','23',3,'',7,1),(38,'2016-09-08 07:16:03','7','23',3,'',7,1),(39,'2016-09-08 07:16:03','6','12',3,'',7,1),(40,'2016-09-08 07:16:03','5','2000',3,'',7,1),(41,'2016-09-08 07:16:03','4','5000',3,'',7,1),(42,'2016-09-08 07:42:23','39','Anda 30.0',3,'',9,1),(43,'2016-09-08 07:42:23','38','Software 3432.0',3,'',9,1),(44,'2016-09-08 07:42:23','37','Shimla 40.0',3,'',9,1),(45,'2016-09-08 07:42:24','36','Orange 23.0',3,'',9,1),(46,'2016-09-08 07:42:24','35','Fan 234.0',3,'',9,1),(47,'2016-09-08 07:42:24','34','Kaddoo 40.0',3,'',9,1),(48,'2016-09-08 07:42:24','33','Orange 23.0',3,'',9,1),(49,'2016-09-08 07:42:24','32','Anda 30.0',3,'',9,1),(50,'2016-09-08 07:42:24','31','Shimla 40.0',3,'',9,1),(51,'2016-09-08 07:42:24','30','Kaddoo 40.0',3,'',9,1),(52,'2016-09-08 07:42:31','14','12345',3,'',7,1),(53,'2016-09-08 07:42:31','13','3456',3,'',7,1),(54,'2016-09-08 07:42:31','12','12',3,'',7,1),(55,'2016-09-08 07:42:38','14','Orange',3,'',8,1),(56,'2016-09-08 07:42:38','11','Fan',3,'',8,1),(57,'2016-09-08 07:42:38','10','Kartoon',3,'',8,1),(58,'2016-09-08 07:42:39','9','Kela',3,'',8,1),(59,'2016-09-08 07:42:39','8','Pyaj',3,'',8,1),(60,'2016-09-08 07:42:39','7','Laptop',3,'',8,1),(61,'2016-09-08 07:42:39','6','Paneer',3,'',8,1),(62,'2016-09-08 07:42:39','5','Anda',3,'',8,1),(63,'2016-09-08 07:42:39','4','Software',3,'',8,1),(64,'2016-09-08 07:42:39','3','Shimla',3,'',8,1),(65,'2016-09-08 07:42:39','2','Kaddoo',3,'',8,1),(66,'2016-09-11 06:08:59','18','6390',3,'',7,1),(67,'2016-09-11 06:08:59','17','10',3,'',7,1),(68,'2016-09-11 06:08:59','16','9000',3,'',7,1),(69,'2016-09-11 06:08:59','15','3000',3,'',7,1),(70,'2016-09-11 06:09:20','62','Sabun 40.0',3,'',9,1),(71,'2016-09-11 06:09:20','61','Pyaj 40.0',3,'',9,1),(72,'2016-09-11 06:09:20','60','Pyaj 40.0',3,'',9,1),(73,'2016-09-11 06:09:20','59','Khadi 500.0',3,'',9,1),(74,'2016-09-11 06:09:20','58','Aloo 40.0',3,'',9,1),(75,'2016-09-11 06:09:20','57','Sabun 35.0',3,'',9,1),(76,'2016-09-11 06:09:20','56','Tel 80.0',3,'',9,1),(77,'2016-09-11 06:09:20','55','Sabun 40.0',3,'',9,1),(78,'2016-09-11 06:09:20','54','Khadi 500.0',3,'',9,1),(79,'2016-09-11 06:09:20','53','Tel 80.0',3,'',9,1),(80,'2016-09-11 06:09:20','52','Khadi 500.0',3,'',9,1),(81,'2016-09-11 06:09:20','51','Tel 80.0',3,'',9,1),(82,'2016-09-11 06:09:20','50','Tel 80.0',3,'',9,1),(83,'2016-09-11 06:09:20','49','Pyaj 40.0',3,'',9,1),(84,'2016-09-11 06:09:20','48','Pyaj 40.0',3,'',9,1),(85,'2016-09-11 06:09:20','47','Aloo 40.0',3,'',9,1),(86,'2016-09-11 06:09:20','46','Pyaj 40.0',3,'',9,1),(87,'2016-09-11 06:09:20','45','Khadi 500.0',3,'',9,1),(88,'2016-09-11 06:09:20','44','Sabun 40.0',3,'',9,1),(89,'2016-09-11 06:09:20','43','Sabun 40.0',3,'',9,1),(90,'2016-09-11 06:09:20','42','Tel 80.0',3,'',9,1),(91,'2016-09-11 06:09:20','41','Tel 80.0',3,'',9,1),(92,'2016-09-11 06:09:20','40','Tel 80.0',3,'',9,1),(93,'2016-09-11 06:13:34','3','ravi',3,'',4,1),(94,'2016-09-11 06:13:35','2','shanu',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'accounts','document'),(10,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'kharch','cash'),(8,'kharch','item'),(9,'kharch','spent'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-07 06:31:47'),(2,'auth','0001_initial','2016-09-07 06:31:49'),(3,'accounts','0001_initial','2016-09-07 06:31:50'),(4,'admin','0001_initial','2016-09-07 06:31:50'),(5,'contenttypes','0002_remove_content_type_name','2016-09-07 06:31:51'),(6,'auth','0002_alter_permission_name_max_length','2016-09-07 06:31:51'),(7,'auth','0003_alter_user_email_max_length','2016-09-07 06:31:51'),(8,'auth','0004_alter_user_username_opts','2016-09-07 06:31:51'),(9,'auth','0005_alter_user_last_login_null','2016-09-07 06:31:52'),(10,'auth','0006_require_contenttypes_0002','2016-09-07 06:31:52'),(11,'kharch','0001_initial','2016-09-07 06:31:53'),(12,'sessions','0001_initial','2016-09-07 06:31:53'),(13,'kharch','0002_auto_20160910_1459','2016-09-10 09:29:24');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3sty4jfi76cz51lwzo6vsh1sg80dpo03','NDhhZjMyMWI0NzFmZTYyNWQ3ZTA1ZWI3MWJhZDE2MDdiOWZlYzMyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMmE0MGJiODY4MDQyMjdkM2NkYTViNzBlZDg2ZDM4N2RmNjJjNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-12-07 04:21:30'),('hdseb6alb7lop8ca20y15i6j8ywbbt0y','NDhhZjMyMWI0NzFmZTYyNWQ3ZTA1ZWI3MWJhZDE2MDdiOWZlYzMyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMmE0MGJiODY4MDQyMjdkM2NkYTViNzBlZDg2ZDM4N2RmNjJjNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-12-06 06:39:50'),('qr8lvquuizxqrzqhsuq5htk5svi2r1i2','MzM3NzdjZTI2ODg1ODkyYjU0MDJlNDNmODA0MzA5YWY0MjcxNDQ3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImExY2UwNWNmYWIxNWU2MmQ5OTJjMTJlMDk2ODYxM2ZhZTRhMzhjZWIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-12-10 06:15:38');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_cash`
--

DROP TABLE IF EXISTS `kharch_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capital` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `loaded_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kharch_cash_loaded_by_id_503d28d80cacc9a4_fk_auth_user_id` (`loaded_by_id`),
  CONSTRAINT `kharch_cash_loaded_by_id_503d28d80cacc9a4_fk_auth_user_id` FOREIGN KEY (`loaded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_cash`
--

LOCK TABLES `kharch_cash` WRITE;
/*!40000 ALTER TABLE `kharch_cash` DISABLE KEYS */;
INSERT INTO `kharch_cash` VALUES (19,3000,'2016-09-11',1),(20,1880,'2016-09-11',1);
/*!40000 ALTER TABLE `kharch_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_item`
--

DROP TABLE IF EXISTS `kharch_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cost` decimal(5,1) NOT NULL,
  `category` varchar(2) NOT NULL,
  `date` date NOT NULL,
  `added_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `kharch_item_added_by_id_73beda85ac496352_fk_auth_user_id` (`added_by_id`),
  CONSTRAINT `kharch_item_added_by_id_73beda85ac496352_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_item`
--

LOCK TABLES `kharch_item` WRITE;
/*!40000 ALTER TABLE `kharch_item` DISABLE KEYS */;
INSERT INTO `kharch_item` VALUES (30,'Roomrent',3000.0,'MK','2016-09-11',1),(31,'Toilet',70.0,'MK','2016-09-11',1),(32,'Auto',10.0,'OT','2016-09-11',1),(33,'Suran',60.0,'RT','2016-09-11',1),(34,'Aata',105.0,'RT','2016-09-11',1),(35,'Aloo',30.0,'RT','2016-09-11',1),(36,'Tamatar',40.0,'RT','2016-09-11',1);
/*!40000 ALTER TABLE `kharch_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_item_inherited_by`
--

DROP TABLE IF EXISTS `kharch_item_inherited_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_item_inherited_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`user_id`),
  KEY `kharch_item_inherited_b_user_id_3a854615c6c29b29_fk_auth_user_id` (`user_id`),
  CONSTRAINT `kharch_item_inherited_b_user_id_3a854615c6c29b29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `kharch_item_inherited__item_id_8cd4db9b5fae6cd_fk_kharch_item_id` FOREIGN KEY (`item_id`) REFERENCES `kharch_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_item_inherited_by`
--

LOCK TABLES `kharch_item_inherited_by` WRITE;
/*!40000 ALTER TABLE `kharch_item_inherited_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `kharch_item_inherited_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_spent`
--

DROP TABLE IF EXISTS `kharch_spent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_spent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(20) NOT NULL,
  `category` varchar(2) NOT NULL,
  `price` decimal(5,1) NOT NULL,
  `date` date NOT NULL,
  `reason` varchar(255) NOT NULL,
  `payment` varchar(2) NOT NULL,
  `where` varchar(100) NOT NULL,
  `needed` tinyint(1) NOT NULL,
  `spent_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kharch_spent_spent_by_id_19079136add1a11a_fk_auth_user_id` (`spent_by_id`),
  CONSTRAINT `kharch_spent_spent_by_id_19079136add1a11a_fk_auth_user_id` FOREIGN KEY (`spent_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_spent`
--

LOCK TABLES `kharch_spent` WRITE;
/*!40000 ALTER TABLE `kharch_spent` DISABLE KEYS */;
INSERT INTO `kharch_spent` VALUES (63,'Roomrent','MK',3000.0,'2016-09-11','','CA','',1,1),(64,'Toilet','MK',70.0,'2016-09-11','','CA','',1,1);
/*!40000 ALTER TABLE `kharch_spent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-11 11:53:17
