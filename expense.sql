-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: expense
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_document`
--

LOCK TABLES `accounts_document` WRITE;
/*!40000 ALTER TABLE `accounts_document` DISABLE KEYS */;
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
  UNIQUE KEY `user_id` (`user_id`)
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
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add payment',7,'add_payment'),(20,'Can change payment',7,'change_payment'),(21,'Can delete payment',7,'delete_payment'),(22,'Can add payment method',8,'add_paymentmethod'),(23,'Can change payment method',8,'change_paymentmethod'),(24,'Can delete payment method',8,'delete_paymentmethod'),(25,'Can add cash',9,'add_cash'),(26,'Can change cash',9,'change_cash'),(27,'Can delete cash',9,'delete_cash'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add item',11,'add_item'),(32,'Can change item',11,'change_item'),(33,'Can delete item',11,'delete_item'),(34,'Can add spent',12,'add_spent'),(35,'Can change spent',12,'change_spent'),(36,'Can delete spent',12,'delete_spent'),(37,'Can add country',13,'add_country'),(38,'Can change country',13,'change_country'),(39,'Can delete country',13,'delete_country'),(40,'Can add state',14,'add_state'),(41,'Can change state',14,'change_state'),(42,'Can delete state',14,'delete_state'),(43,'Can add district',15,'add_district'),(44,'Can change district',15,'change_district'),(45,'Can delete district',15,'delete_district'),(46,'Can add tehsil',16,'add_tehsil'),(47,'Can change tehsil',16,'change_tehsil'),(48,'Can delete tehsil',16,'delete_tehsil'),(49,'Can add village',17,'add_village'),(50,'Can change village',17,'change_village'),(51,'Can delete village',17,'delete_village'),(52,'Can add user profile',18,'add_userprofile'),(53,'Can change user profile',18,'change_userprofile'),(54,'Can delete user profile',18,'delete_userprofile'),(55,'Can add document',19,'add_document'),(56,'Can change document',19,'change_document'),(57,'Can delete document',19,'delete_document');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$qhGg774Q5C4D$Ck3vGpD1zx2Ur+AiqQTYk9gmOm+cu/WGfRyb2Y86CQw=','2017-03-26 03:34:36.421626',1,'amit','','','',1,1,'2017-03-26 03:34:32.026381');
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
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-03-26 03:34:55.642427','1','Mobile',1,'',10,1),(2,'2017-03-26 03:35:05.043284','2','Other',1,'',10,1),(3,'2017-03-26 03:35:14.090125','3','Roti',1,'',10,1),(4,'2017-03-26 03:35:22.257335','4','Kapda',1,'',10,1),(5,'2017-03-26 03:35:33.517543','5','Makan',1,'',10,1),(6,'2017-03-26 03:35:59.524220','1','Rokda',1,'',7,1),(7,'2017-03-26 03:36:07.169455','2','Credit',1,'',7,1),(8,'2017-03-26 03:36:21.476247','3','Online',1,'',7,1),(9,'2017-03-26 03:39:52.255284','1','MRecharge 145.0',2,'Changed paid.',12,1),(10,'2017-03-26 03:48:12.132443','1','MRecharge 145.0',2,'Changed paid.',12,1),(11,'2017-03-26 03:49:35.932473','1','MRecharge 145.0',2,'Changed paid.',12,1),(12,'2017-03-26 03:56:25.061396','2','500',1,'',9,1),(13,'2017-03-26 03:58:20.065988','2','145',2,'Changed capital.',9,1),(14,'2017-03-26 04:03:38.800591','2','145',3,'',9,1),(15,'2017-03-26 04:04:06.921969','1','MRecharge 145.0',2,'Changed paid.',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (19,'accounts','document'),(18,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'kharch','cash'),(10,'kharch','category'),(11,'kharch','item'),(7,'kharch','payment'),(8,'kharch','paymentmethod'),(12,'kharch','spent'),(6,'sessions','session'),(13,'utils','country'),(15,'utils','district'),(14,'utils','state'),(16,'utils','tehsil'),(17,'utils','village');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-03-26 03:33:05.864951'),(2,'contenttypes','0002_remove_content_type_name','2017-03-26 03:33:07.484783'),(3,'auth','0001_initial','2017-03-26 03:33:18.311329'),(4,'auth','0002_alter_permission_name_max_length','2017-03-26 03:33:19.137792'),(5,'auth','0003_alter_user_email_max_length','2017-03-26 03:33:20.186606'),(6,'auth','0004_alter_user_username_opts','2017-03-26 03:33:20.264741'),(7,'auth','0005_alter_user_last_login_null','2017-03-26 03:33:21.036207'),(8,'auth','0006_require_contenttypes_0002','2017-03-26 03:33:21.090751'),(9,'admin','0001_initial','2017-03-26 03:33:32.168808'),(10,'kharch','0001_initial','2017-03-26 03:33:48.631901'),(11,'sessions','0001_initial','2017-03-26 03:33:49.481580');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e45neymv0ny0b1hothrgtwimg4nffo14','MWEyZWViOWViZTUwMmQwZTk0NDBiZDcwNjg4MTYxNzI0NjU5YWFlYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgxMDRhZjA2MGY1ZThmOWZiZjkxNTc2YjJhODUwNjNmZGUwNDA0NTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-24 03:34:36.477686');
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
  `capital` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `form` varchar(4) NOT NULL,
  `loaded_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kharch_cash_loaded_by_id_503d28d80cacc9a4_fk_auth_user_id` (`loaded_by_id`),
  CONSTRAINT `kharch_cash_loaded_by_id_503d28d80cacc9a4_fk_auth_user_id` FOREIGN KEY (`loaded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_cash`
--

LOCK TABLES `kharch_cash` WRITE;
/*!40000 ALTER TABLE `kharch_cash` DISABLE KEYS */;
INSERT INTO `kharch_cash` VALUES (1,346,'2017-03-26','CASH',1);
/*!40000 ALTER TABLE `kharch_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_category`
--

DROP TABLE IF EXISTS `kharch_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_category`
--

LOCK TABLES `kharch_category` WRITE;
/*!40000 ALTER TABLE `kharch_category` DISABLE KEYS */;
INSERT INTO `kharch_category` VALUES (1,'Mobile','MB'),(2,'Other','OT'),(3,'Roti','RT'),(4,'Kapda','KP'),(5,'Makan','MK');
/*!40000 ALTER TABLE `kharch_category` ENABLE KEYS */;
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
  `date` date NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `kharch_item_added_by_id_73beda85ac496352_fk_auth_user_id` (`added_by_id`),
  KEY `kharch_item_category_id_7b3dce269fc67418_fk_kharch_category_id` (`category_id`),
  CONSTRAINT `kharch_item_added_by_id_73beda85ac496352_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `kharch_item_category_id_7b3dce269fc67418_fk_kharch_category_id` FOREIGN KEY (`category_id`) REFERENCES `kharch_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_item`
--

LOCK TABLES `kharch_item` WRITE;
/*!40000 ALTER TABLE `kharch_item` DISABLE KEYS */;
INSERT INTO `kharch_item` VALUES (1,'MRecharge',145.0,'2017-03-26',1,1);
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
  CONSTRAINT `kharch_item_inherited__item_id_8cd4db9b5fae6cd_fk_kharch_item_id` FOREIGN KEY (`item_id`) REFERENCES `kharch_item` (`id`),
  CONSTRAINT `kharch_item_inherited_b_user_id_3a854615c6c29b29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `kharch_payment`
--

DROP TABLE IF EXISTS `kharch_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_payment`
--

LOCK TABLES `kharch_payment` WRITE;
/*!40000 ALTER TABLE `kharch_payment` DISABLE KEYS */;
INSERT INTO `kharch_payment` VALUES (1,'Rokda','RK'),(2,'Credit','CR'),(3,'Online','DB');
/*!40000 ALTER TABLE `kharch_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_paymentmethod`
--

DROP TABLE IF EXISTS `kharch_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_paymentmethod`
--

LOCK TABLES `kharch_paymentmethod` WRITE;
/*!40000 ALTER TABLE `kharch_paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `kharch_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kharch_spent`
--

DROP TABLE IF EXISTS `kharch_spent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kharch_spent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(5,1) NOT NULL,
  `date` date NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `pay_date` date NOT NULL,
  `validity` varchar(5) NOT NULL,
  `needed` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `spent_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kharch_spent_category_id_5c71f4dd1cf3fdba_fk_kharch_category_id` (`category_id`),
  KEY `kharch_spent_item_id_3079e8482450410f_fk_kharch_item_id` (`item_id`),
  KEY `kharch_spent_payment_id_77435151e4852fd9_fk_kharch_payment_id` (`payment_id`),
  KEY `kharch_spent_spent_by_id_19079136add1a11a_fk_auth_user_id` (`spent_by_id`),
  CONSTRAINT `kharch_spent_category_id_5c71f4dd1cf3fdba_fk_kharch_category_id` FOREIGN KEY (`category_id`) REFERENCES `kharch_category` (`id`),
  CONSTRAINT `kharch_spent_item_id_3079e8482450410f_fk_kharch_item_id` FOREIGN KEY (`item_id`) REFERENCES `kharch_item` (`id`),
  CONSTRAINT `kharch_spent_payment_id_77435151e4852fd9_fk_kharch_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `kharch_payment` (`id`),
  CONSTRAINT `kharch_spent_spent_by_id_19079136add1a11a_fk_auth_user_id` FOREIGN KEY (`spent_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kharch_spent`
--

LOCK TABLES `kharch_spent` WRITE;
/*!40000 ALTER TABLE `kharch_spent` DISABLE KEYS */;
INSERT INTO `kharch_spent` VALUES (1,145.0,'2017-02-28',0,'2017-03-26','28',1,1,1,2,1),(2,145.0,'2017-02-28',0,'2017-02-28','28',1,1,1,2,1),(3,156.0,'2017-03-25',0,'2017-03-25','28',1,1,1,2,1),(4,100.0,'2017-03-12',0,'2017-03-12','NA',1,1,1,2,1),(5,100.0,'2017-03-01',0,'2017-03-01','NA',1,1,1,2,1);
/*!40000 ALTER TABLE `kharch_spent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utils_country`
--

DROP TABLE IF EXISTS `utils_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utils_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `abrcode` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `scount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `abrcode` (`abrcode`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utils_country`
--

LOCK TABLES `utils_country` WRITE;
/*!40000 ALTER TABLE `utils_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `utils_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utils_district`
--

DROP TABLE IF EXISTS `utils_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utils_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `district` varchar(100) NOT NULL,
  `abrcode` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `vcount` int(10) unsigned NOT NULL,
  `code` varchar(10) NOT NULL,
  `hq` varchar(100) NOT NULL,
  `population` int(10) unsigned NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `density` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utils_district_state_id_fe13e6f29cb064e_fk_utils_state_id` (`state_id`),
  CONSTRAINT `utils_district_state_id_fe13e6f29cb064e_fk_utils_state_id` FOREIGN KEY (`state_id`) REFERENCES `utils_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utils_district`
--

LOCK TABLES `utils_district` WRITE;
/*!40000 ALTER TABLE `utils_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `utils_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utils_state`
--

DROP TABLE IF EXISTS `utils_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utils_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state` varchar(70) NOT NULL,
  `abrcode` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `vcount` int(10) unsigned NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utils_state_country_id_50b270e5cd40f275_fk_utils_country_id` (`country_id`),
  CONSTRAINT `utils_state_country_id_50b270e5cd40f275_fk_utils_country_id` FOREIGN KEY (`country_id`) REFERENCES `utils_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utils_state`
--

LOCK TABLES `utils_state` WRITE;
/*!40000 ALTER TABLE `utils_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `utils_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utils_tehsil`
--

DROP TABLE IF EXISTS `utils_tehsil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utils_tehsil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `tehsil` varchar(100) NOT NULL,
  `abrcode` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `vcount` int(10) unsigned NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utils_tehsil_district_id_292b11ba3a248481_fk_utils_district_id` (`district_id`),
  CONSTRAINT `utils_tehsil_district_id_292b11ba3a248481_fk_utils_district_id` FOREIGN KEY (`district_id`) REFERENCES `utils_district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utils_tehsil`
--

LOCK TABLES `utils_tehsil` WRITE;
/*!40000 ALTER TABLE `utils_tehsil` DISABLE KEYS */;
/*!40000 ALTER TABLE `utils_tehsil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utils_village`
--

DROP TABLE IF EXISTS `utils_village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utils_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tehsil_id` int(11) NOT NULL,
  `village` varchar(100) NOT NULL,
  `abrcode` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `pincode` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utils_village_tehsil_id_ff76f73d42219de_fk_utils_tehsil_id` (`tehsil_id`),
  CONSTRAINT `utils_village_tehsil_id_ff76f73d42219de_fk_utils_tehsil_id` FOREIGN KEY (`tehsil_id`) REFERENCES `utils_tehsil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utils_village`
--

LOCK TABLES `utils_village` WRITE;
/*!40000 ALTER TABLE `utils_village` DISABLE KEYS */;
/*!40000 ALTER TABLE `utils_village` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-26  9:41:20
