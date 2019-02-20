-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: akeneo_pim
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
INSERT INTO `acl_classes` VALUES (1,'(root)');
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
INSERT INTO `acl_entries` VALUES (1,1,1,1,NULL,3,1,1,'all',0,0),(2,1,2,1,NULL,3,1056964608,1,'all',0,0),(3,1,1,2,NULL,2,1,1,'all',0,0),(4,1,2,2,NULL,2,1056964608,1,'all',0,0),(5,1,1,3,NULL,1,1,1,'all',0,0),(6,1,2,3,NULL,1,1056964608,1,'all',0,0),(7,1,1,4,NULL,0,1,1,'all',0,0),(8,1,2,4,NULL,0,1056964608,1,'all',0,0);
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
INSERT INTO `acl_object_identities` VALUES (1,NULL,1,'action',1),(2,NULL,1,'entity',1);
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
INSERT INTO `acl_object_identity_ancestors` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
INSERT INTO `acl_security_identities` VALUES (1,'ROLE_ADMINISTRATOR',0),(3,'ROLE_ASSET_MANAGER',0),(2,'ROLE_CATALOG_MANAGER',0),(4,'ROLE_USER',0);
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acme_reference_data_color`
--

DROP TABLE IF EXISTS `acme_reference_data_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acme_reference_data_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `red` int(11) NOT NULL,
  `green` int(11) NOT NULL,
  `blue` int(11) NOT NULL,
  `hue` int(11) NOT NULL,
  `hslSaturation` int(11) NOT NULL,
  `light` int(11) NOT NULL,
  `hsvSaturation` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D28047C977153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acme_reference_data_color`
--

LOCK TABLES `acme_reference_data_color` WRITE;
/*!40000 ALTER TABLE `acme_reference_data_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `acme_reference_data_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acme_reference_data_fabric`
--

DROP TABLE IF EXISTS `acme_reference_data_fabric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acme_reference_data_fabric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternativeName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5639866477153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acme_reference_data_fabric`
--

LOCK TABLES `acme_reference_data_fabric` WRITE;
/*!40000 ALTER TABLE `acme_reference_data_fabric` DISABLE KEYS */;
/*!40000 ALTER TABLE `acme_reference_data_fabric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_job_execution`
--

DROP TABLE IF EXISTS `akeneo_batch_job_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_batch_job_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_instance_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `end_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `create_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `updated_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `health_check_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `exit_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit_description` longtext COLLATE utf8mb4_unicode_ci,
  `failure_exceptions` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `log_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raw_parameters` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_62738477593D6954` (`job_instance_id`),
  CONSTRAINT `FK_62738477593D6954` FOREIGN KEY (`job_instance_id`) REFERENCES `akeneo_batch_job_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_job_execution`
--

LOCK TABLES `akeneo_batch_job_execution` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_job_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_job_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_job_execution_queue`
--

DROP TABLE IF EXISTS `akeneo_batch_job_execution_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_batch_job_execution_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_execution_id` int(11) DEFAULT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `consumer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `updated_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_job_execution_queue`
--

LOCK TABLES `akeneo_batch_job_execution_queue` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_job_execution_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_job_execution_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_job_instance`
--

DROP TABLE IF EXISTS `akeneo_batch_job_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_batch_job_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `connector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_parameters` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_job_instance`
--

LOCK TABLES `akeneo_batch_job_instance` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_job_instance` DISABLE KEYS */;
INSERT INTO `akeneo_batch_job_instance` VALUES (28,'add_product_value','Mass add products values','add_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(29,'update_product_value','Mass update products','update_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(30,'remove_product_value','Mass remove products values','remove_product_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(31,'move_to_category','Mass move to categories','move_to_category',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(32,'add_to_group','Mass add product to group','add_to_group',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(33,'add_association','Mass associate products','add_association',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(34,'add_to_category','Mass add to categories','add_to_category',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(35,'remove_from_category','Mass remove from categories','remove_from_category',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(36,'delete_products_and_product_models','Mass delete products','delete_products_and_product_models',0,'Akeneo Mass Edit Connector','a:0:{}','mass_delete'),(37,'publish_product','Mass publish products','publish_product',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(38,'unpublish_product','Mass unpublish products','unpublish_product',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(39,'edit_common_attributes','Mass edit product attributes','edit_common_attributes',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(40,'add_attribute_value','Mass add attribute value','add_attribute_value',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(41,'add_to_existing_product_model','Add to existing product model','add_to_existing_product_model',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(42,'set_attribute_requirements','Set family attribute requirements','set_attribute_requirements',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(43,'change_parent_product','Change parent product model','change_parent_product',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(44,'csv_product_quick_export','CSV product quick export','csv_product_quick_export',0,'Akeneo CSV Connector','a:14:{s:8:\"filePath\";s:38:\"/tmp/export_%job_label%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;s:15:\"filePathProduct\";s:54:\"/tmp/1_products_export_%locale%_%scope%_%datetime%.csv\";s:20:\"filePathProductModel\";s:60:\"/tmp/2_product_models_export_%locale%_%scope%_%datetime%.csv\";}','quick_export'),(45,'csv_product_grid_context_quick_export','CSV product quick export grid context','csv_product_grid_context_quick_export',0,'Akeneo CSV Connector','a:14:{s:8:\"filePath\";s:38:\"/tmp/export_%job_label%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;s:15:\"filePathProduct\";s:67:\"/tmp/1_products_export_grid_context_%locale%_%scope%_%datetime%.csv\";s:20:\"filePathProductModel\";s:73:\"/tmp/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.csv\";}','quick_export'),(46,'csv_published_product_quick_export','CSV published product quick export','csv_published_product_quick_export',0,'Akeneo CSV Connector','a:12:{s:8:\"filePath\";s:62:\"/tmp/published_products_export_%locale%_%scope%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(47,'csv_published_product_grid_context_quick_export','CSV published product quick export grid context','csv_published_product_grid_context_quick_export',0,'Akeneo Mass Edit Connector','a:12:{s:8:\"filePath\";s:75:\"/tmp/published_products_export_grid_context_%locale%_%scope%_%datetime%.csv\";s:9:\"delimiter\";s:1:\";\";s:9:\"enclosure\";s:1:\"\"\";s:10:\"withHeader\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(48,'approve_product_draft','Mass approve product drafts','approve_product_draft',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(49,'refuse_product_draft','Mass reject product drafts','refuse_product_draft',0,'Akeneo Mass Edit Connector','a:0:{}','mass_edit'),(50,'apply_assets_mass_upload','Process mass uploaded assets','apply_assets_mass_upload',0,'Akeneo Product Asset Connector','a:0:{}','mass_upload'),(51,'apply_assets_mass_upload_into_asset_collection','Process mass uploaded assets and add to product','apply_assets_mass_upload_into_asset_collection',0,'Akeneo Product Asset Connector','a:0:{}','mass_upload'),(52,'xlsx_product_quick_export','XLSX product quick export','xlsx_product_quick_export',0,'Akeneo XLSX Connector','a:13:{s:8:\"filePath\";s:39:\"/tmp/export_%job_label%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;s:15:\"filePathProduct\";s:55:\"/tmp/1_products_export_%locale%_%scope%_%datetime%.xlsx\";s:20:\"filePathProductModel\";s:61:\"/tmp/2_product_models_export_%locale%_%scope%_%datetime%.xlsx\";}','quick_export'),(53,'xlsx_product_grid_context_quick_export','XLSX product quick export grid context','xlsx_product_grid_context_quick_export',0,'Akeneo XLSX Connector','a:13:{s:8:\"filePath\";s:39:\"/tmp/export_%job_label%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;s:15:\"filePathProduct\";s:68:\"/tmp/1_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\";s:20:\"filePathProductModel\";s:74:\"/tmp/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.xlsx\";}','quick_export'),(54,'xlsx_published_product_grid_context_quick_export','XLSX published product quick export grid context','xlsx_published_product_grid_context_quick_export',0,'Akeneo Mass Edit Connector','a:11:{s:8:\"filePath\";s:76:\"/tmp/published_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(55,'xlsx_published_product_quick_export','XLSX published product quick export','xlsx_published_product_quick_export',0,'Akeneo XLSX Connector','a:11:{s:8:\"filePath\";s:63:\"/tmp/published_products_export_%locale%_%scope%_%datetime%.xlsx\";s:10:\"withHeader\";b:1;s:12:\"linesPerFile\";i:10000;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;s:7:\"filters\";N;s:19:\"selected_properties\";N;s:10:\"with_media\";b:1;s:6:\"locale\";N;s:5:\"scope\";N;s:9:\"ui_locale\";N;}','quick_export'),(56,'rule_impacted_product_count','Calculation the affected products for the rules','rule_impacted_product_count',0,'Akeneo Rule Engine Connector','a:0:{}','mass_edit_rule'),(57,'classify_assets','Mass classify product assets','classify_assets',0,'Akeneo Product Asset Connector','a:0:{}','mass_edit'),(58,'add_tags_to_assets','Add tags to assets','add_tags_to_assets',0,'Akeneo Product Asset Connector','a:0:{}','mass_edit'),(59,'project_calculation','Project calculation','project_calculation',0,'teamwork assistant','a:0:{}','project_calculation'),(60,'refresh_project_completeness_calculation','Refresh project completeness','refresh_project_completeness_calculation',0,'teamwork assistant','a:0:{}','refresh_project_completeness_calculation'),(61,'compute_product_models_descendants','Compute product models descendants','compute_product_models_descendants',0,'internal','a:0:{}','compute_product_models_descendants'),(62,'compute_completeness_of_products_family','compute completeness of products family','compute_completeness_of_products_family',0,'internal','a:0:{}','compute_completeness_of_products_family'),(63,'compute_family_variant_structure_changes','Compute family variant structure changes','compute_family_variant_structure_changes',0,'internal','a:0:{}','compute_family_variant_structure_changes'),(64,'compute_completeness_of_products_linked_to_assets','compute completeness of products linked to assets','compute_completeness_of_products_linked_to_assets',0,'internal','a:0:{}','compute_completeness_of_products_linked_to_assets'),(65,'franklin_insights_subscribe_products','franklin_insights_subscribe_products','franklin_insights_subscribe_products',0,'Franklin Insights Connector','a:5:{s:7:\"filters\";a:0:{}s:7:\"actions\";a:0:{}s:18:\"realTimeVersioning\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;}','mass_edit'),(66,'franklin_insights_unsubscribe_products','franklin_insights_unsubscribe_products','franklin_insights_unsubscribe_products',0,'Franklin Insights Connector','a:5:{s:7:\"filters\";a:0:{}s:7:\"actions\";a:0:{}s:18:\"realTimeVersioning\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;}','mass_edit'),(67,'franklin_insights_fetch_products','franklin_insights_fetch_products','franklin_insights_fetch_products',0,'Franklin Insights Connector','a:1:{s:13:\"updated_since\";N;}','franklin_insights'),(68,'franklin_insights_remove_attribute_from_mapping','franklin_insights_remove_attribute_from_mapping','franklin_insights_remove_attribute_from_mapping',0,'Franklin Insights Connector','a:0:{}','franklin_insights'),(69,'franklin_insights_remove_option_from_mapping','franklin_insights_remove_option_from_mapping','franklin_insights_remove_option_from_mapping',0,'Franklin Insights Connector','a:0:{}','franklin_insights'),(70,'franklin_insights_resubscribe_products','franklin_insights_resubscribe_products','franklin_insights_resubscribe_products',0,'Franklin Insights Connector','a:5:{s:7:\"filters\";a:0:{}s:7:\"actions\";a:0:{}s:18:\"realTimeVersioning\";b:1;s:14:\"user_to_notify\";N;s:21:\"is_user_authenticated\";b:0;}','franklin_insights'),(71,'franklin_insights_identify_products_to_resubscribe','franklin_insights_identify_products_to_resubscribe','franklin_insights_identify_products_to_resubscribe',0,'Franklin Insights Connector','a:1:{s:19:\"updated_identifiers\";a:0:{}}','franklin_insights'),(72,'franklin_insights_synchronize','franklin_insights_synchronize','franklin_insights_synchronize',0,'Franklin Insights Connector','a:0:{}','franklin_insights');
/*!40000 ALTER TABLE `akeneo_batch_job_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_step_execution`
--

DROP TABLE IF EXISTS `akeneo_batch_step_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_batch_step_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_execution_id` int(11) DEFAULT NULL,
  `step_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `read_count` int(11) NOT NULL,
  `write_count` int(11) NOT NULL,
  `filter_count` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `end_time` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `exit_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit_description` longtext COLLATE utf8mb4_unicode_ci,
  `terminate_only` tinyint(1) DEFAULT NULL,
  `failure_exceptions` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `errors` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_BDE7D0925871C06B` (`job_execution_id`),
  CONSTRAINT `FK_BDE7D0925871C06B` FOREIGN KEY (`job_execution_id`) REFERENCES `akeneo_batch_job_execution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_step_execution`
--

LOCK TABLES `akeneo_batch_step_execution` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_step_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_step_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_batch_warning`
--

DROP TABLE IF EXISTS `akeneo_batch_warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_batch_warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_execution_id` int(11) DEFAULT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `reason_parameters` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `item` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_8EE0AE736C7DA296` (`step_execution_id`),
  CONSTRAINT `FK_8EE0AE736C7DA296` FOREIGN KEY (`step_execution_id`) REFERENCES `akeneo_batch_step_execution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_batch_warning`
--

LOCK TABLES `akeneo_batch_warning` WRITE;
/*!40000 ALTER TABLE `akeneo_batch_warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_batch_warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_file_storage_file_info`
--

DROP TABLE IF EXISTS `akeneo_file_storage_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_file_storage_file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F19B3719A5D32530` (`file_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_file_storage_file_info`
--

LOCK TABLES `akeneo_file_storage_file_info` WRITE;
/*!40000 ALTER TABLE `akeneo_file_storage_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_file_storage_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_reference_entity_attribute`
--

DROP TABLE IF EXISTS `akeneo_reference_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_reference_entity_attribute` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_entity_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels` json NOT NULL,
  `attribute_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_order` int(11) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `value_per_channel` tinyint(1) NOT NULL,
  `value_per_locale` tinyint(1) NOT NULL,
  `additional_properties` json NOT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `attribute_identifier_index` (`code`,`reference_entity_identifier`),
  UNIQUE KEY `attribute_reference_entity_order_index` (`reference_entity_identifier`,`attribute_order`),
  CONSTRAINT `attribute_reference_entity_identifier_foreign_key` FOREIGN KEY (`reference_entity_identifier`) REFERENCES `akeneo_reference_entity_reference_entity` (`identifier`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_reference_entity_attribute`
--

LOCK TABLES `akeneo_reference_entity_attribute` WRITE;
/*!40000 ALTER TABLE `akeneo_reference_entity_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_reference_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_reference_entity_record`
--

DROP TABLE IF EXISTS `akeneo_reference_entity_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_reference_entity_record` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_entity_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_collection` json NOT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `akeneoreference_entity_identifier_record_ux` (`reference_entity_identifier`,`code`),
  CONSTRAINT `akeneoreference_entity_reference_entity_identifier_foreign_key` FOREIGN KEY (`reference_entity_identifier`) REFERENCES `akeneo_reference_entity_reference_entity` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_reference_entity_record`
--

LOCK TABLES `akeneo_reference_entity_record` WRITE;
/*!40000 ALTER TABLE `akeneo_reference_entity_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_reference_entity_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_reference_entity_reference_entity`
--

DROP TABLE IF EXISTS `akeneo_reference_entity_reference_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_reference_entity_reference_entity` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels` json NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_as_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_as_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `akeneoreference_entity_attribute_as_label_foreign_key` (`attribute_as_label`),
  KEY `akeneoreference_entity_attribute_as_image_foreign_key` (`attribute_as_image`),
  CONSTRAINT `akeneoreference_entity_attribute_as_image_foreign_key` FOREIGN KEY (`attribute_as_image`) REFERENCES `akeneo_reference_entity_attribute` (`identifier`) ON DELETE SET NULL,
  CONSTRAINT `akeneoreference_entity_attribute_as_label_foreign_key` FOREIGN KEY (`attribute_as_label`) REFERENCES `akeneo_reference_entity_attribute` (`identifier`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_reference_entity_reference_entity`
--

LOCK TABLES `akeneo_reference_entity_reference_entity` WRITE;
/*!40000 ALTER TABLE `akeneo_reference_entity_reference_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_reference_entity_reference_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_reference_entity_reference_entity_permissions`
--

DROP TABLE IF EXISTS `akeneo_reference_entity_reference_entity_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_reference_entity_reference_entity_permissions` (
  `reference_entity_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group_identifier` smallint(6) NOT NULL,
  `right_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`reference_entity_identifier`,`user_group_identifier`),
  KEY `user_group_foreign_key` (`user_group_identifier`),
  CONSTRAINT `permissions_reference_entity_identifier_foreign_key` FOREIGN KEY (`reference_entity_identifier`) REFERENCES `akeneo_reference_entity_reference_entity` (`identifier`) ON DELETE CASCADE,
  CONSTRAINT `user_group_foreign_key` FOREIGN KEY (`user_group_identifier`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_reference_entity_reference_entity_permissions`
--

LOCK TABLES `akeneo_reference_entity_reference_entity_permissions` WRITE;
/*!40000 ALTER TABLE `akeneo_reference_entity_reference_entity_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_reference_entity_reference_entity_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_rule_engine_rule_definition`
--

DROP TABLE IF EXISTS `akeneo_rule_engine_rule_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_rule_engine_rule_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `priority` int(11) NOT NULL DEFAULT '0',
  `impacted_subject_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_rule_engine_rule_definition`
--

LOCK TABLES `akeneo_rule_engine_rule_definition` WRITE;
/*!40000 ALTER TABLE `akeneo_rule_engine_rule_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_rule_engine_rule_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_rule_engine_rule_relation`
--

DROP TABLE IF EXISTS `akeneo_rule_engine_rule_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_rule_engine_rule_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `resource_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_id` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F7D0C461744E0351` (`rule_id`),
  KEY `resource_name_resource_id_idx` (`resource_name`,`resource_id`),
  CONSTRAINT `FK_F7D0C461744E0351` FOREIGN KEY (`rule_id`) REFERENCES `akeneo_rule_engine_rule_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_rule_engine_rule_relation`
--

LOCK TABLES `akeneo_rule_engine_rule_relation` WRITE;
/*!40000 ALTER TABLE `akeneo_rule_engine_rule_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `akeneo_rule_engine_rule_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akeneo_structure_version_last_update`
--

DROP TABLE IF EXISTS `akeneo_structure_version_last_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akeneo_structure_version_last_update` (
  `resource_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`resource_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akeneo_structure_version_last_update`
--

LOCK TABLES `akeneo_structure_version_last_update` WRITE;
/*!40000 ALTER TABLE `akeneo_structure_version_last_update` DISABLE KEYS */;
INSERT INTO `akeneo_structure_version_last_update` VALUES ('Akeneo\\Asset\\Component\\Model\\Category','2019-02-19 21:01:31'),('Akeneo\\Channel\\Component\\Model\\Channel','2019-02-19 21:01:31'),('Akeneo\\Channel\\Component\\Model\\Currency','2019-02-19 21:01:26'),('Akeneo\\Channel\\Component\\Model\\Locale','2019-02-19 21:01:31'),('Akeneo\\Pim\\Enrichment\\Component\\Category\\Model\\Category','2019-02-19 21:01:29'),('Akeneo\\Pim\\Permission\\Bundle\\Entity\\AssetCategoryAccess','2019-02-19 21:01:33'),('Akeneo\\Pim\\Permission\\Bundle\\Entity\\AttributeGroupAccess','2019-02-19 21:01:33'),('Akeneo\\Pim\\Permission\\Bundle\\Entity\\JobProfileAccess','2019-02-19 21:01:39'),('Akeneo\\Pim\\Permission\\Bundle\\Entity\\LocaleAccess','2019-02-19 21:01:31'),('Akeneo\\Pim\\Permission\\Bundle\\Entity\\ProductCategoryAccess','2019-02-19 21:01:33'),('Akeneo\\Pim\\Structure\\Component\\Model\\AssociationType','2019-02-19 21:01:31'),('Akeneo\\Pim\\Structure\\Component\\Model\\Attribute','2019-02-19 21:01:31'),('Akeneo\\Pim\\Structure\\Component\\Model\\AttributeGroup','2019-02-19 21:01:29'),('Akeneo\\Pim\\Structure\\Component\\Model\\GroupType','2019-02-19 21:01:29'),('Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','2019-02-19 21:01:39'),('Akeneo\\UserManagement\\Component\\Model\\Group','2019-02-19 21:01:28'),('Akeneo\\UserManagement\\Component\\Model\\Role','2019-02-19 21:01:33'),('Akeneo\\UserManagement\\Component\\Model\\User','2019-02-19 21:01:34');
/*!40000 ALTER TABLE `akeneo_structure_version_last_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_group`
--

DROP TABLE IF EXISTS `oro_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_access_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FEF9EDB75E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_group`
--

LOCK TABLES `oro_access_group` WRITE;
/*!40000 ALTER TABLE `oro_access_group` DISABLE KEYS */;
INSERT INTO `oro_access_group` VALUES (4,'All'),(1,'IT support'),(2,'Manager'),(3,'Redactor');
/*!40000 ALTER TABLE `oro_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_role`
--

DROP TABLE IF EXISTS `oro_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_access_role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_673F65E757698A6A` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_role`
--

LOCK TABLES `oro_access_role` WRITE;
/*!40000 ALTER TABLE `oro_access_role` DISABLE KEYS */;
INSERT INTO `oro_access_role` VALUES (1,'IS_AUTHENTICATED_ANONYMOUSLY','Anonymous'),(2,'ROLE_ADMINISTRATOR','Administrator'),(3,'ROLE_CATALOG_MANAGER','Catalog manager'),(4,'ROLE_ASSET_MANAGER','Asset manager'),(5,'ROLE_USER','User');
/*!40000 ALTER TABLE `oro_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config`
--

DROP TABLE IF EXISTS `oro_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CONFIG_UQ_ENTITY` (`entity`,`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config`
--

LOCK TABLES `oro_config` WRITE;
/*!40000 ALTER TABLE `oro_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config_value`
--

DROP TABLE IF EXISTS `oro_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_config_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CONFIG_VALUE_UQ_ENTITY` (`name`,`section`,`config_id`),
  KEY `IDX_DAF6DF5524DB0683` (`config_id`),
  CONSTRAINT `FK_DAF6DF5524DB0683` FOREIGN KEY (`config_id`) REFERENCES `oro_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config_value`
--

LOCK TABLES `oro_config_value` WRITE;
/*!40000 ALTER TABLE `oro_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user`
--

DROP TABLE IF EXISTS `oro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) DEFAULT NULL,
  `ui_locale_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `last_login` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updatedAt` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `product_grid_filters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `emailNotifications` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `catalogLocale_id` int(11) DEFAULT NULL,
  `catalogScope_id` int(11) DEFAULT NULL,
  `defaultTree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F82840BCF85E0677` (`username`),
  UNIQUE KEY `UNIQ_F82840BCE7927C74` (`email`),
  UNIQUE KEY `UNIQ_F82840BC6ED78C3` (`file_info_id`),
  KEY `IDX_F82840BC7BBFC60C` (`catalogLocale_id`),
  KEY `IDX_F82840BCA7EA8E8C` (`ui_locale_id`),
  KEY `IDX_F82840BCEAA72736` (`catalogScope_id`),
  KEY `IDX_F82840BCD654B1EE` (`defaultTree_id`),
  CONSTRAINT `FK_F82840BC6ED78C3` FOREIGN KEY (`file_info_id`) REFERENCES `akeneo_file_storage_file_info` (`id`),
  CONSTRAINT `FK_F82840BC7BBFC60C` FOREIGN KEY (`catalogLocale_id`) REFERENCES `pim_catalog_locale` (`id`),
  CONSTRAINT `FK_F82840BCA7EA8E8C` FOREIGN KEY (`ui_locale_id`) REFERENCES `pim_catalog_locale` (`id`),
  CONSTRAINT `FK_F82840BCD654B1EE` FOREIGN KEY (`defaultTree_id`) REFERENCES `pim_catalog_category` (`id`),
  CONSTRAINT `FK_F82840BCEAA72736` FOREIGN KEY (`catalogScope_id`) REFERENCES `pim_catalog_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user`
--

LOCK TABLES `oro_user` WRITE;
/*!40000 ALTER TABLE `oro_user` DISABLE KEYS */;
INSERT INTO `oro_user` VALUES (1,NULL,58,'admin','admin@example.com',NULL,'John',NULL,'Doe',NULL,NULL,1,'j6bt438wbzcok8oc4gkggs8gwwkw8o4','d4aiZbb/KvQVy2zWgeTFy+lt5jd+23OSoWBBDK1zC+g43KUFBIHur/qfjT5ZH+Rhx5TqopfuN1qhgbPjucnPiw==',NULL,NULL,NULL,0,'2019-02-19 21:01:33','2019-02-19 21:01:33','[]',0,NULL,'UTC','{\"default_asset_tree\":\"asset_main_catalog\",\"asset_delay_reminder\":5,\"proposals_to_review_notification\":true,\"proposals_state_notifications\":true}',58,1,1),(2,NULL,58,'Franklin','admin@akeneo.com',NULL,'Franklin',NULL,'Insights',NULL,NULL,0,'l6ovs1lx9fk0sw00w8sccgos4cwogww','hnWdVr3lqOBCLNNfrbjX4eexqALfrmOQmszGCQHnfJLmwH7JNxEepLChBVSPfiwimVkec+VqyiIjpFfEUsBikQ==',NULL,NULL,NULL,0,'2019-02-19 21:01:34','2019-02-19 21:01:34','[]',0,NULL,'UTC','{\"default_asset_tree\":\"asset_main_catalog\",\"asset_delay_reminder\":5,\"proposals_to_review_notification\":true,\"proposals_state_notifications\":true}',58,1,1);
/*!40000 ALTER TABLE `oro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group`
--

DROP TABLE IF EXISTS `oro_user_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_group` (
  `user_id` int(11) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_EC003EF3A76ED395` (`user_id`),
  KEY `IDX_EC003EF3FE54D947` (`group_id`),
  CONSTRAINT `FK_EC003EF3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EC003EF3FE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group`
--

LOCK TABLES `oro_user_access_group` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group` DISABLE KEYS */;
INSERT INTO `oro_user_access_group` VALUES (1,1),(1,4),(2,4);
/*!40000 ALTER TABLE `oro_user_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group_role`
--

DROP TABLE IF EXISTS `oro_user_access_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_group_role` (
  `group_id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `IDX_E7E7E38EFE54D947` (`group_id`),
  KEY `IDX_E7E7E38ED60322AC` (`role_id`),
  CONSTRAINT `FK_E7E7E38ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E7E7E38EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group_role`
--

LOCK TABLES `oro_user_access_group_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_access_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_role`
--

DROP TABLE IF EXISTS `oro_user_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_role` (
  `user_id` int(11) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_290571BEA76ED395` (`user_id`),
  KEY `IDX_290571BED60322AC` (`role_id`),
  CONSTRAINT `FK_290571BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_290571BED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_role`
--

LOCK TABLES `oro_user_access_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_role` DISABLE KEYS */;
INSERT INTO `oro_user_access_role` VALUES (1,2),(2,5);
/*!40000 ALTER TABLE `oro_user_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_aggregated_volume`
--

DROP TABLE IF EXISTS `pim_aggregated_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_aggregated_volume` (
  `volume_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` json NOT NULL COMMENT '(DC2Type:native_json)',
  `aggregated_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`volume_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_aggregated_volume`
--

LOCK TABLES `pim_aggregated_volume` WRITE;
/*!40000 ALTER TABLE `pim_aggregated_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_aggregated_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_access_token`
--

DROP TABLE IF EXISTS `pim_api_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_api_access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BD5E40235F37A13B` (`token`),
  KEY `IDX_BD5E4023C7440455` (`client`),
  KEY `IDX_BD5E40238D93D649` (`user`),
  CONSTRAINT `FK_BD5E40238D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BD5E4023C7440455` FOREIGN KEY (`client`) REFERENCES `pim_api_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_access_token`
--

LOCK TABLES `pim_api_access_token` WRITE;
/*!40000 ALTER TABLE `pim_api_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_auth_code`
--

DROP TABLE IF EXISTS `pim_api_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_api_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AD5DC7C65F37A13B` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_auth_code`
--

LOCK TABLES `pim_api_auth_code` WRITE;
/*!40000 ALTER TABLE `pim_api_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_client`
--

DROP TABLE IF EXISTS `pim_api_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_api_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_client`
--

LOCK TABLES `pim_api_client` WRITE;
/*!40000 ALTER TABLE `pim_api_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_api_refresh_token`
--

DROP TABLE IF EXISTS `pim_api_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_api_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_264A45105F37A13B` (`token`),
  KEY `IDX_264A4510C7440455` (`client`),
  KEY `IDX_264A45108D93D649` (`user`),
  CONSTRAINT `FK_264A45108D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_264A4510C7440455` FOREIGN KEY (`client`) REFERENCES `pim_api_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_api_refresh_token`
--

LOCK TABLES `pim_api_refresh_token` WRITE;
/*!40000 ALTER TABLE `pim_api_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_api_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association`
--

DROP TABLE IF EXISTS `pim_catalog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_type_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`owner_id`,`association_type_id`),
  KEY `IDX_CC271001B1E1C39` (`association_type_id`),
  KEY `IDX_CC2710017E3C61F9` (`owner_id`),
  CONSTRAINT `FK_CC2710017E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CC271001B1E1C39` FOREIGN KEY (`association_type_id`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association`
--

LOCK TABLES `pim_catalog_association` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_group`
--

DROP TABLE IF EXISTS `pim_catalog_association_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_group` (
  `association_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`group_id`),
  KEY `IDX_E91414DDEFB9C8A5` (`association_id`),
  KEY `IDX_E91414DDFE54D947` (`group_id`),
  CONSTRAINT `FK_E91414DDEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E91414DDFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_group`
--

LOCK TABLES `pim_catalog_association_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product`
--

DROP TABLE IF EXISTS `pim_catalog_association_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_product` (
  `association_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_id`),
  KEY `IDX_3A3A49D4EFB9C8A5` (`association_id`),
  KEY `IDX_3A3A49D44584665A` (`product_id`),
  CONSTRAINT `FK_3A3A49D44584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3A3A49D4EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product`
--

LOCK TABLES `pim_catalog_association_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product_model`
--

DROP TABLE IF EXISTS `pim_catalog_association_product_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_product_model` (
  `association_id` int(11) NOT NULL,
  `product_model_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_model_id`),
  KEY `IDX_378B82C7EFB9C8A5` (`association_id`),
  KEY `IDX_378B82C7B2C5DD70` (`product_model_id`),
  CONSTRAINT `FK_378B82C7B2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_378B82C7EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product_model`
--

LOCK TABLES `pim_catalog_association_product_model` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product_model_to_group`
--

DROP TABLE IF EXISTS `pim_catalog_association_product_model_to_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_product_model_to_group` (
  `association_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`group_id`),
  KEY `IDX_16EA55AEEFB9C8A5` (`association_id`),
  KEY `IDX_16EA55AEFE54D947` (`group_id`),
  CONSTRAINT `FK_16EA55AEEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_product_model_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_16EA55AEFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product_model_to_group`
--

LOCK TABLES `pim_catalog_association_product_model_to_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product_model_to_product`
--

DROP TABLE IF EXISTS `pim_catalog_association_product_model_to_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_product_model_to_product` (
  `association_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_id`),
  KEY `IDX_3FF3ED19EFB9C8A5` (`association_id`),
  KEY `IDX_3FF3ED194584665A` (`product_id`),
  CONSTRAINT `FK_3FF3ED194584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3FF3ED19EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_product_model_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product_model_to_product`
--

LOCK TABLES `pim_catalog_association_product_model_to_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_product_model_to_product_model`
--

DROP TABLE IF EXISTS `pim_catalog_association_product_model_to_product_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_product_model_to_product_model` (
  `association_id` int(11) NOT NULL,
  `product_model_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_model_id`),
  KEY `IDX_12D4D59CEFB9C8A5` (`association_id`),
  KEY `IDX_12D4D59CB2C5DD70` (`product_model_id`),
  CONSTRAINT `FK_12D4D59CB2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_12D4D59CEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pim_catalog_product_model_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_product_model_to_product_model`
--

LOCK TABLES `pim_catalog_association_product_model_to_product_model` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_product_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_association_product_model_to_product_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_type`
--

DROP TABLE IF EXISTS `pim_catalog_association_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E6CF913A77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_type`
--

LOCK TABLES `pim_catalog_association_type` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_type` DISABLE KEYS */;
INSERT INTO `pim_catalog_association_type` VALUES (1,'X_SELL','2019-02-19 21:01:31','2019-02-19 21:01:31'),(2,'UPSELL','2019-02-19 21:01:31','2019-02-19 21:01:31'),(3,'SUBSTITUTION','2019-02-19 21:01:31','2019-02-19 21:01:31'),(4,'PACK','2019-02-19 21:01:31','2019-02-19 21:01:31');
/*!40000 ALTER TABLE `pim_catalog_association_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_association_type_translation`
--

DROP TABLE IF EXISTS `pim_catalog_association_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_association_type_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_CCCBAA2D7E366551` (`foreign_key`),
  CONSTRAINT `FK_CCCBAA2D7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_association_type_translation`
--

LOCK TABLES `pim_catalog_association_type_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_association_type_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_association_type_translation` VALUES (1,1,'Cross sell','en_US'),(2,1,'Vente croisée','fr_FR'),(3,2,'Upsell','en_US'),(4,2,'Vente incitative','fr_FR'),(5,3,'Ersatz','de_DE'),(6,3,'Substitution','en_US'),(7,3,'Remplacement','fr_FR'),(8,4,'Pack','de_DE'),(9,4,'Pack','en_US'),(10,4,'Pack','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_association_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `useable_as_grid_filter` tinyint(1) NOT NULL DEFAULT '0',
  `max_characters` smallint(6) DEFAULT NULL,
  `validation_rule` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation_regexp` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wysiwyg_enabled` tinyint(1) DEFAULT NULL,
  `number_min` decimal(14,4) DEFAULT NULL,
  `number_max` decimal(14,4) DEFAULT NULL,
  `decimals_allowed` tinyint(1) DEFAULT NULL,
  `negative_allowed` tinyint(1) DEFAULT NULL,
  `date_min` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `date_max` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `metric_family` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_metric_unit` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_file_size` decimal(6,2) DEFAULT NULL,
  `allowed_extensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimumInputLength` smallint(6) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  `is_localizable` tinyint(1) NOT NULL,
  `is_scopable` tinyint(1) NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backend_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`entity_type`),
  KEY `IDX_492FD44FFE54D947` (`group_id`),
  KEY `searchcode_idx` (`code`),
  CONSTRAINT `FK_492FD44FFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute`
--

LOCK TABLES `pim_catalog_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute` VALUES (1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,1,0,0,'sku','Akeneo\\Pim\\Enrichment\\Component\\Product\\Model\\Product','pim_catalog_identifier','text','a:1:{s:19:\"reference_data_name\";N;}','2019-02-19 21:01:31','2019-02-19 21:01:31');
/*!40000 ALTER TABLE `pim_catalog_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E299C05E77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group`
--

LOCK TABLES `pim_catalog_attribute_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_group` VALUES (1,'other',100,'2019-02-19 21:01:29','2019-02-19 21:01:29');
/*!40000 ALTER TABLE `pim_catalog_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_B74958BD7E366551` (`foreign_key`),
  CONSTRAINT `FK_B74958BD7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group_translation`
--

LOCK TABLES `pim_catalog_attribute_group_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_group_translation` VALUES (1,1,'Other','en_US'),(2,1,'Autre','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_locale`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_locale` (
  `attribute_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`locale_id`),
  KEY `IDX_26D2D5D0B6E62EFA` (`attribute_id`),
  KEY `IDX_26D2D5D0E559DFD1` (`locale_id`),
  CONSTRAINT `FK_26D2D5D0B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_26D2D5D0E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_locale`
--

LOCK TABLES `pim_catalog_attribute_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`attribute_id`),
  KEY `IDX_3DD413F8B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_3DD413F8B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option`
--

LOCK TABLES `pim_catalog_attribute_option` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option_value`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `locale_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`locale_code`,`option_id`),
  KEY `IDX_CC4B9A83A7C41D6F` (`option_id`),
  CONSTRAINT `FK_CC4B9A83A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option_value`
--

LOCK TABLES `pim_catalog_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_requirement`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`family_id`,`attribute_id`),
  KEY `IDX_B494B917C35E566A` (`family_id`),
  KEY `IDX_B494B917B6E62EFA` (`attribute_id`),
  KEY `IDX_B494B91772F5A1AA` (`channel_id`),
  CONSTRAINT `FK_B494B91772F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B494B917B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B494B917C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_requirement`
--

LOCK TABLES `pim_catalog_attribute_requirement` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_DBC2A9287E366551` (`foreign_key`),
  CONSTRAINT `FK_DBC2A9287E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_translation`
--

LOCK TABLES `pim_catalog_attribute_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_translation` VALUES (1,1,'SKU','en_US');
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category`
--

DROP TABLE IF EXISTS `pim_catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `root` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pim_category_code_uc` (`code`),
  KEY `IDX_350D8339727ACA70` (`parent_id`),
  KEY `left_idx` (`lft`),
  CONSTRAINT `FK_350D8339727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category`
--

LOCK TABLES `pim_catalog_category` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category` DISABLE KEYS */;
INSERT INTO `pim_catalog_category` VALUES (1,NULL,'master','2019-02-19 21:01:29',1,0,1,2);
/*!40000 ALTER TABLE `pim_catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_product`
--

DROP TABLE IF EXISTS `pim_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `IDX_512179C14584665A` (`product_id`),
  KEY `IDX_512179C112469DE2` (`category_id`),
  CONSTRAINT `FK_512179C112469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_512179C14584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_product`
--

LOCK TABLES `pim_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_product_model`
--

DROP TABLE IF EXISTS `pim_catalog_category_product_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category_product_model` (
  `product_model_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_model_id`,`category_id`),
  KEY `IDX_62B5D36B2C5DD70` (`product_model_id`),
  KEY `IDX_62B5D3612469DE2` (`category_id`),
  CONSTRAINT `FK_62B5D3612469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_62B5D36B2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_product_model`
--

LOCK TABLES `pim_catalog_category_product_model` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_product_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category_product_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_translation`
--

DROP TABLE IF EXISTS `pim_catalog_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_1C0FA6B77E366551` (`foreign_key`),
  CONSTRAINT `FK_1C0FA6B77E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_translation`
--

LOCK TABLES `pim_catalog_category_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_category_translation` VALUES (1,1,'Master catalog','en_US');
/*!40000 ALTER TABLE `pim_catalog_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel`
--

DROP TABLE IF EXISTS `pim_catalog_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversionUnits` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E07E932A77153098` (`code`),
  KEY `IDX_E07E932A12469DE2` (`category_id`),
  CONSTRAINT `FK_E07E932A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel`
--

LOCK TABLES `pim_catalog_channel` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel` VALUES (1,1,'ecommerce','a:0:{}');
/*!40000 ALTER TABLE `pim_catalog_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_currency`
--

DROP TABLE IF EXISTS `pim_catalog_channel_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel_currency` (
  `channel_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `IDX_5B55C68472F5A1AA` (`channel_id`),
  KEY `IDX_5B55C68438248176` (`currency_id`),
  CONSTRAINT `FK_5B55C68438248176` FOREIGN KEY (`currency_id`) REFERENCES `pim_catalog_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5B55C68472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_currency`
--

LOCK TABLES `pim_catalog_channel_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_currency` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_currency` VALUES (1,1);
/*!40000 ALTER TABLE `pim_catalog_channel_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_locale`
--

DROP TABLE IF EXISTS `pim_catalog_channel_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel_locale` (
  `channel_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `IDX_D8113CB272F5A1AA` (`channel_id`),
  KEY `IDX_D8113CB2E559DFD1` (`locale_id`),
  CONSTRAINT `FK_D8113CB272F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D8113CB2E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_locale`
--

LOCK TABLES `pim_catalog_channel_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_locale` VALUES (1,58);
/*!40000 ALTER TABLE `pim_catalog_channel_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_translation`
--

DROP TABLE IF EXISTS `pim_catalog_channel_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_8A91679D7E366551` (`foreign_key`),
  CONSTRAINT `FK_8A91679D7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_translation`
--

LOCK TABLES `pim_catalog_channel_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_translation` VALUES (1,1,'Default','en_US'),(2,1,'Standard','de_DE'),(3,1,'Défaut','fr_FR');
/*!40000 ALTER TABLE `pim_catalog_channel_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_completeness`
--

DROP TABLE IF EXISTS `pim_catalog_completeness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_completeness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `missing_count` int(11) NOT NULL,
  `required_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`locale_id`,`product_id`),
  KEY `IDX_113BA854E559DFD1` (`locale_id`),
  KEY `IDX_113BA85472F5A1AA` (`channel_id`),
  KEY `IDX_113BA8544584665A` (`product_id`),
  KEY `ratio_idx` (`ratio`),
  CONSTRAINT `FK_113BA8544584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA85472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA854E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_completeness`
--

LOCK TABLES `pim_catalog_completeness` WRITE;
/*!40000 ALTER TABLE `pim_catalog_completeness` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_completeness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_completeness_missing_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_completeness_missing_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_completeness_missing_attribute` (
  `completeness_id` int(11) NOT NULL,
  `missing_attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`completeness_id`,`missing_attribute_id`),
  KEY `IDX_DF61BBD3B640FBA5` (`completeness_id`),
  KEY `IDX_DF61BBD3762147F6` (`missing_attribute_id`),
  CONSTRAINT `FK_DF61BBD3762147F6` FOREIGN KEY (`missing_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DF61BBD3B640FBA5` FOREIGN KEY (`completeness_id`) REFERENCES `pim_catalog_completeness` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_completeness_missing_attribute`
--

LOCK TABLES `pim_catalog_completeness_missing_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_completeness_missing_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_completeness_missing_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_currency`
--

DROP TABLE IF EXISTS `pim_catalog_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A1712C777153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_currency`
--

LOCK TABLES `pim_catalog_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_currency` DISABLE KEYS */;
INSERT INTO `pim_catalog_currency` VALUES (1,'USD',1),(2,'EUR',1),(3,'ADP',0),(4,'AED',0),(5,'AFA',0),(6,'AFN',0),(7,'ALK',0),(8,'ALL',0),(9,'AMD',0),(10,'ANG',0),(11,'AOA',0),(12,'AOK',0),(13,'AON',0),(14,'AOR',0),(15,'ARA',0),(16,'ARL',0),(17,'ARM',0),(18,'ARP',0),(19,'ARS',0),(20,'ATS',0),(21,'AUD',0),(22,'AWG',0),(23,'AZM',0),(24,'AZN',0),(25,'BAD',0),(26,'BAM',0),(27,'BAN',0),(28,'BBD',0),(29,'BDT',0),(30,'BEC',0),(31,'BEF',0),(32,'BEL',0),(33,'BGL',0),(34,'BGM',0),(35,'BGN',0),(36,'BGO',0),(37,'BHD',0),(38,'BIF',0),(39,'BMD',0),(40,'BND',0),(41,'BOB',0),(42,'BOL',0),(43,'BOP',0),(44,'BOV',0),(45,'BRB',0),(46,'BRC',0),(47,'BRE',0),(48,'BRL',0),(49,'BRN',0),(50,'BRR',0),(51,'BRZ',0),(52,'BSD',0),(53,'BTN',0),(54,'BUK',0),(55,'BWP',0),(56,'BYB',0),(57,'BYR',0),(58,'BZD',0),(59,'CAD',0),(60,'CDF',0),(61,'CHE',0),(62,'CHF',0),(63,'CHW',0),(64,'CLE',0),(65,'CLF',0),(66,'CLP',0),(67,'CNX',0),(68,'CNY',0),(69,'COP',0),(70,'COU',0),(71,'CRC',0),(72,'CSD',0),(73,'CSK',0),(74,'CUC',0),(75,'CUP',0),(76,'CVE',0),(77,'CYP',0),(78,'CZK',0),(79,'DDM',0),(80,'DEM',0),(81,'DJF',0),(82,'DKK',0),(83,'DOP',0),(84,'DZD',0),(85,'ECS',0),(86,'ECV',0),(87,'EEK',0),(88,'EGP',0),(89,'ERN',0),(90,'ESA',0),(91,'ESB',0),(92,'ESP',0),(93,'ETB',0),(94,'FIM',0),(95,'FJD',0),(96,'FKP',0),(97,'FRF',0),(98,'GBP',0),(99,'GEK',0),(100,'GEL',0),(101,'GHC',0),(102,'GHS',0),(103,'GIP',0),(104,'GMD',0),(105,'GNF',0),(106,'GNS',0),(107,'GQE',0),(108,'GRD',0),(109,'GTQ',0),(110,'GWE',0),(111,'GWP',0),(112,'GYD',0),(113,'HKD',0),(114,'HNL',0),(115,'HRD',0),(116,'HRK',0),(117,'HTG',0),(118,'HUF',0),(119,'IDR',0),(120,'IEP',0),(121,'ILP',0),(122,'ILR',0),(123,'ILS',0),(124,'INR',0),(125,'IQD',0),(126,'IRR',0),(127,'ISJ',0),(128,'ISK',0),(129,'ITL',0),(130,'JMD',0),(131,'JOD',0),(132,'JPY',0),(133,'KES',0),(134,'KGS',0),(135,'KHR',0),(136,'KMF',0),(137,'KPW',0),(138,'KRH',0),(139,'KRO',0),(140,'KRW',0),(141,'KWD',0),(142,'KYD',0),(143,'KZT',0),(144,'LAK',0),(145,'LBP',0),(146,'LKR',0),(147,'LRD',0),(148,'LSL',0),(149,'LTL',0),(150,'LTT',0),(151,'LUC',0),(152,'LUF',0),(153,'LUL',0),(154,'LVL',0),(155,'LVR',0),(156,'LYD',0),(157,'MAD',0),(158,'MAF',0),(159,'MCF',0),(160,'MDC',0),(161,'MDL',0),(162,'MGA',0),(163,'MGF',0),(164,'MKD',0),(165,'MKN',0),(166,'MLF',0),(167,'MMK',0),(168,'MNT',0),(169,'MOP',0),(170,'MRO',0),(171,'MTL',0),(172,'MTP',0),(173,'MUR',0),(174,'MVP',0),(175,'MVR',0),(176,'MWK',0),(177,'MXN',0),(178,'MXP',0),(179,'MXV',0),(180,'MYR',0),(181,'MZE',0),(182,'MZM',0),(183,'MZN',0),(184,'NAD',0),(185,'NGN',0),(186,'NIC',0),(187,'NIO',0),(188,'NLG',0),(189,'NOK',0),(190,'NPR',0),(191,'NZD',0),(192,'OMR',0),(193,'PAB',0),(194,'PEI',0),(195,'PEN',0),(196,'PES',0),(197,'PGK',0),(198,'PHP',0),(199,'PKR',0),(200,'PLN',0),(201,'PLZ',0),(202,'PTE',0),(203,'PYG',0),(204,'QAR',0),(205,'RHD',0),(206,'ROL',0),(207,'RON',0),(208,'RSD',0),(209,'RUB',0),(210,'RUR',0),(211,'RWF',0),(212,'SAR',0),(213,'SBD',0),(214,'SCR',0),(215,'SDD',0),(216,'SDG',0),(217,'SDP',0),(218,'SEK',0),(219,'SGD',0),(220,'SHP',0),(221,'SIT',0),(222,'SKK',0),(223,'SLL',0),(224,'SOS',0),(225,'SRD',0),(226,'SRG',0),(227,'SSP',0),(228,'STD',0),(229,'SUR',0),(230,'SVC',0),(231,'SYP',0),(232,'SZL',0),(233,'THB',0),(234,'TJR',0),(235,'TJS',0),(236,'TMM',0),(237,'TMT',0),(238,'TND',0),(239,'TOP',0),(240,'TPE',0),(241,'TRL',0),(242,'TRY',0),(243,'TTD',0),(244,'TWD',0),(245,'TZS',0),(246,'UAH',0),(247,'UAK',0),(248,'UGS',0),(249,'UGX',0),(250,'USN',0),(251,'USS',0),(252,'UYI',0),(253,'UYP',0),(254,'UYU',0),(255,'UZS',0),(256,'VEB',0),(257,'VEF',0),(258,'VND',0),(259,'VNN',0),(260,'VUV',0),(261,'WST',0),(262,'XAF',0),(263,'XAU',0),(264,'XBA',0),(265,'XBB',0),(266,'XBC',0),(267,'XBD',0),(268,'XCD',0),(269,'XDR',0),(270,'XEU',0),(271,'XFO',0),(272,'XFU',0),(273,'XOF',0),(274,'XPD',0),(275,'XPF',0),(276,'XRE',0),(277,'XSU',0),(278,'XTS',0),(279,'XXX',0),(280,'YDD',0),(281,'YER',0),(282,'YUD',0),(283,'YUM',0),(284,'YUN',0),(285,'YUR',0),(286,'ZAL',0),(287,'ZAR',0),(288,'ZMK',0),(289,'ZMW',0),(290,'ZRN',0),(291,'ZRZ',0),(292,'ZWD',0),(293,'ZWL',0),(294,'ZWR',0);
/*!40000 ALTER TABLE `pim_catalog_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family`
--

DROP TABLE IF EXISTS `pim_catalog_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_attribute_id` int(11) DEFAULT NULL,
  `image_attribute_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9063207277153098` (`code`),
  KEY `IDX_90632072E2D3A503` (`label_attribute_id`),
  KEY `IDX_90632072BC295696` (`image_attribute_id`),
  CONSTRAINT `FK_90632072BC295696` FOREIGN KEY (`image_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_90632072E2D3A503` FOREIGN KEY (`label_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family`
--

LOCK TABLES `pim_catalog_family` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_family_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_attribute` (
  `family_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`family_id`,`attribute_id`),
  KEY `IDX_76074884C35E566A` (`family_id`),
  KEY `IDX_76074884B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_76074884B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76074884C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_attribute`
--

LOCK TABLES `pim_catalog_family_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_translation`
--

DROP TABLE IF EXISTS `pim_catalog_family_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_547C9A607E366551` (`foreign_key`),
  CONSTRAINT `FK_547C9A607E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_translation`
--

LOCK TABLES `pim_catalog_family_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_variant`
--

DROP TABLE IF EXISTS `pim_catalog_family_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FBA5AB4577153098` (`code`),
  KEY `IDX_FBA5AB45C35E566A` (`family_id`),
  CONSTRAINT `FK_FBA5AB45C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_variant`
--

LOCK TABLES `pim_catalog_family_variant` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_variant` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_variant_attribute_set`
--

DROP TABLE IF EXISTS `pim_catalog_family_variant_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_variant_attribute_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_variant_attribute_set`
--

LOCK TABLES `pim_catalog_family_variant_attribute_set` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_variant_attribute_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_variant_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_variant_has_variant_attribute_sets`
--

DROP TABLE IF EXISTS `pim_catalog_family_variant_has_variant_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_variant_has_variant_attribute_sets` (
  `family_variant_id` int(11) NOT NULL,
  `variant_attribute_sets_id` int(11) NOT NULL,
  PRIMARY KEY (`family_variant_id`,`variant_attribute_sets_id`),
  UNIQUE KEY `UNIQ_1F4DC702D8404D` (`variant_attribute_sets_id`),
  KEY `IDX_1F4DC7028A37AD0` (`family_variant_id`),
  CONSTRAINT `FK_1F4DC7028A37AD0` FOREIGN KEY (`family_variant_id`) REFERENCES `pim_catalog_family_variant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1F4DC702D8404D` FOREIGN KEY (`variant_attribute_sets_id`) REFERENCES `pim_catalog_family_variant_attribute_set` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_variant_has_variant_attribute_sets`
--

LOCK TABLES `pim_catalog_family_variant_has_variant_attribute_sets` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_variant_has_variant_attribute_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_variant_has_variant_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_variant_translation`
--

DROP TABLE IF EXISTS `pim_catalog_family_variant_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_variant_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_CB9A96AF7E366551` (`foreign_key`),
  CONSTRAINT `FK_CB9A96AF7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_family_variant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_variant_translation`
--

LOCK TABLES `pim_catalog_family_variant_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_variant_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_variant_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group`
--

DROP TABLE IF EXISTS `pim_catalog_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5D6997ED77153098` (`code`),
  KEY `IDX_5D6997EDC54C8C93` (`type_id`),
  CONSTRAINT `FK_5D6997EDC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `pim_catalog_group_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group`
--

LOCK TABLES `pim_catalog_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_product`
--

DROP TABLE IF EXISTS `pim_catalog_group_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_group_product` (
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`group_id`),
  KEY `IDX_7AC0C83A4584665A` (`product_id`),
  KEY `IDX_7AC0C83AFE54D947` (`group_id`),
  CONSTRAINT `FK_7AC0C83A4584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7AC0C83AFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_product`
--

LOCK TABLES `pim_catalog_group_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_translation`
--

DROP TABLE IF EXISTS `pim_catalog_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_622D98DB7E366551` (`foreign_key`),
  CONSTRAINT `FK_622D98DB7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_translation`
--

LOCK TABLES `pim_catalog_group_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_type`
--

DROP TABLE IF EXISTS `pim_catalog_group_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_693B2EF777153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_type`
--

LOCK TABLES `pim_catalog_group_type` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_type` DISABLE KEYS */;
INSERT INTO `pim_catalog_group_type` VALUES (1,'RELATED');
/*!40000 ALTER TABLE `pim_catalog_group_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_group_type_translation`
--

DROP TABLE IF EXISTS `pim_catalog_group_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_group_type_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_6EF81AEB7E366551` (`foreign_key`),
  CONSTRAINT `FK_6EF81AEB7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_group_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_group_type_translation`
--

LOCK TABLES `pim_catalog_group_type_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_group_type_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_group_type_translation` VALUES (1,1,'[RELATED]','en_US');
/*!40000 ALTER TABLE `pim_catalog_group_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_locale`
--

DROP TABLE IF EXISTS `pim_catalog_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7405C7B177153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_locale`
--

LOCK TABLES `pim_catalog_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_locale` VALUES (1,'af_ZA',0),(2,'am_ET',0),(3,'ar_AE',0),(4,'ar_BH',0),(5,'ar_DZ',0),(6,'ar_EG',0),(7,'ar_IQ',0),(8,'ar_JO',0),(9,'ar_KW',0),(10,'ar_LB',0),(11,'ar_LY',0),(12,'ar_MA',0),(13,'arn_CL',0),(14,'ar_OM',0),(15,'ar_QA',0),(16,'ar_SA',0),(17,'ar_SY',0),(18,'ar_TN',0),(19,'ar_YE',0),(20,'as_IN',0),(21,'az_Cyrl_AZ',0),(22,'az_Latn_AZ',0),(23,'ba_RU',0),(24,'be_BY',0),(25,'bg_BG',0),(26,'bn_BD',0),(27,'bn_IN',0),(28,'bo_CN',0),(29,'br_FR',0),(30,'bs_Cyrl_BA',0),(31,'bs_Latn_BA',0),(32,'ca_ES',0),(33,'co_FR',0),(34,'cs_CZ',0),(35,'cy_GB',0),(36,'da_DK',0),(37,'de_AT',0),(38,'de_CH',0),(39,'de_DE',0),(40,'de_LI',0),(41,'de_LU',0),(42,'dsb_DE',0),(43,'dv_MV',0),(44,'el_GR',0),(45,'en_029',0),(46,'en_AU',0),(47,'en_BZ',0),(48,'en_CA',0),(49,'en_GB',0),(50,'en_IE',0),(51,'en_IN',0),(52,'en_JM',0),(53,'en_MY',0),(54,'en_NZ',0),(55,'en_PH',0),(56,'en_SG',0),(57,'en_TT',0),(58,'en_US',1),(59,'en_ZA',0),(60,'en_ZW',0),(61,'es_AR',0),(62,'es_BO',0),(63,'es_CL',0),(64,'es_CO',0),(65,'es_CR',0),(66,'es_DO',0),(67,'es_EC',0),(68,'es_ES',0),(69,'es_GT',0),(70,'es_HN',0),(71,'es_MX',0),(72,'es_NI',0),(73,'es_PA',0),(74,'es_PE',0),(75,'es_PR',0),(76,'es_PY',0),(77,'es_SV',0),(78,'es_US',0),(79,'es_UY',0),(80,'es_VE',0),(81,'et_EE',0),(82,'eu_ES',0),(83,'fa_IR',0),(84,'fi_FI',0),(85,'fil_PH',0),(86,'fo_FO',0),(87,'fr_BE',0),(88,'fr_CA',0),(89,'fr_CH',0),(90,'fr_FR',0),(91,'fr_LU',0),(92,'fr_MC',0),(93,'fy_NL',0),(94,'ga_IE',0),(95,'gd_GB',0),(96,'gl_ES',0),(97,'gsw_FR',0),(98,'gu_IN',0),(99,'ha_Latn_NG',0),(100,'he_IL',0),(101,'hi_IN',0),(102,'hr_BA',0),(103,'hr_HR',0),(104,'hsb_DE',0),(105,'hu_HU',0),(106,'hy_AM',0),(107,'id_ID',0),(108,'ig_NG',0),(109,'ii_CN',0),(110,'is_IS',0),(111,'it_CH',0),(112,'it_IT',0),(113,'iu_Cans_CA',0),(114,'iu_Latn_CA',0),(115,'ja_JP',0),(116,'ka_GE',0),(117,'kk_KZ',0),(118,'kl_GL',0),(119,'km_KH',0),(120,'kn_IN',0),(121,'kok_IN',0),(122,'ko_KR',0),(123,'ky_KG',0),(124,'lb_LU',0),(125,'lo_LA',0),(126,'lt_LT',0),(127,'lv_LV',0),(128,'mi_NZ',0),(129,'mk_MK',0),(130,'ml_IN',0),(131,'mn_MN',0),(132,'mn_Mong_CN',0),(133,'moh_CA',0),(134,'mr_IN',0),(135,'ms_BN',0),(136,'ms_MY',0),(137,'mt_MT',0),(138,'nb_NO',0),(139,'ne_NP',0),(140,'nl_BE',0),(141,'nl_NL',0),(142,'nn_NO',0),(143,'nso_ZA',0),(144,'oc_FR',0),(145,'or_IN',0),(146,'pa_IN',0),(147,'pl_PL',0),(148,'prs_AF',0),(149,'ps_AF',0),(150,'pt_BR',0),(151,'pt_PT',0),(152,'qut_GT',0),(153,'quz_BO',0),(154,'quz_EC',0),(155,'quz_PE',0),(156,'rm_CH',0),(157,'ro_RO',0),(158,'ru_RU',0),(159,'rw_RW',0),(160,'sah_RU',0),(161,'sa_IN',0),(162,'se_FI',0),(163,'se_NO',0),(164,'se_SE',0),(165,'si_LK',0),(166,'sk_SK',0),(167,'sl_SI',0),(168,'sma_NO',0),(169,'sma_SE',0),(170,'smj_NO',0),(171,'smj_SE',0),(172,'smn_FI',0),(173,'sms_FI',0),(174,'sq_AL',0),(175,'sr_Cyrl_BA',0),(176,'sr_Cyrl_CS',0),(177,'sr_Cyrl_ME',0),(178,'sr_Cyrl_RS',0),(179,'sr_Latn_BA',0),(180,'sr_Latn_CS',0),(181,'sr_Latn_ME',0),(182,'sr_Latn_RS',0),(183,'sv_FI',0),(184,'sv_SE',0),(185,'sw_KE',0),(186,'syr_SY',0),(187,'ta_IN',0),(188,'te_IN',0),(189,'tg_Cyrl_TJ',0),(190,'th_TH',0),(191,'tk_TM',0),(192,'tn_ZA',0),(193,'tr_TR',0),(194,'tt_RU',0),(195,'tzm_Latn_DZ',0),(196,'ug_CN',0),(197,'uk_UA',0),(198,'ur_PK',0),(199,'uz_Cyrl_UZ',0),(200,'uz_Latn_UZ',0),(201,'vi_VN',0),(202,'wo_SN',0),(203,'xh_ZA',0),(204,'yo_NG',0),(205,'zh_CN',0),(206,'zh_HK',0),(207,'zh_MO',0),(208,'zh_SG',0),(209,'zh_TW',0),(210,'zu_ZA',0);
/*!40000 ALTER TABLE `pim_catalog_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product`
--

DROP TABLE IF EXISTS `pim_catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `product_model_id` int(11) DEFAULT NULL,
  `family_variant_id` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_values` json NOT NULL COMMENT '(DC2Type:native_json)',
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_91CD19C0772E836A` (`identifier`),
  KEY `IDX_91CD19C0C35E566A` (`family_id`),
  KEY `IDX_91CD19C0B2C5DD70` (`product_model_id`),
  KEY `IDX_91CD19C08A37AD0` (`family_variant_id`),
  CONSTRAINT `FK_91CD19C08A37AD0` FOREIGN KEY (`family_variant_id`) REFERENCES `pim_catalog_family_variant` (`id`),
  CONSTRAINT `FK_91CD19C0B2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_91CD19C0C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product`
--

LOCK TABLES `pim_catalog_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_model`
--

DROP TABLE IF EXISTS `pim_catalog_product_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `family_variant_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_values` json NOT NULL COMMENT '(DC2Type:native_json)',
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `root` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5943911E77153098` (`code`),
  KEY `IDX_5943911E727ACA70` (`parent_id`),
  KEY `IDX_5943911E8A37AD0` (`family_variant_id`),
  CONSTRAINT `FK_5943911E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5943911E8A37AD0` FOREIGN KEY (`family_variant_id`) REFERENCES `pim_catalog_family_variant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_model`
--

LOCK TABLES `pim_catalog_product_model` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_model_association`
--

DROP TABLE IF EXISTS `pim_catalog_product_model_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product_model_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_type_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`owner_id`,`association_type_id`),
  KEY `IDX_F5F4C8CAB1E1C39` (`association_type_id`),
  KEY `IDX_F5F4C8CA7E3C61F9` (`owner_id`),
  CONSTRAINT `FK_F5F4C8CA7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F5F4C8CAB1E1C39` FOREIGN KEY (`association_type_id`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_model_association`
--

LOCK TABLES `pim_catalog_product_model_association` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_model_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_model_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_unique_data`
--

DROP TABLE IF EXISTS `pim_catalog_product_unique_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product_unique_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `raw_data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_value_idx` (`attribute_id`,`raw_data`),
  KEY `IDX_E0768BA34584665A` (`product_id`),
  KEY `IDX_E0768BA3B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_E0768BA34584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E0768BA3B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_unique_data`
--

LOCK TABLES `pim_catalog_product_unique_data` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_unique_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_unique_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_variant_attribute_set_has_attributes`
--

DROP TABLE IF EXISTS `pim_catalog_variant_attribute_set_has_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_variant_attribute_set_has_attributes` (
  `variant_attribute_set_id` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  PRIMARY KEY (`variant_attribute_set_id`,`attributes_id`),
  KEY `IDX_E9C4264A11D06F0E` (`variant_attribute_set_id`),
  KEY `IDX_E9C4264ABAAF4009` (`attributes_id`),
  CONSTRAINT `FK_E9C4264A11D06F0E` FOREIGN KEY (`variant_attribute_set_id`) REFERENCES `pim_catalog_family_variant_attribute_set` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E9C4264ABAAF4009` FOREIGN KEY (`attributes_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_variant_attribute_set_has_attributes`
--

LOCK TABLES `pim_catalog_variant_attribute_set_has_attributes` WRITE;
/*!40000 ALTER TABLE `pim_catalog_variant_attribute_set_has_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_variant_attribute_set_has_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_variant_attribute_set_has_axes`
--

DROP TABLE IF EXISTS `pim_catalog_variant_attribute_set_has_axes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_variant_attribute_set_has_axes` (
  `variant_attribute_set_id` int(11) NOT NULL,
  `axes_id` int(11) NOT NULL,
  PRIMARY KEY (`variant_attribute_set_id`,`axes_id`),
  KEY `IDX_6965051E11D06F0E` (`variant_attribute_set_id`),
  KEY `IDX_6965051EE684FCEE` (`axes_id`),
  CONSTRAINT `FK_6965051E11D06F0E` FOREIGN KEY (`variant_attribute_set_id`) REFERENCES `pim_catalog_family_variant_attribute_set` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6965051EE684FCEE` FOREIGN KEY (`axes_id`) REFERENCES `pim_catalog_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_variant_attribute_set_has_axes`
--

LOCK TABLES `pim_catalog_variant_attribute_set_has_axes` WRITE;
/*!40000 ALTER TABLE `pim_catalog_variant_attribute_set_has_axes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_variant_attribute_set_has_axes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_comment_comment`
--

DROP TABLE IF EXISTS `pim_comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `resource_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_id` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `replied_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  KEY `IDX_2A32D03D727ACA70` (`parent_id`),
  KEY `IDX_2A32D03DF675F31B` (`author_id`),
  KEY `resource_name_resource_id_idx` (`resource_name`,`resource_id`),
  CONSTRAINT `FK_2A32D03D727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_comment_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2A32D03DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_comment_comment`
--

LOCK TABLES `pim_comment_comment` WRITE;
/*!40000 ALTER TABLE `pim_comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_configuration`
--

DROP TABLE IF EXISTS `pim_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_configuration` (
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` json NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_configuration`
--

LOCK TABLES `pim_configuration` WRITE;
/*!40000 ALTER TABLE `pim_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_datagrid_view`
--

DROP TABLE IF EXISTS `pim_datagrid_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_datagrid_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datagrid_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `columns` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `filters` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B56B38F1EA750E8` (`label`),
  KEY `IDX_B56B38F17E3C61F9` (`owner_id`),
  CONSTRAINT `FK_B56B38F17E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_datagrid_view`
--

LOCK TABLES `pim_datagrid_view` WRITE;
/*!40000 ALTER TABLE `pim_datagrid_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_datagrid_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_notification_notification`
--

DROP TABLE IF EXISTS `pim_notification_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_notification_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routeParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_notification_notification`
--

LOCK TABLES `pim_notification_notification` WRITE;
/*!40000 ALTER TABLE `pim_notification_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_notification_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_notification_user_notification`
--

DROP TABLE IF EXISTS `pim_notification_user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_notification_user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_342AA855BF5476CA` (`notification`),
  KEY `IDX_342AA8558D93D649` (`user`),
  CONSTRAINT `FK_342AA8558D93D649` FOREIGN KEY (`user`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_342AA855BF5476CA` FOREIGN KEY (`notification`) REFERENCES `pim_notification_notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_notification_user_notification`
--

LOCK TABLES `pim_notification_user_notification` WRITE;
/*!40000 ALTER TABLE `pim_notification_user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_notification_user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_session`
--

DROP TABLE IF EXISTS `pim_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_session` (
  `sess_id` varbinary(128) NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) unsigned NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_session`
--

LOCK TABLES `pim_session` WRITE;
/*!40000 ALTER TABLE `pim_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_user_default_datagrid_view`
--

DROP TABLE IF EXISTS `pim_user_default_datagrid_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_user_default_datagrid_view` (
  `user_id` int(11) NOT NULL,
  `view_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`view_id`),
  KEY `IDX_3CEEC2F2A76ED395` (`user_id`),
  KEY `IDX_3CEEC2F231518C7` (`view_id`),
  CONSTRAINT `FK_3CEEC2F231518C7` FOREIGN KEY (`view_id`) REFERENCES `pim_datagrid_view` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3CEEC2F2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_user_default_datagrid_view`
--

LOCK TABLES `pim_user_default_datagrid_view` WRITE;
/*!40000 ALTER TABLE `pim_user_default_datagrid_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_user_default_datagrid_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_versioning_version`
--

DROP TABLE IF EXISTS `pim_versioning_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_versioning_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_id` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snapshot` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `changeset` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `logged_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `pending` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_name_resource_id_idx` (`resource_name`,`resource_id`),
  KEY `resource_name_idx` (`resource_name`),
  KEY `pending_idx` (`pending`),
  KEY `version_idx` (`version`),
  KEY `logged_at_idx` (`logged_at`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_versioning_version`
--

LOCK TABLES `pim_versioning_version` WRITE;
/*!40000 ALTER TABLE `pim_versioning_version` DISABLE KEYS */;
INSERT INTO `pim_versioning_version` VALUES (1,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','1','a:6:{s:4:\"code\";s:21:\"fixtures_currency_csv\";s:8:\"job_name\";s:21:\"fixtures_currency_csv\";s:5:\"label\";s:24:\"Currencies data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/currencies.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_currency_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_currency_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Currencies data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/currencies.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(2,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','2','a:6:{s:4:\"code\";s:19:\"fixtures_locale_csv\";s:8:\"job_name\";s:19:\"fixtures_locale_csv\";s:5:\"label\";s:21:\"Locales data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:288:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locales.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_locale_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_locale_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Locales data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:288:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locales.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(3,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','3','a:6:{s:4:\"code\";s:23:\"fixtures_user_group_csv\";s:8:\"job_name\";s:23:\"fixtures_user_group_csv\";s:5:\"label\";s:25:\"User groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:292:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_user_group_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_user_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"User groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:292:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(4,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','4','a:6:{s:4:\"code\";s:21:\"fixtures_category_csv\";s:8:\"job_name\";s:21:\"fixtures_category_csv\";s:5:\"label\";s:24:\"Categories data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_category_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"fixtures_category_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Categories data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(5,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','5','a:6:{s:4:\"code\";s:28:\"fixtures_attribute_group_csv\";s:8:\"job_name\";s:28:\"fixtures_attribute_group_csv\";s:5:\"label\";s:30:\"Attribute groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:297:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"fixtures_attribute_group_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"fixtures_attribute_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Attribute groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:297:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(6,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','6','a:6:{s:4:\"code\";s:23:\"fixtures_group_type_csv\";s:8:\"job_name\";s:23:\"fixtures_group_type_csv\";s:5:\"label\";s:25:\"Group types data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:292:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/group_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_group_type_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"fixtures_group_type_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"Group types data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:292:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/group_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(7,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','7','a:6:{s:4:\"code\";s:26:\"fixtures_locale_access_csv\";s:8:\"job_name\";s:26:\"fixtures_locale_access_csv\";s:5:\"label\";s:29:\"Locale accesses data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:296:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locale_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"fixtures_locale_access_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"fixtures_locale_access_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"Locale accesses data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:296:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/locale_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(8,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','8','a:6:{s:4:\"code\";s:27:\"fixtures_asset_category_csv\";s:8:\"job_name\";s:27:\"fixtures_asset_category_csv\";s:5:\"label\";s:30:\"Asset categories data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:297:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"fixtures_asset_category_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"fixtures_asset_category_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Asset categories data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:297:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_categories.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(9,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','9','a:6:{s:4:\"code\";s:22:\"fixtures_attribute_csv\";s:8:\"job_name\";s:22:\"fixtures_attribute_csv\";s:5:\"label\";s:24:\"Attributes data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attributes.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_attribute_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_attribute_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Attributes data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attributes.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(10,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','10','a:6:{s:4:\"code\";s:20:\"fixtures_channel_csv\";s:8:\"job_name\";s:20:\"fixtures_channel_csv\";s:5:\"label\";s:22:\"Channels data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:289:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/channels.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_channel_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_channel_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"Channels data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:289:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/channels.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(11,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','11','a:6:{s:4:\"code\";s:29:\"fixtures_association_type_csv\";s:8:\"job_name\";s:29:\"fixtures_association_type_csv\";s:5:\"label\";s:26:\"Associations data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:298:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/association_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"fixtures_association_type_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"fixtures_association_type_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Associations data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:298:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/association_types.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(12,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','12','a:6:{s:4:\"code\";s:30:\"fixtures_attribute_options_csv\";s:8:\"job_name\";s:30:\"fixtures_attribute_options_csv\";s:5:\"label\";s:31:\"Attribute options data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:298:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_options.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"fixtures_attribute_options_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"fixtures_attribute_options_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:31:\"Attribute options data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:298:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_options.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(13,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','13','a:6:{s:4:\"code\";s:41:\"fixtures_asset_channel_configurations_yml\";s:8:\"job_name\";s:41:\"fixtures_asset_channel_configurations_yml\";s:5:\"label\";s:20:\"assets data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:245:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_channel_configurations.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:41:\"fixtures_asset_channel_configurations_yml\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:41:\"fixtures_asset_channel_configurations_yml\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"assets data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:245:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_channel_configurations.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(14,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','14','a:6:{s:4:\"code\";s:19:\"fixtures_family_csv\";s:8:\"job_name\";s:19:\"fixtures_family_csv\";s:5:\"label\";s:22:\"Families data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:289:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/families.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_family_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"fixtures_family_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"Families data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:289:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/families.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(15,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','15','a:6:{s:4:\"code\";s:16:\"fixtures_job_yml\";s:8:\"job_name\";s:16:\"fixtures_job_yml\";s:5:\"label\";s:18:\"Jobs data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:221:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/jobs.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"fixtures_job_yml\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"fixtures_job_yml\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"Jobs data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:221:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/jobs.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(16,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','16','a:6:{s:4:\"code\";s:27:\"fixtures_family_variant_csv\";s:8:\"job_name\";s:27:\"fixtures_family_variant_csv\";s:5:\"label\";s:29:\"Family variants data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:296:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/family_variants.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"fixtures_family_variant_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"fixtures_family_variant_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"Family variants data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:296:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/family_variants.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(17,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','17','a:6:{s:4:\"code\";s:17:\"fixtures_rule_yml\";s:8:\"job_name\";s:17:\"fixtures_rule_yml\";s:5:\"label\";s:19:\"rules data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:222:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/rules.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"fixtures_rule_yml\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"fixtures_rule_yml\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"rules data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:222:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/rules.yml\",\"uploadAllowed\":true,\"invalid_items_file_format\":\"yaml\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(18,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','18','a:6:{s:4:\"code\";s:18:\"fixtures_asset_csv\";s:8:\"job_name\";s:18:\"fixtures_asset_csv\";s:5:\"label\";s:20:\"assets data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:287:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/assets.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"fixtures_asset_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"fixtures_asset_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"assets data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:287:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/assets.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(19,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','19','a:6:{s:4:\"code\";s:18:\"fixtures_group_csv\";s:8:\"job_name\";s:18:\"fixtures_group_csv\";s:5:\"label\";s:20:\"Groups data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:287:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"fixtures_group_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"fixtures_group_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Groups data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:287:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/groups.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(20,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','20','a:6:{s:4:\"code\";s:22:\"fixtures_user_role_csv\";s:8:\"job_name\";s:22:\"fixtures_user_role_csv\";s:5:\"label\";s:24:\"User roles data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_roles.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_user_role_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"fixtures_user_role_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"User roles data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:291:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/user_roles.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(21,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','21','a:6:{s:4:\"code\";s:17:\"fixtures_user_csv\";s:8:\"job_name\";s:17:\"fixtures_user_csv\";s:5:\"label\";s:19:\"Users data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:286:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/users.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"fixtures_user_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"fixtures_user_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"Users data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:286:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/users.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(22,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','22','a:6:{s:4:\"code\";s:26:\"fixtures_product_model_csv\";s:8:\"job_name\";s:26:\"fixtures_product_model_csv\";s:5:\"label\";s:27:\"Product model data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:481:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/product_models.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false,\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyVariantColumn\":\"family_variant\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"fixtures_product_model_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"fixtures_product_model_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Product model data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:481:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/product_models.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false,\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyVariantColumn\":\"family_variant\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}}',NULL,1,'2019-02-19 21:01:24',0),(23,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','23','a:6:{s:4:\"code\";s:20:\"fixtures_product_csv\";s:8:\"job_name\";s:20:\"fixtures_product_csv\";s:5:\"label\";s:21:\"Product data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:484:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/products.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false,\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyColumn\":\"family\",\"groupsColumn\":\"groups\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_product_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"fixtures_product_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Product data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:484:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/products.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false,\"decimalSeparator\":\".\",\"dateFormat\":\"yyyy-MM-dd\",\"enabled\":true,\"categoriesColumn\":\"categories\",\"familyColumn\":\"family\",\"groupsColumn\":\"groups\",\"enabledComparison\":true,\"realTimeVersioning\":true}\";}}',NULL,1,'2019-02-19 21:01:24',0),(24,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','24','a:6:{s:4:\"code\";s:35:\"fixtures_attribute_group_access_csv\";s:8:\"job_name\";s:35:\"fixtures_attribute_group_access_csv\";s:5:\"label\";s:38:\"Attribute group accesses data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:305:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_group_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"fixtures_attribute_group_access_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"fixtures_attribute_group_access_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"Attribute group accesses data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:305:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/attribute_group_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(25,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','25','a:6:{s:4:\"code\";s:36:\"fixtures_product_category_access_csv\";s:8:\"job_name\";s:36:\"fixtures_product_category_access_csv\";s:5:\"label\";s:39:\"Product category accesses data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:306:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/product_category_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:36:\"fixtures_product_category_access_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:36:\"fixtures_product_category_access_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:39:\"Product category accesses data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:306:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/product_category_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(26,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','26','a:6:{s:4:\"code\";s:31:\"fixtures_job_profile_access_csv\";s:8:\"job_name\";s:31:\"fixtures_job_profile_access_csv\";s:5:\"label\";s:34:\"Job profile accesses data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:301:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/job_profile_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:31:\"fixtures_job_profile_access_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:31:\"fixtures_job_profile_access_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"Job profile accesses data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:301:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/job_profile_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(27,'admin','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','27','a:6:{s:4:\"code\";s:34:\"fixtures_asset_category_access_csv\";s:8:\"job_name\";s:34:\"fixtures_asset_category_access_csv\";s:5:\"label\";s:37:\"Asset category accesses data fixtures\";s:9:\"connector\";s:13:\"Data fixtures\";s:4:\"type\";s:8:\"fixtures\";s:13:\"configuration\";s:304:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_category_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"fixtures_asset_category_access_csv\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"fixtures_asset_category_access_csv\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"Asset category accesses data fixtures\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:13:\"Data fixtures\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"fixtures\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:304:\"{\"filePath\":\"\\/srv\\/pim\\/src\\/Akeneo\\/Platform\\/Bundle\\/InstallerBundle\\/Resources\\/fixtures\\/minimal\\/asset_category_accesses.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"withHeader\":true,\"uploadAllowed\":true,\"invalid_items_file_format\":\"csv\",\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:24',0),(28,'system','Akeneo\\Channel\\Component\\Model\\Locale','1','a:3:{s:4:\"code\";s:5:\"af_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"af_ZA\";}}',NULL,1,'2019-02-19 21:01:26',0),(29,'system','Akeneo\\Channel\\Component\\Model\\Locale','2','a:3:{s:4:\"code\";s:5:\"am_ET\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"am_ET\";}}',NULL,1,'2019-02-19 21:01:26',0),(30,'system','Akeneo\\Channel\\Component\\Model\\Locale','3','a:3:{s:4:\"code\";s:5:\"ar_AE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_AE\";}}',NULL,1,'2019-02-19 21:01:26',0),(31,'system','Akeneo\\Channel\\Component\\Model\\Locale','4','a:3:{s:4:\"code\";s:5:\"ar_BH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_BH\";}}',NULL,1,'2019-02-19 21:01:26',0),(32,'system','Akeneo\\Channel\\Component\\Model\\Locale','5','a:3:{s:4:\"code\";s:5:\"ar_DZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_DZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(33,'system','Akeneo\\Channel\\Component\\Model\\Locale','6','a:3:{s:4:\"code\";s:5:\"ar_EG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_EG\";}}',NULL,1,'2019-02-19 21:01:26',0),(34,'system','Akeneo\\Channel\\Component\\Model\\Locale','7','a:3:{s:4:\"code\";s:5:\"ar_IQ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_IQ\";}}',NULL,1,'2019-02-19 21:01:26',0),(35,'system','Akeneo\\Channel\\Component\\Model\\Locale','8','a:3:{s:4:\"code\";s:5:\"ar_JO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_JO\";}}',NULL,1,'2019-02-19 21:01:26',0),(36,'system','Akeneo\\Channel\\Component\\Model\\Locale','9','a:3:{s:4:\"code\";s:5:\"ar_KW\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_KW\";}}',NULL,1,'2019-02-19 21:01:26',0),(37,'system','Akeneo\\Channel\\Component\\Model\\Locale','10','a:3:{s:4:\"code\";s:5:\"ar_LB\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_LB\";}}',NULL,1,'2019-02-19 21:01:26',0),(38,'system','Akeneo\\Channel\\Component\\Model\\Locale','11','a:3:{s:4:\"code\";s:5:\"ar_LY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_LY\";}}',NULL,1,'2019-02-19 21:01:26',0),(39,'system','Akeneo\\Channel\\Component\\Model\\Locale','12','a:3:{s:4:\"code\";s:5:\"ar_MA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_MA\";}}',NULL,1,'2019-02-19 21:01:26',0),(40,'system','Akeneo\\Channel\\Component\\Model\\Locale','13','a:3:{s:4:\"code\";s:6:\"arn_CL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"arn_CL\";}}',NULL,1,'2019-02-19 21:01:26',0),(41,'system','Akeneo\\Channel\\Component\\Model\\Locale','14','a:3:{s:4:\"code\";s:5:\"ar_OM\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_OM\";}}',NULL,1,'2019-02-19 21:01:26',0),(42,'system','Akeneo\\Channel\\Component\\Model\\Locale','15','a:3:{s:4:\"code\";s:5:\"ar_QA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_QA\";}}',NULL,1,'2019-02-19 21:01:26',0),(43,'system','Akeneo\\Channel\\Component\\Model\\Locale','16','a:3:{s:4:\"code\";s:5:\"ar_SA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_SA\";}}',NULL,1,'2019-02-19 21:01:26',0),(44,'system','Akeneo\\Channel\\Component\\Model\\Locale','17','a:3:{s:4:\"code\";s:5:\"ar_SY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_SY\";}}',NULL,1,'2019-02-19 21:01:26',0),(45,'system','Akeneo\\Channel\\Component\\Model\\Locale','18','a:3:{s:4:\"code\";s:5:\"ar_TN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_TN\";}}',NULL,1,'2019-02-19 21:01:26',0),(46,'system','Akeneo\\Channel\\Component\\Model\\Locale','19','a:3:{s:4:\"code\";s:5:\"ar_YE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ar_YE\";}}',NULL,1,'2019-02-19 21:01:26',0),(47,'system','Akeneo\\Channel\\Component\\Model\\Locale','20','a:3:{s:4:\"code\";s:5:\"as_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"as_IN\";}}',NULL,1,'2019-02-19 21:01:26',0),(48,'system','Akeneo\\Channel\\Component\\Model\\Locale','21','a:3:{s:4:\"code\";s:10:\"az_Cyrl_AZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"az_Cyrl_AZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(49,'system','Akeneo\\Channel\\Component\\Model\\Locale','22','a:3:{s:4:\"code\";s:10:\"az_Latn_AZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"az_Latn_AZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(50,'system','Akeneo\\Channel\\Component\\Model\\Locale','23','a:3:{s:4:\"code\";s:5:\"ba_RU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ba_RU\";}}',NULL,1,'2019-02-19 21:01:26',0),(51,'system','Akeneo\\Channel\\Component\\Model\\Locale','24','a:3:{s:4:\"code\";s:5:\"be_BY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"be_BY\";}}',NULL,1,'2019-02-19 21:01:26',0),(52,'system','Akeneo\\Channel\\Component\\Model\\Locale','25','a:3:{s:4:\"code\";s:5:\"bg_BG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bg_BG\";}}',NULL,1,'2019-02-19 21:01:26',0),(53,'system','Akeneo\\Channel\\Component\\Model\\Locale','26','a:3:{s:4:\"code\";s:5:\"bn_BD\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bn_BD\";}}',NULL,1,'2019-02-19 21:01:26',0),(54,'system','Akeneo\\Channel\\Component\\Model\\Locale','27','a:3:{s:4:\"code\";s:5:\"bn_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bn_IN\";}}',NULL,1,'2019-02-19 21:01:26',0),(55,'system','Akeneo\\Channel\\Component\\Model\\Locale','28','a:3:{s:4:\"code\";s:5:\"bo_CN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"bo_CN\";}}',NULL,1,'2019-02-19 21:01:26',0),(56,'system','Akeneo\\Channel\\Component\\Model\\Locale','29','a:3:{s:4:\"code\";s:5:\"br_FR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"br_FR\";}}',NULL,1,'2019-02-19 21:01:26',0),(57,'system','Akeneo\\Channel\\Component\\Model\\Locale','30','a:3:{s:4:\"code\";s:10:\"bs_Cyrl_BA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"bs_Cyrl_BA\";}}',NULL,1,'2019-02-19 21:01:26',0),(58,'system','Akeneo\\Channel\\Component\\Model\\Locale','31','a:3:{s:4:\"code\";s:10:\"bs_Latn_BA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"bs_Latn_BA\";}}',NULL,1,'2019-02-19 21:01:26',0),(59,'system','Akeneo\\Channel\\Component\\Model\\Locale','32','a:3:{s:4:\"code\";s:5:\"ca_ES\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ca_ES\";}}',NULL,1,'2019-02-19 21:01:26',0),(60,'system','Akeneo\\Channel\\Component\\Model\\Locale','33','a:3:{s:4:\"code\";s:5:\"co_FR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"co_FR\";}}',NULL,1,'2019-02-19 21:01:26',0),(61,'system','Akeneo\\Channel\\Component\\Model\\Locale','34','a:3:{s:4:\"code\";s:5:\"cs_CZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"cs_CZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(62,'system','Akeneo\\Channel\\Component\\Model\\Locale','35','a:3:{s:4:\"code\";s:5:\"cy_GB\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"cy_GB\";}}',NULL,1,'2019-02-19 21:01:26',0),(63,'system','Akeneo\\Channel\\Component\\Model\\Locale','36','a:3:{s:4:\"code\";s:5:\"da_DK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"da_DK\";}}',NULL,1,'2019-02-19 21:01:26',0),(64,'system','Akeneo\\Channel\\Component\\Model\\Locale','37','a:3:{s:4:\"code\";s:5:\"de_AT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_AT\";}}',NULL,1,'2019-02-19 21:01:26',0),(65,'system','Akeneo\\Channel\\Component\\Model\\Locale','38','a:3:{s:4:\"code\";s:5:\"de_CH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_CH\";}}',NULL,1,'2019-02-19 21:01:26',0),(66,'system','Akeneo\\Channel\\Component\\Model\\Locale','39','a:3:{s:4:\"code\";s:5:\"de_DE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_DE\";}}',NULL,1,'2019-02-19 21:01:26',0),(67,'system','Akeneo\\Channel\\Component\\Model\\Locale','40','a:3:{s:4:\"code\";s:5:\"de_LI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_LI\";}}',NULL,1,'2019-02-19 21:01:26',0),(68,'system','Akeneo\\Channel\\Component\\Model\\Locale','41','a:3:{s:4:\"code\";s:5:\"de_LU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"de_LU\";}}',NULL,1,'2019-02-19 21:01:26',0),(69,'system','Akeneo\\Channel\\Component\\Model\\Locale','42','a:3:{s:4:\"code\";s:6:\"dsb_DE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"dsb_DE\";}}',NULL,1,'2019-02-19 21:01:26',0),(70,'system','Akeneo\\Channel\\Component\\Model\\Locale','43','a:3:{s:4:\"code\";s:5:\"dv_MV\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"dv_MV\";}}',NULL,1,'2019-02-19 21:01:26',0),(71,'system','Akeneo\\Channel\\Component\\Model\\Locale','44','a:3:{s:4:\"code\";s:5:\"el_GR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"el_GR\";}}',NULL,1,'2019-02-19 21:01:26',0),(72,'system','Akeneo\\Channel\\Component\\Model\\Locale','45','a:3:{s:4:\"code\";s:6:\"en_029\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"en_029\";}}',NULL,1,'2019-02-19 21:01:26',0),(73,'system','Akeneo\\Channel\\Component\\Model\\Locale','46','a:3:{s:4:\"code\";s:5:\"en_AU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_AU\";}}',NULL,1,'2019-02-19 21:01:26',0),(74,'system','Akeneo\\Channel\\Component\\Model\\Locale','47','a:3:{s:4:\"code\";s:5:\"en_BZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_BZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(75,'system','Akeneo\\Channel\\Component\\Model\\Locale','48','a:3:{s:4:\"code\";s:5:\"en_CA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_CA\";}}',NULL,1,'2019-02-19 21:01:26',0),(76,'system','Akeneo\\Channel\\Component\\Model\\Locale','49','a:3:{s:4:\"code\";s:5:\"en_GB\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_GB\";}}',NULL,1,'2019-02-19 21:01:26',0),(77,'system','Akeneo\\Channel\\Component\\Model\\Locale','50','a:3:{s:4:\"code\";s:5:\"en_IE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_IE\";}}',NULL,1,'2019-02-19 21:01:26',0),(78,'system','Akeneo\\Channel\\Component\\Model\\Locale','51','a:3:{s:4:\"code\";s:5:\"en_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_IN\";}}',NULL,1,'2019-02-19 21:01:26',0),(79,'system','Akeneo\\Channel\\Component\\Model\\Locale','52','a:3:{s:4:\"code\";s:5:\"en_JM\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_JM\";}}',NULL,1,'2019-02-19 21:01:26',0),(80,'system','Akeneo\\Channel\\Component\\Model\\Locale','53','a:3:{s:4:\"code\";s:5:\"en_MY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_MY\";}}',NULL,1,'2019-02-19 21:01:26',0),(81,'system','Akeneo\\Channel\\Component\\Model\\Locale','54','a:3:{s:4:\"code\";s:5:\"en_NZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_NZ\";}}',NULL,1,'2019-02-19 21:01:26',0),(82,'system','Akeneo\\Channel\\Component\\Model\\Locale','55','a:3:{s:4:\"code\";s:5:\"en_PH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_PH\";}}',NULL,1,'2019-02-19 21:01:26',0),(83,'system','Akeneo\\Channel\\Component\\Model\\Locale','56','a:3:{s:4:\"code\";s:5:\"en_SG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_SG\";}}',NULL,1,'2019-02-19 21:01:26',0),(84,'system','Akeneo\\Channel\\Component\\Model\\Locale','57','a:3:{s:4:\"code\";s:5:\"en_TT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_TT\";}}',NULL,1,'2019-02-19 21:01:26',0),(85,'system','Akeneo\\Channel\\Component\\Model\\Locale','58','a:3:{s:4:\"code\";s:5:\"en_US\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_US\";}}',NULL,1,'2019-02-19 21:01:26',0),(86,'system','Akeneo\\Channel\\Component\\Model\\Locale','59','a:3:{s:4:\"code\";s:5:\"en_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_ZA\";}}',NULL,1,'2019-02-19 21:01:26',0),(87,'system','Akeneo\\Channel\\Component\\Model\\Locale','60','a:3:{s:4:\"code\";s:5:\"en_ZW\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_ZW\";}}',NULL,1,'2019-02-19 21:01:26',0),(88,'system','Akeneo\\Channel\\Component\\Model\\Locale','61','a:3:{s:4:\"code\";s:5:\"es_AR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_AR\";}}',NULL,1,'2019-02-19 21:01:26',0),(89,'system','Akeneo\\Channel\\Component\\Model\\Locale','62','a:3:{s:4:\"code\";s:5:\"es_BO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_BO\";}}',NULL,1,'2019-02-19 21:01:26',0),(90,'system','Akeneo\\Channel\\Component\\Model\\Locale','63','a:3:{s:4:\"code\";s:5:\"es_CL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CL\";}}',NULL,1,'2019-02-19 21:01:26',0),(91,'system','Akeneo\\Channel\\Component\\Model\\Locale','64','a:3:{s:4:\"code\";s:5:\"es_CO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CO\";}}',NULL,1,'2019-02-19 21:01:26',0),(92,'system','Akeneo\\Channel\\Component\\Model\\Locale','65','a:3:{s:4:\"code\";s:5:\"es_CR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_CR\";}}',NULL,1,'2019-02-19 21:01:26',0),(93,'system','Akeneo\\Channel\\Component\\Model\\Locale','66','a:3:{s:4:\"code\";s:5:\"es_DO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_DO\";}}',NULL,1,'2019-02-19 21:01:26',0),(94,'system','Akeneo\\Channel\\Component\\Model\\Locale','67','a:3:{s:4:\"code\";s:5:\"es_EC\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_EC\";}}',NULL,1,'2019-02-19 21:01:26',0),(95,'system','Akeneo\\Channel\\Component\\Model\\Locale','68','a:3:{s:4:\"code\";s:5:\"es_ES\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_ES\";}}',NULL,1,'2019-02-19 21:01:26',0),(96,'system','Akeneo\\Channel\\Component\\Model\\Locale','69','a:3:{s:4:\"code\";s:5:\"es_GT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_GT\";}}',NULL,1,'2019-02-19 21:01:26',0),(97,'system','Akeneo\\Channel\\Component\\Model\\Locale','70','a:3:{s:4:\"code\";s:5:\"es_HN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_HN\";}}',NULL,1,'2019-02-19 21:01:26',0),(98,'system','Akeneo\\Channel\\Component\\Model\\Locale','71','a:3:{s:4:\"code\";s:5:\"es_MX\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_MX\";}}',NULL,1,'2019-02-19 21:01:26',0),(99,'system','Akeneo\\Channel\\Component\\Model\\Locale','72','a:3:{s:4:\"code\";s:5:\"es_NI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_NI\";}}',NULL,1,'2019-02-19 21:01:26',0),(100,'system','Akeneo\\Channel\\Component\\Model\\Locale','73','a:3:{s:4:\"code\";s:5:\"es_PA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PA\";}}',NULL,1,'2019-02-19 21:01:26',0),(101,'system','Akeneo\\Channel\\Component\\Model\\Locale','74','a:3:{s:4:\"code\";s:5:\"es_PE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PE\";}}',NULL,1,'2019-02-19 21:01:26',0),(102,'system','Akeneo\\Channel\\Component\\Model\\Locale','75','a:3:{s:4:\"code\";s:5:\"es_PR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PR\";}}',NULL,1,'2019-02-19 21:01:26',0),(103,'system','Akeneo\\Channel\\Component\\Model\\Locale','76','a:3:{s:4:\"code\";s:5:\"es_PY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_PY\";}}',NULL,1,'2019-02-19 21:01:26',0),(104,'system','Akeneo\\Channel\\Component\\Model\\Locale','77','a:3:{s:4:\"code\";s:5:\"es_SV\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_SV\";}}',NULL,1,'2019-02-19 21:01:26',0),(105,'system','Akeneo\\Channel\\Component\\Model\\Locale','78','a:3:{s:4:\"code\";s:5:\"es_US\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_US\";}}',NULL,1,'2019-02-19 21:01:27',0),(106,'system','Akeneo\\Channel\\Component\\Model\\Locale','79','a:3:{s:4:\"code\";s:5:\"es_UY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_UY\";}}',NULL,1,'2019-02-19 21:01:27',0),(107,'system','Akeneo\\Channel\\Component\\Model\\Locale','80','a:3:{s:4:\"code\";s:5:\"es_VE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"es_VE\";}}',NULL,1,'2019-02-19 21:01:27',0),(108,'system','Akeneo\\Channel\\Component\\Model\\Locale','81','a:3:{s:4:\"code\";s:5:\"et_EE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"et_EE\";}}',NULL,1,'2019-02-19 21:01:27',0),(109,'system','Akeneo\\Channel\\Component\\Model\\Locale','82','a:3:{s:4:\"code\";s:5:\"eu_ES\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"eu_ES\";}}',NULL,1,'2019-02-19 21:01:27',0),(110,'system','Akeneo\\Channel\\Component\\Model\\Locale','83','a:3:{s:4:\"code\";s:5:\"fa_IR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fa_IR\";}}',NULL,1,'2019-02-19 21:01:27',0),(111,'system','Akeneo\\Channel\\Component\\Model\\Locale','84','a:3:{s:4:\"code\";s:5:\"fi_FI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fi_FI\";}}',NULL,1,'2019-02-19 21:01:27',0),(112,'system','Akeneo\\Channel\\Component\\Model\\Locale','85','a:3:{s:4:\"code\";s:6:\"fil_PH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"fil_PH\";}}',NULL,1,'2019-02-19 21:01:27',0),(113,'system','Akeneo\\Channel\\Component\\Model\\Locale','86','a:3:{s:4:\"code\";s:5:\"fo_FO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fo_FO\";}}',NULL,1,'2019-02-19 21:01:27',0),(114,'system','Akeneo\\Channel\\Component\\Model\\Locale','87','a:3:{s:4:\"code\";s:5:\"fr_BE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_BE\";}}',NULL,1,'2019-02-19 21:01:27',0),(115,'system','Akeneo\\Channel\\Component\\Model\\Locale','88','a:3:{s:4:\"code\";s:5:\"fr_CA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_CA\";}}',NULL,1,'2019-02-19 21:01:27',0),(116,'system','Akeneo\\Channel\\Component\\Model\\Locale','89','a:3:{s:4:\"code\";s:5:\"fr_CH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_CH\";}}',NULL,1,'2019-02-19 21:01:27',0),(117,'system','Akeneo\\Channel\\Component\\Model\\Locale','90','a:3:{s:4:\"code\";s:5:\"fr_FR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_FR\";}}',NULL,1,'2019-02-19 21:01:27',0),(118,'system','Akeneo\\Channel\\Component\\Model\\Locale','91','a:3:{s:4:\"code\";s:5:\"fr_LU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_LU\";}}',NULL,1,'2019-02-19 21:01:27',0),(119,'system','Akeneo\\Channel\\Component\\Model\\Locale','92','a:3:{s:4:\"code\";s:5:\"fr_MC\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fr_MC\";}}',NULL,1,'2019-02-19 21:01:27',0),(120,'system','Akeneo\\Channel\\Component\\Model\\Locale','93','a:3:{s:4:\"code\";s:5:\"fy_NL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"fy_NL\";}}',NULL,1,'2019-02-19 21:01:27',0),(121,'system','Akeneo\\Channel\\Component\\Model\\Locale','94','a:3:{s:4:\"code\";s:5:\"ga_IE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ga_IE\";}}',NULL,1,'2019-02-19 21:01:27',0),(122,'system','Akeneo\\Channel\\Component\\Model\\Locale','95','a:3:{s:4:\"code\";s:5:\"gd_GB\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gd_GB\";}}',NULL,1,'2019-02-19 21:01:27',0),(123,'system','Akeneo\\Channel\\Component\\Model\\Locale','96','a:3:{s:4:\"code\";s:5:\"gl_ES\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gl_ES\";}}',NULL,1,'2019-02-19 21:01:27',0),(124,'system','Akeneo\\Channel\\Component\\Model\\Locale','97','a:3:{s:4:\"code\";s:6:\"gsw_FR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"gsw_FR\";}}',NULL,1,'2019-02-19 21:01:27',0),(125,'system','Akeneo\\Channel\\Component\\Model\\Locale','98','a:3:{s:4:\"code\";s:5:\"gu_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"gu_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(126,'system','Akeneo\\Channel\\Component\\Model\\Locale','99','a:3:{s:4:\"code\";s:10:\"ha_Latn_NG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"ha_Latn_NG\";}}',NULL,1,'2019-02-19 21:01:27',0),(127,'system','Akeneo\\Channel\\Component\\Model\\Locale','100','a:3:{s:4:\"code\";s:5:\"he_IL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"he_IL\";}}',NULL,1,'2019-02-19 21:01:27',0),(128,'system','Akeneo\\Channel\\Component\\Model\\Locale','101','a:3:{s:4:\"code\";s:5:\"hi_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hi_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(129,'system','Akeneo\\Channel\\Component\\Model\\Locale','102','a:3:{s:4:\"code\";s:5:\"hr_BA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hr_BA\";}}',NULL,1,'2019-02-19 21:01:27',0),(130,'system','Akeneo\\Channel\\Component\\Model\\Locale','103','a:3:{s:4:\"code\";s:5:\"hr_HR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hr_HR\";}}',NULL,1,'2019-02-19 21:01:27',0),(131,'system','Akeneo\\Channel\\Component\\Model\\Locale','104','a:3:{s:4:\"code\";s:6:\"hsb_DE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"hsb_DE\";}}',NULL,1,'2019-02-19 21:01:27',0),(132,'system','Akeneo\\Channel\\Component\\Model\\Locale','105','a:3:{s:4:\"code\";s:5:\"hu_HU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hu_HU\";}}',NULL,1,'2019-02-19 21:01:27',0),(133,'system','Akeneo\\Channel\\Component\\Model\\Locale','106','a:3:{s:4:\"code\";s:5:\"hy_AM\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"hy_AM\";}}',NULL,1,'2019-02-19 21:01:27',0),(134,'system','Akeneo\\Channel\\Component\\Model\\Locale','107','a:3:{s:4:\"code\";s:5:\"id_ID\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"id_ID\";}}',NULL,1,'2019-02-19 21:01:27',0),(135,'system','Akeneo\\Channel\\Component\\Model\\Locale','108','a:3:{s:4:\"code\";s:5:\"ig_NG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ig_NG\";}}',NULL,1,'2019-02-19 21:01:27',0),(136,'system','Akeneo\\Channel\\Component\\Model\\Locale','109','a:3:{s:4:\"code\";s:5:\"ii_CN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ii_CN\";}}',NULL,1,'2019-02-19 21:01:27',0),(137,'system','Akeneo\\Channel\\Component\\Model\\Locale','110','a:3:{s:4:\"code\";s:5:\"is_IS\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"is_IS\";}}',NULL,1,'2019-02-19 21:01:27',0),(138,'system','Akeneo\\Channel\\Component\\Model\\Locale','111','a:3:{s:4:\"code\";s:5:\"it_CH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"it_CH\";}}',NULL,1,'2019-02-19 21:01:27',0),(139,'system','Akeneo\\Channel\\Component\\Model\\Locale','112','a:3:{s:4:\"code\";s:5:\"it_IT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"it_IT\";}}',NULL,1,'2019-02-19 21:01:27',0),(140,'system','Akeneo\\Channel\\Component\\Model\\Locale','113','a:3:{s:4:\"code\";s:10:\"iu_Cans_CA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"iu_Cans_CA\";}}',NULL,1,'2019-02-19 21:01:27',0),(141,'system','Akeneo\\Channel\\Component\\Model\\Locale','114','a:3:{s:4:\"code\";s:10:\"iu_Latn_CA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"iu_Latn_CA\";}}',NULL,1,'2019-02-19 21:01:27',0),(142,'system','Akeneo\\Channel\\Component\\Model\\Locale','115','a:3:{s:4:\"code\";s:5:\"ja_JP\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ja_JP\";}}',NULL,1,'2019-02-19 21:01:27',0),(143,'system','Akeneo\\Channel\\Component\\Model\\Locale','116','a:3:{s:4:\"code\";s:5:\"ka_GE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ka_GE\";}}',NULL,1,'2019-02-19 21:01:27',0),(144,'system','Akeneo\\Channel\\Component\\Model\\Locale','117','a:3:{s:4:\"code\";s:5:\"kk_KZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kk_KZ\";}}',NULL,1,'2019-02-19 21:01:27',0),(145,'system','Akeneo\\Channel\\Component\\Model\\Locale','118','a:3:{s:4:\"code\";s:5:\"kl_GL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kl_GL\";}}',NULL,1,'2019-02-19 21:01:27',0),(146,'system','Akeneo\\Channel\\Component\\Model\\Locale','119','a:3:{s:4:\"code\";s:5:\"km_KH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"km_KH\";}}',NULL,1,'2019-02-19 21:01:27',0),(147,'system','Akeneo\\Channel\\Component\\Model\\Locale','120','a:3:{s:4:\"code\";s:5:\"kn_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"kn_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(148,'system','Akeneo\\Channel\\Component\\Model\\Locale','121','a:3:{s:4:\"code\";s:6:\"kok_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"kok_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(149,'system','Akeneo\\Channel\\Component\\Model\\Locale','122','a:3:{s:4:\"code\";s:5:\"ko_KR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ko_KR\";}}',NULL,1,'2019-02-19 21:01:27',0),(150,'system','Akeneo\\Channel\\Component\\Model\\Locale','123','a:3:{s:4:\"code\";s:5:\"ky_KG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ky_KG\";}}',NULL,1,'2019-02-19 21:01:27',0),(151,'system','Akeneo\\Channel\\Component\\Model\\Locale','124','a:3:{s:4:\"code\";s:5:\"lb_LU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lb_LU\";}}',NULL,1,'2019-02-19 21:01:27',0),(152,'system','Akeneo\\Channel\\Component\\Model\\Locale','125','a:3:{s:4:\"code\";s:5:\"lo_LA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lo_LA\";}}',NULL,1,'2019-02-19 21:01:27',0),(153,'system','Akeneo\\Channel\\Component\\Model\\Locale','126','a:3:{s:4:\"code\";s:5:\"lt_LT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lt_LT\";}}',NULL,1,'2019-02-19 21:01:27',0),(154,'system','Akeneo\\Channel\\Component\\Model\\Locale','127','a:3:{s:4:\"code\";s:5:\"lv_LV\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"lv_LV\";}}',NULL,1,'2019-02-19 21:01:27',0),(155,'system','Akeneo\\Channel\\Component\\Model\\Locale','128','a:3:{s:4:\"code\";s:5:\"mi_NZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mi_NZ\";}}',NULL,1,'2019-02-19 21:01:27',0),(156,'system','Akeneo\\Channel\\Component\\Model\\Locale','129','a:3:{s:4:\"code\";s:5:\"mk_MK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mk_MK\";}}',NULL,1,'2019-02-19 21:01:27',0),(157,'system','Akeneo\\Channel\\Component\\Model\\Locale','130','a:3:{s:4:\"code\";s:5:\"ml_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ml_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(158,'system','Akeneo\\Channel\\Component\\Model\\Locale','131','a:3:{s:4:\"code\";s:5:\"mn_MN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mn_MN\";}}',NULL,1,'2019-02-19 21:01:27',0),(159,'system','Akeneo\\Channel\\Component\\Model\\Locale','132','a:3:{s:4:\"code\";s:10:\"mn_Mong_CN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"mn_Mong_CN\";}}',NULL,1,'2019-02-19 21:01:27',0),(160,'system','Akeneo\\Channel\\Component\\Model\\Locale','133','a:3:{s:4:\"code\";s:6:\"moh_CA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"moh_CA\";}}',NULL,1,'2019-02-19 21:01:27',0),(161,'system','Akeneo\\Channel\\Component\\Model\\Locale','134','a:3:{s:4:\"code\";s:5:\"mr_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mr_IN\";}}',NULL,1,'2019-02-19 21:01:27',0),(162,'system','Akeneo\\Channel\\Component\\Model\\Locale','135','a:3:{s:4:\"code\";s:5:\"ms_BN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ms_BN\";}}',NULL,1,'2019-02-19 21:01:27',0),(163,'system','Akeneo\\Channel\\Component\\Model\\Locale','136','a:3:{s:4:\"code\";s:5:\"ms_MY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ms_MY\";}}',NULL,1,'2019-02-19 21:01:27',0),(164,'system','Akeneo\\Channel\\Component\\Model\\Locale','137','a:3:{s:4:\"code\";s:5:\"mt_MT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"mt_MT\";}}',NULL,1,'2019-02-19 21:01:27',0),(165,'system','Akeneo\\Channel\\Component\\Model\\Locale','138','a:3:{s:4:\"code\";s:5:\"nb_NO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nb_NO\";}}',NULL,1,'2019-02-19 21:01:28',0),(166,'system','Akeneo\\Channel\\Component\\Model\\Locale','139','a:3:{s:4:\"code\";s:5:\"ne_NP\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ne_NP\";}}',NULL,1,'2019-02-19 21:01:28',0),(167,'system','Akeneo\\Channel\\Component\\Model\\Locale','140','a:3:{s:4:\"code\";s:5:\"nl_BE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nl_BE\";}}',NULL,1,'2019-02-19 21:01:28',0),(168,'system','Akeneo\\Channel\\Component\\Model\\Locale','141','a:3:{s:4:\"code\";s:5:\"nl_NL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nl_NL\";}}',NULL,1,'2019-02-19 21:01:28',0),(169,'system','Akeneo\\Channel\\Component\\Model\\Locale','142','a:3:{s:4:\"code\";s:5:\"nn_NO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"nn_NO\";}}',NULL,1,'2019-02-19 21:01:28',0),(170,'system','Akeneo\\Channel\\Component\\Model\\Locale','143','a:3:{s:4:\"code\";s:6:\"nso_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"nso_ZA\";}}',NULL,1,'2019-02-19 21:01:28',0),(171,'system','Akeneo\\Channel\\Component\\Model\\Locale','144','a:3:{s:4:\"code\";s:5:\"oc_FR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"oc_FR\";}}',NULL,1,'2019-02-19 21:01:28',0),(172,'system','Akeneo\\Channel\\Component\\Model\\Locale','145','a:3:{s:4:\"code\";s:5:\"or_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"or_IN\";}}',NULL,1,'2019-02-19 21:01:28',0),(173,'system','Akeneo\\Channel\\Component\\Model\\Locale','146','a:3:{s:4:\"code\";s:5:\"pa_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pa_IN\";}}',NULL,1,'2019-02-19 21:01:28',0),(174,'system','Akeneo\\Channel\\Component\\Model\\Locale','147','a:3:{s:4:\"code\";s:5:\"pl_PL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pl_PL\";}}',NULL,1,'2019-02-19 21:01:28',0),(175,'system','Akeneo\\Channel\\Component\\Model\\Locale','148','a:3:{s:4:\"code\";s:6:\"prs_AF\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"prs_AF\";}}',NULL,1,'2019-02-19 21:01:28',0),(176,'system','Akeneo\\Channel\\Component\\Model\\Locale','149','a:3:{s:4:\"code\";s:5:\"ps_AF\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ps_AF\";}}',NULL,1,'2019-02-19 21:01:28',0),(177,'system','Akeneo\\Channel\\Component\\Model\\Locale','150','a:3:{s:4:\"code\";s:5:\"pt_BR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pt_BR\";}}',NULL,1,'2019-02-19 21:01:28',0),(178,'system','Akeneo\\Channel\\Component\\Model\\Locale','151','a:3:{s:4:\"code\";s:5:\"pt_PT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"pt_PT\";}}',NULL,1,'2019-02-19 21:01:28',0),(179,'system','Akeneo\\Channel\\Component\\Model\\Locale','152','a:3:{s:4:\"code\";s:6:\"qut_GT\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"qut_GT\";}}',NULL,1,'2019-02-19 21:01:28',0),(180,'system','Akeneo\\Channel\\Component\\Model\\Locale','153','a:3:{s:4:\"code\";s:6:\"quz_BO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_BO\";}}',NULL,1,'2019-02-19 21:01:28',0),(181,'system','Akeneo\\Channel\\Component\\Model\\Locale','154','a:3:{s:4:\"code\";s:6:\"quz_EC\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_EC\";}}',NULL,1,'2019-02-19 21:01:28',0),(182,'system','Akeneo\\Channel\\Component\\Model\\Locale','155','a:3:{s:4:\"code\";s:6:\"quz_PE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"quz_PE\";}}',NULL,1,'2019-02-19 21:01:28',0),(183,'system','Akeneo\\Channel\\Component\\Model\\Locale','156','a:3:{s:4:\"code\";s:5:\"rm_CH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"rm_CH\";}}',NULL,1,'2019-02-19 21:01:28',0),(184,'system','Akeneo\\Channel\\Component\\Model\\Locale','157','a:3:{s:4:\"code\";s:5:\"ro_RO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ro_RO\";}}',NULL,1,'2019-02-19 21:01:28',0),(185,'system','Akeneo\\Channel\\Component\\Model\\Locale','158','a:3:{s:4:\"code\";s:5:\"ru_RU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ru_RU\";}}',NULL,1,'2019-02-19 21:01:28',0),(186,'system','Akeneo\\Channel\\Component\\Model\\Locale','159','a:3:{s:4:\"code\";s:5:\"rw_RW\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"rw_RW\";}}',NULL,1,'2019-02-19 21:01:28',0),(187,'system','Akeneo\\Channel\\Component\\Model\\Locale','160','a:3:{s:4:\"code\";s:6:\"sah_RU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sah_RU\";}}',NULL,1,'2019-02-19 21:01:28',0),(188,'system','Akeneo\\Channel\\Component\\Model\\Locale','161','a:3:{s:4:\"code\";s:5:\"sa_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sa_IN\";}}',NULL,1,'2019-02-19 21:01:28',0),(189,'system','Akeneo\\Channel\\Component\\Model\\Locale','162','a:3:{s:4:\"code\";s:5:\"se_FI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_FI\";}}',NULL,1,'2019-02-19 21:01:28',0),(190,'system','Akeneo\\Channel\\Component\\Model\\Locale','163','a:3:{s:4:\"code\";s:5:\"se_NO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_NO\";}}',NULL,1,'2019-02-19 21:01:28',0),(191,'system','Akeneo\\Channel\\Component\\Model\\Locale','164','a:3:{s:4:\"code\";s:5:\"se_SE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"se_SE\";}}',NULL,1,'2019-02-19 21:01:28',0),(192,'system','Akeneo\\Channel\\Component\\Model\\Locale','165','a:3:{s:4:\"code\";s:5:\"si_LK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"si_LK\";}}',NULL,1,'2019-02-19 21:01:28',0),(193,'system','Akeneo\\Channel\\Component\\Model\\Locale','166','a:3:{s:4:\"code\";s:5:\"sk_SK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sk_SK\";}}',NULL,1,'2019-02-19 21:01:28',0),(194,'system','Akeneo\\Channel\\Component\\Model\\Locale','167','a:3:{s:4:\"code\";s:5:\"sl_SI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sl_SI\";}}',NULL,1,'2019-02-19 21:01:28',0),(195,'system','Akeneo\\Channel\\Component\\Model\\Locale','168','a:3:{s:4:\"code\";s:6:\"sma_NO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sma_NO\";}}',NULL,1,'2019-02-19 21:01:28',0),(196,'system','Akeneo\\Channel\\Component\\Model\\Locale','169','a:3:{s:4:\"code\";s:6:\"sma_SE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sma_SE\";}}',NULL,1,'2019-02-19 21:01:28',0),(197,'system','Akeneo\\Channel\\Component\\Model\\Locale','170','a:3:{s:4:\"code\";s:6:\"smj_NO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smj_NO\";}}',NULL,1,'2019-02-19 21:01:28',0),(198,'system','Akeneo\\Channel\\Component\\Model\\Locale','171','a:3:{s:4:\"code\";s:6:\"smj_SE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smj_SE\";}}',NULL,1,'2019-02-19 21:01:28',0),(199,'system','Akeneo\\Channel\\Component\\Model\\Locale','172','a:3:{s:4:\"code\";s:6:\"smn_FI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"smn_FI\";}}',NULL,1,'2019-02-19 21:01:28',0),(200,'system','Akeneo\\Channel\\Component\\Model\\Locale','173','a:3:{s:4:\"code\";s:6:\"sms_FI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"sms_FI\";}}',NULL,1,'2019-02-19 21:01:28',0),(201,'system','Akeneo\\Channel\\Component\\Model\\Locale','174','a:3:{s:4:\"code\";s:5:\"sq_AL\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sq_AL\";}}',NULL,1,'2019-02-19 21:01:28',0),(202,'system','Akeneo\\Channel\\Component\\Model\\Locale','175','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_BA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_BA\";}}',NULL,1,'2019-02-19 21:01:28',0),(203,'system','Akeneo\\Channel\\Component\\Model\\Locale','176','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_CS\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_CS\";}}',NULL,1,'2019-02-19 21:01:28',0),(204,'system','Akeneo\\Channel\\Component\\Model\\Locale','177','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_ME\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_ME\";}}',NULL,1,'2019-02-19 21:01:28',0),(205,'system','Akeneo\\Channel\\Component\\Model\\Locale','178','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_RS\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Cyrl_RS\";}}',NULL,1,'2019-02-19 21:01:28',0),(206,'system','Akeneo\\Channel\\Component\\Model\\Locale','179','a:3:{s:4:\"code\";s:10:\"sr_Latn_BA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_BA\";}}',NULL,1,'2019-02-19 21:01:28',0),(207,'system','Akeneo\\Channel\\Component\\Model\\Locale','180','a:3:{s:4:\"code\";s:10:\"sr_Latn_CS\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_CS\";}}',NULL,1,'2019-02-19 21:01:28',0),(208,'system','Akeneo\\Channel\\Component\\Model\\Locale','181','a:3:{s:4:\"code\";s:10:\"sr_Latn_ME\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_ME\";}}',NULL,1,'2019-02-19 21:01:28',0),(209,'system','Akeneo\\Channel\\Component\\Model\\Locale','182','a:3:{s:4:\"code\";s:10:\"sr_Latn_RS\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"sr_Latn_RS\";}}',NULL,1,'2019-02-19 21:01:28',0),(210,'system','Akeneo\\Channel\\Component\\Model\\Locale','183','a:3:{s:4:\"code\";s:5:\"sv_FI\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sv_FI\";}}',NULL,1,'2019-02-19 21:01:28',0),(211,'system','Akeneo\\Channel\\Component\\Model\\Locale','184','a:3:{s:4:\"code\";s:5:\"sv_SE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sv_SE\";}}',NULL,1,'2019-02-19 21:01:28',0),(212,'system','Akeneo\\Channel\\Component\\Model\\Locale','185','a:3:{s:4:\"code\";s:5:\"sw_KE\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"sw_KE\";}}',NULL,1,'2019-02-19 21:01:28',0),(213,'system','Akeneo\\Channel\\Component\\Model\\Locale','186','a:3:{s:4:\"code\";s:6:\"syr_SY\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"syr_SY\";}}',NULL,1,'2019-02-19 21:01:28',0),(214,'system','Akeneo\\Channel\\Component\\Model\\Locale','187','a:3:{s:4:\"code\";s:5:\"ta_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ta_IN\";}}',NULL,1,'2019-02-19 21:01:28',0),(215,'system','Akeneo\\Channel\\Component\\Model\\Locale','188','a:3:{s:4:\"code\";s:5:\"te_IN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"te_IN\";}}',NULL,1,'2019-02-19 21:01:28',0),(216,'system','Akeneo\\Channel\\Component\\Model\\Locale','189','a:3:{s:4:\"code\";s:10:\"tg_Cyrl_TJ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"tg_Cyrl_TJ\";}}',NULL,1,'2019-02-19 21:01:28',0),(217,'system','Akeneo\\Channel\\Component\\Model\\Locale','190','a:3:{s:4:\"code\";s:5:\"th_TH\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"th_TH\";}}',NULL,1,'2019-02-19 21:01:28',0),(218,'system','Akeneo\\Channel\\Component\\Model\\Locale','191','a:3:{s:4:\"code\";s:5:\"tk_TM\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tk_TM\";}}',NULL,1,'2019-02-19 21:01:28',0),(219,'system','Akeneo\\Channel\\Component\\Model\\Locale','192','a:3:{s:4:\"code\";s:5:\"tn_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tn_ZA\";}}',NULL,1,'2019-02-19 21:01:28',0),(220,'system','Akeneo\\Channel\\Component\\Model\\Locale','193','a:3:{s:4:\"code\";s:5:\"tr_TR\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tr_TR\";}}',NULL,1,'2019-02-19 21:01:28',0),(221,'system','Akeneo\\Channel\\Component\\Model\\Locale','194','a:3:{s:4:\"code\";s:5:\"tt_RU\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"tt_RU\";}}',NULL,1,'2019-02-19 21:01:28',0),(222,'system','Akeneo\\Channel\\Component\\Model\\Locale','195','a:3:{s:4:\"code\";s:11:\"tzm_Latn_DZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:11:\"tzm_Latn_DZ\";}}',NULL,1,'2019-02-19 21:01:28',0),(223,'system','Akeneo\\Channel\\Component\\Model\\Locale','196','a:3:{s:4:\"code\";s:5:\"ug_CN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ug_CN\";}}',NULL,1,'2019-02-19 21:01:28',0),(224,'system','Akeneo\\Channel\\Component\\Model\\Locale','197','a:3:{s:4:\"code\";s:5:\"uk_UA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"uk_UA\";}}',NULL,1,'2019-02-19 21:01:28',0),(225,'system','Akeneo\\Channel\\Component\\Model\\Locale','198','a:3:{s:4:\"code\";s:5:\"ur_PK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"ur_PK\";}}',NULL,1,'2019-02-19 21:01:28',0),(226,'system','Akeneo\\Channel\\Component\\Model\\Locale','199','a:3:{s:4:\"code\";s:10:\"uz_Cyrl_UZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"uz_Cyrl_UZ\";}}',NULL,1,'2019-02-19 21:01:28',0),(227,'system','Akeneo\\Channel\\Component\\Model\\Locale','200','a:3:{s:4:\"code\";s:10:\"uz_Latn_UZ\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"uz_Latn_UZ\";}}',NULL,1,'2019-02-19 21:01:28',0),(228,'system','Akeneo\\Channel\\Component\\Model\\Locale','201','a:3:{s:4:\"code\";s:5:\"vi_VN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"vi_VN\";}}',NULL,1,'2019-02-19 21:01:28',0),(229,'system','Akeneo\\Channel\\Component\\Model\\Locale','202','a:3:{s:4:\"code\";s:5:\"wo_SN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"wo_SN\";}}',NULL,1,'2019-02-19 21:01:28',0),(230,'system','Akeneo\\Channel\\Component\\Model\\Locale','203','a:3:{s:4:\"code\";s:5:\"xh_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"xh_ZA\";}}',NULL,1,'2019-02-19 21:01:28',0),(231,'system','Akeneo\\Channel\\Component\\Model\\Locale','204','a:3:{s:4:\"code\";s:5:\"yo_NG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"yo_NG\";}}',NULL,1,'2019-02-19 21:01:28',0),(232,'system','Akeneo\\Channel\\Component\\Model\\Locale','205','a:3:{s:4:\"code\";s:5:\"zh_CN\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_CN\";}}',NULL,1,'2019-02-19 21:01:28',0),(233,'system','Akeneo\\Channel\\Component\\Model\\Locale','206','a:3:{s:4:\"code\";s:5:\"zh_HK\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_HK\";}}',NULL,1,'2019-02-19 21:01:28',0),(234,'system','Akeneo\\Channel\\Component\\Model\\Locale','207','a:3:{s:4:\"code\";s:5:\"zh_MO\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_MO\";}}',NULL,1,'2019-02-19 21:01:28',0),(235,'system','Akeneo\\Channel\\Component\\Model\\Locale','208','a:3:{s:4:\"code\";s:5:\"zh_SG\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_SG\";}}',NULL,1,'2019-02-19 21:01:28',0),(236,'system','Akeneo\\Channel\\Component\\Model\\Locale','209','a:3:{s:4:\"code\";s:5:\"zh_TW\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zh_TW\";}}',NULL,1,'2019-02-19 21:01:28',0),(237,'system','Akeneo\\Channel\\Component\\Model\\Locale','210','a:3:{s:4:\"code\";s:5:\"zu_ZA\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"zu_ZA\";}}',NULL,1,'2019-02-19 21:01:28',0),(238,'system','Akeneo\\Pim\\Enrichment\\Component\\Category\\Model\\Category','1','a:5:{s:4:\"code\";s:6:\"master\";s:6:\"parent\";N;s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";s:14:\"own_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"master\";}}',NULL,1,'2019-02-19 21:01:29',0),(239,'system','Akeneo\\Pim\\Enrichment\\Component\\Category\\Model\\Category','1','a:5:{s:4:\"code\";s:6:\"master\";s:6:\"parent\";N;s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";s:14:\"own_permission\";s:3:\"All\";}','a:3:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:14:\"own_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(240,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AttributeGroup','1','a:5:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:0:\"\";s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"other\";}s:10:\"sort_order\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";i:100;}}',NULL,1,'2019-02-19 21:01:29',0),(241,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AttributeGroup','1','a:5:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:0:\"\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(242,'system','Akeneo\\Channel\\Component\\Model\\Locale','1','a:3:{s:4:\"code\";s:5:\"af_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(243,'system','Akeneo\\Channel\\Component\\Model\\Locale','2','a:3:{s:4:\"code\";s:5:\"am_ET\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(244,'system','Akeneo\\Channel\\Component\\Model\\Locale','3','a:3:{s:4:\"code\";s:5:\"ar_AE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(245,'system','Akeneo\\Channel\\Component\\Model\\Locale','4','a:3:{s:4:\"code\";s:5:\"ar_BH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(246,'system','Akeneo\\Channel\\Component\\Model\\Locale','5','a:3:{s:4:\"code\";s:5:\"ar_DZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(247,'system','Akeneo\\Channel\\Component\\Model\\Locale','6','a:3:{s:4:\"code\";s:5:\"ar_EG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(248,'system','Akeneo\\Channel\\Component\\Model\\Locale','7','a:3:{s:4:\"code\";s:5:\"ar_IQ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(249,'system','Akeneo\\Channel\\Component\\Model\\Locale','8','a:3:{s:4:\"code\";s:5:\"ar_JO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(250,'system','Akeneo\\Channel\\Component\\Model\\Locale','9','a:3:{s:4:\"code\";s:5:\"ar_KW\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(251,'system','Akeneo\\Channel\\Component\\Model\\Locale','10','a:3:{s:4:\"code\";s:5:\"ar_LB\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(252,'system','Akeneo\\Channel\\Component\\Model\\Locale','11','a:3:{s:4:\"code\";s:5:\"ar_LY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(253,'system','Akeneo\\Channel\\Component\\Model\\Locale','12','a:3:{s:4:\"code\";s:5:\"ar_MA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(254,'system','Akeneo\\Channel\\Component\\Model\\Locale','13','a:3:{s:4:\"code\";s:6:\"arn_CL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(255,'system','Akeneo\\Channel\\Component\\Model\\Locale','14','a:3:{s:4:\"code\";s:5:\"ar_OM\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(256,'system','Akeneo\\Channel\\Component\\Model\\Locale','15','a:3:{s:4:\"code\";s:5:\"ar_QA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(257,'system','Akeneo\\Channel\\Component\\Model\\Locale','16','a:3:{s:4:\"code\";s:5:\"ar_SA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(258,'system','Akeneo\\Channel\\Component\\Model\\Locale','17','a:3:{s:4:\"code\";s:5:\"ar_SY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(259,'system','Akeneo\\Channel\\Component\\Model\\Locale','18','a:3:{s:4:\"code\";s:5:\"ar_TN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(260,'system','Akeneo\\Channel\\Component\\Model\\Locale','19','a:3:{s:4:\"code\";s:5:\"ar_YE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(261,'system','Akeneo\\Channel\\Component\\Model\\Locale','20','a:3:{s:4:\"code\";s:5:\"as_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(262,'system','Akeneo\\Channel\\Component\\Model\\Locale','21','a:3:{s:4:\"code\";s:10:\"az_Cyrl_AZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(263,'system','Akeneo\\Channel\\Component\\Model\\Locale','22','a:3:{s:4:\"code\";s:10:\"az_Latn_AZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(264,'system','Akeneo\\Channel\\Component\\Model\\Locale','23','a:3:{s:4:\"code\";s:5:\"ba_RU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(265,'system','Akeneo\\Channel\\Component\\Model\\Locale','24','a:3:{s:4:\"code\";s:5:\"be_BY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(266,'system','Akeneo\\Channel\\Component\\Model\\Locale','25','a:3:{s:4:\"code\";s:5:\"bg_BG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(267,'system','Akeneo\\Channel\\Component\\Model\\Locale','26','a:3:{s:4:\"code\";s:5:\"bn_BD\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(268,'system','Akeneo\\Channel\\Component\\Model\\Locale','27','a:3:{s:4:\"code\";s:5:\"bn_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(269,'system','Akeneo\\Channel\\Component\\Model\\Locale','28','a:3:{s:4:\"code\";s:5:\"bo_CN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(270,'system','Akeneo\\Channel\\Component\\Model\\Locale','29','a:3:{s:4:\"code\";s:5:\"br_FR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(271,'system','Akeneo\\Channel\\Component\\Model\\Locale','30','a:3:{s:4:\"code\";s:10:\"bs_Cyrl_BA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(272,'system','Akeneo\\Channel\\Component\\Model\\Locale','31','a:3:{s:4:\"code\";s:10:\"bs_Latn_BA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(273,'system','Akeneo\\Channel\\Component\\Model\\Locale','32','a:3:{s:4:\"code\";s:5:\"ca_ES\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(274,'system','Akeneo\\Channel\\Component\\Model\\Locale','33','a:3:{s:4:\"code\";s:5:\"co_FR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(275,'system','Akeneo\\Channel\\Component\\Model\\Locale','34','a:3:{s:4:\"code\";s:5:\"cs_CZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(276,'system','Akeneo\\Channel\\Component\\Model\\Locale','35','a:3:{s:4:\"code\";s:5:\"cy_GB\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(277,'system','Akeneo\\Channel\\Component\\Model\\Locale','36','a:3:{s:4:\"code\";s:5:\"da_DK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(278,'system','Akeneo\\Channel\\Component\\Model\\Locale','37','a:3:{s:4:\"code\";s:5:\"de_AT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(279,'system','Akeneo\\Channel\\Component\\Model\\Locale','38','a:3:{s:4:\"code\";s:5:\"de_CH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(280,'system','Akeneo\\Channel\\Component\\Model\\Locale','39','a:3:{s:4:\"code\";s:5:\"de_DE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(281,'system','Akeneo\\Channel\\Component\\Model\\Locale','40','a:3:{s:4:\"code\";s:5:\"de_LI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(282,'system','Akeneo\\Channel\\Component\\Model\\Locale','41','a:3:{s:4:\"code\";s:5:\"de_LU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(283,'system','Akeneo\\Channel\\Component\\Model\\Locale','42','a:3:{s:4:\"code\";s:6:\"dsb_DE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(284,'system','Akeneo\\Channel\\Component\\Model\\Locale','43','a:3:{s:4:\"code\";s:5:\"dv_MV\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(285,'system','Akeneo\\Channel\\Component\\Model\\Locale','44','a:3:{s:4:\"code\";s:5:\"el_GR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(286,'system','Akeneo\\Channel\\Component\\Model\\Locale','45','a:3:{s:4:\"code\";s:6:\"en_029\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(287,'system','Akeneo\\Channel\\Component\\Model\\Locale','46','a:3:{s:4:\"code\";s:5:\"en_AU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:29',0),(288,'system','Akeneo\\Channel\\Component\\Model\\Locale','47','a:3:{s:4:\"code\";s:5:\"en_BZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(289,'system','Akeneo\\Channel\\Component\\Model\\Locale','48','a:3:{s:4:\"code\";s:5:\"en_CA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(290,'system','Akeneo\\Channel\\Component\\Model\\Locale','49','a:3:{s:4:\"code\";s:5:\"en_GB\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(291,'system','Akeneo\\Channel\\Component\\Model\\Locale','50','a:3:{s:4:\"code\";s:5:\"en_IE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(292,'system','Akeneo\\Channel\\Component\\Model\\Locale','51','a:3:{s:4:\"code\";s:5:\"en_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(293,'system','Akeneo\\Channel\\Component\\Model\\Locale','52','a:3:{s:4:\"code\";s:5:\"en_JM\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(294,'system','Akeneo\\Channel\\Component\\Model\\Locale','53','a:3:{s:4:\"code\";s:5:\"en_MY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(295,'system','Akeneo\\Channel\\Component\\Model\\Locale','54','a:3:{s:4:\"code\";s:5:\"en_NZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(296,'system','Akeneo\\Channel\\Component\\Model\\Locale','55','a:3:{s:4:\"code\";s:5:\"en_PH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(297,'system','Akeneo\\Channel\\Component\\Model\\Locale','56','a:3:{s:4:\"code\";s:5:\"en_SG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(298,'system','Akeneo\\Channel\\Component\\Model\\Locale','57','a:3:{s:4:\"code\";s:5:\"en_TT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(299,'system','Akeneo\\Channel\\Component\\Model\\Locale','58','a:3:{s:4:\"code\";s:5:\"en_US\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(300,'system','Akeneo\\Channel\\Component\\Model\\Locale','59','a:3:{s:4:\"code\";s:5:\"en_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(301,'system','Akeneo\\Channel\\Component\\Model\\Locale','60','a:3:{s:4:\"code\";s:5:\"en_ZW\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(302,'system','Akeneo\\Channel\\Component\\Model\\Locale','61','a:3:{s:4:\"code\";s:5:\"es_AR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(303,'system','Akeneo\\Channel\\Component\\Model\\Locale','62','a:3:{s:4:\"code\";s:5:\"es_BO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(304,'system','Akeneo\\Channel\\Component\\Model\\Locale','63','a:3:{s:4:\"code\";s:5:\"es_CL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(305,'system','Akeneo\\Channel\\Component\\Model\\Locale','64','a:3:{s:4:\"code\";s:5:\"es_CO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(306,'system','Akeneo\\Channel\\Component\\Model\\Locale','65','a:3:{s:4:\"code\";s:5:\"es_CR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(307,'system','Akeneo\\Channel\\Component\\Model\\Locale','66','a:3:{s:4:\"code\";s:5:\"es_DO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(308,'system','Akeneo\\Channel\\Component\\Model\\Locale','67','a:3:{s:4:\"code\";s:5:\"es_EC\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(309,'system','Akeneo\\Channel\\Component\\Model\\Locale','68','a:3:{s:4:\"code\";s:5:\"es_ES\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(310,'system','Akeneo\\Channel\\Component\\Model\\Locale','69','a:3:{s:4:\"code\";s:5:\"es_GT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(311,'system','Akeneo\\Channel\\Component\\Model\\Locale','70','a:3:{s:4:\"code\";s:5:\"es_HN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(312,'system','Akeneo\\Channel\\Component\\Model\\Locale','71','a:3:{s:4:\"code\";s:5:\"es_MX\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(313,'system','Akeneo\\Channel\\Component\\Model\\Locale','72','a:3:{s:4:\"code\";s:5:\"es_NI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(314,'system','Akeneo\\Channel\\Component\\Model\\Locale','73','a:3:{s:4:\"code\";s:5:\"es_PA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(315,'system','Akeneo\\Channel\\Component\\Model\\Locale','74','a:3:{s:4:\"code\";s:5:\"es_PE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(316,'system','Akeneo\\Channel\\Component\\Model\\Locale','75','a:3:{s:4:\"code\";s:5:\"es_PR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(317,'system','Akeneo\\Channel\\Component\\Model\\Locale','76','a:3:{s:4:\"code\";s:5:\"es_PY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(318,'system','Akeneo\\Channel\\Component\\Model\\Locale','77','a:3:{s:4:\"code\";s:5:\"es_SV\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(319,'system','Akeneo\\Channel\\Component\\Model\\Locale','78','a:3:{s:4:\"code\";s:5:\"es_US\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(320,'system','Akeneo\\Channel\\Component\\Model\\Locale','79','a:3:{s:4:\"code\";s:5:\"es_UY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(321,'system','Akeneo\\Channel\\Component\\Model\\Locale','80','a:3:{s:4:\"code\";s:5:\"es_VE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(322,'system','Akeneo\\Channel\\Component\\Model\\Locale','81','a:3:{s:4:\"code\";s:5:\"et_EE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(323,'system','Akeneo\\Channel\\Component\\Model\\Locale','82','a:3:{s:4:\"code\";s:5:\"eu_ES\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(324,'system','Akeneo\\Channel\\Component\\Model\\Locale','83','a:3:{s:4:\"code\";s:5:\"fa_IR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(325,'system','Akeneo\\Channel\\Component\\Model\\Locale','84','a:3:{s:4:\"code\";s:5:\"fi_FI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(326,'system','Akeneo\\Channel\\Component\\Model\\Locale','85','a:3:{s:4:\"code\";s:6:\"fil_PH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(327,'system','Akeneo\\Channel\\Component\\Model\\Locale','86','a:3:{s:4:\"code\";s:5:\"fo_FO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(328,'system','Akeneo\\Channel\\Component\\Model\\Locale','87','a:3:{s:4:\"code\";s:5:\"fr_BE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(329,'system','Akeneo\\Channel\\Component\\Model\\Locale','88','a:3:{s:4:\"code\";s:5:\"fr_CA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(330,'system','Akeneo\\Channel\\Component\\Model\\Locale','89','a:3:{s:4:\"code\";s:5:\"fr_CH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(331,'system','Akeneo\\Channel\\Component\\Model\\Locale','90','a:3:{s:4:\"code\";s:5:\"fr_FR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(332,'system','Akeneo\\Channel\\Component\\Model\\Locale','91','a:3:{s:4:\"code\";s:5:\"fr_LU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(333,'system','Akeneo\\Channel\\Component\\Model\\Locale','92','a:3:{s:4:\"code\";s:5:\"fr_MC\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(334,'system','Akeneo\\Channel\\Component\\Model\\Locale','93','a:3:{s:4:\"code\";s:5:\"fy_NL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(335,'system','Akeneo\\Channel\\Component\\Model\\Locale','94','a:3:{s:4:\"code\";s:5:\"ga_IE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(336,'system','Akeneo\\Channel\\Component\\Model\\Locale','95','a:3:{s:4:\"code\";s:5:\"gd_GB\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(337,'system','Akeneo\\Channel\\Component\\Model\\Locale','96','a:3:{s:4:\"code\";s:5:\"gl_ES\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(338,'system','Akeneo\\Channel\\Component\\Model\\Locale','97','a:3:{s:4:\"code\";s:6:\"gsw_FR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(339,'system','Akeneo\\Channel\\Component\\Model\\Locale','98','a:3:{s:4:\"code\";s:5:\"gu_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(340,'system','Akeneo\\Channel\\Component\\Model\\Locale','99','a:3:{s:4:\"code\";s:10:\"ha_Latn_NG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(341,'system','Akeneo\\Channel\\Component\\Model\\Locale','100','a:3:{s:4:\"code\";s:5:\"he_IL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(342,'system','Akeneo\\Channel\\Component\\Model\\Locale','101','a:3:{s:4:\"code\";s:5:\"hi_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(343,'system','Akeneo\\Channel\\Component\\Model\\Locale','102','a:3:{s:4:\"code\";s:5:\"hr_BA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(344,'system','Akeneo\\Channel\\Component\\Model\\Locale','103','a:3:{s:4:\"code\";s:5:\"hr_HR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(345,'system','Akeneo\\Channel\\Component\\Model\\Locale','104','a:3:{s:4:\"code\";s:6:\"hsb_DE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(346,'system','Akeneo\\Channel\\Component\\Model\\Locale','105','a:3:{s:4:\"code\";s:5:\"hu_HU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(347,'system','Akeneo\\Channel\\Component\\Model\\Locale','106','a:3:{s:4:\"code\";s:5:\"hy_AM\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(348,'system','Akeneo\\Channel\\Component\\Model\\Locale','107','a:3:{s:4:\"code\";s:5:\"id_ID\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(349,'system','Akeneo\\Channel\\Component\\Model\\Locale','108','a:3:{s:4:\"code\";s:5:\"ig_NG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(350,'system','Akeneo\\Channel\\Component\\Model\\Locale','109','a:3:{s:4:\"code\";s:5:\"ii_CN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(351,'system','Akeneo\\Channel\\Component\\Model\\Locale','110','a:3:{s:4:\"code\";s:5:\"is_IS\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(352,'system','Akeneo\\Channel\\Component\\Model\\Locale','111','a:3:{s:4:\"code\";s:5:\"it_CH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(353,'system','Akeneo\\Channel\\Component\\Model\\Locale','112','a:3:{s:4:\"code\";s:5:\"it_IT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(354,'system','Akeneo\\Channel\\Component\\Model\\Locale','113','a:3:{s:4:\"code\";s:10:\"iu_Cans_CA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(355,'system','Akeneo\\Channel\\Component\\Model\\Locale','114','a:3:{s:4:\"code\";s:10:\"iu_Latn_CA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(356,'system','Akeneo\\Channel\\Component\\Model\\Locale','115','a:3:{s:4:\"code\";s:5:\"ja_JP\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(357,'system','Akeneo\\Channel\\Component\\Model\\Locale','116','a:3:{s:4:\"code\";s:5:\"ka_GE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(358,'system','Akeneo\\Channel\\Component\\Model\\Locale','117','a:3:{s:4:\"code\";s:5:\"kk_KZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(359,'system','Akeneo\\Channel\\Component\\Model\\Locale','118','a:3:{s:4:\"code\";s:5:\"kl_GL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(360,'system','Akeneo\\Channel\\Component\\Model\\Locale','119','a:3:{s:4:\"code\";s:5:\"km_KH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(361,'system','Akeneo\\Channel\\Component\\Model\\Locale','120','a:3:{s:4:\"code\";s:5:\"kn_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(362,'system','Akeneo\\Channel\\Component\\Model\\Locale','121','a:3:{s:4:\"code\";s:6:\"kok_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(363,'system','Akeneo\\Channel\\Component\\Model\\Locale','122','a:3:{s:4:\"code\";s:5:\"ko_KR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(364,'system','Akeneo\\Channel\\Component\\Model\\Locale','123','a:3:{s:4:\"code\";s:5:\"ky_KG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(365,'system','Akeneo\\Channel\\Component\\Model\\Locale','124','a:3:{s:4:\"code\";s:5:\"lb_LU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(366,'system','Akeneo\\Channel\\Component\\Model\\Locale','125','a:3:{s:4:\"code\";s:5:\"lo_LA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(367,'system','Akeneo\\Channel\\Component\\Model\\Locale','126','a:3:{s:4:\"code\";s:5:\"lt_LT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(368,'system','Akeneo\\Channel\\Component\\Model\\Locale','127','a:3:{s:4:\"code\";s:5:\"lv_LV\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(369,'system','Akeneo\\Channel\\Component\\Model\\Locale','128','a:3:{s:4:\"code\";s:5:\"mi_NZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(370,'system','Akeneo\\Channel\\Component\\Model\\Locale','129','a:3:{s:4:\"code\";s:5:\"mk_MK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(371,'system','Akeneo\\Channel\\Component\\Model\\Locale','130','a:3:{s:4:\"code\";s:5:\"ml_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(372,'system','Akeneo\\Channel\\Component\\Model\\Locale','131','a:3:{s:4:\"code\";s:5:\"mn_MN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(373,'system','Akeneo\\Channel\\Component\\Model\\Locale','132','a:3:{s:4:\"code\";s:10:\"mn_Mong_CN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(374,'system','Akeneo\\Channel\\Component\\Model\\Locale','133','a:3:{s:4:\"code\";s:6:\"moh_CA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(375,'system','Akeneo\\Channel\\Component\\Model\\Locale','134','a:3:{s:4:\"code\";s:5:\"mr_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(376,'system','Akeneo\\Channel\\Component\\Model\\Locale','135','a:3:{s:4:\"code\";s:5:\"ms_BN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(377,'system','Akeneo\\Channel\\Component\\Model\\Locale','136','a:3:{s:4:\"code\";s:5:\"ms_MY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(378,'system','Akeneo\\Channel\\Component\\Model\\Locale','137','a:3:{s:4:\"code\";s:5:\"mt_MT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(379,'system','Akeneo\\Channel\\Component\\Model\\Locale','138','a:3:{s:4:\"code\";s:5:\"nb_NO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(380,'system','Akeneo\\Channel\\Component\\Model\\Locale','139','a:3:{s:4:\"code\";s:5:\"ne_NP\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(381,'system','Akeneo\\Channel\\Component\\Model\\Locale','140','a:3:{s:4:\"code\";s:5:\"nl_BE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(382,'system','Akeneo\\Channel\\Component\\Model\\Locale','141','a:3:{s:4:\"code\";s:5:\"nl_NL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(383,'system','Akeneo\\Channel\\Component\\Model\\Locale','142','a:3:{s:4:\"code\";s:5:\"nn_NO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(384,'system','Akeneo\\Channel\\Component\\Model\\Locale','143','a:3:{s:4:\"code\";s:6:\"nso_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(385,'system','Akeneo\\Channel\\Component\\Model\\Locale','144','a:3:{s:4:\"code\";s:5:\"oc_FR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(386,'system','Akeneo\\Channel\\Component\\Model\\Locale','145','a:3:{s:4:\"code\";s:5:\"or_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(387,'system','Akeneo\\Channel\\Component\\Model\\Locale','146','a:3:{s:4:\"code\";s:5:\"pa_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(388,'system','Akeneo\\Channel\\Component\\Model\\Locale','147','a:3:{s:4:\"code\";s:5:\"pl_PL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(389,'system','Akeneo\\Channel\\Component\\Model\\Locale','148','a:3:{s:4:\"code\";s:6:\"prs_AF\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(390,'system','Akeneo\\Channel\\Component\\Model\\Locale','149','a:3:{s:4:\"code\";s:5:\"ps_AF\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(391,'system','Akeneo\\Channel\\Component\\Model\\Locale','150','a:3:{s:4:\"code\";s:5:\"pt_BR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(392,'system','Akeneo\\Channel\\Component\\Model\\Locale','151','a:3:{s:4:\"code\";s:5:\"pt_PT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(393,'system','Akeneo\\Channel\\Component\\Model\\Locale','152','a:3:{s:4:\"code\";s:6:\"qut_GT\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(394,'system','Akeneo\\Channel\\Component\\Model\\Locale','153','a:3:{s:4:\"code\";s:6:\"quz_BO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(395,'system','Akeneo\\Channel\\Component\\Model\\Locale','154','a:3:{s:4:\"code\";s:6:\"quz_EC\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(396,'system','Akeneo\\Channel\\Component\\Model\\Locale','155','a:3:{s:4:\"code\";s:6:\"quz_PE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(397,'system','Akeneo\\Channel\\Component\\Model\\Locale','156','a:3:{s:4:\"code\";s:5:\"rm_CH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(398,'system','Akeneo\\Channel\\Component\\Model\\Locale','157','a:3:{s:4:\"code\";s:5:\"ro_RO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(399,'system','Akeneo\\Channel\\Component\\Model\\Locale','158','a:3:{s:4:\"code\";s:5:\"ru_RU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(400,'system','Akeneo\\Channel\\Component\\Model\\Locale','159','a:3:{s:4:\"code\";s:5:\"rw_RW\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(401,'system','Akeneo\\Channel\\Component\\Model\\Locale','160','a:3:{s:4:\"code\";s:6:\"sah_RU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(402,'system','Akeneo\\Channel\\Component\\Model\\Locale','161','a:3:{s:4:\"code\";s:5:\"sa_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(403,'system','Akeneo\\Channel\\Component\\Model\\Locale','162','a:3:{s:4:\"code\";s:5:\"se_FI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(404,'system','Akeneo\\Channel\\Component\\Model\\Locale','163','a:3:{s:4:\"code\";s:5:\"se_NO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(405,'system','Akeneo\\Channel\\Component\\Model\\Locale','164','a:3:{s:4:\"code\";s:5:\"se_SE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(406,'system','Akeneo\\Channel\\Component\\Model\\Locale','165','a:3:{s:4:\"code\";s:5:\"si_LK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(407,'system','Akeneo\\Channel\\Component\\Model\\Locale','166','a:3:{s:4:\"code\";s:5:\"sk_SK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(408,'system','Akeneo\\Channel\\Component\\Model\\Locale','167','a:3:{s:4:\"code\";s:5:\"sl_SI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(409,'system','Akeneo\\Channel\\Component\\Model\\Locale','168','a:3:{s:4:\"code\";s:6:\"sma_NO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(410,'system','Akeneo\\Channel\\Component\\Model\\Locale','169','a:3:{s:4:\"code\";s:6:\"sma_SE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(411,'system','Akeneo\\Channel\\Component\\Model\\Locale','170','a:3:{s:4:\"code\";s:6:\"smj_NO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(412,'system','Akeneo\\Channel\\Component\\Model\\Locale','171','a:3:{s:4:\"code\";s:6:\"smj_SE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(413,'system','Akeneo\\Channel\\Component\\Model\\Locale','172','a:3:{s:4:\"code\";s:6:\"smn_FI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(414,'system','Akeneo\\Channel\\Component\\Model\\Locale','173','a:3:{s:4:\"code\";s:6:\"sms_FI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(415,'system','Akeneo\\Channel\\Component\\Model\\Locale','174','a:3:{s:4:\"code\";s:5:\"sq_AL\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(416,'system','Akeneo\\Channel\\Component\\Model\\Locale','175','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_BA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(417,'system','Akeneo\\Channel\\Component\\Model\\Locale','176','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_CS\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(418,'system','Akeneo\\Channel\\Component\\Model\\Locale','177','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_ME\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(419,'system','Akeneo\\Channel\\Component\\Model\\Locale','178','a:3:{s:4:\"code\";s:10:\"sr_Cyrl_RS\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(420,'system','Akeneo\\Channel\\Component\\Model\\Locale','179','a:3:{s:4:\"code\";s:10:\"sr_Latn_BA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(421,'system','Akeneo\\Channel\\Component\\Model\\Locale','180','a:3:{s:4:\"code\";s:10:\"sr_Latn_CS\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(422,'system','Akeneo\\Channel\\Component\\Model\\Locale','181','a:3:{s:4:\"code\";s:10:\"sr_Latn_ME\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(423,'system','Akeneo\\Channel\\Component\\Model\\Locale','182','a:3:{s:4:\"code\";s:10:\"sr_Latn_RS\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(424,'system','Akeneo\\Channel\\Component\\Model\\Locale','183','a:3:{s:4:\"code\";s:5:\"sv_FI\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(425,'system','Akeneo\\Channel\\Component\\Model\\Locale','184','a:3:{s:4:\"code\";s:5:\"sv_SE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(426,'system','Akeneo\\Channel\\Component\\Model\\Locale','185','a:3:{s:4:\"code\";s:5:\"sw_KE\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(427,'system','Akeneo\\Channel\\Component\\Model\\Locale','186','a:3:{s:4:\"code\";s:6:\"syr_SY\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(428,'system','Akeneo\\Channel\\Component\\Model\\Locale','187','a:3:{s:4:\"code\";s:5:\"ta_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(429,'system','Akeneo\\Channel\\Component\\Model\\Locale','188','a:3:{s:4:\"code\";s:5:\"te_IN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(430,'system','Akeneo\\Channel\\Component\\Model\\Locale','189','a:3:{s:4:\"code\";s:10:\"tg_Cyrl_TJ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(431,'system','Akeneo\\Channel\\Component\\Model\\Locale','190','a:3:{s:4:\"code\";s:5:\"th_TH\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(432,'system','Akeneo\\Channel\\Component\\Model\\Locale','191','a:3:{s:4:\"code\";s:5:\"tk_TM\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(433,'system','Akeneo\\Channel\\Component\\Model\\Locale','192','a:3:{s:4:\"code\";s:5:\"tn_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(434,'system','Akeneo\\Channel\\Component\\Model\\Locale','193','a:3:{s:4:\"code\";s:5:\"tr_TR\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(435,'system','Akeneo\\Channel\\Component\\Model\\Locale','194','a:3:{s:4:\"code\";s:5:\"tt_RU\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(436,'system','Akeneo\\Channel\\Component\\Model\\Locale','195','a:3:{s:4:\"code\";s:11:\"tzm_Latn_DZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(437,'system','Akeneo\\Channel\\Component\\Model\\Locale','196','a:3:{s:4:\"code\";s:5:\"ug_CN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:30',0),(438,'system','Akeneo\\Channel\\Component\\Model\\Locale','197','a:3:{s:4:\"code\";s:5:\"uk_UA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(439,'system','Akeneo\\Channel\\Component\\Model\\Locale','198','a:3:{s:4:\"code\";s:5:\"ur_PK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(440,'system','Akeneo\\Channel\\Component\\Model\\Locale','199','a:3:{s:4:\"code\";s:10:\"uz_Cyrl_UZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(441,'system','Akeneo\\Channel\\Component\\Model\\Locale','200','a:3:{s:4:\"code\";s:10:\"uz_Latn_UZ\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(442,'system','Akeneo\\Channel\\Component\\Model\\Locale','201','a:3:{s:4:\"code\";s:5:\"vi_VN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(443,'system','Akeneo\\Channel\\Component\\Model\\Locale','202','a:3:{s:4:\"code\";s:5:\"wo_SN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(444,'system','Akeneo\\Channel\\Component\\Model\\Locale','203','a:3:{s:4:\"code\";s:5:\"xh_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(445,'system','Akeneo\\Channel\\Component\\Model\\Locale','204','a:3:{s:4:\"code\";s:5:\"yo_NG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(446,'system','Akeneo\\Channel\\Component\\Model\\Locale','205','a:3:{s:4:\"code\";s:5:\"zh_CN\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(447,'system','Akeneo\\Channel\\Component\\Model\\Locale','206','a:3:{s:4:\"code\";s:5:\"zh_HK\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(448,'system','Akeneo\\Channel\\Component\\Model\\Locale','207','a:3:{s:4:\"code\";s:5:\"zh_MO\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(449,'system','Akeneo\\Channel\\Component\\Model\\Locale','208','a:3:{s:4:\"code\";s:5:\"zh_SG\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(450,'system','Akeneo\\Channel\\Component\\Model\\Locale','209','a:3:{s:4:\"code\";s:5:\"zh_TW\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(451,'system','Akeneo\\Channel\\Component\\Model\\Locale','210','a:3:{s:4:\"code\";s:5:\"zu_ZA\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(452,'system','Akeneo\\Asset\\Component\\Model\\Category','1','a:4:{s:4:\"code\";s:18:\"asset_main_catalog\";s:6:\"parent\";N;s:15:\"view_permission\";s:0:\"\";s:15:\"edit_permission\";s:0:\"\";}','a:1:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"asset_main_catalog\";}}',NULL,1,'2019-02-19 21:01:31',0),(453,'system','Akeneo\\Asset\\Component\\Model\\Category','1','a:4:{s:4:\"code\";s:18:\"asset_main_catalog\";s:6:\"parent\";N;s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"All\";}}',NULL,2,'2019-02-19 21:01:31',0),(454,'system','Akeneo\\Pim\\Structure\\Component\\Model\\Attribute','1','a:30:{s:4:\"code\";s:3:\"sku\";s:4:\"type\";s:22:\"pim_catalog_identifier\";s:5:\"group\";s:5:\"other\";s:6:\"unique\";b:1;s:22:\"useable_as_grid_filter\";b:1;s:18:\"allowed_extensions\";s:0:\"\";s:13:\"metric_family\";N;s:19:\"default_metric_unit\";N;s:19:\"reference_data_name\";N;s:17:\"available_locales\";s:0:\"\";s:14:\"max_characters\";N;s:15:\"validation_rule\";N;s:17:\"validation_regexp\";N;s:15:\"wysiwyg_enabled\";N;s:10:\"number_min\";N;s:10:\"number_max\";N;s:16:\"decimals_allowed\";N;s:16:\"negative_allowed\";N;s:8:\"date_min\";N;s:8:\"date_max\";N;s:13:\"max_file_size\";N;s:20:\"minimum_input_length\";N;s:10:\"sort_order\";i:0;s:11:\"localizable\";b:0;s:19:\"auto_option_sorting\";N;s:12:\"is_read_only\";N;s:15:\"locale_specific\";b:0;s:7:\"options\";N;s:5:\"scope\";s:6:\"Global\";s:8:\"required\";b:1;}','a:7:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"sku\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"pim_catalog_identifier\";}s:5:\"group\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"other\";}s:6:\"unique\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}s:22:\"useable_as_grid_filter\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}s:5:\"scope\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"Global\";}s:8:\"required\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";b:1;}}',NULL,1,'2019-02-19 21:01:31',0),(455,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AttributeGroup','1','a:5:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:3:\"sku\";s:15:\"view_permission\";s:3:\"All\";s:15:\"edit_permission\";s:3:\"All\";}','a:1:{s:10:\"attributes\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"sku\";}}',NULL,3,'2019-02-19 21:01:31',0),(456,'system','Akeneo\\Channel\\Component\\Model\\Channel','1','a:5:{s:4:\"code\";s:9:\"ecommerce\";s:10:\"currencies\";s:3:\"USD\";s:7:\"locales\";s:5:\"en_US\";s:11:\"label-en_US\";s:7:\"Default\";s:8:\"category\";s:6:\"master\";}','a:5:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"ecommerce\";}s:10:\"currencies\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:3:\"USD\";}s:7:\"locales\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"en_US\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:7:\"Default\";}s:8:\"category\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"master\";}}',NULL,1,'2019-02-19 21:01:31',0),(457,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AssociationType','1','a:2:{s:4:\"code\";s:6:\"X_SELL\";s:11:\"label-en_US\";s:10:\"Cross sell\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"X_SELL\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:10:\"Cross sell\";}}',NULL,1,'2019-02-19 21:01:31',0),(458,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AssociationType','2','a:2:{s:4:\"code\";s:6:\"UPSELL\";s:11:\"label-en_US\";s:6:\"Upsell\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"UPSELL\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:6:\"Upsell\";}}',NULL,1,'2019-02-19 21:01:31',0),(459,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AssociationType','3','a:2:{s:4:\"code\";s:12:\"SUBSTITUTION\";s:11:\"label-en_US\";s:12:\"Substitution\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"SUBSTITUTION\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"Substitution\";}}',NULL,1,'2019-02-19 21:01:31',0),(460,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AssociationType','4','a:2:{s:4:\"code\";s:4:\"PACK\";s:11:\"label-en_US\";s:4:\"Pack\";}','a:2:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:4:\"PACK\";}s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:4:\"Pack\";}}',NULL,1,'2019-02-19 21:01:31',0),(461,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','28','a:6:{s:4:\"code\";s:17:\"add_product_value\";s:8:\"job_name\";s:17:\"add_product_value\";s:5:\"label\";s:24:\"Mass add products values\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"add_product_value\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"add_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Mass add products values\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(462,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','29','a:6:{s:4:\"code\";s:20:\"update_product_value\";s:8:\"job_name\";s:20:\"update_product_value\";s:5:\"label\";s:20:\"Mass update products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"update_product_value\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"update_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Mass update products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(463,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','30','a:6:{s:4:\"code\";s:20:\"remove_product_value\";s:8:\"job_name\";s:20:\"remove_product_value\";s:5:\"label\";s:27:\"Mass remove products values\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"remove_product_value\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"remove_product_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Mass remove products values\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(464,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','31','a:6:{s:4:\"code\";s:16:\"move_to_category\";s:8:\"job_name\";s:16:\"move_to_category\";s:5:\"label\";s:23:\"Mass move to categories\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"move_to_category\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:16:\"move_to_category\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"Mass move to categories\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(465,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','32','a:6:{s:4:\"code\";s:12:\"add_to_group\";s:8:\"job_name\";s:12:\"add_to_group\";s:5:\"label\";s:25:\"Mass add product to group\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"add_to_group\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"add_to_group\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"Mass add product to group\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(466,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','33','a:6:{s:4:\"code\";s:15:\"add_association\";s:8:\"job_name\";s:15:\"add_association\";s:5:\"label\";s:23:\"Mass associate products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"add_association\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"add_association\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"Mass associate products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(467,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','34','a:6:{s:4:\"code\";s:15:\"add_to_category\";s:8:\"job_name\";s:15:\"add_to_category\";s:5:\"label\";s:22:\"Mass add to categories\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"add_to_category\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"add_to_category\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"Mass add to categories\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(468,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','35','a:6:{s:4:\"code\";s:20:\"remove_from_category\";s:8:\"job_name\";s:20:\"remove_from_category\";s:5:\"label\";s:27:\"Mass remove from categories\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"remove_from_category\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"remove_from_category\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Mass remove from categories\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(469,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','36','a:6:{s:4:\"code\";s:34:\"delete_products_and_product_models\";s:8:\"job_name\";s:34:\"delete_products_and_product_models\";s:5:\"label\";s:20:\"Mass delete products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:11:\"mass_delete\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"delete_products_and_product_models\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"delete_products_and_product_models\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Mass delete products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:11:\"mass_delete\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(470,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','37','a:6:{s:4:\"code\";s:15:\"publish_product\";s:8:\"job_name\";s:15:\"publish_product\";s:5:\"label\";s:21:\"Mass publish products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"publish_product\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"publish_product\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Mass publish products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(471,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','38','a:6:{s:4:\"code\";s:17:\"unpublish_product\";s:8:\"job_name\";s:17:\"unpublish_product\";s:5:\"label\";s:23:\"Mass unpublish products\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"unpublish_product\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"unpublish_product\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:23:\"Mass unpublish products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(472,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','39','a:6:{s:4:\"code\";s:22:\"edit_common_attributes\";s:8:\"job_name\";s:22:\"edit_common_attributes\";s:5:\"label\";s:28:\"Mass edit product attributes\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"edit_common_attributes\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"edit_common_attributes\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Mass edit product attributes\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(473,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','40','a:6:{s:4:\"code\";s:19:\"add_attribute_value\";s:8:\"job_name\";s:19:\"add_attribute_value\";s:5:\"label\";s:24:\"Mass add attribute value\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"add_attribute_value\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"add_attribute_value\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"Mass add attribute value\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(474,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','41','a:6:{s:4:\"code\";s:29:\"add_to_existing_product_model\";s:8:\"job_name\";s:29:\"add_to_existing_product_model\";s:5:\"label\";s:29:\"Add to existing product model\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"add_to_existing_product_model\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"add_to_existing_product_model\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"Add to existing product model\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(475,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','42','a:6:{s:4:\"code\";s:26:\"set_attribute_requirements\";s:8:\"job_name\";s:26:\"set_attribute_requirements\";s:5:\"label\";s:33:\"Set family attribute requirements\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"set_attribute_requirements\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"set_attribute_requirements\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:33:\"Set family attribute requirements\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(476,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','43','a:6:{s:4:\"code\";s:21:\"change_parent_product\";s:8:\"job_name\";s:21:\"change_parent_product\";s:5:\"label\";s:27:\"Change parent product model\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"change_parent_product\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"change_parent_product\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Change parent product model\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(477,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','44','a:6:{s:4:\"code\";s:24:\"csv_product_quick_export\";s:8:\"job_name\";s:24:\"csv_product_quick_export\";s:5:\"label\";s:24:\"CSV product quick export\";s:9:\"connector\";s:20:\"Akeneo CSV Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:427:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_%locale%_%scope%_%datetime%.csv\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_%locale%_%scope%_%datetime%.csv\"}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"csv_product_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"csv_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"CSV product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Akeneo CSV Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:427:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_%locale%_%scope%_%datetime%.csv\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_%locale%_%scope%_%datetime%.csv\"}\";}}',NULL,1,'2019-02-19 21:01:32',0),(478,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','45','a:6:{s:4:\"code\";s:37:\"csv_product_grid_context_quick_export\";s:8:\"job_name\";s:37:\"csv_product_grid_context_quick_export\";s:5:\"label\";s:37:\"CSV product quick export grid context\";s:9:\"connector\";s:20:\"Akeneo CSV Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:453:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.csv\"}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"csv_product_grid_context_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"csv_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:37:\"CSV product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Akeneo CSV Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:453:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.csv\"}\";}}',NULL,1,'2019-02-19 21:01:32',0),(479,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','46','a:6:{s:4:\"code\";s:34:\"csv_published_product_quick_export\";s:8:\"job_name\";s:34:\"csv_published_product_quick_export\";s:5:\"label\";s:34:\"CSV published product quick export\";s:9:\"connector\";s:20:\"Akeneo CSV Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:286:\"{\"filePath\":\"\\/tmp\\/published_products_export_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"csv_published_product_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"csv_published_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"CSV published product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"Akeneo CSV Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:286:\"{\"filePath\":\"\\/tmp\\/published_products_export_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2019-02-19 21:01:32',0),(480,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','47','a:6:{s:4:\"code\";s:47:\"csv_published_product_grid_context_quick_export\";s:8:\"job_name\";s:47:\"csv_published_product_grid_context_quick_export\";s:5:\"label\";s:47:\"CSV published product quick export grid context\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:299:\"{\"filePath\":\"\\/tmp\\/published_products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"csv_published_product_grid_context_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"csv_published_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"CSV published product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:299:\"{\"filePath\":\"\\/tmp\\/published_products_export_grid_context_%locale%_%scope%_%datetime%.csv\",\"delimiter\":\";\",\"enclosure\":\"\\\"\",\"withHeader\":true,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2019-02-19 21:01:32',0),(481,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','48','a:6:{s:4:\"code\";s:21:\"approve_product_draft\";s:8:\"job_name\";s:21:\"approve_product_draft\";s:5:\"label\";s:27:\"Mass approve product drafts\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"approve_product_draft\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"approve_product_draft\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Mass approve product drafts\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(482,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','49','a:6:{s:4:\"code\";s:20:\"refuse_product_draft\";s:8:\"job_name\";s:20:\"refuse_product_draft\";s:5:\"label\";s:26:\"Mass reject product drafts\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"refuse_product_draft\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:20:\"refuse_product_draft\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Mass reject product drafts\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(483,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','50','a:6:{s:4:\"code\";s:24:\"apply_assets_mass_upload\";s:8:\"job_name\";s:24:\"apply_assets_mass_upload\";s:5:\"label\";s:28:\"Process mass uploaded assets\";s:9:\"connector\";s:30:\"Akeneo Product Asset Connector\";s:4:\"type\";s:11:\"mass_upload\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"apply_assets_mass_upload\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:24:\"apply_assets_mass_upload\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Process mass uploaded assets\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Akeneo Product Asset Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:11:\"mass_upload\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(484,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','51','a:6:{s:4:\"code\";s:46:\"apply_assets_mass_upload_into_asset_collection\";s:8:\"job_name\";s:46:\"apply_assets_mass_upload_into_asset_collection\";s:5:\"label\";s:47:\"Process mass uploaded assets and add to product\";s:9:\"connector\";s:30:\"Akeneo Product Asset Connector\";s:4:\"type\";s:11:\"mass_upload\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:46:\"apply_assets_mass_upload_into_asset_collection\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:46:\"apply_assets_mass_upload_into_asset_collection\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"Process mass uploaded assets and add to product\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Akeneo Product Asset Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:11:\"mass_upload\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(485,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','52','a:6:{s:4:\"code\";s:25:\"xlsx_product_quick_export\";s:8:\"job_name\";s:25:\"xlsx_product_quick_export\";s:5:\"label\";s:25:\"XLSX product quick export\";s:9:\"connector\";s:21:\"Akeneo XLSX Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:418:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_%locale%_%scope%_%datetime%.xlsx\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_%locale%_%scope%_%datetime%.xlsx\"}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"xlsx_product_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"xlsx_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:25:\"XLSX product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Akeneo XLSX Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:418:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_%locale%_%scope%_%datetime%.xlsx\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_%locale%_%scope%_%datetime%.xlsx\"}\";}}',NULL,1,'2019-02-19 21:01:32',0),(486,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','53','a:6:{s:4:\"code\";s:38:\"xlsx_product_grid_context_quick_export\";s:8:\"job_name\";s:38:\"xlsx_product_grid_context_quick_export\";s:5:\"label\";s:38:\"XLSX product quick export grid context\";s:9:\"connector\";s:21:\"Akeneo XLSX Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:444:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.xlsx\"}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"xlsx_product_grid_context_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"xlsx_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"XLSX product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Akeneo XLSX Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:444:\"{\"filePath\":\"\\/tmp\\/export_%job_label%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null,\"filePathProduct\":\"\\/tmp\\/1_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"filePathProductModel\":\"\\/tmp\\/2_product_models_export_grid_context_%locale%_%scope%_%datetime%.xlsx\"}\";}}',NULL,1,'2019-02-19 21:01:32',0),(487,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','54','a:6:{s:4:\"code\";s:48:\"xlsx_published_product_grid_context_quick_export\";s:8:\"job_name\";s:48:\"xlsx_published_product_grid_context_quick_export\";s:5:\"label\";s:48:\"XLSX published product quick export grid context\";s:9:\"connector\";s:26:\"Akeneo Mass Edit Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:288:\"{\"filePath\":\"\\/tmp\\/published_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:48:\"xlsx_published_product_grid_context_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:48:\"xlsx_published_product_grid_context_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:48:\"XLSX published product quick export grid context\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"Akeneo Mass Edit Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:288:\"{\"filePath\":\"\\/tmp\\/published_products_export_grid_context_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2019-02-19 21:01:32',0),(488,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','55','a:6:{s:4:\"code\";s:35:\"xlsx_published_product_quick_export\";s:8:\"job_name\";s:35:\"xlsx_published_product_quick_export\";s:5:\"label\";s:35:\"XLSX published product quick export\";s:9:\"connector\";s:21:\"Akeneo XLSX Connector\";s:4:\"type\";s:12:\"quick_export\";s:13:\"configuration\";s:275:\"{\"filePath\":\"\\/tmp\\/published_products_export_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"xlsx_published_product_quick_export\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"xlsx_published_product_quick_export\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:35:\"XLSX published product quick export\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:21:\"Akeneo XLSX Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:12:\"quick_export\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:275:\"{\"filePath\":\"\\/tmp\\/published_products_export_%locale%_%scope%_%datetime%.xlsx\",\"withHeader\":true,\"linesPerFile\":10000,\"user_to_notify\":null,\"is_user_authenticated\":false,\"filters\":null,\"selected_properties\":null,\"with_media\":true,\"locale\":null,\"scope\":null,\"ui_locale\":null}\";}}',NULL,1,'2019-02-19 21:01:32',0),(489,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','56','a:6:{s:4:\"code\";s:27:\"rule_impacted_product_count\";s:8:\"job_name\";s:27:\"rule_impacted_product_count\";s:5:\"label\";s:47:\"Calculation the affected products for the rules\";s:9:\"connector\";s:28:\"Akeneo Rule Engine Connector\";s:4:\"type\";s:14:\"mass_edit_rule\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"rule_impacted_product_count\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"rule_impacted_product_count\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"Calculation the affected products for the rules\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Akeneo Rule Engine Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:14:\"mass_edit_rule\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(490,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','57','a:6:{s:4:\"code\";s:15:\"classify_assets\";s:8:\"job_name\";s:15:\"classify_assets\";s:5:\"label\";s:28:\"Mass classify product assets\";s:9:\"connector\";s:30:\"Akeneo Product Asset Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"classify_assets\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:15:\"classify_assets\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Mass classify product assets\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Akeneo Product Asset Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(491,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','58','a:6:{s:4:\"code\";s:18:\"add_tags_to_assets\";s:8:\"job_name\";s:18:\"add_tags_to_assets\";s:5:\"label\";s:18:\"Add tags to assets\";s:9:\"connector\";s:30:\"Akeneo Product Asset Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"add_tags_to_assets\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"add_tags_to_assets\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"Add tags to assets\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:30:\"Akeneo Product Asset Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(492,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','59','a:6:{s:4:\"code\";s:19:\"project_calculation\";s:8:\"job_name\";s:19:\"project_calculation\";s:5:\"label\";s:19:\"Project calculation\";s:9:\"connector\";s:18:\"teamwork assistant\";s:4:\"type\";s:19:\"project_calculation\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"project_calculation\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"project_calculation\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"Project calculation\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"teamwork assistant\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:19:\"project_calculation\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(493,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','60','a:6:{s:4:\"code\";s:40:\"refresh_project_completeness_calculation\";s:8:\"job_name\";s:40:\"refresh_project_completeness_calculation\";s:5:\"label\";s:28:\"Refresh project completeness\";s:9:\"connector\";s:18:\"teamwork assistant\";s:4:\"type\";s:40:\"refresh_project_completeness_calculation\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"refresh_project_completeness_calculation\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"refresh_project_completeness_calculation\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:28:\"Refresh project completeness\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"teamwork assistant\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"refresh_project_completeness_calculation\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(494,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','61','a:6:{s:4:\"code\";s:34:\"compute_product_models_descendants\";s:8:\"job_name\";s:34:\"compute_product_models_descendants\";s:5:\"label\";s:34:\"Compute product models descendants\";s:9:\"connector\";s:8:\"internal\";s:4:\"type\";s:34:\"compute_product_models_descendants\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"compute_product_models_descendants\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"compute_product_models_descendants\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"Compute product models descendants\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"internal\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:34:\"compute_product_models_descendants\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(495,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','62','a:6:{s:4:\"code\";s:39:\"compute_completeness_of_products_family\";s:8:\"job_name\";s:39:\"compute_completeness_of_products_family\";s:5:\"label\";s:39:\"compute completeness of products family\";s:9:\"connector\";s:8:\"internal\";s:4:\"type\";s:39:\"compute_completeness_of_products_family\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:39:\"compute_completeness_of_products_family\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:39:\"compute_completeness_of_products_family\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:39:\"compute completeness of products family\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"internal\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:39:\"compute_completeness_of_products_family\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(496,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','63','a:6:{s:4:\"code\";s:40:\"compute_family_variant_structure_changes\";s:8:\"job_name\";s:40:\"compute_family_variant_structure_changes\";s:5:\"label\";s:40:\"Compute family variant structure changes\";s:9:\"connector\";s:8:\"internal\";s:4:\"type\";s:40:\"compute_family_variant_structure_changes\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"compute_family_variant_structure_changes\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"compute_family_variant_structure_changes\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"Compute family variant structure changes\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"internal\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:40:\"compute_family_variant_structure_changes\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(497,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','64','a:6:{s:4:\"code\";s:49:\"compute_completeness_of_products_linked_to_assets\";s:8:\"job_name\";s:49:\"compute_completeness_of_products_linked_to_assets\";s:5:\"label\";s:49:\"compute completeness of products linked to assets\";s:9:\"connector\";s:8:\"internal\";s:4:\"type\";s:49:\"compute_completeness_of_products_linked_to_assets\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:49:\"compute_completeness_of_products_linked_to_assets\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:49:\"compute_completeness_of_products_linked_to_assets\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:49:\"compute completeness of products linked to assets\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:8:\"internal\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:49:\"compute_completeness_of_products_linked_to_assets\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:32',0),(498,'system','Akeneo\\Pim\\Structure\\Component\\Model\\AttributeGroup','1','a:6:{s:4:\"code\";s:5:\"other\";s:10:\"sort_order\";i:100;s:10:\"attributes\";s:3:\"sku\";s:11:\"label-en_US\";s:5:\"Other\";s:15:\"view_permission\";s:31:\"All,IT support,Manager,Redactor\";s:15:\"edit_permission\";s:31:\"All,IT support,Manager,Redactor\";}','a:3:{s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:5:\"Other\";}s:15:\"view_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}}',NULL,4,'2019-02-19 21:01:33',0),(499,'system','Akeneo\\Pim\\Enrichment\\Component\\Category\\Model\\Category','1','a:6:{s:4:\"code\";s:6:\"master\";s:6:\"parent\";N;s:11:\"label-en_US\";s:14:\"Master catalog\";s:15:\"view_permission\";s:31:\"All,IT support,Manager,Redactor\";s:15:\"edit_permission\";s:31:\"All,IT support,Manager,Redactor\";s:14:\"own_permission\";s:31:\"All,IT support,Manager,Redactor\";}','a:4:{s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:14:\"Master catalog\";}s:15:\"view_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}s:14:\"own_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}}',NULL,3,'2019-02-19 21:01:33',0),(500,'system','Akeneo\\Asset\\Component\\Model\\Category','1','a:5:{s:4:\"code\";s:18:\"asset_main_catalog\";s:6:\"parent\";N;s:11:\"label-en_US\";s:18:\"Asset main catalog\";s:15:\"view_permission\";s:31:\"All,IT support,Manager,Redactor\";s:15:\"edit_permission\";s:31:\"All,IT support,Manager,Redactor\";}','a:3:{s:11:\"label-en_US\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:18:\"Asset main catalog\";}s:15:\"view_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:3:\"All\";s:3:\"new\";s:31:\"All,IT support,Manager,Redactor\";}}',NULL,3,'2019-02-19 21:01:33',0),(501,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','65','a:6:{s:4:\"code\";s:36:\"franklin_insights_subscribe_products\";s:8:\"job_name\";s:36:\"franklin_insights_subscribe_products\";s:5:\"label\";s:36:\"franklin_insights_subscribe_products\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:36:\"franklin_insights_subscribe_products\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:36:\"franklin_insights_subscribe_products\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:36:\"franklin_insights_subscribe_products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:34',0),(502,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','66','a:6:{s:4:\"code\";s:38:\"franklin_insights_unsubscribe_products\";s:8:\"job_name\";s:38:\"franklin_insights_unsubscribe_products\";s:5:\"label\";s:38:\"franklin_insights_unsubscribe_products\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:9:\"mass_edit\";s:13:\"configuration\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_unsubscribe_products\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_unsubscribe_products\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_unsubscribe_products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:9:\"mass_edit\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:35',0),(503,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','67','a:6:{s:4:\"code\";s:32:\"franklin_insights_fetch_products\";s:8:\"job_name\";s:32:\"franklin_insights_fetch_products\";s:5:\"label\";s:32:\"franklin_insights_fetch_products\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:22:\"{\"updated_since\":null}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:32:\"franklin_insights_fetch_products\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:32:\"franklin_insights_fetch_products\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:32:\"franklin_insights_fetch_products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:22:\"{\"updated_since\":null}\";}}',NULL,1,'2019-02-19 21:01:36',0),(504,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','68','a:6:{s:4:\"code\";s:47:\"franklin_insights_remove_attribute_from_mapping\";s:8:\"job_name\";s:47:\"franklin_insights_remove_attribute_from_mapping\";s:5:\"label\";s:47:\"franklin_insights_remove_attribute_from_mapping\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"franklin_insights_remove_attribute_from_mapping\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"franklin_insights_remove_attribute_from_mapping\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:47:\"franklin_insights_remove_attribute_from_mapping\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:36',0),(505,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','69','a:6:{s:4:\"code\";s:44:\"franklin_insights_remove_option_from_mapping\";s:8:\"job_name\";s:44:\"franklin_insights_remove_option_from_mapping\";s:5:\"label\";s:44:\"franklin_insights_remove_option_from_mapping\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:44:\"franklin_insights_remove_option_from_mapping\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:44:\"franklin_insights_remove_option_from_mapping\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:44:\"franklin_insights_remove_option_from_mapping\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:37',0),(506,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','70','a:6:{s:4:\"code\";s:38:\"franklin_insights_resubscribe_products\";s:8:\"job_name\";s:38:\"franklin_insights_resubscribe_products\";s:5:\"label\";s:38:\"franklin_insights_resubscribe_products\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_resubscribe_products\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_resubscribe_products\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:38:\"franklin_insights_resubscribe_products\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:105:\"{\"filters\":[],\"actions\":[],\"realTimeVersioning\":true,\"user_to_notify\":null,\"is_user_authenticated\":false}\";}}',NULL,1,'2019-02-19 21:01:37',0),(507,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','71','a:6:{s:4:\"code\";s:50:\"franklin_insights_identify_products_to_resubscribe\";s:8:\"job_name\";s:50:\"franklin_insights_identify_products_to_resubscribe\";s:5:\"label\";s:50:\"franklin_insights_identify_products_to_resubscribe\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:26:\"{\"updated_identifiers\":[]}\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:50:\"franklin_insights_identify_products_to_resubscribe\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:50:\"franklin_insights_identify_products_to_resubscribe\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:50:\"franklin_insights_identify_products_to_resubscribe\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:26:\"{\"updated_identifiers\":[]}\";}}',NULL,1,'2019-02-19 21:01:38',0),(508,'system','Akeneo\\Tool\\Component\\Batch\\Model\\JobInstance','72','a:6:{s:4:\"code\";s:29:\"franklin_insights_synchronize\";s:8:\"job_name\";s:29:\"franklin_insights_synchronize\";s:5:\"label\";s:29:\"franklin_insights_synchronize\";s:9:\"connector\";s:27:\"Franklin Insights Connector\";s:4:\"type\";s:17:\"franklin_insights\";s:13:\"configuration\";s:2:\"[]\";}','a:6:{s:4:\"code\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"franklin_insights_synchronize\";}s:8:\"job_name\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"franklin_insights_synchronize\";}s:5:\"label\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:29:\"franklin_insights_synchronize\";}s:9:\"connector\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:27:\"Franklin Insights Connector\";}s:4:\"type\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:17:\"franklin_insights\";}s:13:\"configuration\";a:2:{s:3:\"old\";s:0:\"\";s:3:\"new\";s:2:\"[]\";}}',NULL,1,'2019-02-19 21:01:39',0),(509,'system','Akeneo\\Pim\\Enrichment\\Component\\Category\\Model\\Category','1','a:6:{s:4:\"code\";s:6:\"master\";s:6:\"parent\";N;s:11:\"label-en_US\";s:14:\"Master catalog\";s:15:\"view_permission\";s:27:\"IT support,Manager,Redactor\";s:15:\"edit_permission\";s:27:\"IT support,Manager,Redactor\";s:14:\"own_permission\";s:27:\"IT support,Manager,Redactor\";}','a:3:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:31:\"All,IT support,Manager,Redactor\";s:3:\"new\";s:27:\"IT support,Manager,Redactor\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:31:\"All,IT support,Manager,Redactor\";s:3:\"new\";s:27:\"IT support,Manager,Redactor\";}s:14:\"own_permission\";a:2:{s:3:\"old\";s:31:\"All,IT support,Manager,Redactor\";s:3:\"new\";s:27:\"IT support,Manager,Redactor\";}}',NULL,4,'2019-02-19 21:01:39',0),(510,'system','Akeneo\\Asset\\Component\\Model\\Category','1','a:5:{s:4:\"code\";s:18:\"asset_main_catalog\";s:6:\"parent\";N;s:11:\"label-en_US\";s:18:\"Asset main catalog\";s:15:\"view_permission\";s:27:\"IT support,Manager,Redactor\";s:15:\"edit_permission\";s:27:\"IT support,Manager,Redactor\";}','a:2:{s:15:\"view_permission\";a:2:{s:3:\"old\";s:31:\"All,IT support,Manager,Redactor\";s:3:\"new\";s:27:\"IT support,Manager,Redactor\";}s:15:\"edit_permission\";a:2:{s:3:\"old\";s:31:\"All,IT support,Manager,Redactor\";s:3:\"new\";s:27:\"IT support,Manager,Redactor\";}}',NULL,4,'2019-02-19 21:01:39',0);
/*!40000 ALTER TABLE `pim_versioning_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_franklin_insights_identifier_mapping`
--

DROP TABLE IF EXISTS `pimee_franklin_insights_identifier_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_franklin_insights_identifier_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `franklin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5F1E2B0DB6E62EFA` (`attribute_id`),
  KEY `franklin_code_idx` (`franklin_code`),
  CONSTRAINT `FK_5F1E2B0DB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_franklin_insights_identifier_mapping`
--

LOCK TABLES `pimee_franklin_insights_identifier_mapping` WRITE;
/*!40000 ALTER TABLE `pimee_franklin_insights_identifier_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_franklin_insights_identifier_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_franklin_insights_subscription`
--

DROP TABLE IF EXISTS `pimee_franklin_insights_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_franklin_insights_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `raw_suggested_data` json DEFAULT NULL COMMENT '(DC2Type:native_json)',
  `misses_mapping` tinyint(1) NOT NULL,
  `requested_asin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_upc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_mpn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `franklin_insights_subscription_idx` (`subscription_id`),
  KEY `franklin_insights_product_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_franklin_insights_subscription`
--

LOCK TABLES `pimee_franklin_insights_subscription` WRITE;
/*!40000 ALTER TABLE `pimee_franklin_insights_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_franklin_insights_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_asset`
--

DROP TABLE IF EXISTS `pimee_product_asset_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_enabled` tinyint(1) NOT NULL,
  `end_of_use_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2604DEA77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_asset`
--

LOCK TABLES `pimee_product_asset_asset` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_asset_category`
--

DROP TABLE IF EXISTS `pimee_product_asset_asset_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_asset_category` (
  `asset_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`category_id`),
  KEY `IDX_F3726D065DA1941` (`asset_id`),
  KEY `IDX_F3726D0612469DE2` (`category_id`),
  CONSTRAINT `FK_F3726D0612469DE2` FOREIGN KEY (`category_id`) REFERENCES `pimee_product_asset_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F3726D065DA1941` FOREIGN KEY (`asset_id`) REFERENCES `pimee_product_asset_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_asset_category`
--

LOCK TABLES `pimee_product_asset_asset_category` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_asset_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_asset_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_asset_tag`
--

DROP TABLE IF EXISTS `pimee_product_asset_asset_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_asset_tag` (
  `asset_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_id`,`tag_id`),
  KEY `IDX_4911B3D5DA1941` (`asset_id`),
  KEY `IDX_4911B3DBAD26311` (`tag_id`),
  CONSTRAINT `FK_4911B3D5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `pimee_product_asset_asset` (`id`),
  CONSTRAINT `FK_4911B3DBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `pimee_product_asset_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_asset_tag`
--

LOCK TABLES `pimee_product_asset_asset_tag` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_asset_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_asset_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_category`
--

DROP TABLE IF EXISTS `pimee_product_asset_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `root` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pimee_product_asset_category_code_uc` (`code`),
  KEY `IDX_C9C7C0D4727ACA70` (`parent_id`),
  CONSTRAINT `FK_C9C7C0D4727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pimee_product_asset_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_category`
--

LOCK TABLES `pimee_product_asset_category` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_category` DISABLE KEYS */;
INSERT INTO `pimee_product_asset_category` VALUES (1,NULL,'asset_main_catalog','2019-02-19 21:01:31',1,0,1,2);
/*!40000 ALTER TABLE `pimee_product_asset_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_category_translation`
--

DROP TABLE IF EXISTS `pimee_product_asset_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_category_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`locale`,`foreign_key`),
  KEY `IDX_9AC075B97E366551` (`foreign_key`),
  CONSTRAINT `FK_9AC075B97E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pimee_product_asset_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_category_translation`
--

LOCK TABLES `pimee_product_asset_category_translation` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_category_translation` DISABLE KEYS */;
INSERT INTO `pimee_product_asset_category_translation` VALUES (1,1,'Asset main catalog','en_US');
/*!40000 ALTER TABLE `pimee_product_asset_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_channel_variation_configuration`
--

DROP TABLE IF EXISTS `pimee_product_asset_channel_variation_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_channel_variation_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FF39199B72F5A1AA` (`channel_id`),
  CONSTRAINT `FK_FF39199B72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_channel_variation_configuration`
--

LOCK TABLES `pimee_product_asset_channel_variation_configuration` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_channel_variation_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_channel_variation_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_file_metadata`
--

DROP TABLE IF EXISTS `pimee_product_asset_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_file_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) DEFAULT NULL,
  `modificationDatetime` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `dtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exifResolution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifDateTimeOriginal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifCameraMake` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifCameraModel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifSizeWidth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifSizeHeight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifOrientation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifCopyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifKeywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifDescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exifColorSpace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iptcKeywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iptcLocationCountry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iptcLocationCity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AC1A6A886ED78C3` (`file_info_id`),
  CONSTRAINT `FK_AC1A6A886ED78C3` FOREIGN KEY (`file_info_id`) REFERENCES `akeneo_file_storage_file_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_file_metadata`
--

LOCK TABLES `pimee_product_asset_file_metadata` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_file_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_reference`
--

DROP TABLE IF EXISTS `pimee_product_asset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) DEFAULT NULL,
  `locale_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C3B126216ED78C3` (`file_info_id`),
  KEY `IDX_C3B12621E559DFD1` (`locale_id`),
  KEY `IDX_C3B126215DA1941` (`asset_id`),
  CONSTRAINT `FK_C3B126215DA1941` FOREIGN KEY (`asset_id`) REFERENCES `pimee_product_asset_asset` (`id`),
  CONSTRAINT `FK_C3B126216ED78C3` FOREIGN KEY (`file_info_id`) REFERENCES `akeneo_file_storage_file_info` (`id`),
  CONSTRAINT `FK_C3B12621E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_reference`
--

LOCK TABLES `pimee_product_asset_reference` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_tag`
--

DROP TABLE IF EXISTS `pimee_product_asset_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AEAA2EB577153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_tag`
--

LOCK TABLES `pimee_product_asset_tag` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_product_asset_variation`
--

DROP TABLE IF EXISTS `pimee_product_asset_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_product_asset_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `source_file_info_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F895CD86ED78C3` (`file_info_id`),
  KEY `IDX_F895CD872F5A1AA` (`channel_id`),
  KEY `IDX_F895CD81645DEA9` (`reference_id`),
  KEY `IDX_F895CD8D007A47B` (`source_file_info_id`),
  CONSTRAINT `FK_F895CD81645DEA9` FOREIGN KEY (`reference_id`) REFERENCES `pimee_product_asset_reference` (`id`),
  CONSTRAINT `FK_F895CD86ED78C3` FOREIGN KEY (`file_info_id`) REFERENCES `akeneo_file_storage_file_info` (`id`),
  CONSTRAINT `FK_F895CD872F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`),
  CONSTRAINT `FK_F895CD8D007A47B` FOREIGN KEY (`source_file_info_id`) REFERENCES `akeneo_file_storage_file_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_product_asset_variation`
--

LOCK TABLES `pimee_product_asset_variation` WRITE;
/*!40000 ALTER TABLE `pimee_product_asset_variation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_product_asset_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_security_asset_category_access`
--

DROP TABLE IF EXISTS `pimee_security_asset_category_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_security_asset_category_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `view_items` tinyint(1) NOT NULL DEFAULT '0',
  `edit_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_user_group_idx` (`category_id`,`user_group_id`),
  KEY `IDX_70DA129E1ED93D47` (`user_group_id`),
  KEY `IDX_70DA129E12469DE2` (`category_id`),
  CONSTRAINT `FK_70DA129E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `pimee_product_asset_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_70DA129E1ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_security_asset_category_access`
--

LOCK TABLES `pimee_security_asset_category_access` WRITE;
/*!40000 ALTER TABLE `pimee_security_asset_category_access` DISABLE KEYS */;
INSERT INTO `pimee_security_asset_category_access` VALUES (2,1,1,1,1),(3,2,1,1,1),(4,3,1,1,1);
/*!40000 ALTER TABLE `pimee_security_asset_category_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_security_attribute_group_access`
--

DROP TABLE IF EXISTS `pimee_security_attribute_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_security_attribute_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` smallint(6) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `view_attributes` tinyint(1) NOT NULL DEFAULT '0',
  `edit_attributes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_user_group_idx` (`attribute_group_id`,`user_group_id`),
  KEY `IDX_D69E7F7B1ED93D47` (`user_group_id`),
  KEY `IDX_D69E7F7B62D643B7` (`attribute_group_id`),
  KEY `attr_grp_editable_permission_index` (`edit_attributes`,`attribute_group_id`),
  CONSTRAINT `FK_D69E7F7B1ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D69E7F7B62D643B7` FOREIGN KEY (`attribute_group_id`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_security_attribute_group_access`
--

LOCK TABLES `pimee_security_attribute_group_access` WRITE;
/*!40000 ALTER TABLE `pimee_security_attribute_group_access` DISABLE KEYS */;
INSERT INTO `pimee_security_attribute_group_access` VALUES (2,1,1,1,1),(3,2,1,1,1),(4,3,1,1,1);
/*!40000 ALTER TABLE `pimee_security_attribute_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_security_job_profile_access`
--

DROP TABLE IF EXISTS `pimee_security_job_profile_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_security_job_profile_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_profile_id` int(11) NOT NULL,
  `user_group_id` smallint(6) NOT NULL,
  `execute_job_profile` tinyint(1) NOT NULL DEFAULT '0',
  `edit_job_profile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_profile_user_group_idx` (`job_profile_id`,`user_group_id`),
  KEY `IDX_5A5F2763A68D82A5` (`job_profile_id`),
  KEY `IDX_5A5F27631ED93D47` (`user_group_id`),
  CONSTRAINT `FK_5A5F27631ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5A5F2763A68D82A5` FOREIGN KEY (`job_profile_id`) REFERENCES `akeneo_batch_job_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_security_job_profile_access`
--

LOCK TABLES `pimee_security_job_profile_access` WRITE;
/*!40000 ALTER TABLE `pimee_security_job_profile_access` DISABLE KEYS */;
INSERT INTO `pimee_security_job_profile_access` VALUES (1,29,4,1,0),(2,28,4,1,0),(3,30,4,1,0),(4,37,4,1,0),(5,38,4,1,0),(6,39,4,1,0),(7,36,4,1,0),(8,32,4,1,0),(9,40,4,1,0),(10,42,4,1,0),(11,48,4,1,0),(12,49,4,1,0),(13,50,4,1,0),(14,51,4,1,0),(15,44,4,1,0),(16,45,4,1,0),(17,46,4,1,0),(18,47,4,1,0),(19,52,4,1,0),(20,53,4,1,0),(21,55,4,1,0),(22,54,4,1,0),(23,56,4,1,0),(24,57,4,1,0),(25,58,4,1,0),(26,59,4,1,0),(27,60,4,1,0),(28,61,4,1,0),(29,62,4,1,0),(30,63,4,1,0),(31,43,4,1,0),(32,64,4,1,0),(33,65,4,1,1),(34,66,4,1,1),(35,67,4,1,1),(36,68,4,1,1),(37,69,4,1,1),(38,70,4,1,1),(39,71,4,1,1),(40,72,4,1,1);
/*!40000 ALTER TABLE `pimee_security_job_profile_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_security_locale_access`
--

DROP TABLE IF EXISTS `pimee_security_locale_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_security_locale_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` smallint(6) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `view_products` tinyint(1) NOT NULL DEFAULT '0',
  `edit_products` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_user_group_idx` (`locale_id`,`user_group_id`),
  KEY `IDX_E1E285481ED93D47` (`user_group_id`),
  KEY `IDX_E1E28548E559DFD1` (`locale_id`),
  CONSTRAINT `FK_E1E285481ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E1E28548E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_security_locale_access`
--

LOCK TABLES `pimee_security_locale_access` WRITE;
/*!40000 ALTER TABLE `pimee_security_locale_access` DISABLE KEYS */;
INSERT INTO `pimee_security_locale_access` VALUES (1,4,1,1,1),(2,4,2,1,1),(3,4,3,1,1),(4,4,4,1,1),(5,4,5,1,1),(6,4,6,1,1),(7,4,7,1,1),(8,4,8,1,1),(9,4,9,1,1),(10,4,10,1,1),(11,4,11,1,1),(12,4,12,1,1),(13,4,13,1,1),(14,4,14,1,1),(15,4,15,1,1),(16,4,16,1,1),(17,4,17,1,1),(18,4,18,1,1),(19,4,19,1,1),(20,4,20,1,1),(21,4,21,1,1),(22,4,22,1,1),(23,4,23,1,1),(24,4,24,1,1),(25,4,25,1,1),(26,4,26,1,1),(27,4,27,1,1),(28,4,28,1,1),(29,4,29,1,1),(30,4,30,1,1),(31,4,31,1,1),(32,4,32,1,1),(33,4,33,1,1),(34,4,34,1,1),(35,4,35,1,1),(36,4,36,1,1),(37,4,37,1,1),(38,4,38,1,1),(39,4,39,1,1),(40,4,40,1,1),(41,4,41,1,1),(42,4,42,1,1),(43,4,43,1,1),(44,4,44,1,1),(45,4,45,1,1),(46,4,46,1,1),(47,4,47,1,1),(48,4,48,1,1),(49,4,49,1,1),(50,4,50,1,1),(51,4,51,1,1),(52,4,52,1,1),(53,4,53,1,1),(54,4,54,1,1),(55,4,55,1,1),(56,4,56,1,1),(57,4,57,1,1),(58,4,58,1,1),(59,4,59,1,1),(60,4,60,1,1),(61,4,61,1,1),(62,4,62,1,1),(63,4,63,1,1),(64,4,64,1,1),(65,4,65,1,1),(66,4,66,1,1),(67,4,67,1,1),(68,4,68,1,1),(69,4,69,1,1),(70,4,70,1,1),(71,4,71,1,1),(72,4,72,1,1),(73,4,73,1,1),(74,4,74,1,1),(75,4,75,1,1),(76,4,76,1,1),(77,4,77,1,1),(78,4,78,1,1),(79,4,79,1,1),(80,4,80,1,1),(81,4,81,1,1),(82,4,82,1,1),(83,4,83,1,1),(84,4,84,1,1),(85,4,85,1,1),(86,4,86,1,1),(87,4,87,1,1),(88,4,88,1,1),(89,4,89,1,1),(90,4,90,1,1),(91,4,91,1,1),(92,4,92,1,1),(93,4,93,1,1),(94,4,94,1,1),(95,4,95,1,1),(96,4,96,1,1),(97,4,97,1,1),(98,4,98,1,1),(99,4,99,1,1),(100,4,100,1,1),(101,4,101,1,1),(102,4,102,1,1),(103,4,103,1,1),(104,4,104,1,1),(105,4,105,1,1),(106,4,106,1,1),(107,4,107,1,1),(108,4,108,1,1),(109,4,109,1,1),(110,4,110,1,1),(111,4,111,1,1),(112,4,112,1,1),(113,4,113,1,1),(114,4,114,1,1),(115,4,115,1,1),(116,4,116,1,1),(117,4,117,1,1),(118,4,118,1,1),(119,4,119,1,1),(120,4,120,1,1),(121,4,121,1,1),(122,4,122,1,1),(123,4,123,1,1),(124,4,124,1,1),(125,4,125,1,1),(126,4,126,1,1),(127,4,127,1,1),(128,4,128,1,1),(129,4,129,1,1),(130,4,130,1,1),(131,4,131,1,1),(132,4,132,1,1),(133,4,133,1,1),(134,4,134,1,1),(135,4,135,1,1),(136,4,136,1,1),(137,4,137,1,1),(138,4,138,1,1),(139,4,139,1,1),(140,4,140,1,1),(141,4,141,1,1),(142,4,142,1,1),(143,4,143,1,1),(144,4,144,1,1),(145,4,145,1,1),(146,4,146,1,1),(147,4,147,1,1),(148,4,148,1,1),(149,4,149,1,1),(150,4,150,1,1),(151,4,151,1,1),(152,4,152,1,1),(153,4,153,1,1),(154,4,154,1,1),(155,4,155,1,1),(156,4,156,1,1),(157,4,157,1,1),(158,4,158,1,1),(159,4,159,1,1),(160,4,160,1,1),(161,4,161,1,1),(162,4,162,1,1),(163,4,163,1,1),(164,4,164,1,1),(165,4,165,1,1),(166,4,166,1,1),(167,4,167,1,1),(168,4,168,1,1),(169,4,169,1,1),(170,4,170,1,1),(171,4,171,1,1),(172,4,172,1,1),(173,4,173,1,1),(174,4,174,1,1),(175,4,175,1,1),(176,4,176,1,1),(177,4,177,1,1),(178,4,178,1,1),(179,4,179,1,1),(180,4,180,1,1),(181,4,181,1,1),(182,4,182,1,1),(183,4,183,1,1),(184,4,184,1,1),(185,4,185,1,1),(186,4,186,1,1),(187,4,187,1,1),(188,4,188,1,1),(189,4,189,1,1),(190,4,190,1,1),(191,4,191,1,1),(192,4,192,1,1),(193,4,193,1,1),(194,4,194,1,1),(195,4,195,1,1),(196,4,196,1,1),(197,4,197,1,1),(198,4,198,1,1),(199,4,199,1,1),(200,4,200,1,1),(201,4,201,1,1),(202,4,202,1,1),(203,4,203,1,1),(204,4,204,1,1),(205,4,205,1,1),(206,4,206,1,1),(207,4,207,1,1),(208,4,208,1,1),(209,4,209,1,1),(210,4,210,1,1);
/*!40000 ALTER TABLE `pimee_security_locale_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_security_product_category_access`
--

DROP TABLE IF EXISTS `pimee_security_product_category_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_security_product_category_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `view_items` tinyint(1) NOT NULL DEFAULT '0',
  `edit_items` tinyint(1) NOT NULL DEFAULT '0',
  `own_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_user_group_idx` (`category_id`,`user_group_id`),
  KEY `IDX_B38721D61ED93D47` (`user_group_id`),
  KEY `IDX_B38721D612469DE2` (`category_id`),
  KEY `view_category_user_group_idx` (`view_items`,`user_group_id`,`category_id`),
  CONSTRAINT `FK_B38721D612469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B38721D61ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_security_product_category_access`
--

LOCK TABLES `pimee_security_product_category_access` WRITE;
/*!40000 ALTER TABLE `pimee_security_product_category_access` DISABLE KEYS */;
INSERT INTO `pimee_security_product_category_access` VALUES (2,1,1,1,1,1),(3,2,1,1,1,1),(4,3,1,1,1,1);
/*!40000 ALTER TABLE `pimee_security_product_category_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_teamwork_assistant_completeness_per_attribute_group`
--

DROP TABLE IF EXISTS `pimee_teamwork_assistant_completeness_per_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_teamwork_assistant_completeness_per_attribute_group` (
  `locale_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `has_at_least_one_required_attribute_filled` tinyint(1) NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `calculated_at` datetime NOT NULL,
  PRIMARY KEY (`locale_id`,`channel_id`,`product_id`,`attribute_group_id`),
  KEY `attr_grp_completeness_locale_index` (`locale_id`),
  KEY `attr_grp_completeness_channel_index` (`channel_id`),
  KEY `attr_grp_completeness_product_index` (`product_id`),
  KEY `attr_grp_completeness_attribute_group_index` (`attribute_group_id`),
  CONSTRAINT `attr_grp_completeness_attribute_group_foreign_key` FOREIGN KEY (`attribute_group_id`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attr_grp_completeness_channel_foreign_key` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attr_grp_completeness_locale_foreign_key` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attr_grp_completeness_product_foreign_key` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_teamwork_assistant_completeness_per_attribute_group`
--

LOCK TABLES `pimee_teamwork_assistant_completeness_per_attribute_group` WRITE;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_completeness_per_attribute_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_completeness_per_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_teamwork_assistant_project`
--

DROP TABLE IF EXISTS `pimee_teamwork_assistant_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_teamwork_assistant_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datagrid_view_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `code` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `due_date` date NOT NULL,
  `productFilters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9406D3B01E2E9CAF` (`datagrid_view_id`),
  UNIQUE KEY `channel_locale_label_idx` (`channel_id`,`locale_id`,`label`),
  KEY `IDX_9406D3B07E3C61F9` (`owner_id`),
  KEY `IDX_9406D3B072F5A1AA` (`channel_id`),
  KEY `IDX_9406D3B0E559DFD1` (`locale_id`),
  CONSTRAINT `FK_9406D3B01E2E9CAF` FOREIGN KEY (`datagrid_view_id`) REFERENCES `pim_datagrid_view` (`id`),
  CONSTRAINT `FK_9406D3B072F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`),
  CONSTRAINT `FK_9406D3B07E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `oro_user` (`id`),
  CONSTRAINT `FK_9406D3B0E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_teamwork_assistant_project`
--

LOCK TABLES `pimee_teamwork_assistant_project` WRITE;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_teamwork_assistant_project_product`
--

DROP TABLE IF EXISTS `pimee_teamwork_assistant_project_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_teamwork_assistant_project_product` (
  `project_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`product_id`),
  KEY `product_selection_project_index` (`project_id`),
  KEY `product_selection_product_index` (`product_id`),
  CONSTRAINT `product_selection_product_foreign_key` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selection_project_foreign_key` FOREIGN KEY (`project_id`) REFERENCES `pimee_teamwork_assistant_project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_teamwork_assistant_project_product`
--

LOCK TABLES `pimee_teamwork_assistant_project_product` WRITE;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_teamwork_assistant_project_status`
--

DROP TABLE IF EXISTS `pimee_teamwork_assistant_project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_teamwork_assistant_project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `isComplete` tinyint(1) DEFAULT NULL,
  `hasBeenNotified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8B8E20EDA76ED395` (`user_id`),
  KEY `IDX_8B8E20ED166D1F9C` (`project_id`),
  CONSTRAINT `FK_8B8E20ED166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `pimee_teamwork_assistant_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8B8E20EDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_teamwork_assistant_project_status`
--

LOCK TABLES `pimee_teamwork_assistant_project_status` WRITE;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_teamwork_assistant_project_user_group`
--

DROP TABLE IF EXISTS `pimee_teamwork_assistant_project_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_teamwork_assistant_project_user_group` (
  `project_id` int(11) NOT NULL,
  `user_group_id` smallint(6) NOT NULL,
  PRIMARY KEY (`project_id`,`user_group_id`),
  KEY `IDX_DF34C6AD166D1F9C` (`project_id`),
  KEY `IDX_DF34C6AD1ED93D47` (`user_group_id`),
  CONSTRAINT `FK_DF34C6AD166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `pimee_teamwork_assistant_project` (`id`),
  CONSTRAINT `FK_DF34C6AD1ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `oro_access_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_teamwork_assistant_project_user_group`
--

LOCK TABLES `pimee_teamwork_assistant_project_user_group` WRITE;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_teamwork_assistant_project_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_category_published_product`
--

DROP TABLE IF EXISTS `pimee_workflow_category_published_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_category_published_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `IDX_FBF18BD24584665A` (`product_id`),
  KEY `IDX_FBF18BD212469DE2` (`category_id`),
  CONSTRAINT `FK_FBF18BD212469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FBF18BD24584665A` FOREIGN KEY (`product_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_category_published_product`
--

LOCK TABLES `pimee_workflow_category_published_product` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_category_published_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_category_published_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_group_published_product`
--

DROP TABLE IF EXISTS `pimee_workflow_group_published_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_group_published_product` (
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`group_id`),
  KEY `IDX_60C37BBC4584665A` (`product_id`),
  KEY `IDX_60C37BBCFE54D947` (`group_id`),
  CONSTRAINT `FK_60C37BBC4584665A` FOREIGN KEY (`product_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_60C37BBCFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_group_published_product`
--

LOCK TABLES `pimee_workflow_group_published_product` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_group_published_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_group_published_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_product_draft`
--

DROP TABLE IF EXISTS `pimee_workflow_product_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_product_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `changes` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `raw_values` json NOT NULL COMMENT '(DC2Type:native_json)',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`author`,`product_id`),
  KEY `IDX_6F63A25F4584665A` (`product_id`),
  CONSTRAINT `FK_6F63A25F4584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_product_draft`
--

LOCK TABLES `pimee_workflow_product_draft` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_product_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_product_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_product_model_draft`
--

DROP TABLE IF EXISTS `pimee_workflow_product_model_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_product_model_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_model_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `changes` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `raw_values` json NOT NULL COMMENT '(DC2Type:native_json)',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`author`,`product_model_id`),
  KEY `IDX_68577CF4B2C5DD70` (`product_model_id`),
  CONSTRAINT `FK_68577CF4B2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_product_model_draft`
--

LOCK TABLES `pimee_workflow_product_model_draft` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_product_model_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_product_model_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_product_unique_data`
--

DROP TABLE IF EXISTS `pimee_workflow_product_unique_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_product_unique_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `raw_data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_value_idx` (`attribute_id`,`raw_data`),
  KEY `IDX_7B1302F84584665A` (`product_id`),
  KEY `IDX_7B1302F8B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_7B1302F84584665A` FOREIGN KEY (`product_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7B1302F8B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_product_unique_data`
--

LOCK TABLES `pimee_workflow_product_unique_data` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_product_unique_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_product_unique_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) DEFAULT NULL,
  `original_product_id` int(11) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  `product_model_id` int(11) DEFAULT NULL,
  `family_variant_id` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_values` json NOT NULL COMMENT '(DC2Type:native_json)',
  `created` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  `updated` datetime NOT NULL COMMENT '(DC2Type:datetime)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E3566E69772E836A` (`identifier`),
  UNIQUE KEY `UNIQ_E3566E694BBC2705` (`version_id`),
  UNIQUE KEY `UNIQ_E3566E69283311CE` (`original_product_id`),
  KEY `IDX_E3566E69C35E566A` (`family_id`),
  KEY `IDX_E3566E69B2C5DD70` (`product_model_id`),
  KEY `IDX_E3566E698A37AD0` (`family_variant_id`),
  CONSTRAINT `FK_E3566E69283311CE` FOREIGN KEY (`original_product_id`) REFERENCES `pim_catalog_product` (`id`),
  CONSTRAINT `FK_E3566E694BBC2705` FOREIGN KEY (`version_id`) REFERENCES `pim_versioning_version` (`id`),
  CONSTRAINT `FK_E3566E698A37AD0` FOREIGN KEY (`family_variant_id`) REFERENCES `pim_catalog_family_variant` (`id`),
  CONSTRAINT `FK_E3566E69B2C5DD70` FOREIGN KEY (`product_model_id`) REFERENCES `pim_catalog_product_model` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E3566E69C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product`
--

LOCK TABLES `pimee_workflow_published_product` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product_association`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association_type_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_foreign_key_idx` (`owner_id`,`association_type_id`),
  KEY `IDX_A3D033B4B1E1C39` (`association_type_id`),
  KEY `IDX_A3D033B47E3C61F9` (`owner_id`),
  CONSTRAINT `FK_A3D033B47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A3D033B4B1E1C39` FOREIGN KEY (`association_type_id`) REFERENCES `pim_catalog_association_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product_association`
--

LOCK TABLES `pimee_workflow_published_product_association` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product_association_published_group`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product_association_published_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product_association_published_group` (
  `association_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`group_id`),
  KEY `IDX_4F53DE31EFB9C8A5` (`association_id`),
  KEY `IDX_4F53DE31FE54D947` (`group_id`),
  CONSTRAINT `FK_4F53DE31EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pimee_workflow_published_product_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4F53DE31FE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product_association_published_group`
--

LOCK TABLES `pimee_workflow_published_product_association_published_group` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association_published_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association_published_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product_association_published_product`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product_association_published_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product_association_published_product` (
  `association_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`association_id`,`product_id`),
  KEY `IDX_B34078DDEFB9C8A5` (`association_id`),
  KEY `IDX_B34078DD4584665A` (`product_id`),
  CONSTRAINT `FK_B34078DD4584665A` FOREIGN KEY (`product_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B34078DDEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `pimee_workflow_published_product_association` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product_association_published_product`
--

LOCK TABLES `pimee_workflow_published_product_association_published_product` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association_published_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product_association_published_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product_completeness`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product_completeness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product_completeness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ratio` int(11) NOT NULL,
  `missing_count` int(11) NOT NULL,
  `required_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`locale_id`,`product_id`),
  KEY `IDX_AA5F1874E559DFD1` (`locale_id`),
  KEY `IDX_AA5F187472F5A1AA` (`channel_id`),
  KEY `IDX_AA5F18744584665A` (`product_id`),
  KEY `ratio_idx` (`ratio`),
  CONSTRAINT `FK_AA5F18744584665A` FOREIGN KEY (`product_id`) REFERENCES `pimee_workflow_published_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AA5F187472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AA5F1874E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product_completeness`
--

LOCK TABLES `pimee_workflow_published_product_completeness` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product_completeness` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product_completeness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimee_workflow_published_product_completeness_missing_attribute`
--

DROP TABLE IF EXISTS `pimee_workflow_published_product_completeness_missing_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimee_workflow_published_product_completeness_missing_attribute` (
  `completeness_id` int(11) NOT NULL,
  `missing_attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`completeness_id`,`missing_attribute_id`),
  KEY `IDX_B0FD5518B640FBA5` (`completeness_id`),
  KEY `IDX_B0FD5518762147F6` (`missing_attribute_id`),
  CONSTRAINT `FK_B0FD5518762147F6` FOREIGN KEY (`missing_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`),
  CONSTRAINT `FK_B0FD5518B640FBA5` FOREIGN KEY (`completeness_id`) REFERENCES `pimee_workflow_published_product_completeness` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimee_workflow_published_product_completeness_missing_attribute`
--

LOCK TABLES `pimee_workflow_published_product_completeness_missing_attribute` WRITE;
/*!40000 ALTER TABLE `pimee_workflow_published_product_completeness_missing_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pimee_workflow_published_product_completeness_missing_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-20 14:21:48
