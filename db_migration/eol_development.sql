-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: eol_development
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `agent_roles`
--

DROP TABLE IF EXISTS `agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Identifies how agent is linked to data_object';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_roles`
--

LOCK TABLES `agent_roles` WRITE;
/*!40000 ALTER TABLE `agent_roles` DISABLE KEYS */;
INSERT INTO `agent_roles` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16);
/*!40000 ALTER TABLE `agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` text NOT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homepage` text NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `yahoo_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `full_name` (`full_name`(200))
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='Agents are content partners and used for object attribution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'IUCN',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:10','2011-09-13 04:27:10'),(2,'Janie Reinger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:10','2011-09-13 04:27:10'),(3,'Catalogue of Life',NULL,NULL,NULL,'http://www.catalogueoflife.org/','',219000,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:12','2011-09-13 04:27:12'),(4,'National Center for Biotechnology Information',NULL,NULL,NULL,'http://www.ncbi.nlm.nih.gov/','',921800,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:12','2011-09-13 04:27:12'),(5,'Biology of Aging',NULL,NULL,NULL,'','',318700,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:12','2011-09-13 04:27:12'),(6,'Spencer Bergstrom',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:13','2011-09-13 04:27:13'),(7,'Camren Rhys',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:15','2011-09-13 04:27:15'),(8,'GBIF',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:15','2011-09-13 04:27:15'),(9,'Ahmad Murphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:19','2011-09-13 04:27:19'),(10,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:43','2011-09-13 04:27:43'),(11,'Roxane Connelly',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:43','2011-09-13 04:27:43'),(12,'Mariana Runolfsson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:45','2011-09-13 04:27:45'),(13,'Joshuah Ernser',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:45','2011-09-13 04:27:45'),(14,'Antonia Nolan',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:53','2011-09-13 04:27:53'),(15,'Eugene Mosciski',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:53','2011-09-13 04:27:53'),(16,'Kaitlin Larkin',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:59','2011-09-13 04:27:59'),(17,'Otho Willms',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:27:59','2011-09-13 04:27:59'),(18,'Camila Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:05','2011-09-13 04:28:05'),(19,'Colt Stracke',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:05','2011-09-13 04:28:05'),(20,'Mathew Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:11','2011-09-13 04:28:11'),(21,'Electa Na',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:11','2011-09-13 04:28:11'),(22,'Damaris Torphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:17','2011-09-13 04:28:17'),(23,'Aidan Mills',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:17','2011-09-13 04:28:17'),(24,'Dora Pollich',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:27','2011-09-13 04:28:27'),(25,'Emmanuelle Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:30','2011-09-13 04:28:30'),(26,'Sam Hettinger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:30','2011-09-13 04:28:30'),(27,'Betty Okuneva',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:33','2011-09-13 04:28:33'),(28,'Reuben Olson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:33','2011-09-13 04:28:33'),(29,'Ashley West',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:34','2011-09-13 04:28:34'),(30,'Vicente Schowalter',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:34','2011-09-13 04:28:34'),(31,'Heber Hill',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:35','2011-09-13 04:28:35'),(32,'Maybell Schneider',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:35','2011-09-13 04:28:36'),(33,'Okey McCullough',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:45','2011-09-13 04:28:45'),(34,'test curator',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:46','2011-09-13 04:28:46'),(35,'Leonardo Schamberger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:47','2011-09-13 04:28:47'),(36,'Gerhard Bode',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:47','2011-09-13 04:28:47'),(37,'Cicero Stehr',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:50','2011-09-13 04:28:50'),(38,'Maritza Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:50','2011-09-13 04:28:50'),(39,'Alvah Wisozk',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:53','2011-09-13 04:28:53'),(40,'Wyatt Hansen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:54','2011-09-13 04:28:54'),(41,'Ming Spencer',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:54','2011-09-13 04:28:54'),(42,'Shane Eichmann',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:28:54','2011-09-13 04:28:54'),(43,'Ralph Wiggum',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:01','2011-09-13 04:29:01'),(44,'Benton Corwin',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:01','2011-09-13 04:29:01'),(45,'Chanel Keller',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:02','2011-09-13 04:29:02'),(46,'Admin User',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:03','2011-09-13 04:29:03'),(47,'Rosalia Toy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:05','2011-09-13 04:29:05'),(48,'Christie Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:05','2011-09-13 04:29:05'),(49,'Madelynn Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:11','2011-09-13 04:29:11'),(50,'Jeramie Botsford',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:11','2011-09-13 04:29:11'),(51,'Kailey Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:13','2011-09-13 04:29:13'),(52,'Duane Leuschke',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:13','2011-09-13 04:29:13'),(53,'Herbert Senger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:21','2011-09-13 04:29:21'),(54,'Rolfe Luettgen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:21','2011-09-13 04:29:21'),(55,'Kali Lubowitz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:32','2011-09-13 04:29:32'),(56,'Jacky Welch',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:32','2011-09-13 04:29:32'),(57,'Marilie Harvey',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:43','2011-09-13 04:29:43'),(58,'Jon Schultz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:43','2011-09-13 04:29:43'),(59,'Rachel Keebler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:51','2011-09-13 04:29:51'),(60,'Scot Hudson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:29:51','2011-09-13 04:29:51'),(61,'Rhea Leffler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:00','2011-09-13 04:30:00'),(62,'Greta Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:00','2011-09-13 04:30:00'),(63,'Dameon Schmidt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:06','2011-09-13 04:30:06'),(64,'Rasheed Skiles',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:07','2011-09-13 04:30:07'),(65,'Bertrand Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:19','2011-09-13 04:30:19'),(66,'Seao Cummerata',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:19','2011-09-13 04:30:19'),(67,'Janif Stamm',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:29','2011-09-13 04:30:29'),(68,'Helmes Beier',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:29','2011-09-13 04:30:29'),(69,'Fionb Dickens',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:35','2011-09-13 04:30:35'),(70,'Spences Kulas',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:35','2011-09-13 04:30:35'),(71,'Camreo Franecki',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:43','2011-09-13 04:30:43'),(72,'Ahmae Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:44','2011-09-13 04:30:44'),(73,'Roxanf Padberg',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:51','2011-09-13 04:30:51'),(74,'Marianb Haley',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:51','2011-09-13 04:30:51'),(75,'Joshuai Gorczany',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:57','2011-09-13 04:30:57'),(76,'Antonib Hoeger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:30:58','2011-09-13 04:30:58'),(77,'Eugenf Cronio',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:31:03','2011-09-13 04:31:03'),(78,'Kaitlio Reinges',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:31:03','2011-09-13 04:31:03'),(79,'Othp Jacobt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:31:58','2011-09-13 04:31:58'),(80,'Camilb Cronb',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:31:58','2011-09-13 04:31:58'),(81,'Colu Parisiao',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:00','2011-09-13 04:32:00'),(82,'Mathex Bergstron',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:00','2011-09-13 04:32:00'),(83,'Electb Rhyt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:03','2011-09-13 04:32:03'),(84,'Damarit Murphz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:03','2011-09-13 04:32:03'),(85,'Aidao Connellz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:05','2011-09-13 04:32:05'),(86,'Dorb Runolfssoo',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:06','2011-09-13 04:32:06'),(87,'Emmanuellf Ernses',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:08','2011-09-13 04:32:08'),(88,'San Nolao',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:08','2011-09-13 04:32:08'),(89,'Bettz Mosciskj',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:10','2011-09-13 04:32:10'),(90,'Reubeo Larkio',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:10','2011-09-13 04:32:10'),(91,'Ashlez Willmt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:13','2011-09-13 04:32:13'),(92,'Vicentf Deckox',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:13','2011-09-13 04:32:13'),(93,'Hebes Strackf',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:15','2011-09-13 04:32:15'),(94,'Maybelm Deckox',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:15','2011-09-13 04:32:15'),(95,'Okez Nb',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:17','2011-09-13 04:32:17'),(96,'Leonardp Torphz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:17','2011-09-13 04:32:17'),(97,'Gerhare Millt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:19','2011-09-13 04:32:19'),(98,'Cicerp Pollici',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:19','2011-09-13 04:32:19'),(99,'Maritzb Beattz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:22','2011-09-13 04:32:22'),(100,'Alvai Hettinges',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:22','2011-09-13 04:32:22'),(101,'Wyatu Okunevb',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:25','2011-09-13 04:32:25'),(102,'Minh Olsoo',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:25','2011-09-13 04:32:25'),(103,'Shanf Wesu',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:27','2011-09-13 04:32:27'),(104,'Bentoo Schowaltes',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:27','2011-09-13 04:32:27'),(105,'Georgf Hilm',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:30','2011-09-13 04:32:30'),(106,'Chanem Schneides',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:30','2011-09-13 04:32:30'),(107,'Rosalib McCullougi',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:32','2011-09-13 04:32:32'),(108,'Christif Schamberges',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:33','2011-09-13 04:32:33'),(109,'Madelyno Bodf',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:35','2011-09-13 04:32:35'),(110,'Jeramif Stehs',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:36','2011-09-13 04:32:36'),(111,'Lavadb Kuhid',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:42','2011-09-13 04:32:42'),(112,'Kailez Wisozl',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:42','2011-09-13 04:32:42'),(113,'Duanf Hanseo',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:46','2011-09-13 04:32:46'),(114,'Herberu Spences',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:46','2011-09-13 04:32:46'),(115,'Rolff Eichmano',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:49','2011-09-13 04:32:49'),(116,'Kalj Corwio',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:49','2011-09-13 04:32:49'),(117,'Jackz Rolfsoo',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:54','2011-09-13 04:32:54'),(118,'Marilif Kelles',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:54','2011-09-13 04:32:54'),(119,'Joo Toz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:58','2011-09-13 04:32:58'),(120,'Rachem Ankundinh',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-08 04:32:58','2011-09-13 04:32:58');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_data_objects`
--

DROP TABLE IF EXISTS `agents_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with data objects in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_data_objects`
--

LOCK TABLES `agents_data_objects` WRITE;
/*!40000 ALTER TABLE `agents_data_objects` DISABLE KEYS */;
INSERT INTO `agents_data_objects` VALUES (2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0),(10,3,1,0),(11,3,1,0),(12,3,1,0),(13,3,1,0),(14,3,1,0),(15,3,1,0),(16,3,1,0),(17,3,1,0),(18,3,1,0),(19,3,1,0),(20,3,1,0),(21,3,1,0),(22,3,1,0),(23,3,1,0),(24,3,1,0),(25,3,1,0),(26,3,1,0),(27,3,1,0),(28,3,1,0),(29,3,1,0),(30,3,1,0),(31,3,1,0),(32,3,1,0),(33,3,1,0),(34,3,1,0),(35,3,1,0),(36,3,1,0),(37,3,1,0),(38,3,1,0),(39,3,1,0),(40,3,1,0),(41,3,1,0),(42,3,1,0),(43,3,1,0),(44,3,1,0),(45,3,1,0),(46,3,1,0),(47,3,1,0),(48,3,1,0),(49,3,1,0),(50,3,1,0),(51,3,1,0),(52,3,1,0),(53,3,1,0),(54,3,1,0),(55,3,1,0),(56,3,1,0),(57,3,1,0),(58,3,1,0),(59,3,1,0),(60,3,1,0),(61,3,1,0),(62,3,1,0),(63,3,1,0),(64,3,1,0),(65,3,1,0),(66,3,1,0),(67,3,1,0),(68,3,1,0),(69,3,1,0),(70,3,1,0),(71,3,1,0),(72,3,1,0),(73,3,1,0),(74,3,1,0),(75,3,1,0),(76,3,1,0),(77,3,1,0),(78,3,1,0),(79,3,1,0),(80,3,1,0),(81,3,1,0),(82,3,1,0),(83,3,1,0),(84,3,1,0),(85,3,1,0),(86,3,1,0),(87,3,1,0),(88,3,1,0),(89,3,1,0),(92,10,1,0),(93,10,1,0),(94,10,1,0),(95,10,1,0),(96,10,1,0),(97,10,1,0),(98,10,1,0),(99,10,1,0),(100,10,1,0),(101,3,1,0),(102,3,1,0),(103,3,1,0),(104,3,1,0),(105,3,1,0),(106,3,1,0),(107,3,1,0),(108,3,1,0),(109,3,1,0),(110,3,1,0),(111,3,1,0),(112,3,1,0),(113,3,1,0),(114,3,1,0),(115,3,1,0),(116,3,1,0),(117,3,1,0),(118,3,1,0),(119,3,1,0),(120,3,1,0),(121,3,1,0),(122,3,1,0),(123,3,1,0),(124,3,1,0),(125,3,1,0),(126,3,1,0),(127,3,1,0),(128,3,1,0),(129,3,1,0),(130,3,1,0),(131,3,1,0),(132,3,1,0),(133,3,1,0),(134,3,1,0),(135,3,1,0),(136,3,1,0),(137,3,1,0),(138,3,1,0),(139,3,1,0),(140,3,1,0),(141,3,1,0),(142,3,1,0),(143,3,1,0),(144,3,1,0),(145,3,1,0),(146,3,1,0),(147,3,1,0),(148,3,1,0),(149,3,1,0),(150,3,1,0),(151,3,1,0),(152,3,1,0),(153,3,1,0),(154,3,1,0),(155,3,1,0),(156,3,1,0),(157,3,1,0),(158,3,1,0),(159,3,1,0),(160,3,1,0),(161,3,1,0),(162,3,1,0),(163,3,1,0),(164,3,1,0),(165,3,1,0),(166,3,1,0),(167,3,1,0),(168,3,1,0),(169,3,1,0),(170,3,1,0),(171,3,1,0),(172,3,1,0),(173,3,1,0),(174,3,1,0),(175,3,1,0),(176,3,1,0),(177,3,1,0),(178,3,1,0),(179,3,1,0),(180,3,1,0),(181,3,1,0),(182,3,1,0),(183,3,1,0),(184,3,1,0),(185,3,1,0),(186,3,1,0),(187,3,1,0),(188,3,1,0),(189,3,1,0),(190,3,1,0),(191,3,1,0),(192,3,1,0),(193,3,1,0),(194,3,1,0),(195,3,1,0),(196,3,1,0),(197,3,1,0),(198,3,1,0),(199,3,1,0),(200,3,1,0),(201,3,1,0),(202,3,1,0),(203,3,1,0),(204,3,1,0),(205,3,1,0),(206,3,1,0),(207,3,1,0),(208,3,1,0),(209,3,1,0),(210,3,1,0),(211,3,1,0),(212,3,1,0),(213,3,1,0),(214,3,1,0),(215,3,1,0),(216,3,1,0),(217,3,1,0),(218,3,1,0),(219,3,1,0),(220,3,1,0),(221,3,1,0),(222,3,1,0),(223,3,1,0),(224,3,1,0),(225,3,1,0),(226,3,1,0),(227,3,1,0),(228,3,1,0),(229,3,1,0),(230,3,1,0),(231,3,1,0),(232,3,1,0),(233,3,1,0),(234,3,1,0),(235,3,1,0),(236,10,1,0),(237,10,1,0),(238,10,1,0),(239,10,1,0),(240,10,1,0),(241,10,1,0),(242,10,1,0),(243,10,1,0),(244,10,1,0),(245,10,1,0),(246,10,1,0),(247,10,1,0),(248,10,1,0),(249,10,1,0),(250,10,1,0),(251,10,1,0),(252,10,1,0),(253,10,1,0),(254,10,1,0),(255,10,1,0),(256,10,1,0),(257,10,1,0),(258,10,1,0),(259,10,1,0),(260,10,1,0),(261,10,1,0),(262,10,1,0),(263,10,1,0),(264,10,1,0),(265,10,1,0),(266,10,1,0),(267,10,1,0),(268,10,1,0),(269,10,1,0),(270,10,1,0),(271,10,1,0),(272,10,1,0),(273,10,1,0),(274,10,1,0),(275,10,1,0),(276,10,1,0),(277,10,1,0),(278,10,1,0),(279,10,1,0),(280,10,1,0),(281,10,1,0),(282,10,1,0),(283,10,1,0),(284,10,1,0),(285,10,1,0),(286,10,1,0),(287,10,1,0),(288,10,1,0),(289,10,1,0),(290,10,1,0),(291,10,1,0),(292,10,1,0),(293,10,1,0),(294,10,1,0),(295,10,1,0),(296,10,1,0),(297,10,1,0),(298,10,1,0),(299,10,1,0),(300,10,1,0),(301,10,1,0);
/*!40000 ALTER TABLE `agents_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_hierarchy_entries`
--

DROP TABLE IF EXISTS `agents_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with hierarchy entries in various role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_hierarchy_entries`
--

LOCK TABLES `agents_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `agents_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_synonyms`
--

DROP TABLE IF EXISTS `agents_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_synonyms` (
  `synonym_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`synonym_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with synonyms in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_synonyms`
--

LOCK TABLES `agents_synonyms` WRITE;
/*!40000 ALTER TABLE `agents_synonyms` DISABLE KEYS */;
INSERT INTO `agents_synonyms` VALUES (1,1,3,1),(2,3,3,1),(3,1,3,1),(4,3,3,1),(5,1,3,1),(6,3,3,1),(7,1,3,1),(8,3,3,1),(9,1,3,1),(10,3,3,1),(11,1,3,1),(12,3,3,1),(13,1,3,1),(14,3,3,1),(15,3,3,1),(16,3,3,1),(17,3,3,1),(18,3,3,1),(19,3,3,1),(20,1,3,1),(21,3,3,1),(22,1,3,1),(23,1,3,1),(24,3,3,1),(25,3,3,1),(26,1,3,1),(27,1,3,1),(28,3,3,1),(29,3,3,1),(30,3,3,1),(31,1,3,1),(32,3,3,1),(33,1,3,1),(34,3,3,1),(35,1,3,1),(36,3,3,1),(37,1,3,1),(38,3,3,1),(39,1,3,1),(40,3,3,1),(41,1,3,1),(42,3,3,1),(43,1,3,1),(44,3,3,1),(45,1,3,1),(46,3,3,1),(47,1,3,1),(48,3,3,1),(49,1,3,1),(50,1,3,1),(51,3,3,1),(52,3,3,1),(53,3,3,1),(54,3,3,1),(55,3,3,1),(56,3,3,1),(57,3,3,1),(58,3,3,1),(59,3,3,1),(60,3,3,1),(61,1,3,1),(62,3,3,1),(63,1,3,1),(64,3,3,1),(65,1,3,1),(66,3,3,1),(67,1,3,1),(68,3,3,1),(69,1,3,1),(70,3,3,1),(71,1,3,1),(72,1,3,1),(73,3,3,1),(74,1,3,1),(75,1,3,1),(76,1,3,1),(77,1,3,1),(78,1,3,1),(79,1,3,1),(80,1,3,1),(81,3,3,1),(82,1,3,1),(83,3,3,1),(84,1,3,1),(85,3,3,1),(86,1,3,1),(87,3,3,1),(88,1,3,1),(89,1,3,1),(90,1,3,1),(91,3,3,1),(92,1,3,1),(93,3,3,1),(94,1,3,1),(95,1,3,1),(96,3,3,1),(97,1,3,1),(98,3,3,1),(99,1,3,1),(100,1,3,1);
/*!40000 ALTER TABLE `agents_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Controlled list for determining the "expertise" of a data ob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
INSERT INTO `audiences` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences_data_objects`
--

DROP TABLE IF EXISTS `audiences_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `audience_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`audience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A data object can have zero to many target audiences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences_data_objects`
--

LOCK TABLES `audiences_data_objects` WRITE;
/*!40000 ALTER TABLE `audiences_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiences_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canonical_forms`
--

DROP TABLE IF EXISTS `canonical_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canonical_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(300) NOT NULL COMMENT 'a canonical form of a scientific name is the name parts without authorship, rank information, or anthing except the latinized name parts. These are for the most part algorithmically generated',
  `name_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(255)),
  KEY `index_canonical_forms_on_name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='Every name string has one canonical form - a simplified vers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonical_forms`
--

LOCK TABLES `canonical_forms` WRITE;
/*!40000 ALTER TABLE `canonical_forms` DISABLE KEYS */;
INSERT INTO `canonical_forms` VALUES (1,'Animalia',NULL),(2,'Animalia',NULL),(3,'Animals',NULL),(4,'Autrecusandaees repudiandaeica',NULL),(5,'ravenous clover',NULL),(6,'Nihileri voluptasus',NULL),(7,'red suntus',NULL),(8,'Dignissimosii inutes',NULL),(9,'darning needle',NULL),(10,'Fugais utharumatus',NULL),(11,'tiger',NULL),(12,'Minuseli ullamens',NULL),(13,'Tiger moth',NULL),(14,'Dignissimosatus nobisosyne',NULL),(15,'Tiger lilly',NULL),(16,'Tiger water lilly',NULL),(17,'lilly of the tiger',NULL),(18,'Tiger flower',NULL),(19,'Tiger-stripe lilly',NULL),(20,'Tiger-eye lilly',NULL),(21,'Expeditaalia evenietelia',NULL),(22,'Earumeles\n    beataeata',NULL),(23,'Culpaensis sapienteesi',NULL),(24,'frizzlebek',NULL),(25,'Utomnisesi sequialis',NULL),(26,'purple dust crab',NULL),(27,'Autaliquideri minimais',NULL),(28,'Autema officiaalius',NULL),(29,'wumpus',NULL),(30,'wompus',NULL),(31,'wampus',NULL),(32,'Eukaryota',NULL),(33,'eukaryotes',NULL),(34,'Metazoa',NULL),(35,'opisthokonts',NULL),(36,'Autemalius utsimiliqueesi',NULL),(37,'cloud swallow',NULL),(38,'Etconsequaturelia autenimalia',NULL),(39,'spiny possom',NULL),(40,'Quoautesi natuseri',NULL),(41,'common desert mouse',NULL),(42,'Voluptatumeri esseensis',NULL),(43,'fisher',NULL),(44,'Ameti maioresis',NULL),(45,'chartruse turtle',NULL),(46,'Ipsamalius distinctioerox',NULL),(47,'horny toad',NULL),(48,'Maximees veritatisatus',NULL),(49,'scarlet vermillion',NULL),(50,'Molestiaeus\n    rationealia',NULL),(51,'Mozart\'s nemesis',NULL),(52,'Bacteria',NULL),(53,'bugs',NULL),(54,'grime',NULL),(55,'critters',NULL),(56,'bakteria',NULL),(57,'die buggen',NULL),(58,'das greim',NULL),(59,'baseteir',NULL),(60,'le grimme',NULL),(61,'ler petit bugge',NULL),(62,'Fugitens dolorealius',NULL),(63,'quick brown fox',NULL),(64,'Quisquamator sequieles',NULL),(65,'painted horse',NULL),(66,'Essees eaqueata',NULL),(67,'thirsty aphid',NULL),(68,'Animiens atdoloribuseron',NULL),(69,'bloody eel',NULL),(70,'Fungi',NULL),(71,'Mushrooms, sac fungi, lichens, yeast, molds, rusts, etc.',NULL),(72,'Chromista',NULL),(73,'Plantae',NULL),(74,'Plants',NULL),(75,'Amanitaceae',NULL),(76,'Amanita',NULL),(77,'Nephropidae',NULL),(78,'Dinochelus',NULL),(79,'Raphidophyceae',NULL),(80,'Haramonas',NULL),(81,'Canidae',NULL),(82,'Coyotes, dogs, foxes, jackals, and wolves',NULL),(83,'Canis',NULL),(84,'Wolf',NULL),(85,'Pinaceae ',NULL),(86,'Pine trees',NULL),(87,'Pinus ',NULL),(88,'Pine',NULL),(89,'Formicidae',NULL),(90,'Anochetus',NULL),(91,'Amanita muscaria',NULL),(92,'Fly Agaric',NULL),(93,'Dinochelus ausubeli',NULL),(94,'Ausubel\'s Mighty Claws Lobster',NULL),(95,'Haramonas dimorpha',NULL),(96,'Canis lupus',NULL),(97,'Pinus strobus',NULL),(98,'Eastern white pine',NULL),(99,'Anochetus mayri',NULL);
/*!40000 ALTER TABLE `canonical_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeable_object_types`
--

DROP TABLE IF EXISTS `changeable_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeable_object_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ch_object_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeable_object_types`
--

LOCK TABLES `changeable_object_types` WRITE;
/*!40000 ALTER TABLE `changeable_object_types` DISABLE KEYS */;
INSERT INTO `changeable_object_types` VALUES (1,'comment','2011-09-13 07:27:19','2011-09-13 07:27:19'),(2,'data_object','2011-09-13 07:27:19','2011-09-13 07:27:19'),(3,'synonym','2011-09-13 07:27:19','2011-09-13 07:27:19'),(4,'taxon_concept_name','2011-09-13 07:27:19','2011-09-13 07:27:19'),(5,'tag','2011-09-13 07:27:19','2011-09-13 07:27:19'),(6,'users_data_object','2011-09-13 07:27:19','2011-09-13 07:27:19'),(7,'hierarchy_entry','2011-09-13 07:27:19','2011-09-13 07:27:19'),(8,'curated_data_objects_hierarchy_entry','2011-09-13 07:27:19','2011-09-13 07:27:19'),(9,'data_objects_hierarchy_entry','2011-09-13 07:27:19','2011-09-13 07:27:19'),(10,'TaxonConcept','2011-09-13 07:27:45','2011-09-13 07:27:45');
/*!40000 ALTER TABLE `changeable_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items`
--

DROP TABLE IF EXISTS `collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `annotation` text,
  `added_by_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id_object_type_object_id` (`collection_id`,`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items`
--

LOCK TABLES `collection_items` WRITE;
/*!40000 ALTER TABLE `collection_items` DISABLE KEYS */;
INSERT INTO `collection_items` VALUES (1,'<i>Amanita muscaria</i> (L. ex Fr.) Hook.','TaxonConcept',2866150,4,'2011-09-13 07:33:03','2011-09-13 07:33:03',NULL,NULL),(2,'<i>Amanita muscaria</i> (L. ex Fr.) Hook.','TaxonConcept',2866150,5,'2011-09-13 07:33:03','2011-09-13 07:33:03',NULL,NULL),(3,'Soluta voluptate ut corporis.','DataObject',269,5,'2011-09-13 07:33:03','2011-09-13 07:33:03',NULL,NULL),(4,'<p> Communément appelé la vol','DataObject',273,5,'2011-09-13 07:33:04','2011-09-13 07:33:04',NULL,NULL),(5,'<i>Dinochelus ausubeli</i> Ahyong, Chan & Bouchet, 2010','TaxonConcept',17924149,4,'2011-09-13 07:33:04','2011-09-13 07:33:04',NULL,NULL),(6,'<i>Dinochelus ausubeli</i> Ahyong, Chan & Bouchet, 2010','TaxonConcept',17924149,5,'2011-09-13 07:33:04','2011-09-13 07:33:04',NULL,NULL),(7,'Labore temporibus animi est.','DataObject',277,5,'2011-09-13 07:33:04','2011-09-13 07:33:04',NULL,NULL),(8,'Dinochelus ausubeli is a new spe...','DataObject',279,5,'2011-09-13 07:33:04','2011-09-13 07:33:04',NULL,NULL),(9,'<i>Haramonas dimorpha</i> Horiguchi','TaxonConcept',921737,4,'2011-09-13 07:33:05','2011-09-13 07:33:05',NULL,NULL),(10,'<i>Haramonas dimorpha</i> Horiguchi','TaxonConcept',921737,5,'2011-09-13 07:33:05','2011-09-13 07:33:05',NULL,NULL),(11,'Ea quia nemo occaecati odio aut....','DataObject',281,5,'2011-09-13 07:33:05','2011-09-13 07:33:05',NULL,NULL),(12,'Haramonas (ha-ra-moan-ass) dimor...','DataObject',283,5,'2011-09-13 07:33:05','2011-09-13 07:33:05',NULL,NULL),(13,'<i>Canis lupus</i> Linnaeus, 1758','TaxonConcept',328607,4,'2011-09-13 07:33:06','2011-09-13 07:33:06',NULL,NULL),(14,'<i>Canis lupus</i> Linnaeus, 1758','TaxonConcept',328607,5,'2011-09-13 07:33:06','2011-09-13 07:33:06',NULL,NULL),(15,'Amet magnam ut consequatur.','DataObject',287,5,'2011-09-13 07:33:06','2011-09-13 07:33:06',NULL,NULL),(16,'%q{<p>Gray wolves usually live i...','DataObject',289,5,'2011-09-13 07:33:06','2011-09-13 07:33:06',NULL,NULL),(17,'<i>Pinus strobus</i> L.','TaxonConcept',1061748,4,'2011-09-13 07:33:07','2011-09-13 07:33:07',NULL,NULL),(18,'<i>Pinus strobus</i> L.','TaxonConcept',1061748,5,'2011-09-13 07:33:07','2011-09-13 07:33:07',NULL,NULL),(19,'Illo ratione et et deserunt enim...','DataObject',293,5,'2011-09-13 07:33:07','2011-09-13 07:33:07',NULL,NULL),(20,'<p>Pinus strobus, the Eastern Wh...','DataObject',295,5,'2011-09-13 07:33:07','2011-09-13 07:33:07',NULL,NULL),(21,'<i>Anochetus mayri</i> Emery, 1884','TaxonConcept',491753,4,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(22,'<i>Anochetus mayri</i> Emery, 1884','TaxonConcept',491753,5,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(23,'Laudantium ducimus adipisci magn...','DataObject',299,5,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(24,'Anochetus are presumably predato...','DataObject',301,5,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(25,'Fiona Parisian','User',3,5,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(26,'Roxane Connelly','User',4,5,'2011-09-13 07:33:08','2011-09-13 07:33:08',NULL,NULL),(27,'Mariana Runolfsson','User',5,5,'2011-09-13 07:33:09','2011-09-13 07:33:09',NULL,NULL),(28,'Columbia Intro Biology','Community',1,5,'2011-09-13 07:33:09','2011-09-13 07:33:09',NULL,NULL);
/*!40000 ALTER TABLE `collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types`
--

DROP TABLE IF EXISTS `collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `lft` smallint(5) unsigned DEFAULT NULL,
  `rgt` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types`
--

LOCK TABLES `collection_types` WRITE;
/*!40000 ALTER TABLE `collection_types` DISABLE KEYS */;
INSERT INTO `collection_types` VALUES (1,0,0,1),(2,0,2,3),(3,0,4,9),(4,3,5,6),(5,3,7,8),(6,0,10,17),(7,6,11,12),(8,6,13,14),(9,6,15,16),(10,0,18,19),(11,0,20,21);
/*!40000 ALTER TABLE `collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_collections`
--

DROP TABLE IF EXISTS `collection_types_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_collections` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `collection_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`collection_id`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_collections`
--

LOCK TABLES `collection_types_collections` WRITE;
/*!40000 ALTER TABLE `collection_types_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_types_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_hierarchies`
--

DROP TABLE IF EXISTS `collection_types_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_hierarchies` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `hierarchy_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`hierarchy_id`),
  KEY `collection_id` (`hierarchy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_hierarchies`
--

LOCK TABLES `collection_types_hierarchies` WRITE;
/*!40000 ALTER TABLE `collection_types_hierarchies` DISABLE KEYS */;
INSERT INTO `collection_types_hierarchies` VALUES (1,2),(2,2),(4,14),(9,14),(11,14),(7,15),(10,15);
/*!40000 ALTER TABLE `collection_types_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `special_collection_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `description` text,
  `sort_style_id` int(11) DEFAULT NULL,
  `relevance` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'Alvah Wisozk\'s Watch List',NULL,32,2,1,'2011-09-13 07:28:54','2011-09-13 07:28:54',NULL,NULL,NULL,0,NULL,NULL,1),(2,'Ralph Wiggum\'s Watch List',NULL,35,2,1,'2011-09-13 07:29:01','2011-09-13 07:29:01',NULL,NULL,NULL,0,NULL,NULL,1),(3,'Admin User\'s Watch List',NULL,37,2,1,'2011-09-13 07:29:03','2011-09-13 07:29:03',NULL,NULL,NULL,0,NULL,NULL,1),(4,'Voluptatem Laboriosam Quam Unique18string',1,NULL,NULL,1,'2011-09-13 07:33:03','2011-09-13 07:33:08',201107131234217,NULL,NULL,0,NULL,7,29),(5,'New Species from the Census of Marine Life',NULL,2,NULL,1,'2011-09-13 07:33:03','2011-09-13 07:33:08',201107131204367,NULL,NULL,0,NULL,8,23);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `visible_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `from_curator` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_parent_id` (`parent_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:45','2011-09-13 07:31:33','2011-09-13 07:31:33',0),(2,5,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:46','2011-09-13 06:31:33','2011-09-13 07:31:33',0),(3,6,2,'DataObject','Iste suscipit voluptas quaerat sunt et placeat ex. Minus ipsum qui rerum enim iusto ut. Itaque quae aut dignissimos earum. Nam voluptatem autem nemo deserunt distinctio.','2011-09-13 07:27:46','2011-09-13 05:31:33','2011-09-13 07:31:33',0),(4,6,3,'DataObject','Perferendis est laborum qui nemo aspernatur. Unde est ex rerum officiis quas. Laborum voluptatem expedita laudantium.','2011-09-13 07:27:48','2011-09-13 04:31:34','2011-09-13 07:31:34',0),(5,6,7,'DataObject','Qui cum nisi dicta. Iste dolores velit animi. Velit et aperiam natus ut aut voluptatem. Possimus repellat totam quisquam illo laborum ducimus.','2011-09-13 07:27:49','2011-09-13 03:31:34','2011-09-13 07:31:34',0),(6,6,8,'DataObject','Quibusdam voluptatem qui eius assumenda fugiat aut error esse. Eum consequatur in inventore quia sunt ea minus expedita. Facere maiores aliquam consequatur autem. Ab quia illum quidem. Quia enim aperiam dolorem quae non quidem nesciunt.','2011-09-13 07:27:50','2011-09-13 02:31:34','2011-09-13 07:31:34',0),(7,6,9,'DataObject','Et provident quasi praesentium eligendi ut eius quis ipsum. Qui ducimus illo adipisci sapiente architecto asperiores deserunt. Ea est labore eum ducimus quod voluptatibus enim laboriosam.','2011-09-13 07:27:50','2011-09-13 01:31:34','2011-09-13 07:31:34',0),(8,6,10,'DataObject','Eum quam sit deleniti magni dolor. Quisquam facere corrupti minima rerum cumque consequatur. Ad et eum eos facilis soluta quidem sit et.','2011-09-13 07:27:50','2011-09-13 00:31:34','2011-09-13 07:31:34',0),(9,8,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:53','2011-09-12 23:31:34','2011-09-13 07:31:34',0),(10,2,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:53','2011-09-12 22:31:34','2011-09-13 07:31:34',0),(11,8,11,'DataObject','Vero minus alias labore. Reprehenderit quo veritatis est quibusdam nemo adipisci ea. Aut molestiae dolor est.','2011-09-13 07:27:54','2011-09-12 21:31:34','2011-09-13 07:31:34',0),(12,8,12,'DataObject','Nesciunt dolor perferendis sed corrupti quos. Esse est nihil eos. Aut qui tempore autem. In nihil reprehenderit distinctio fugiat eum earum non quis.','2011-09-13 07:27:54','2011-09-12 20:31:34','2011-09-13 07:31:34',0),(13,8,16,'DataObject','Aut dolorum exercitationem quisquam ea in. Et necessitatibus voluptatem fugit. Eos qui explicabo natus et vero laboriosam nisi et.','2011-09-13 07:27:55','2011-09-12 19:31:34','2011-09-13 07:31:34',0),(14,8,17,'DataObject','Praesentium animi est suscipit omnis nam alias non. Qui necessitatibus perferendis reiciendis modi possimus quod. Itaque maiores quod deleniti occaecati tempore ut accusantium. Architecto quia est natus repellendus atque rerum.','2011-09-13 07:27:56','2011-09-12 18:31:34','2011-09-13 07:31:34',0),(15,8,18,'DataObject','Corporis aliquid ipsum exercitationem. Neque temporibus perferendis iure autem aut. Commodi magnam nemo nam.','2011-09-13 07:27:56','2011-09-12 17:31:34','2011-09-13 07:31:34',0),(16,8,19,'DataObject','Autem et repellendus dolore perspiciatis. Animi quo ut magnam. Libero quia quasi voluptates. Consequuntur sapiente quae in iste.','2011-09-13 07:27:57','2011-09-12 16:31:34','2011-09-13 07:31:34',0),(17,4,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:59','2011-09-12 15:31:34','2011-09-13 07:31:34',0),(18,6,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:27:59','2011-09-12 14:31:34','2011-09-13 07:31:34',0),(19,10,20,'DataObject','Adipisci eos velit illum. Aut facere tempore et repellendus qui tempora. Aut ratione voluptatum est sint incidunt quo. Debitis non rem veniam magni blanditiis delectus ut perferendis.','2011-09-13 07:28:00','2011-09-12 13:31:34','2011-09-13 07:31:34',0),(20,10,21,'DataObject','Ullam nostrum dolor porro dolorum dolorem est. Saepe corporis assumenda eum quia et sit odit voluptas. Eius corrupti eveniet qui explicabo rerum et. Tempora quia corrupti fuga tempore error eum. Exercitationem porro excepturi ab iste quia.','2011-09-13 07:28:00','2011-09-12 12:31:34','2011-09-13 07:31:34',0),(21,10,25,'DataObject','Aut qui vel fuga sed quo. Qui eius quisquam aut quidem qui voluptatem non. Occaecati et ratione modi.','2011-09-13 07:28:02','2011-09-12 11:31:34','2011-09-13 07:31:34',0),(22,10,26,'DataObject','Itaque error vel dolor minus. Quis dolor quo repudiandae sequi. Similique repellendus ex dolor odio inventore vel atque. Molestiae commodi ab doloremque suscipit nobis et tempora omnis.','2011-09-13 07:28:02','2011-09-12 10:31:34','2011-09-13 07:31:34',0),(23,10,27,'DataObject','Ut ducimus assumenda sit deserunt est impedit reprehenderit. Quibusdam temporibus non et aut. Dolor nisi assumenda dolore. Dolorem hic corporis eos earum reiciendis velit voluptatem voluptas. Maiores officiis autem voluptatibus nostrum at libero consequatur architecto.','2011-09-13 07:28:02','2011-09-12 09:31:34','2011-09-13 07:31:34',0),(24,10,28,'DataObject','Non sed omnis nobis rerum et ipsum. Rem distinctio qui ab eius dolores id est deserunt. Quia ut magnam accusamus.','2011-09-13 07:28:03','2011-09-12 08:31:35','2011-09-13 07:31:35',0),(25,3,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:05','2011-09-12 07:31:35','2011-09-13 07:31:35',0),(26,12,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:05','2011-09-12 06:31:35','2011-09-13 07:31:35',0),(27,12,29,'DataObject','Vel sequi quis architecto repellendus in. Et deserunt sed sint sunt blanditiis in. Distinctio aliquid aperiam minus architecto et at. A ea provident veritatis voluptatum. Totam non molestiae et recusandae sed perferendis alias laborum.','2011-09-13 07:28:06','2011-09-12 05:31:35','2011-09-13 07:31:35',0),(28,12,30,'DataObject','Incidunt reprehenderit dolores sit ut nostrum est hic. Voluptate fugit non maiores temporibus. Accusantium dignissimos ipsam quidem. Quos et eos aut ut enim quis repudiandae vel.','2011-09-13 07:28:06','2011-09-12 04:31:35','2011-09-13 07:31:35',0),(29,12,34,'DataObject','Distinctio exercitationem alias quia dolor. Consequatur quidem fugit aut illum voluptatum. Voluptates quis tenetur vel voluptatum commodi rem consequatur quaerat. In nemo voluptatem et. Ipsum ut modi nulla natus qui.','2011-09-13 07:28:07','2011-09-12 03:31:35','2011-09-13 07:31:35',0),(30,12,35,'DataObject','Eos totam quis ducimus voluptate harum ut vitae. Facere accusamus assumenda illum velit nihil dignissimos autem. At sit nihil commodi excepturi soluta sed eveniet blanditiis. Itaque nisi velit sit iure voluptatem ab.','2011-09-13 07:28:08','2011-09-12 02:31:35','2011-09-13 07:31:35',0),(31,12,36,'DataObject','Blanditiis dolorem earum non rerum. Qui voluptas harum illum ut ab voluptatem. Voluptas atque aut aut illum rem eum voluptatem quia. Vel aliquid et quae exercitationem doloremque totam.','2011-09-13 07:28:08','2011-09-12 01:31:35','2011-09-13 07:31:35',0),(32,12,37,'DataObject','Cupiditate voluptatem est qui perspiciatis in. In odit est ut unde. Eum doloremque expedita beatae. Ab atque ea numquam libero iusto ratione dolorum explicabo.','2011-09-13 07:28:09','2011-09-12 00:31:35','2011-09-13 07:31:35',0),(33,13,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:11','2011-09-11 23:31:35','2011-09-13 07:31:35',0),(34,12,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:11','2011-09-11 22:31:35','2011-09-13 07:31:35',0),(35,14,38,'DataObject','Voluptas dolore molestiae similique dolorem. Et exercitationem mollitia eum. Illum dolores consequatur ab fugiat voluptatem omnis. Id et ipsam maxime.','2011-09-13 07:28:12','2011-09-11 21:31:35','2011-09-13 07:31:35',0),(36,14,39,'DataObject','Atque voluptatum aut quam impedit. Incidunt veniam officia non unde doloribus nostrum aut. Eum voluptatem labore est nesciunt dolor sed aut eveniet.','2011-09-13 07:28:12','2011-09-11 20:31:35','2011-09-13 07:31:35',0),(37,14,43,'DataObject','Repudiandae dolorem amet illo quaerat sit. Autem voluptate et necessitatibus non et. Aut est qui ipsa sit enim reprehenderit quis et. Assumenda quod nesciunt dolores debitis ut ut. Aut consequatur natus aspernatur quo adipisci.','2011-09-13 07:28:14','2011-09-11 19:31:36','2011-09-13 07:31:36',0),(38,14,44,'DataObject','Qui quam autem quos odit molestias. Et sunt repudiandae est voluptatem. Nam repudiandae quasi iusto provident ex voluptas omnis autem.','2011-09-13 07:28:14','2011-09-11 18:31:36','2011-09-13 07:31:36',0),(39,14,45,'DataObject','Explicabo asperiores iste corrupti soluta et laudantium voluptatem deleniti. Commodi eaque laborum eum placeat modi possimus et. Minima laborum ut quisquam. Sint pariatur doloremque natus. Dolores quibusdam aut illo et ut earum.','2011-09-13 07:28:14','2011-09-11 17:31:36','2011-09-13 07:31:36',0),(40,14,46,'DataObject','Aliquid eum nostrum magni ut. Numquam aut magni ipsum veniam natus. Adipisci temporibus distinctio quis asperiores repudiandae eius omnis cupiditate. Rerum consequuntur asperiores in error voluptas sit laborum. Consequatur qui minima ducimus dolorem qui nobis et.','2011-09-13 07:28:15','2011-09-11 16:31:36','2011-09-13 07:31:36',0),(41,5,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:17','2011-09-11 15:31:36','2011-09-13 07:31:36',0),(42,13,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:17','2011-09-11 14:31:36','2011-09-13 07:31:36',0),(43,16,47,'DataObject','Et alias minus voluptatibus dolor accusamus illum culpa sunt. Distinctio et incidunt dolores unde amet qui recusandae. Porro quo sint repudiandae vero dolores similique. Dolore sit ab nulla voluptatem ut.','2011-09-13 07:28:18','2011-09-11 13:31:36','2011-09-13 07:31:36',0),(44,16,47,'DataObject','Adipisci minus nihil culpa exercitationem pariatur ipsam. Doloremque ullam reprehenderit blanditiis repellendus animi laudantium. Delectus voluptates minus ullam. Et ipsa dolores alias. Quaerat odio optio quas ipsam id est.','2011-09-13 07:28:18','2011-09-11 12:31:36','2011-09-13 07:31:36',0),(45,16,47,'DataObject','Aliquam cum nihil et quas ipsam. Iste explicabo ab voluptate. Aut dicta occaecati magnam est velit ut.','2011-09-13 07:28:18','2011-09-11 11:31:36','2011-09-13 07:31:36',0),(46,16,47,'DataObject','Ut quae sit quia optio et eveniet dolor. Necessitatibus ut et ipsam. Doloremque minus et rem quibusdam ab quaerat.','2011-09-13 07:28:18','2011-09-11 10:31:36','2011-09-13 07:31:36',0),(47,16,47,'DataObject','Iusto eligendi nihil modi. Nostrum ut expedita porro. Ipsum dolores aut hic ex necessitatibus enim sed. Sunt ab itaque maiores nulla et ea culpa.','2011-09-13 07:28:18','2011-09-11 09:31:36','2011-09-13 07:31:36',0),(48,16,47,'DataObject','Est amet numquam tempora nobis aspernatur. Quod eum quas perspiciatis vero voluptatum. Aspernatur ipsa repudiandae iste tempora.','2011-09-13 07:28:18','2011-09-11 08:31:36','2011-09-13 07:31:36',0),(49,16,47,'DataObject','Nostrum temporibus aspernatur et officia reiciendis aut dolorem. Distinctio eveniet nulla assumenda minus. Optio eligendi tenetur quia vel sapiente atque.','2011-09-13 07:28:18','2011-09-11 07:31:36','2011-09-13 07:31:36',0),(50,16,47,'DataObject','In dignissimos praesentium voluptatem soluta velit. Tenetur quaerat consequatur maxime harum qui provident aut. Voluptate amet ratione ab animi rem qui quae. Itaque non maxime laudantium. Quia fugit eum placeat odit dicta deserunt.','2011-09-13 07:28:18','2011-09-11 06:31:36','2011-09-13 07:31:36',0),(51,16,47,'DataObject','Non consequatur provident veritatis corporis id harum repudiandae qui. Dolor repudiandae et deleniti. Pariatur eos soluta nesciunt tenetur illum at corporis. Esse sed qui sit voluptatem.','2011-09-13 07:28:18','2011-09-11 05:31:36','2011-09-13 07:31:36',0),(52,16,47,'DataObject','Voluptatibus quia sint nihil enim. Alias aspernatur placeat repudiandae est doloremque. Rem iure voluptatem accusantium omnis quibusdam dolores.','2011-09-13 07:28:19','2011-09-11 04:31:36','2011-09-13 07:31:36',0),(53,16,47,'DataObject','Laborum aut doloribus et ea aut eum officia. Consequatur doloribus est assumenda alias pariatur. Praesentium iusto doloribus sed numquam aut adipisci magni. Dignissimos dolore odio assumenda alias at. Sint in voluptatem libero molestiae.','2011-09-13 07:28:19','2011-09-11 03:31:36','2011-09-13 07:31:36',0),(54,16,47,'DataObject','Ipsum voluptatem officia rem. Laboriosam illum impedit est odit. Odio et rerum qui sunt dolor est enim.','2011-09-13 07:28:19','2011-09-11 02:31:36','2011-09-13 07:31:36',0),(55,16,48,'DataObject','Asperiores vitae doloribus distinctio consequuntur est omnis. Et nulla minima repellat voluptas earum. Sed voluptates iusto quia dolor debitis nemo blanditiis. Voluptate odio sit et officia amet nihil accusamus ut.','2011-09-13 07:28:19','2011-09-11 01:31:37','2011-09-13 07:31:37',0),(56,16,49,'DataObject','Qui eius dignissimos possimus. Nisi totam aliquam est quasi consequatur adipisci ipsum. Necessitatibus odio quisquam unde aut et aut voluptatum. Provident iste quo magni. Maxime velit in laboriosam voluptas et suscipit.','2011-09-13 07:28:19','2011-09-11 00:31:37','2011-09-13 07:31:37',0),(57,16,50,'DataObject','Similique nam et autem. Animi ut in est porro vel inventore velit quasi. Impedit est doloribus rerum at nemo omnis pariatur aliquid. Odit id qui aliquid autem fuga accusantium. Placeat quia et provident pariatur facilis assumenda et.','2011-09-13 07:28:21','2011-09-10 23:31:37','2011-09-13 07:31:37',0),(58,16,51,'DataObject','Quam minima ut voluptas. Maxime et et ut aut. Aliquid ut perspiciatis fugit consequatur. Dolorum dolores est omnis dolorem ex. Sit beatae ea sint quas consequatur voluptatem sunt.','2011-09-13 07:28:21','2011-09-10 22:31:37','2011-09-13 07:31:37',0),(59,16,52,'DataObject','Et autem et et blanditiis omnis. In tempora aut qui eius cum nam suscipit iste. Nulla rerum qui quibusdam ut aliquam vel cumque.','2011-09-13 07:28:22','2011-09-10 21:31:37','2011-09-13 07:31:37',0),(60,16,53,'DataObject','Inventore sapiente non quia quaerat accusantium. Quia ut velit et suscipit deleniti. Voluptatem dolor suscipit iste atque quas. Voluptas consequatur veritatis odio sed.','2011-09-13 07:28:22','2011-09-10 20:31:37','2011-09-13 07:31:37',0),(61,16,54,'DataObject','Soluta nesciunt et expedita quasi ad. Asperiores sit dolor atque sed ullam quis repudiandae. Sint vero ratione provident rem. Consequuntur architecto qui sed.','2011-09-13 07:28:23','2011-09-10 19:31:37','2011-09-13 07:31:37',0),(62,16,55,'DataObject','Commodi ab vero tempora dignissimos. Molestiae temporibus beatae veniam quae et. Laudantium adipisci tempora consectetur facere. Soluta doloribus qui fugiat eveniet est.','2011-09-13 07:28:23','2011-09-10 18:31:37','2011-09-13 07:31:37',0),(63,16,59,'DataObject','Earum corrupti sed soluta explicabo. Eaque omnis earum animi. Enim animi dolore explicabo quia. Assumenda quia ullam molestiae nesciunt. Consequatur vel id est qui ut quisquam.','2011-09-13 07:28:24','2011-09-10 17:31:37','2011-09-13 07:31:37',0),(64,16,60,'DataObject','Officiis qui libero iure modi qui et nostrum. Eos natus eveniet cumque omnis quo neque sit. Blanditiis saepe nisi pariatur nesciunt harum nihil. Molestiae minima ut aliquam accusamus. Expedita non ut ab sint.','2011-09-13 07:28:25','2011-09-10 16:31:37','2011-09-13 07:31:37',0),(65,16,61,'DataObject','Reprehenderit numquam eos consequatur eveniet. Sit occaecati eos voluptatem veritatis vel et quidem. Voluptatem debitis vel quaerat voluptatem accusantium voluptate animi incidunt.','2011-09-13 07:28:25','2011-09-10 15:31:37','2011-09-13 07:31:37',0),(66,16,62,'DataObject','Nam ut aperiam in vel veritatis ut. Quos ad expedita distinctio perspiciatis. Iste dolores illo dolore dolores reprehenderit non et. In expedita accusamus et ea. Et ut omnis molestiae eos rerum nihil assumenda.','2011-09-13 07:28:26','2011-09-10 14:31:38','2011-09-13 07:31:38',0),(67,17,47,'DataObject','Second comment','2011-09-13 07:28:28','2011-09-10 13:31:38','2011-09-13 07:31:38',0),(68,17,47,'DataObject','Third comment','2011-09-13 07:28:28','2011-09-10 12:31:38','2011-09-13 07:31:38',0),(69,17,47,'DataObject','Forth comment','2011-09-13 07:28:28','2011-09-10 11:31:38','2011-09-13 07:31:38',0),(70,17,47,'DataObject','Fifth comment','2011-09-13 07:28:28','2011-09-10 10:31:38','2011-09-13 07:31:38',0),(71,17,47,'DataObject','Sixth comment','2011-09-13 07:28:29','2011-09-10 09:31:38','2011-09-13 07:31:38',0),(72,17,47,'DataObject','Seventh comment','2011-09-13 07:28:29','2011-09-10 08:31:38','2011-09-13 07:31:38',0),(73,17,47,'DataObject','Eighth comment','2011-09-13 07:28:29','2011-09-10 07:31:38','2011-09-13 07:31:38',0),(74,17,47,'DataObject','Nineth comment','2011-09-13 07:28:29','2011-09-10 06:31:38','2011-09-13 07:31:38',0),(75,17,47,'DataObject','Tenth comment','2011-09-13 07:28:29','2011-09-10 05:31:38','2011-09-13 07:31:38',0),(76,17,47,'DataObject','Eleventh comment','2011-09-13 07:28:29','2011-09-10 04:31:38','2011-09-13 07:31:38',0),(77,17,47,'DataObject','Twelveth comment','2011-09-13 07:28:29','2011-09-10 03:31:38','2011-09-13 07:31:38',0),(78,25,66,'DataObject','Architecto enim aut nam molestiae nulla. Quasi ipsa saepe quis exercitationem. Eos ut voluptatibus deserunt expedita perferendis omnis. Omnis voluptatem maxime sed pariatur aliquam quibusdam est. Ut qui accusamus aut modi dolorem.','2011-09-13 07:28:36','2011-09-10 02:31:38','2011-09-13 07:31:38',0),(79,25,66,'DataObject','Animi reiciendis cumque omnis. Repellendus corporis laudantium iste fuga mollitia molestias dicta. Eius modi recusandae officia quisquam nisi qui.','2011-09-13 07:28:36','2011-09-10 01:31:38','2011-09-13 07:31:38',0),(80,25,66,'DataObject','Quas repellendus doloremque animi repudiandae provident magnam libero nihil. Quidem accusantium vero est quae fugiat facilis quos aliquam. Est commodi voluptatem occaecati corporis quidem qui aut. Omnis iure sunt qui qui aperiam. Eos nesciunt voluptates repudiandae.','2011-09-13 07:28:36','2011-09-10 00:31:38','2011-09-13 07:31:38',0),(81,25,66,'DataObject','Occaecati molestias totam facere distinctio praesentium deserunt voluptatem. Sed laboriosam similique eum quia aut doloremque. Delectus voluptate dolorem saepe neque reiciendis rerum laboriosam dolores.','2011-09-13 07:28:37','2011-09-09 23:31:38','2011-09-13 07:31:38',0),(82,25,66,'DataObject','Quas omnis consequatur nesciunt id voluptatum unde nemo. Sequi culpa omnis commodi veniam quaerat quod rem tempore. Consequatur blanditiis excepturi enim. Rem dolor reiciendis dolores natus voluptas illum.','2011-09-13 07:28:37','2011-09-09 22:31:38','2011-09-13 07:31:38',0),(83,25,66,'DataObject','Odio ducimus animi consequatur suscipit. Eaque esse enim expedita dolore nobis est ipsum. Et nam qui temporibus tempora ut perspiciatis fugit. Tempore earum molestias vero. Laboriosam laborum dolorum atque rerum debitis sunt.','2011-09-13 07:28:37','2011-09-09 21:31:39','2011-09-13 07:31:39',0),(84,25,66,'DataObject','Omnis quae placeat est. Aut assumenda sint ea doloremque consequatur accusantium magni mollitia. Natus iusto consequatur non rerum. Autem iusto quam odio doloremque quibusdam vel consequatur et.','2011-09-13 07:28:37','2011-09-09 20:31:39','2011-09-13 07:31:39',0),(85,25,66,'DataObject','Aut quibusdam in nihil praesentium neque at id quasi. Inventore perferendis ut nostrum id non beatae perspiciatis voluptatem. Quo quo eum quas mollitia vel sunt. Quae esse doloremque est consectetur omnis. Sapiente illo adipisci sed.','2011-09-13 07:28:37','2011-09-09 19:31:39','2011-09-13 07:31:39',0),(86,25,66,'DataObject','Explicabo iure qui doloremque et magni dicta minus necessitatibus. Autem sit tenetur magnam. Dicta et quos cum rem omnis at voluptates.','2011-09-13 07:28:37','2011-09-09 18:31:39','2011-09-13 07:31:39',0),(87,25,66,'DataObject','Unde nobis tempora molestiae est pariatur. Quo quas hic facilis eos omnis adipisci. Consequuntur sit odit nemo magnam est deserunt exercitationem illum.','2011-09-13 07:28:37','2011-09-09 17:31:39','2011-09-13 07:31:39',0),(88,25,66,'DataObject','Et quo consequuntur quibusdam ullam. Eos aliquam quasi quam. Et blanditiis qui impedit fugiat maiores qui rem. Vero dolores eveniet error perspiciatis sit et quod ratione. Aut architecto soluta temporibus sint quas similique.','2011-09-13 07:28:37','2011-09-09 16:31:39','2011-09-13 07:31:39',0),(89,25,66,'DataObject','Quisquam architecto et exercitationem inventore repellendus laudantium voluptatum. Explicabo non dolores veniam laborum. Corporis libero excepturi sed veniam est quis. Ducimus architecto nisi corrupti quae ut. Recusandae ut aut iure enim minus voluptates unde.','2011-09-13 07:28:37','2011-09-09 15:31:39','2011-09-13 07:31:39',0),(90,25,67,'DataObject','Nulla voluptate excepturi molestiae debitis. Aut sint numquam quia. Optio ab dolorem repellendus quia. Quasi quos aspernatur recusandae sint cupiditate magni.','2011-09-13 07:28:38','2011-09-09 14:31:39','2011-09-13 07:31:39',0),(91,25,68,'DataObject','Sint quasi vel dicta sapiente et. Mollitia ea ratione necessitatibus non qui et. Sit et architecto voluptatum rerum expedita. Eius sed error velit.','2011-09-13 07:28:38','2011-09-09 13:31:39','2011-09-13 07:31:39',0),(92,25,69,'DataObject','Et enim quos et itaque aut. Cupiditate omnis iusto sequi quia molestiae optio. Quia quis libero voluptas vero.','2011-09-13 07:28:39','2011-09-09 12:31:39','2011-09-13 07:31:39',0),(93,25,70,'DataObject','Praesentium non animi dolor voluptatem quod id et. Adipisci beatae explicabo et quisquam non animi hic. Illum ipsa omnis ea nisi ex eos. Delectus neque ut voluptatem quam sapiente explicabo.','2011-09-13 07:28:39','2011-09-09 11:31:39','2011-09-13 07:31:39',0),(94,25,71,'DataObject','Aliquid sunt est quas cumque voluptas exercitationem alias illum. Optio repudiandae voluptatem autem modi inventore. Alias consequatur qui nesciunt sequi dolores voluptate. Dicta dolorum voluptatem ad molestias. Exercitationem perspiciatis quis enim mollitia.','2011-09-13 07:28:39','2011-09-09 10:31:39','2011-09-13 07:31:39',0),(95,25,72,'DataObject','Consequatur cum dolor enim est tenetur et vel tempore. Similique sunt libero et rerum. Voluptatibus suscipit nisi autem rerum quam quis.','2011-09-13 07:28:40','2011-09-09 09:31:39','2011-09-13 07:31:39',0),(96,25,73,'DataObject','Quibusdam dolores voluptate officia molestiae a velit sunt corporis. Similique sint et rerum sed eaque ut. Nostrum dolores laboriosam aut.','2011-09-13 07:28:40','2011-09-09 08:31:39','2011-09-13 07:31:39',0),(97,25,74,'DataObject','Est nobis velit velit aut in qui rerum. Aut nostrum minus dolore officia nihil reiciendis vel sint. Voluptatem placeat cumque asperiores. Repellat accusantium voluptatem sunt mollitia ratione. Perspiciatis natus temporibus rerum corrupti.','2011-09-13 07:28:41','2011-09-09 07:31:39','2011-09-13 07:31:39',0),(98,25,78,'DataObject','Rerum eos accusantium eveniet. Consequatur architecto ad alias est qui et. Eum fugit esse iure rerum.','2011-09-13 07:28:42','2011-09-09 06:31:39','2011-09-13 07:31:39',0),(99,25,79,'DataObject','Et numquam repellendus rem ducimus quis quia optio. Voluptatibus sequi repellat rerum atque sunt facilis. Aut in eius occaecati. Tenetur consectetur facere repellat labore eos sit.','2011-09-13 07:28:43','2011-09-09 05:31:40','2011-09-13 07:31:40',0),(100,25,80,'DataObject','Autem ut necessitatibus occaecati perspiciatis cum. Quo est et est. Adipisci dolore molestias nesciunt quis maxime praesentium est. Illo quaerat ad aliquid minima debitis tenetur expedita aut.','2011-09-13 07:28:43','2011-09-09 04:31:40','2011-09-13 07:31:40',0),(101,25,81,'DataObject','Sit aperiam repudiandae itaque ipsa. Id ullam qui soluta ea magnam magni. Fugit distinctio veniam eos omnis voluptates et quo expedita.','2011-09-13 07:28:44','2011-09-09 03:31:40','2011-09-13 07:31:40',0),(102,29,82,'DataObject','Quia dolorum et culpa quaerat odio praesentium earum molestiae. Voluptas beatae facere architecto repellendus qui. Dignissimos quisquam reiciendis consequatur. Aut voluptatem impedit ipsa neque. Aperiam veritatis magnam eaque nihil.','2011-09-13 07:28:47','2011-09-09 02:31:40','2011-09-13 07:31:40',0),(103,29,88,'DataObject','Necessitatibus deleniti nihil ad quia. Vel doloremque aliquid ut rerum ut magnam omnis. Praesentium et quibusdam optio ad eaque aliquam provident et.','2011-09-13 07:28:49','2011-09-09 01:31:40','2011-09-13 07:31:40',0),(104,29,89,'DataObject','Sunt dolorem et similique. Voluptatem soluta consequatur laudantium laborum ut distinctio. Laborum recusandae molestias qui saepe.','2011-09-13 07:28:49','2011-09-09 00:31:40','2011-09-13 07:31:40',0),(105,1,88,'DataObject','this is a comment applied to the old overview','2011-09-13 07:28:51','2011-09-08 23:31:40','2011-09-13 07:31:40',0),(106,1,88,'DataObject','this is an invisible comment applied to the old overview',NULL,'2011-09-08 22:31:40','2011-09-13 07:31:40',0),(107,1,82,'DataObject','this is a comment applied to the old image','2011-09-13 07:28:51','2011-09-08 21:31:40','2011-09-13 07:31:40',0),(108,1,82,'DataObject','this is an invisible comment applied to the old image',NULL,'2011-09-08 20:31:40','2011-09-13 07:31:40',0),(109,1,90,'DataObject','brand new comment on the re-harvested overview','2011-09-13 07:28:52','2011-09-08 19:31:40','2011-09-13 07:31:40',0),(110,1,90,'DataObject','and an invisible comment on the re-harvested overview',NULL,'2011-09-08 18:31:40','2011-09-13 07:31:40',0),(111,1,91,'DataObject','lovely comment added after re-harvesting to the image','2011-09-13 07:28:53','2011-09-08 17:31:40','2011-09-13 07:31:40',0),(112,1,91,'DataObject','even wittier invisible comments on image after the harvest was redone.',NULL,'2011-09-08 16:31:40','2011-09-13 07:31:40',0),(113,14,18,'TaxonConcept','This is a witty comment on the Autaliquideri minimais taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:28:55','2011-09-08 15:31:41','2011-09-13 07:31:41',0),(114,34,92,'DataObject','Aspernatur veritatis deleniti illo. Voluptatum provident atque omnis. Natus soluta qui facere quia. Quae dolorem adipisci est ea ut suscipit et itaque.','2011-09-13 07:28:55','2011-09-08 14:31:41','2011-09-13 07:31:41',0),(115,34,93,'DataObject','Unde dolor et nemo qui assumenda et est nihil. Et architecto ullam natus dolor iusto cumque alias. Dignissimos atque et hic omnis sit. Consequatur repellat officiis labore inventore vel quisquam. Ut quia excepturi numquam et.','2011-09-13 07:28:55','2011-09-08 13:31:41','2011-09-13 07:31:41',0),(116,34,97,'DataObject','Eos illo maxime ullam iusto nisi praesentium. Pariatur modi expedita cupiditate. Debitis hic aspernatur eveniet. Sunt eum voluptatum in provident. Exercitationem nisi ea ut deserunt.','2011-09-13 07:28:57','2011-09-08 12:31:41','2011-09-13 07:31:41',0),(117,34,98,'DataObject','Qui rerum aut tempore voluptas quam. Magnam qui aut aut doloribus. Id porro rerum nihil. Quae voluptatem illo et ducimus et.','2011-09-13 07:28:57','2011-09-08 11:31:41','2011-09-13 07:31:41',0),(118,34,99,'DataObject','Ut et repudiandae et soluta voluptas atque ea veritatis. Ad aut occaecati reprehenderit. Modi et et nisi asperiores dolorem. Ex velit dolor qui.','2011-09-13 07:28:58','2011-09-08 10:31:41','2011-09-13 07:31:41',0),(119,32,99,'DataObject','First comment','2011-09-13 07:28:59','2011-09-08 09:31:41','2011-09-13 07:31:41',0),(120,32,99,'DataObject','Second comment','2011-09-13 07:28:59','2011-09-08 08:31:41','2011-09-13 07:31:41',0),(121,32,99,'DataObject','Third comment','2011-09-13 07:28:59','2011-09-08 07:31:41','2011-09-13 07:31:41',0),(122,32,99,'DataObject','Forth comment','2011-09-13 07:29:00','2011-09-08 06:31:41','2011-09-13 07:31:41',0),(123,32,99,'DataObject','Fifth comment','2011-09-13 07:29:00','2011-09-08 05:31:41','2011-09-13 07:31:41',0),(124,32,99,'DataObject','Sixth comment','2011-09-13 07:29:00','2011-09-08 04:31:41','2011-09-13 07:31:41',0),(125,32,99,'DataObject','Seventh comment','2011-09-13 07:29:00','2011-09-08 03:31:41','2011-09-13 07:31:41',0),(126,32,99,'DataObject','Eighth comment','2011-09-13 07:29:00','2011-09-08 02:31:41','2011-09-13 07:31:41',0),(127,32,99,'DataObject','Ninth comment','2011-09-13 07:29:00','2011-09-08 01:31:41','2011-09-13 07:31:41',0),(128,32,99,'DataObject','Tenth comment','2011-09-13 07:29:00','2011-09-08 00:31:41','2011-09-13 07:31:41',0),(129,32,99,'DataObject','Eleventh comment','2011-09-13 07:29:01','2011-09-07 23:31:41','2011-09-13 07:31:41',0),(130,32,99,'DataObject','Twelfth comment','2011-09-13 07:29:01','2011-09-07 22:31:41','2011-09-13 07:31:41',0),(131,36,100,'DataObject','Quia minima ut rerum ut officiis. Corporis hic excepturi quasi voluptas. Modi fugiat dolorem saepe non maiores dolor adipisci et. Eum natus aut nisi sed culpa porro cumque suscipit. Eos non nemo ut qui.','2011-09-13 07:29:02','2011-09-07 21:31:41','2011-09-13 07:31:41',0),(132,31,910093,'TaxonConcept','This is a witty comment on the Autema officiaalius taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:05','2011-09-07 20:31:42','2011-09-13 07:31:42',0),(133,29,910093,'TaxonConcept','This is a witty comment on the Autema officiaalius taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:05','2011-09-07 19:31:42','2011-09-13 07:31:42',0),(134,39,101,'DataObject','Vitae vero expedita eum. Ea perferendis aut sapiente architecto illum. Incidunt rerum voluptatem quasi voluptas repellat accusantium omnis. Sed et nihil sed maxime quia non hic adipisci. Omnis vel totam qui asperiores delectus.','2011-09-13 07:29:06','2011-09-07 18:31:42','2011-09-13 07:31:42',0),(135,39,102,'DataObject','Perspiciatis dolores deserunt esse ut atque. Ad nihil accusamus quibusdam expedita repellendus nostrum ut. Corporis expedita asperiores quia dicta cumque repellat dolorum. Sed dolorum qui velit et distinctio dicta.','2011-09-13 07:29:06','2011-09-07 17:31:42','2011-09-13 07:31:42',0),(136,39,106,'DataObject','Molestiae cumque repellendus similique. Et tempora velit ut numquam quia. Quisquam quasi nulla et magnam aut iusto quae. Debitis expedita natus aut nihil quibusdam cumque tempora voluptates.','2011-09-13 07:29:07','2011-09-07 16:31:42','2011-09-13 07:31:42',0),(137,39,107,'DataObject','Non voluptatibus voluptatem asperiores quisquam possimus praesentium dolorum necessitatibus. Quibusdam suscipit qui non distinctio et. Minima molestiae vero consectetur incidunt qui ipsum ab. Doloremque aliquam quis incidunt voluptatem corrupti est.','2011-09-13 07:29:08','2011-09-07 15:31:42','2011-09-13 07:31:42',0),(138,39,108,'DataObject','Animi quod impedit quibusdam rem quia. Quaerat commodi blanditiis eos rem aut. Et numquam saepe eos in ut aut.','2011-09-13 07:29:08','2011-09-07 14:31:42','2011-09-13 07:31:42',0),(139,39,109,'DataObject','Rerum aut aut quia consequatur distinctio molestiae qui. Et maxime et ea voluptatem sit accusamus pariatur sint. Deleniti ducimus aperiam libero.','2011-09-13 07:29:09','2011-09-07 13:31:42','2011-09-13 07:31:42',0),(140,2,20,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:13','2011-09-07 12:31:42','2011-09-13 07:31:42',0),(141,40,20,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:13','2011-09-07 11:31:42','2011-09-13 07:31:42',0),(142,42,110,'DataObject','Consequatur alias est quae quia tempora exercitationem minus. Non in rerum iusto. Ut sint odit et cum. Eaque voluptatem distinctio modi eum nostrum aspernatur laboriosam nulla.','2011-09-13 07:29:13','2011-09-07 10:31:43','2011-09-13 07:31:43',0),(143,42,111,'DataObject','Aut aperiam eum enim qui et in et sed. Exercitationem aliquam officia quasi vel possimus nihil voluptatibus. Tempora quis sapiente omnis voluptas. Qui ipsa et vitae iste praesentium fuga.','2011-09-13 07:29:14','2011-09-07 09:31:43','2011-09-13 07:31:43',0),(144,42,115,'DataObject','Est exercitationem porro excepturi. Expedita qui consequatur modi fugiat asperiores aperiam sit ipsa. Enim quis voluptate id. Hic pariatur magni eligendi.','2011-09-13 07:29:16','2011-09-07 08:31:43','2011-09-13 07:31:43',0),(145,42,116,'DataObject','Ullam repellat necessitatibus fugiat magni soluta est. Reiciendis id at aperiam qui quas placeat et. Alias dolor ea iusto temporibus assumenda vel et. Pariatur accusantium quis consequuntur perferendis et laborum ut aut. Deleniti eveniet mollitia facilis labore.','2011-09-13 07:29:16','2011-09-07 07:31:43','2011-09-13 07:31:43',0),(146,42,117,'DataObject','Consequatur rem dignissimos sint autem tempora. Voluptates autem sint dolores optio id sunt. Officiis enim optio voluptas sequi aspernatur excepturi aut animi. Eum amet ea deleniti. Id et rem ratione quas natus est necessitatibus.','2011-09-13 07:29:17','2011-09-07 06:31:43','2011-09-13 07:31:43',0),(147,42,118,'DataObject','Sint culpa nam fugit quisquam. Adipisci cumque ut nulla facere aut eveniet atque repellendus. Qui occaecati sint illo aut. Illum expedita aliquid qui ad. Sint eum nisi at sapiente earum accusamus consequatur minima.','2011-09-13 07:29:17','2011-09-07 05:31:43','2011-09-13 07:31:43',0),(148,35,21,'TaxonConcept','This is a witty comment on the Autemalius utsimiliqueesi taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:21','2011-09-07 04:31:43','2011-09-13 07:31:43',0),(149,30,21,'TaxonConcept','This is a witty comment on the Autemalius utsimiliqueesi taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:21','2011-09-07 03:31:43','2011-09-13 07:31:43',0),(150,44,119,'DataObject','Praesentium ex quasi dolore odio. Id id distinctio doloribus doloremque minus quod. Tempora veritatis est consequatur non et.','2011-09-13 07:29:22','2011-09-07 02:31:43','2011-09-13 07:31:43',0),(151,44,120,'DataObject','Commodi quia voluptas voluptate minus facere non sed. Nihil voluptatem voluptatem non eos voluptas accusantium quod natus. Omnis cumque doloremque assumenda ea doloribus et accusamus. Dolor vero in quod.','2011-09-13 07:29:23','2011-09-07 01:31:43','2011-09-13 07:31:43',0),(152,44,124,'DataObject','Laboriosam quibusdam autem omnis placeat earum unde. Provident magnam omnis rerum modi et minus non. Fuga ut eligendi nulla sed voluptas nihil quam.','2011-09-13 07:29:25','2011-09-07 00:31:44','2011-09-13 07:31:44',0),(153,44,125,'DataObject','Rerum iure debitis cumque aut. Repellendus aut omnis voluptatem et architecto. Consequatur aut voluptatem dolores non sed dolores.','2011-09-13 07:29:26','2011-09-06 23:31:44','2011-09-13 07:31:44',0),(154,44,126,'DataObject','Nihil inventore est ab quia. Nobis facere voluptas magnam placeat distinctio ducimus. Iusto mollitia quisquam facilis et nostrum minus atque similique. Eius beatae voluptatem id.','2011-09-13 07:29:27','2011-09-06 22:31:44','2011-09-13 07:31:44',0),(155,44,127,'DataObject','Aspernatur voluptatem illum autem molestiae dolorem ex. Consectetur quo velit ut. Voluptatem saepe fugiat sunt incidunt illum ut officia. Officiis odio consectetur quod ex voluptas ad excepturi quis.','2011-09-13 07:29:28','2011-09-06 21:31:44','2011-09-13 07:31:44',0),(156,17,22,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:32','2011-09-06 20:31:44','2011-09-13 07:31:44',0),(157,3,22,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:33','2011-09-06 19:31:44','2011-09-13 07:31:44',0),(158,46,128,'DataObject','Enim magni non id deserunt esse iure velit earum. Natus temporibus eaque sed. Aspernatur magnam culpa dicta.','2011-09-13 07:29:33','2011-09-06 18:31:44','2011-09-13 07:31:44',0),(159,46,129,'DataObject','Sunt et quis aut eos sed tempore amet quos. Et est sint iusto exercitationem eos sed aspernatur laudantium. Est veniam sint aliquid. Quam quis nulla aperiam deserunt et necessitatibus.','2011-09-13 07:29:34','2011-09-06 17:31:44','2011-09-13 07:31:44',0),(160,46,133,'DataObject','Pariatur dolorem commodi doloremque mollitia sint expedita nemo nihil. Corporis non repudiandae eius nulla sunt dolor. Veritatis omnis error reprehenderit porro veniam.','2011-09-13 07:29:36','2011-09-06 16:31:44','2011-09-13 07:31:44',0),(161,46,134,'DataObject','Perspiciatis quia recusandae sit expedita ea voluptatem ut quia. Rerum quidem est et labore inventore velit commodi. Delectus officiis ut expedita autem deserunt. Magni aliquam autem aspernatur eligendi aut. Eum voluptatem ratione voluptas dolorum aliquid qui magni.','2011-09-13 07:29:38','2011-09-06 15:31:44','2011-09-13 07:31:44',0),(162,46,135,'DataObject','Porro ipsam eos ut molestiae. Veniam et eaque ea voluptas aut molestiae aut placeat. Unde voluptates id quo. Qui libero optio a illum. Enim nobis quo error.','2011-09-13 07:29:39','2011-09-06 14:31:44','2011-09-13 07:31:44',0),(163,46,136,'DataObject','Fugiat neque praesentium enim esse molestiae modi. Sit sit placeat blanditiis voluptatibus quae quia tempore amet. Adipisci consequuntur et voluptas non culpa. Sint dignissimos quibusdam quia. Sed aut quasi libero cumque odio ipsam qui quidem.','2011-09-13 07:29:40','2011-09-06 13:31:45','2011-09-13 07:31:45',0),(164,16,23,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:44','2011-09-06 12:31:45','2011-09-13 07:31:45',0),(165,32,23,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:44','2011-09-06 11:31:45','2011-09-13 07:31:45',0),(166,48,137,'DataObject','Voluptas aperiam aliquam architecto eligendi. Sunt voluptas nihil sapiente deleniti esse. Repellendus asperiores officiis ipsum enim fugit. Quia labore iure natus magni esse dolorem qui dicta.','2011-09-13 07:29:44','2011-09-06 10:31:45','2011-09-13 07:31:45',0),(167,48,138,'DataObject','Qui ratione rerum quia rem. Voluptas ut error voluptatem id. Et natus assumenda et molestiae.','2011-09-13 07:29:45','2011-09-06 09:31:45','2011-09-13 07:31:45',0),(168,48,142,'DataObject','Quo recusandae earum ut sunt. Voluptatem officiis consequatur perspiciatis error voluptate. Aut expedita voluptatem at. Quo et soluta molestiae et sed id dolor expedita. Praesentium modi necessitatibus sit cum voluptatum.','2011-09-13 07:29:47','2011-09-06 08:31:45','2011-09-13 07:31:45',0),(169,48,143,'DataObject','Laudantium et sunt et veniam ad perspiciatis iste impedit. Eum quaerat consequuntur quo non eveniet error voluptas ad. Et doloribus qui quasi. Unde illo reiciendis cum quia. Harum et magni vel cupiditate id quos.','2011-09-13 07:29:48','2011-09-06 07:31:45','2011-09-13 07:31:45',0),(170,48,144,'DataObject','Reiciendis magnam possimus voluptatibus consectetur non provident. Delectus ea pariatur est corrupti exercitationem modi. Consequatur ut voluptatem eos minima omnis odit aut. Odit distinctio incidunt consequatur quod itaque molestiae non dicta. Totam ut sed deleniti inventore consequatur quas aperiam.','2011-09-13 07:29:48','2011-09-06 06:31:45','2011-09-13 07:31:45',0),(171,48,145,'DataObject','Neque ut ratione nulla eum. Laboriosam qui odio est quia et consequatur et ut. Aut et qui id. Sit voluptatum numquam laboriosam sed repellat quos explicabo. Adipisci porro velit repellat deserunt.','2011-09-13 07:29:49','2011-09-06 05:31:45','2011-09-13 07:31:45',0),(172,23,24,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:52','2011-09-06 04:31:45','2011-09-13 07:31:45',0),(173,12,24,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:29:52','2011-09-06 03:31:45','2011-09-13 07:31:45',0),(174,50,146,'DataObject','Minus pariatur optio est sit cumque ut consequatur ut. Necessitatibus dolores sed aut. Autem aspernatur voluptatem tenetur odio eveniet sed aliquam voluptatem.','2011-09-13 07:29:52','2011-09-06 02:31:45','2011-09-13 07:31:45',0),(175,50,147,'DataObject','Facilis eos aut dolores consequatur delectus minus et. Maiores voluptatibus quaerat error libero reiciendis. Ex tempore et praesentium dolor explicabo. Odit perferendis aut possimus quasi.','2011-09-13 07:29:53','2011-09-06 01:31:45','2011-09-13 07:31:45',0),(176,50,151,'DataObject','Accusantium perferendis fugit architecto dolor. Eum veniam sed repudiandae voluptatum. Eligendi rerum voluptate consectetur. Dolores quia tenetur aut consequatur at molestias. Ut minus dolores quis.','2011-09-13 07:29:56','2011-09-06 00:31:46','2011-09-13 07:31:46',0),(177,50,152,'DataObject','Repellendus commodi autem rerum eligendi quod architecto aut. Debitis odio cum nulla animi quas praesentium impedit voluptas. Quaerat quam minus a iusto. Consequatur officia molestias eligendi deleniti doloribus iste molestiae.','2011-09-13 07:29:57','2011-09-05 23:31:46','2011-09-13 07:31:46',0),(178,50,153,'DataObject','Ut eos fuga ipsam. Molestias quia eum rerum qui voluptatem est ipsum. Ipsa ducimus quos est aperiam sit dignissimos expedita eos. Odio quibusdam deleniti vitae.','2011-09-13 07:29:57','2011-09-05 22:31:46','2011-09-13 07:31:46',0),(179,50,154,'DataObject','Soluta numquam aut odit quia corrupti praesentium minus. Ad ab aperiam magnam aut exercitationem error. Est sed eos eum possimus vitae maiores nihil. Vel sequi quaerat laborum repellendus cumque.','2011-09-13 07:29:58','2011-09-05 21:31:46','2011-09-13 07:31:46',0),(180,30,25,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:01','2011-09-05 20:31:46','2011-09-13 07:31:46',0),(181,49,25,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:01','2011-09-05 19:31:46','2011-09-13 07:31:46',0),(182,52,155,'DataObject','Vel in aut occaecati. Consectetur adipisci earum nihil ea. Dolor eaque asperiores doloremque laboriosam officiis numquam nobis excepturi. Iusto aliquid nihil assumenda. Est minima vitae ut suscipit vel laboriosam molestiae.','2011-09-13 07:30:02','2011-09-05 18:31:46','2011-09-13 07:31:46',0),(183,52,156,'DataObject','Dignissimos incidunt nemo alias optio nostrum officiis repellendus. Unde reprehenderit rerum facilis esse ea. Accusantium deserunt sint iusto et expedita temporibus illum. Error qui magnam sint exercitationem et architecto rerum totam.','2011-09-13 07:30:02','2011-09-05 17:31:46','2011-09-13 07:31:46',0),(184,52,160,'DataObject','Corporis saepe rerum eligendi. Sunt sint omnis ratione cumque rerum. Ut facilis quasi corrupti quos eveniet. Quibusdam impedit velit ex velit quo. Voluptas cupiditate voluptates neque accusantium et eum et et.','2011-09-13 07:30:03','2011-09-05 16:31:46','2011-09-13 07:31:46',0),(185,52,161,'DataObject','Laboriosam ad labore ut enim. Quisquam nulla earum inventore eaque sit voluptatibus doloremque. Eos est hic corrupti autem. Odit voluptatem veniam perferendis voluptate.','2011-09-13 07:30:04','2011-09-05 15:31:46','2011-09-13 07:31:46',0),(186,52,162,'DataObject','Exercitationem quos illum ut asperiores adipisci nihil et. Assumenda recusandae praesentium esse vel corporis debitis aut reiciendis. Harum doloribus non atque id consequatur ea et velit.','2011-09-13 07:30:04','2011-09-05 14:31:46','2011-09-13 07:31:46',0),(187,52,163,'DataObject','Ipsa aut tempore neque laboriosam debitis pariatur qui. Molestias unde ipsam tempora laboriosam consequuntur dicta aspernatur. Eaque quia voluptatem voluptate ab cupiditate veritatis.','2011-09-13 07:30:05','2011-09-05 13:31:46','2011-09-13 07:31:46',0),(188,23,26,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:07','2011-09-05 12:31:46','2011-09-13 07:31:46',0),(189,42,26,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:07','2011-09-05 11:31:46','2011-09-13 07:31:46',0),(190,54,164,'DataObject','Odit illo et eaque id vel eum. Aut quam officia ipsum et blanditiis. Eligendi id illo fugit ipsa pariatur. Velit sit maiores in deserunt sed.','2011-09-13 07:30:07','2011-09-05 10:31:47','2011-09-13 07:31:47',0),(191,54,165,'DataObject','Ex nulla amet quibusdam ut fugit magni cumque. In sint impedit cum aut quam. Ipsam aut est inventore. Quo quis omnis id inventore aperiam sunt aliquam facere. Nam illum sunt id minus nihil.','2011-09-13 07:30:08','2011-09-05 09:31:47','2011-09-13 07:31:47',0),(192,54,169,'DataObject','Nemo eum autem corrupti ad. Dolore veritatis aut praesentium voluptas. Quidem repellendus corporis consequatur cum debitis ratione molestiae. Cupiditate quisquam ducimus praesentium architecto ipsam deserunt aut.','2011-09-13 07:30:10','2011-09-05 08:31:47','2011-09-13 07:31:47',0),(193,54,170,'DataObject','Vero deserunt reiciendis nulla et ipsa maxime ducimus. Ullam officia tempora dolorum numquam sunt. Cumque necessitatibus libero accusamus eius voluptatem id. Fuga et laudantium reiciendis vel neque. Ducimus tempore repudiandae nemo veritatis magni et eum maiores.','2011-09-13 07:30:12','2011-09-05 07:31:47','2011-09-13 07:31:47',0),(194,54,171,'DataObject','Harum voluptates distinctio occaecati necessitatibus totam. Est qui et tenetur. Et sequi voluptatem atque repellendus. Et doloremque rerum nihil incidunt quisquam sint ut quo.','2011-09-13 07:30:13','2011-09-05 06:31:47','2011-09-13 07:31:47',0),(195,54,172,'DataObject','Maiores et error atque impedit aut et et. Rerum inventore quibusdam iste amet molestiae. Quidem iure earum libero animi qui minus non doloremque. Ut et similique quas voluptatem doloremque. Ut beatae alias quibusdam quaerat.','2011-09-13 07:30:14','2011-09-05 05:31:47','2011-09-13 07:31:47',0),(196,3,27,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:19','2011-09-05 04:31:47','2011-09-13 07:31:47',0),(197,52,27,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:19','2011-09-05 03:31:47','2011-09-13 07:31:47',0),(198,56,173,'DataObject','Repellendus ut consectetur nihil voluptatem sint provident culpa laborum. Dolorem quia velit nihil reprehenderit aperiam nisi. Veritatis eligendi qui libero est velit est. Recusandae veniam et sed omnis officia est.','2011-09-13 07:30:21','2011-09-05 02:31:47','2011-09-13 07:31:47',0),(199,56,174,'DataObject','Debitis sint dolor ipsum enim corrupti saepe quam quaerat. Autem reprehenderit dolores corporis quae. Id qui non sed occaecati eos velit corporis. Doloremque dolores assumenda quia aspernatur quia.','2011-09-13 07:30:21','2011-09-05 01:31:47','2011-09-13 07:31:47',0),(200,56,178,'DataObject','Quis blanditiis consectetur quasi maiores accusamus tempore odio soluta. Et ut sit quaerat voluptas. Aut esse odit pariatur.','2011-09-13 07:30:23','2011-09-05 00:31:47','2011-09-13 07:31:47',0),(201,56,179,'DataObject','Ad vitae sequi sed dolorum suscipit in. Ipsa non quod ullam provident blanditiis corporis. At ea qui sunt nihil officia quia esse quos.','2011-09-13 07:30:24','2011-09-04 23:31:47','2011-09-13 07:31:47',0),(202,56,180,'DataObject','Pariatur rem quisquam odit sed possimus similique. Impedit et aut distinctio quia eligendi optio voluptate eos. Rerum et vel quae. Neque non eum exercitationem natus.','2011-09-13 07:30:26','2011-09-04 22:31:47','2011-09-13 07:31:47',0),(203,56,181,'DataObject','Dolor quis nisi est. Neque praesentium sed voluptatem libero rerum ducimus. Temporibus aut in dolores similique qui quis neque qui. Minus fugiat et veritatis sit iste consequuntur numquam. Et dolor et occaecati itaque ut.','2011-09-13 07:30:27','2011-09-04 21:31:47','2011-09-13 07:31:47',0),(204,6,28,'TaxonConcept','This is a witty comment on the Molestiaeus\n    rationealia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:29','2011-09-04 20:31:48','2011-09-13 07:31:48',0),(205,20,28,'TaxonConcept','This is a witty comment on the Molestiaeus\n    rationealia taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:29','2011-09-04 19:31:48','2011-09-13 07:31:48',0),(206,58,182,'DataObject','Minima et dolorem quam laborum quia. Ut voluptatem et suscipit magni ut. Ipsam eos voluptates eligendi debitis.','2011-09-13 07:30:30','2011-09-04 18:31:48','2011-09-13 07:31:48',0),(207,58,183,'DataObject','Molestias accusamus reiciendis natus qui aut. Laborum sint natus deserunt ut rerum dolor nobis non. Beatae impedit id consectetur cum ullam nihil iure ut.','2011-09-13 07:30:30','2011-09-04 17:31:48','2011-09-13 07:31:48',0),(208,58,187,'DataObject','Nisi ut repellendus dolorem. Vero vitae eos velit similique consectetur repellendus. Ut unde mollitia dolorem. At tempore eum voluptas et pariatur autem aut.','2011-09-13 07:30:32','2011-09-04 16:31:48','2011-09-13 07:31:48',0),(209,58,188,'DataObject','Beatae aut quo distinctio sit quos omnis dicta. Distinctio necessitatibus accusamus dolorum perferendis. Ex voluptatem sit eos neque voluptatem quod.','2011-09-13 07:30:32','2011-09-04 15:31:48','2011-09-13 07:31:48',0),(210,58,189,'DataObject','Ea qui neque in possimus impedit. Voluptatum rerum voluptatem dolores nostrum voluptas aut reiciendis. Quaerat tenetur velit porro est blanditiis beatae. Dignissimos fugit error nulla blanditiis quisquam illum natus architecto. Tempore quis placeat ut ipsa consequuntur laboriosam.','2011-09-13 07:30:32','2011-09-04 14:31:48','2011-09-13 07:31:48',0),(211,58,190,'DataObject','Culpa et odio quasi soluta non incidunt qui dignissimos. Quaerat sint veritatis illum debitis cumque. Sint ipsum laudantium asperiores quia cum.','2011-09-13 07:30:33','2011-09-04 13:31:48','2011-09-13 07:31:48',0),(212,57,29,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:35','2011-09-04 12:31:48','2011-09-13 07:31:48',0),(213,59,29,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:35','2011-09-04 11:31:48','2011-09-13 07:31:48',0),(214,60,191,'DataObject','Animi similique ut odit iure accusantium. Ut et non vitae unde. Et voluptatem qui dolorem aspernatur labore debitis.','2011-09-13 07:30:36','2011-09-04 10:31:48','2011-09-13 07:31:48',0),(215,60,192,'DataObject','Debitis nesciunt consequatur qui repudiandae non. Qui repellat voluptas impedit nesciunt aliquam. Maxime quia nemo amet libero distinctio.','2011-09-13 07:30:36','2011-09-04 09:31:48','2011-09-13 07:31:48',0),(216,60,196,'DataObject','Itaque labore vel aperiam nobis dolorum modi quas incidunt. Suscipit inventore ex excepturi vel aut pariatur nam deleniti. Ex expedita dolorem perspiciatis ratione. Cumque tenetur rem repudiandae quia reiciendis voluptatibus nisi.','2011-09-13 07:30:37','2011-09-04 08:31:48','2011-09-13 07:31:48',0),(217,60,197,'DataObject','Et tenetur autem minima. Voluptatibus voluptate quasi doloremque est. Deleniti quisquam aut facilis aliquid.','2011-09-13 07:30:38','2011-09-04 07:31:48','2011-09-13 07:31:48',0),(218,60,198,'DataObject','Quibusdam ducimus sint est officia occaecati doloremque. Vitae autem laboriosam ducimus. Quas iste laboriosam est enim saepe ullam unde sequi. Alias harum quia dignissimos ut sit. Temporibus ducimus doloribus ratione error.','2011-09-13 07:30:38','2011-09-04 06:31:48','2011-09-13 07:31:48',0),(219,60,199,'DataObject','Voluptas est exercitationem alias tenetur. Magnam numquam voluptatum et. Labore provident vel voluptates itaque deleniti unde. Neque dolore totam alias officia cupiditate quidem quod. Vel architecto rerum est eum minima modi nostrum.','2011-09-13 07:30:38','2011-09-04 05:31:48','2011-09-13 07:31:48',0),(220,4,30,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:44','2011-09-04 04:31:49','2011-09-13 07:31:49',0),(221,47,30,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:44','2011-09-04 03:31:49','2011-09-13 07:31:49',0),(222,62,200,'DataObject','Non vel debitis ipsam ducimus eum minus. Atque quam hic enim accusamus. Odit modi nobis eum inventore esse ratione.','2011-09-13 07:30:45','2011-09-04 02:31:49','2011-09-13 07:31:49',0),(223,62,201,'DataObject','Quod esse numquam sit. Porro harum adipisci ut earum minima et culpa. Qui omnis voluptas aut dolorum earum numquam. Ut illo et ratione qui sunt. Inventore doloremque quaerat est et explicabo necessitatibus.','2011-09-13 07:30:46','2011-09-04 01:31:49','2011-09-13 07:31:49',0),(224,62,205,'DataObject','Tenetur et quisquam velit modi. Esse quidem ut sed quo in. Reiciendis labore debitis maiores illo quis necessitatibus minima. Numquam rem quas cumque quaerat rerum et labore. Deleniti voluptatibus assumenda omnis.','2011-09-13 07:30:47','2011-09-04 00:31:49','2011-09-13 07:31:49',0),(225,62,206,'DataObject','Eos molestias esse animi explicabo aspernatur aut ut. Aliquid error eum ea rerum perspiciatis dicta. Vero recusandae et aspernatur adipisci.','2011-09-13 07:30:48','2011-09-03 23:31:49','2011-09-13 07:31:49',0),(226,62,207,'DataObject','Quia sit accusamus dicta. Ea consectetur fugit culpa quidem adipisci eos incidunt nemo. Modi voluptate tempora soluta cum et. Fugit sequi incidunt dignissimos. Quaerat similique neque occaecati et.','2011-09-13 07:30:48','2011-09-03 22:31:49','2011-09-13 07:31:49',0),(227,62,208,'DataObject','Ullam ipsam qui eum. Maxime libero qui accusamus odio quia adipisci et sunt. Commodi et porro quae. Error sed reprehenderit eius. Ut officia omnis est sunt vero porro et.','2011-09-13 07:30:48','2011-09-03 21:31:49','2011-09-13 07:31:49',0),(228,61,31,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:51','2011-09-03 20:31:49','2011-09-13 07:31:49',0),(229,11,31,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:51','2011-09-03 19:31:49','2011-09-13 07:31:49',0),(230,64,209,'DataObject','Non earum repellat architecto autem autem facere. Neque qui architecto hic et ut aspernatur. Porro ipsam cum nihil harum illo. Inventore aliquid corporis odit sequi assumenda est. Tempore quia voluptatem minus.','2011-09-13 07:30:52','2011-09-03 18:31:49','2011-09-13 07:31:49',0),(231,64,210,'DataObject','Quia quidem perferendis aliquam. Facere et quidem placeat sint vel. Odio ab sed laborum. Autem iste atque quis. Vitae nesciunt temporibus totam voluptate earum ab corporis cupiditate.','2011-09-13 07:30:52','2011-09-03 17:31:49','2011-09-13 07:31:49',0),(232,64,214,'DataObject','Impedit asperiores sed omnis maxime rerum provident. Est qui commodi sed occaecati aut eligendi. Praesentium blanditiis dolorem ratione explicabo ducimus incidunt. Reiciendis in expedita laboriosam fuga fugiat saepe. Ut id illum ad porro vitae explicabo eaque architecto.','2011-09-13 07:30:54','2011-09-03 16:31:49','2011-09-13 07:31:49',0),(233,64,215,'DataObject','Adipisci consequatur quia et amet quo nostrum tempora. Fuga sed assumenda et voluptatum soluta. Est ipsam sed in sequi.','2011-09-13 07:30:54','2011-09-03 15:31:49','2011-09-13 07:31:49',0),(234,64,216,'DataObject','Hic corporis cum esse repellendus voluptate illo similique. Similique sequi aut rerum aut et ipsa dolor quibusdam. Quidem veniam earum sit nobis ut modi. Nihil blanditiis libero sit sed.','2011-09-13 07:30:55','2011-09-03 14:31:50','2011-09-13 07:31:50',0),(235,64,217,'DataObject','Eos vero molestias voluptatem dolorem. Sunt perferendis totam ab. Autem voluptas delectus eaque dolorum voluptatum.','2011-09-13 07:30:55','2011-09-03 13:31:50','2011-09-13 07:31:50',0),(236,39,32,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:58','2011-09-03 12:31:50','2011-09-13 07:31:50',0),(237,50,32,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:30:58','2011-09-03 11:31:50','2011-09-13 07:31:50',0),(238,66,218,'DataObject','Sapiente illum recusandae repellendus. Soluta eveniet laudantium sunt hic ducimus fugiat aut. Dicta omnis cupiditate asperiores placeat nisi mollitia voluptatem ut. Possimus quibusdam aut qui ad doloremque facere nesciunt sed. Repudiandae similique dolores necessitatibus numquam qui.','2011-09-13 07:30:58','2011-09-03 10:31:50','2011-09-13 07:31:50',0),(239,66,219,'DataObject','Nam voluptatem velit alias. Autem quis possimus laborum enim. Quibusdam repudiandae molestias amet.','2011-09-13 07:30:59','2011-09-03 09:31:50','2011-09-13 07:31:50',0),(240,66,223,'DataObject','Sapiente harum fuga temporibus. Dolor maxime labore nostrum est similique. Et tempore qui quo inventore corrupti neque voluptatem. Quaerat consequuntur nostrum repellat. Excepturi in earum vero necessitatibus quaerat omnis.','2011-09-13 07:31:00','2011-09-03 08:31:50','2011-09-13 07:31:50',0),(241,66,224,'DataObject','In et totam odio nihil velit praesentium eius. Perspiciatis praesentium modi quod porro quis quia. Sequi sint qui quam eaque harum. Est blanditiis nam ipsum fuga necessitatibus pariatur. Enim maxime consectetur quas.','2011-09-13 07:31:00','2011-09-03 07:31:50','2011-09-13 07:31:50',0),(242,66,225,'DataObject','Quod magni mollitia facere. Dolor at aut enim et maiores laborum nobis dolores. Neque exercitationem debitis non. Voluptate aspernatur quis velit architecto impedit praesentium.','2011-09-13 07:31:01','2011-09-03 06:31:50','2011-09-13 07:31:50',0),(243,66,226,'DataObject','Tempora reprehenderit officia aut qui libero. Aspernatur provident quos quo quo magni repudiandae. Assumenda aspernatur fugiat voluptatem dolore vitae sunt quis aut.','2011-09-13 07:31:01','2011-09-03 05:31:50','2011-09-13 07:31:50',0),(244,5,33,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:31:04','2011-09-03 04:31:50','2011-09-13 07:31:50',0),(245,5,33,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:31:04','2011-09-03 03:31:50','2011-09-13 07:31:50',0),(246,68,227,'DataObject','Quidem quaerat doloribus quia qui est natus. Aliquam neque harum impedit natus ut. Occaecati quas minima sed vel et officia.','2011-09-13 07:31:04','2011-09-03 02:31:50','2011-09-13 07:31:50',0),(247,68,228,'DataObject','In qui dignissimos blanditiis. Et exercitationem nihil eaque. Explicabo impedit magnam sapiente autem et excepturi illo sint. Qui aliquam non soluta aut.','2011-09-13 07:31:05','2011-09-03 01:31:50','2011-09-13 07:31:50',0),(248,68,232,'DataObject','Nisi non animi sapiente. Odit earum non eveniet ut. Eos error voluptas aut quos et quas. Ut qui laudantium quia vitae nobis. Accusamus ut dolorem nihil eum et.','2011-09-13 07:31:06','2011-09-03 00:31:50','2011-09-13 07:31:50',0),(249,68,233,'DataObject','Non facilis similique voluptas. Unde qui assumenda ut tenetur voluptatum alias eos. Accusantium commodi consequatur odio eum consequatur doloremque. Eaque ducimus accusamus autem quia sed dolorum asperiores magnam. Consectetur voluptatum odit quidem quam veritatis ex tempore.','2011-09-13 07:31:07','2011-09-02 23:31:51','2011-09-13 07:31:51',0),(250,68,234,'DataObject','Est officiis placeat quia dolore modi alias amet. Est est qui ducimus rerum quia mollitia. Culpa quo consequuntur voluptas eum. Animi quia quia beatae aut dolores quos. Facere similique excepturi nulla quia.','2011-09-13 07:31:07','2011-09-02 22:31:51','2011-09-13 07:31:51',0),(251,68,235,'DataObject','Excepturi ipsa quo voluptatem amet consequatur. Dolores ea voluptas culpa voluptatum. Molestiae nisi dolor ut.','2011-09-13 07:31:08','2011-09-02 21:31:51','2011-09-13 07:31:51',0),(252,9,5559,'TaxonConcept','This is a witty comment on the Fungi taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:31:58','2011-09-13 07:31:58','2011-09-13 07:31:58',0),(253,34,5559,'TaxonConcept','This is a witty comment on the Fungi taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:31:58','2011-09-13 07:31:58','2011-09-13 07:31:58',0),(254,70,237,'DataObject','Qui tenetur laboriosam quos quo. Doloribus dolore ea dolorem. Repellendus itaque minus doloremque eos. Alias assumenda natus eos vel ipsam.','2011-09-13 07:31:59','2011-09-13 07:31:59','2011-09-13 07:31:59',0),(255,23,3352,'TaxonConcept','This is a witty comment on the Chromista taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:01','2011-09-13 07:32:01','2011-09-13 07:32:01',0),(256,45,3352,'TaxonConcept','This is a witty comment on the Chromista taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:01','2011-09-13 07:32:01','2011-09-13 07:32:01',0),(257,72,239,'DataObject','Qui iure ratione occaecati et dolorem est dolorem. Nam culpa dolores explicabo sit eveniet sint ut officiis. In esse fugiat suscipit. Veritatis odit officia quaerat nobis. Non nemo nihil ipsa alias dolor.','2011-09-13 07:32:02','2011-09-13 07:32:02','2011-09-13 07:32:02',0),(258,57,281,'TaxonConcept','This is a witty comment on the Plantae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:04','2011-09-13 07:32:04','2011-09-13 07:32:04',0),(259,68,281,'TaxonConcept','This is a witty comment on the Plantae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:04','2011-09-13 07:32:04','2011-09-13 07:32:04',0),(260,74,241,'DataObject','Eaque cum id molestiae at tenetur nihil. Odio culpa et repellat corrupti eos et. Quia eius dolorum omnis nihil dolorem voluptatem dolorem qui.','2011-09-13 07:32:04','2011-09-13 07:32:04','2011-09-13 07:32:04',0),(261,46,2861424,'TaxonConcept','This is a witty comment on the Amanitaceae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:06','2011-09-13 07:32:06','2011-09-13 07:32:06',0),(262,45,2861424,'TaxonConcept','This is a witty comment on the Amanitaceae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:06','2011-09-13 07:32:06','2011-09-13 07:32:06',0),(263,76,243,'DataObject','Officiis doloribus debitis eos sed non ducimus commodi. Ipsam dignissimos aut at earum. Eos cum nihil aperiam consequatur dolore hic quidem sapiente. Temporibus ea et eum dolorum velit. Impedit quae tempora voluptas architecto omnis libero.','2011-09-13 07:32:06','2011-09-13 07:32:06','2011-09-13 07:32:06',0),(264,61,18878,'TaxonConcept','This is a witty comment on the Amanita taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:08','2011-09-13 07:32:08','2011-09-13 07:32:08',0),(265,2,18878,'TaxonConcept','This is a witty comment on the Amanita taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:08','2011-09-13 07:32:08','2011-09-13 07:32:08',0),(266,78,245,'DataObject','Exercitationem aliquam sit est et quia ea qui esse. Et assumenda consequatur nostrum hic ut iure. Explicabo magni quisquam quae omnis dolores est est incidunt.','2011-09-13 07:32:09','2011-09-13 07:32:09','2011-09-13 07:32:09',0),(267,78,7160,'TaxonConcept','This is a witty comment on the Nephropidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:10','2011-09-13 07:32:10','2011-09-13 07:32:10',0),(268,65,7160,'TaxonConcept','This is a witty comment on the Nephropidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:11','2011-09-13 07:32:11','2011-09-13 07:32:11',0),(269,80,247,'DataObject','Similique libero accusamus atque voluptatem illum placeat inventore. Sit qui rerum amet. Velit sit vel illo voluptatem sequi veritatis repellat consectetur. Voluptates ut hic quisquam praesentium.','2011-09-13 07:32:11','2011-09-13 07:32:11','2011-09-13 07:32:11',0),(270,74,17954507,'TaxonConcept','This is a witty comment on the Dinochelus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:13','2011-09-13 07:32:13','2011-09-13 07:32:13',0),(271,58,17954507,'TaxonConcept','This is a witty comment on the Dinochelus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:13','2011-09-13 07:32:13','2011-09-13 07:32:13',0),(272,82,249,'DataObject','Quod ipsum necessitatibus et dolores quos iste. Qui illum animi nisi inventore et qui veritatis. Porro iusto et iure voluptas pariatur. Quos vel unde dolores. Explicabo ut optio laborum perspiciatis nisi quis neque.','2011-09-13 07:32:14','2011-09-13 07:32:14','2011-09-13 07:32:14',0),(273,27,3594,'TaxonConcept','This is a witty comment on the Raphidophyceae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:15','2011-09-13 07:32:15','2011-09-13 07:32:15',0),(274,76,3594,'TaxonConcept','This is a witty comment on the Raphidophyceae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:15','2011-09-13 07:32:15','2011-09-13 07:32:15',0),(275,84,251,'DataObject','Qui culpa corporis qui qui et. Tempora qui nam consequatur repudiandae. Maxime sequi quam repellendus rerum dolores voluptatem eos.','2011-09-13 07:32:16','2011-09-13 07:32:16','2011-09-13 07:32:16',0),(276,5,89513,'TaxonConcept','This is a witty comment on the Haramonas taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:17','2011-09-13 07:32:17','2011-09-13 07:32:17',0),(277,67,89513,'TaxonConcept','This is a witty comment on the Haramonas taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:17','2011-09-13 07:32:17','2011-09-13 07:32:17',0),(278,86,253,'DataObject','Omnis necessitatibus sunt perferendis tempore non est. Quo rem nam quia. Ut veritatis voluptates animi. Est id eaque fugit ut corporis aliquam.','2011-09-13 07:32:18','2011-09-13 07:32:18','2011-09-13 07:32:18',0),(279,82,7676,'TaxonConcept','This is a witty comment on the Canidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:20','2011-09-13 07:32:20','2011-09-13 07:32:20',0),(280,73,7676,'TaxonConcept','This is a witty comment on the Canidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:20','2011-09-13 07:32:20','2011-09-13 07:32:20',0),(281,88,255,'DataObject','Iusto omnis ab minus. Consequatur quis et amet odit dolor error nihil mollitia. Consequuntur tempore quia cupiditate quia sit magnam aperiam. Iusto mollitia sed voluptatibus occaecati eligendi at. Et perspiciatis nulla ipsam.','2011-09-13 07:32:21','2011-09-13 07:32:21','2011-09-13 07:32:21',0),(282,44,14460,'TaxonConcept','This is a witty comment on the Canis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:22','2011-09-13 07:32:22','2011-09-13 07:32:22',0),(283,28,14460,'TaxonConcept','This is a witty comment on the Canis taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:22','2011-09-13 07:32:22','2011-09-13 07:32:22',0),(284,90,257,'DataObject','Sit quia et error aut esse est. Eaque iusto est quisquam alias nemo accusantium. Dolor id nulla veniam. Fugit eaque quidem et accusantium. Dolores nemo recusandae at quasi laudantium explicabo et error.','2011-09-13 07:32:24','2011-09-13 07:32:24','2011-09-13 07:32:24',0),(285,71,6747,'TaxonConcept','This is a witty comment on the Pinaceae  taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:25','2011-09-13 07:32:25','2011-09-13 07:32:25',0),(286,91,6747,'TaxonConcept','This is a witty comment on the Pinaceae  taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:25','2011-09-13 07:32:25','2011-09-13 07:32:25',0),(287,92,259,'DataObject','Vel tenetur soluta vero magnam praesentium. Nulla illum vero eveniet. Sit dolore rerum quam explicabo. Dolorem beatae iure neque. Et voluptas tenetur vero esse illo sint explicabo ipsum.','2011-09-13 07:32:26','2011-09-13 07:32:26','2011-09-13 07:32:26',0),(288,19,14031,'TaxonConcept','This is a witty comment on the Pinus  taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:28','2011-09-13 07:32:28','2011-09-13 07:32:28',0),(289,68,14031,'TaxonConcept','This is a witty comment on the Pinus  taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:28','2011-09-13 07:32:28','2011-09-13 07:32:28',0),(290,94,261,'DataObject','Magnam unde rerum sequi. Et placeat et sint et consectetur quia. Ex mollitia dolore velit. Maiores molestiae quod dolores nulla magnam odio delectus.','2011-09-13 07:32:28','2011-09-13 07:32:28','2011-09-13 07:32:28',0),(291,11,699,'TaxonConcept','This is a witty comment on the Formicidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:30','2011-09-13 07:32:30','2011-09-13 07:32:30',0),(292,71,699,'TaxonConcept','This is a witty comment on the Formicidae taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:30','2011-09-13 07:32:30','2011-09-13 07:32:30',0),(293,96,263,'DataObject','Repellat ea culpa qui incidunt voluptatem exercitationem. Numquam non qui eligendi et esse ullam. Mollitia sapiente vel sint debitis exercitationem qui officiis. Sunt nobis reiciendis fugiat rem veniam. Et enim similique sapiente.','2011-09-13 07:32:31','2011-09-13 07:32:31','2011-09-13 07:32:31',0),(294,37,49148,'TaxonConcept','This is a witty comment on the Anochetus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:33','2011-09-13 07:32:33','2011-09-13 07:32:33',0),(295,93,49148,'TaxonConcept','This is a witty comment on the Anochetus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:33','2011-09-13 07:32:33','2011-09-13 07:32:33',0),(296,98,265,'DataObject','Distinctio sed ipsum recusandae iusto rerum. Iusto quia nulla qui. Perferendis nesciunt est et laboriosam qui voluptatem fuga. Voluptates nulla libero atque dolor quo nam dolore. Reiciendis illum laudantium et nulla qui.','2011-09-13 07:32:34','2011-09-13 07:32:34','2011-09-13 07:32:34',0),(297,94,2866150,'TaxonConcept','This is a witty comment on the Amanita muscaria taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:36','2011-09-13 07:32:36','2011-09-13 07:32:36',0),(298,81,2866150,'TaxonConcept','This is a witty comment on the Amanita muscaria taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:36','2011-09-13 07:32:36','2011-09-13 07:32:36',0),(299,100,266,'DataObject','Deleniti sit aut voluptatum voluptatibus minus. Sed velit quisquam veniam nesciunt nostrum eaque natus totam. Rem et voluptatibus dolore. Quos tenetur voluptates assumenda aut ipsum facere dolor. Dolor laborum et voluptatum iste aliquam modi quo.','2011-09-13 07:32:37','2011-09-13 07:32:37','2011-09-13 07:32:37',0),(300,100,267,'DataObject','Nostrum earum sint nihil consequuntur ad enim. Sequi dolorem magni ad iure sed quia. Tempore consequatur cupiditate voluptas. Magni nulla non sint repellat.','2011-09-13 07:32:37','2011-09-13 07:32:37','2011-09-13 07:32:37',0),(301,100,268,'DataObject','Dolores excepturi eveniet reprehenderit. Debitis id repellat natus aut dolore voluptates. Esse dolor numquam quis repellat tempora quasi. Aspernatur sint consectetur consequatur labore sed assumenda id. Nostrum est voluptates explicabo.','2011-09-13 07:32:37','2011-09-13 07:32:37','2011-09-13 07:32:37',0),(302,100,269,'DataObject','Tenetur nam ullam dolorum. Qui voluptate blanditiis culpa adipisci voluptatem dolor quo. Qui quis fuga temporibus suscipit possimus quia quas et. Blanditiis non nemo officia ea ut.','2011-09-13 07:32:38','2011-09-13 07:32:38','2011-09-13 07:32:38',0),(303,100,271,'DataObject','Voluptatem voluptas dignissimos impedit tempore. Et soluta veritatis dolor consequatur. Ut rerum impedit id est aut non excepturi. Quo eum earum ducimus qui maxime id asperiores a. Fugit adipisci esse animi reiciendis sed ut laborum.','2011-09-13 07:32:38','2011-09-13 07:32:38','2011-09-13 07:32:38',0),(304,100,272,'DataObject','Voluptates nihil in ut ea aliquam est praesentium nesciunt. Omnis error facilis corrupti eum. Numquam molestias eveniet asperiores.','2011-09-13 07:32:39','2011-09-13 07:32:39','2011-09-13 07:32:39',0),(305,100,273,'DataObject','Velit deserunt quas dolore animi consequatur beatae eaque. Rerum aut aut minus. Eaque consequatur expedita quis. Earum voluptas magni eos molestiae nihil adipisci nam. Rerum at temporibus consectetur quia est aliquam.','2011-09-13 07:32:39','2011-09-13 07:32:39','2011-09-13 07:32:39',0),(306,100,274,'DataObject','Et ut aliquam voluptates voluptatem recusandae quae sint ab. Consequuntur consequatur sed est alias cumque quibusdam culpa quia. Consequatur nisi nulla qui ratione quibusdam sit. Molestiae enim quia quas molestias est temporibus.','2011-09-13 07:32:40','2011-09-13 07:32:40','2011-09-13 07:32:40',0),(307,100,275,'DataObject','Et rerum officiis omnis illo sed. Dolorem consequatur doloremque quia nam aut. Dolores doloribus repellat sed et qui sunt. Fugit atque ipsa aliquid repellendus. Voluptatem voluptatem qui ut nemo.','2011-09-13 07:32:40','2011-09-13 07:32:40','2011-09-13 07:32:40',0),(308,90,17924149,'TaxonConcept','This is a witty comment on the Dinochelus ausubeli taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:42','2011-09-13 07:32:42','2011-09-13 07:32:42',0),(309,101,17924149,'TaxonConcept','This is a witty comment on the Dinochelus ausubeli taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:42','2011-09-13 07:32:42','2011-09-13 07:32:42',0),(310,102,276,'DataObject','Amet aut quisquam ea eaque dolor consequatur officiis. Nam repudiandae voluptatibus recusandae sunt repellat velit quia. Delectus dignissimos molestiae quia et.','2011-09-13 07:32:43','2011-09-13 07:32:43','2011-09-13 07:32:43',0),(311,102,277,'DataObject','Velit earum ea ut alias sint exercitationem aut in. Eos sit autem explicabo qui dolores culpa hic. Atque id impedit labore error non eos. Rerum est sit tempore tenetur voluptas eius eligendi. Sed soluta quidem amet molestiae nemo velit enim.','2011-09-13 07:32:43','2011-09-13 07:32:43','2011-09-13 07:32:43',0),(312,102,279,'DataObject','Illo est autem est fuga commodi voluptas aut. Culpa quibusdam sunt natus corporis. Qui tempora maxime dolores occaecati illo nisi soluta. Consectetur provident impedit sint itaque. Animi laborum voluptatem aliquid.','2011-09-13 07:32:44','2011-09-13 07:32:44','2011-09-13 07:32:44',0),(313,12,921737,'TaxonConcept','This is a witty comment on the Haramonas dimorpha taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:46','2011-09-13 07:32:46','2011-09-13 07:32:46',0),(314,40,921737,'TaxonConcept','This is a witty comment on the Haramonas dimorpha taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:46','2011-09-13 07:32:46','2011-09-13 07:32:46',0),(315,104,280,'DataObject','Expedita eum id voluptatibus suscipit eos. Ut voluptatem voluptates et ratione. Ut ut cum qui ducimus velit veritatis ea. Dignissimos quis sunt eligendi. Similique qui et eius ratione qui harum.','2011-09-13 07:32:47','2011-09-13 07:32:47','2011-09-13 07:32:47',0),(316,104,281,'DataObject','Nobis et ipsum autem repellat fuga voluptate. Et facere sed non mollitia officia aperiam. Consectetur ea quia explicabo nemo qui velit et. Nihil quis consectetur ea perferendis.','2011-09-13 07:32:47','2011-09-13 07:32:47','2011-09-13 07:32:47',0),(317,104,283,'DataObject','Mollitia est quia itaque qui. Non cum et quibusdam. Molestias perferendis repudiandae vitae dolore harum id corporis.','2011-09-13 07:32:48','2011-09-13 07:32:48','2011-09-13 07:32:48',0),(318,94,328607,'TaxonConcept','This is a witty comment on the Canis lupus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:49','2011-09-13 07:32:49','2011-09-13 07:32:49',0),(319,75,328607,'TaxonConcept','This is a witty comment on the Canis lupus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:49','2011-09-13 07:32:49','2011-09-13 07:32:49',0),(320,106,284,'DataObject','Vero dolore asperiores aspernatur. Accusamus inventore enim exercitationem rerum. Id amet dolor et voluptas et iusto. Dolores nesciunt ut et.','2011-09-13 07:32:50','2011-09-13 07:32:50','2011-09-13 07:32:50',0),(321,106,285,'DataObject','Non officia hic non dolorem quas dolorum. Possimus totam quia officiis. Necessitatibus nulla fuga est sit in non alias. Maiores placeat deleniti dolorem quisquam sequi nisi dolor.','2011-09-13 07:32:50','2011-09-13 07:32:50','2011-09-13 07:32:50',0),(322,106,286,'DataObject','Rem facilis architecto libero corrupti laudantium ut minus. Assumenda et eligendi velit dolorem soluta officiis et nihil. Expedita incidunt in aliquid doloribus quia. Impedit porro laborum qui. Qui quia earum magni odit blanditiis maiores possimus.','2011-09-13 07:32:51','2011-09-13 07:32:51','2011-09-13 07:32:51',0),(323,106,287,'DataObject','Omnis fuga et sunt quibusdam voluptatem voluptas cupiditate sit. Non molestiae dolorum adipisci est omnis. Rem quia occaecati fugit optio voluptates ipsum.','2011-09-13 07:32:51','2011-09-13 07:32:51','2011-09-13 07:32:51',0),(324,106,289,'DataObject','Vitae enim est rerum aut dolores. Sapiente similique dolores impedit. Est quia nihil omnis molestiae aliquid quia officiis incidunt. Est exercitationem inventore vitae consequatur recusandae. Dolor voluptas dicta asperiores.','2011-09-13 07:32:52','2011-09-13 07:32:52','2011-09-13 07:32:52',0),(325,46,1061748,'TaxonConcept','This is a witty comment on the Pinus strobus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:54','2011-09-13 07:32:54','2011-09-13 07:32:54',0),(326,66,1061748,'TaxonConcept','This is a witty comment on the Pinus strobus taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:54','2011-09-13 07:32:54','2011-09-13 07:32:54',0),(327,108,290,'DataObject','Reiciendis ipsa qui necessitatibus. Iste in officiis perferendis qui qui. Soluta cumque expedita pariatur cum excepturi. Iure corporis error voluptas soluta sunt quibusdam dignissimos.','2011-09-13 07:32:54','2011-09-13 07:32:54','2011-09-13 07:32:54',0),(328,108,291,'DataObject','Soluta non tempora alias quo odio maxime aut. Officiis qui dicta omnis officia saepe sint totam. Dolore impedit blanditiis occaecati corrupti facere. Et et veniam id aliquid labore consequuntur pariatur.','2011-09-13 07:32:55','2011-09-13 07:32:55','2011-09-13 07:32:55',0),(329,108,292,'DataObject','Ut atque autem illum non officiis vel dolor. Dolor aliquid quos accusamus aperiam dolore et voluptatibus enim. Magni expedita et et doloremque ea deserunt molestiae quae. Explicabo id quia quo quia cumque. Tenetur ut qui impedit aut numquam itaque recusandae adipisci.','2011-09-13 07:32:55','2011-09-13 07:32:55','2011-09-13 07:32:55',0),(330,108,293,'DataObject','Ut eum error voluptas aut labore quam officia vitae. Saepe possimus itaque occaecati. Error doloribus ex voluptatem consectetur.','2011-09-13 07:32:56','2011-09-13 07:32:56','2011-09-13 07:32:56',0),(331,108,295,'DataObject','Consequatur suscipit voluptas ex minima molestiae praesentium placeat voluptatem. Facere ipsum non soluta ab reiciendis nihil qui. Explicabo consequatur quas eum velit. Itaque et atque numquam sit voluptates officia.','2011-09-13 07:32:57','2011-09-13 07:32:57','2011-09-13 07:32:57',0),(332,97,491753,'TaxonConcept','This is a witty comment on the Anochetus mayri taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:59','2011-09-13 07:32:59','2011-09-13 07:32:59',0),(333,24,491753,'TaxonConcept','This is a witty comment on the Anochetus mayri taxon concept. Any resemblance to comments realor imagined is coincidental.','2011-09-13 07:32:59','2011-09-13 07:32:59','2011-09-13 07:32:59',0),(334,110,296,'DataObject','Voluptatem quos dolorum at facilis. Suscipit natus consequatur error esse. Eum enim esse at accusamus et eos est. Maxime alias cumque sunt et porro ex quas.','2011-09-13 07:32:59','2011-09-13 07:32:59','2011-09-13 07:32:59',0),(335,110,297,'DataObject','Qui voluptate inventore corrupti neque et est. Corporis temporibus similique qui. Ratione magni quasi deserunt omnis minima. Consequuntur quis placeat non nostrum quo voluptas.','2011-09-13 07:33:00','2011-09-13 07:33:00','2011-09-13 07:33:00',0),(336,110,298,'DataObject','At aliquid tenetur alias rerum. Quis ea eos dolore voluptatum at id dolorem et. Corporis cumque minima soluta ea voluptatem similique delectus.','2011-09-13 07:33:00','2011-09-13 07:33:00','2011-09-13 07:33:00',0),(337,110,299,'DataObject','Vel dicta labore neque. Rerum ipsa atque et. Nam et magni ea impedit sint est suscipit excepturi. Aspernatur esse sunt eaque. Et dolore porro est autem esse at iusto optio.','2011-09-13 07:33:01','2011-09-13 07:33:01','2011-09-13 07:33:01',0),(338,110,301,'DataObject','In voluptatem sunt quod ex consequatur a. Excepturi id expedita officia in sunt rerum. Expedita magnam et fugiat facere. Veniam neque odit blanditiis culpa omnis aliquam qui.','2011-09-13 07:33:01','2011-09-13 07:33:01','2011-09-13 07:33:01',0),(339,3,2866150,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:04','2011-09-13 07:33:04','2011-09-13 07:33:04',0),(340,4,2866150,'TaxonConcept','Beautiful!','2011-09-13 07:33:04','2011-09-13 07:33:04','2011-09-13 07:33:04',0),(341,5,2866150,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:04','2011-09-13 07:33:04','2011-09-13 07:33:04',0),(342,3,17924149,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:05','2011-09-13 07:33:05','2011-09-13 07:33:05',0),(343,4,17924149,'TaxonConcept','Beautiful!','2011-09-13 07:33:05','2011-09-13 07:33:05','2011-09-13 07:33:05',0),(344,5,17924149,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:05','2011-09-13 07:33:05','2011-09-13 07:33:05',0),(345,3,921737,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:05','2011-09-13 07:33:05','2011-09-13 07:33:05',0),(346,4,921737,'TaxonConcept','Beautiful!','2011-09-13 07:33:06','2011-09-13 07:33:06','2011-09-13 07:33:06',0),(347,5,921737,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:06','2011-09-13 07:33:06','2011-09-13 07:33:06',0),(348,3,328607,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:06','2011-09-13 07:33:06','2011-09-13 07:33:06',0),(349,4,328607,'TaxonConcept','Beautiful!','2011-09-13 07:33:06','2011-09-13 07:33:06','2011-09-13 07:33:06',0),(350,5,328607,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:07','2011-09-13 07:33:07','2011-09-13 07:33:07',0),(351,3,1061748,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:07','2011-09-13 07:33:07','2011-09-13 07:33:07',0),(352,4,1061748,'TaxonConcept','Beautiful!','2011-09-13 07:33:07','2011-09-13 07:33:07','2011-09-13 07:33:07',0),(353,5,1061748,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:07','2011-09-13 07:33:07','2011-09-13 07:33:07',0),(354,3,491753,'TaxonConcept','Could we add some images of this in its natural habitat?','2011-09-13 07:33:08','2011-09-13 07:33:08','2011-09-13 07:33:08',0),(355,4,491753,'TaxonConcept','Beautiful!','2011-09-13 07:33:08','2011-09-13 07:33:08','2011-09-13 07:33:08',0),(356,5,491753,'TaxonConcept','There are serious concerns about this species becoming endangered','2011-09-13 07:33:08','2011-09-13 07:33:08','2011-09-13 07:33:08',0),(357,3,5,'Collection','Are there enough curators for this?','2011-09-13 07:33:09','2011-09-13 07:33:09','2011-09-13 07:33:09',0),(358,4,5,'Collection','Excellent list!','2011-09-13 07:33:09','2011-09-13 07:33:09','2011-09-13 07:33:09',0),(359,5,5,'Collection','Should\'t this have a few more ducks?','2011-09-13 07:33:09','2011-09-13 07:33:09','2011-09-13 07:33:09',0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `published` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'Columbia Intro Biology','This is a community intended to showcase the newest features of Version 2 for the EOL website.','2011-09-13 07:33:03','2011-09-13 07:33:03',201107131232031,NULL,NULL,0,1);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_roles`
--

DROP TABLE IF EXISTS `contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='For content partner agent_contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_roles`
--

LOCK TABLES `contact_roles` WRITE;
/*!40000 ALTER TABLE `contact_roles` DISABLE KEYS */;
INSERT INTO `contact_roles` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_subjects`
--

DROP TABLE IF EXISTS `contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_subjects`
--

LOCK TABLES `contact_subjects` WRITE;
/*!40000 ALTER TABLE `contact_subjects` DISABLE KEYS */;
INSERT INTO `contact_subjects` VALUES (1,'test@test.com',1,'2011-09-11 07:27:07','2011-09-13 07:27:08');
/*!40000 ALTER TABLE `contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comments` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `referred_page` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `taxon_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_page_archives`
--

DROP TABLE IF EXISTS `content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `content_section_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `original_creation_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_page_archives`
--

LOCK TABLES `content_page_archives` WRITE;
/*!40000 ALTER TABLE `content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_pages`
--

DROP TABLE IF EXISTS `content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_pages`
--

LOCK TABLES `content_pages` WRITE;
/*!40000 ALTER TABLE `content_pages` DISABLE KEYS */;
INSERT INTO `content_pages` VALUES (1,'Home',1,1,0,1,NULL),(2,'Who We Are',2,1,0,1,NULL),(3,'Working Groups',1,1,0,1,2),(4,'Working Group A',1,1,0,1,3),(5,'Working Group B',2,1,0,1,3),(6,'Working Group C',3,1,0,1,3),(7,'Working Group D',4,1,0,1,3),(8,'Working Group E',5,1,0,1,3),(9,'Contact Us',3,1,0,1,NULL),(10,'Screencasts',4,1,0,1,NULL),(11,'Press Releases',5,1,0,1,NULL),(12,'terms_of_use',6,1,0,1,NULL),(13,'curator_central',7,1,0,1,NULL);
/*!40000 ALTER TABLE `content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_agreements`
--

DROP TABLE IF EXISTS `content_partner_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `template` text NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '1',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `mou_url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `signed_on_date` datetime DEFAULT NULL,
  `signed_by` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_agreements`
--

LOCK TABLES `content_partner_agreements` WRITE;
/*!40000 ALTER TABLE `content_partner_agreements` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_partner_agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_contacts`
--

DROP TABLE IF EXISTS `content_partner_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `title` varchar(20) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `homepage` varchar(255) CHARACTER SET ascii NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(30) CHARACTER SET ascii NOT NULL,
  `address` text NOT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='For content partners, specifying people to contact (each one';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_contacts`
--

LOCK TABLES `content_partner_contacts` WRITE;
/*!40000 ALTER TABLE `content_partner_contacts` DISABLE KEYS */;
INSERT INTO `content_partner_contacts` VALUES (1,1,1,'unique2string unique3string','Call me SIR','unique2string','unique3string','http://whatever.org','unique2string.unique3string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL),(2,2,1,'unique4string unique5string','Call me SIR','unique4string','unique5string','http://whatever.org','unique4string.unique5string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL),(3,4,1,'unique10string unique11string','Call me SIR','unique10string','unique11string','http://whatever.org','unique10string.unique11string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL),(4,5,1,'unique12string unique13string','Call me SIR','unique12string','unique13string','http://whatever.org','unique12string.unique13string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL),(5,6,1,'unique14string unique15string','Call me SIR','unique14string','unique15string','http://whatever.org','unique14string.unique15string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL),(6,7,1,'unique16string unique17string','Call me SIR','unique16string','unique17string','http://whatever.org','unique16string.unique17string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL);
/*!40000 ALTER TABLE `content_partner_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_statuses`
--

DROP TABLE IF EXISTS `content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_statuses`
--

LOCK TABLES `content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `content_partner_statuses` DISABLE KEYS */;
INSERT INTO `content_partner_statuses` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partners`
--

DROP TABLE IF EXISTS `content_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(4) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `full_name` text,
  `display_name` varchar(255) DEFAULT NULL,
  `acronym` varchar(20) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `description_of_data` text,
  `partner_seen_step` timestamp NULL DEFAULT NULL,
  `partner_complete_step` timestamp NULL DEFAULT NULL,
  `contacts_seen_step` timestamp NULL DEFAULT NULL,
  `contacts_complete_step` timestamp NULL DEFAULT NULL,
  `licensing_seen_step` timestamp NULL DEFAULT NULL,
  `licensing_complete_step` timestamp NULL DEFAULT NULL,
  `attribution_seen_step` timestamp NULL DEFAULT NULL,
  `attribution_complete_step` timestamp NULL DEFAULT NULL,
  `roles_seen_step` timestamp NULL DEFAULT NULL,
  `roles_complete_step` timestamp NULL DEFAULT NULL,
  `transfer_overview_seen_step` timestamp NULL DEFAULT NULL,
  `transfer_overview_complete_step` timestamp NULL DEFAULT NULL,
  `transfer_upload_seen_step` timestamp NULL DEFAULT NULL,
  `transfer_upload_complete_step` timestamp NULL DEFAULT NULL,
  `specialist_overview_seen_step` timestamp NULL DEFAULT NULL,
  `specialist_overview_complete_step` timestamp NULL DEFAULT NULL,
  `specialist_formatting_seen_step` timestamp NULL DEFAULT NULL,
  `specialist_formatting_complete_step` timestamp NULL DEFAULT NULL,
  `vetted` tinyint(4) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `last_completed_step` varchar(40) DEFAULT NULL,
  `notes` text NOT NULL,
  `ipr_accept` tinyint(4) NOT NULL DEFAULT '0',
  `attribution_accept` tinyint(4) NOT NULL DEFAULT '0',
  `roles_accept` tinyint(4) NOT NULL DEFAULT '0',
  `transfer_schema_accept` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `eol_notified_of_acceptance` datetime DEFAULT NULL,
  `auto_publish` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_partner_page` tinyint(1) NOT NULL DEFAULT '0',
  `show_mou_on_partner_page` tinyint(1) NOT NULL DEFAULT '0',
  `show_gallery_on_partner_page` tinyint(1) NOT NULL DEFAULT '0',
  `show_stats_on_partner_page` tinyint(1) NOT NULL DEFAULT '0',
  `admin_notes` text,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partners`
--

LOCK TABLES `content_partners` WRITE;
/*!40000 ALTER TABLE `content_partners` DISABLE KEYS */;
INSERT INTO `content_partners` VALUES (1,1,1,'IUCN',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11','2011-09-08 04:27:11',0,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:27:11','2011-09-13 04:27:11',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(2,1,2,'Catalogue of Life',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12',0,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:27:12','2011-09-13 04:27:12',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(3,1,3,'Biology of Aging',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12','2011-09-08 04:27:12',0,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:27:12','2011-09-13 04:27:12',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(4,1,4,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44','2011-09-08 04:27:44',1,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:27:44','2011-09-13 04:27:44',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(5,1,35,'Partner name',NULL,NULL,NULL,'Civil Protection!','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00','2009-10-21 08:00:00',1,'description of the partner',NULL,'',1,1,1,1,'2011-09-08 04:29:01','2011-09-13 04:29:01',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(6,1,36,'Test ContenPartner',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02','2011-09-08 04:29:02',1,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:29:02','2011-09-13 04:29:02',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0),(7,1,40,'NCBI',NULL,NULL,NULL,'Civil Protection!','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12','2011-09-08 04:29:12',0,'Our Testing Content Partner',NULL,'',1,1,1,1,'2011-09-08 04:29:12','2011-09-13 04:29:12',NULL,0,1,0,0,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `content_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_table_items`
--

DROP TABLE IF EXISTS `content_table_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_table_items` (
  `content_table_id` int(11) NOT NULL,
  `toc_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_table_items`
--

LOCK TABLES `content_table_items` WRITE;
/*!40000 ALTER TABLE `content_table_items` DISABLE KEYS */;
INSERT INTO `content_table_items` VALUES (1,1,'2011-09-13 07:27:26','2011-09-13 07:27:26'),(2,2,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,3,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,39,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,19,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,15,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,7,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,22,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,40,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,9,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,27,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,10,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,5,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,1,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,14,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,25,'2011-09-13 07:31:15','2011-09-13 07:31:15'),(2,8,'2011-09-13 07:31:15','2011-09-13 07:31:15');
/*!40000 ALTER TABLE `content_table_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tables`
--

DROP TABLE IF EXISTS `content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tables`
--

LOCK TABLES `content_tables` WRITE;
/*!40000 ALTER TABLE `content_tables` DISABLE KEYS */;
INSERT INTO `content_tables` VALUES (2,'2011-09-13 07:31:15','2011-09-13 07:31:15');
/*!40000 ALTER TABLE `content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_uploads`
--

DROP TABLE IF EXISTS `content_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `link_name` varchar(70) DEFAULT NULL,
  `attachment_cache_url` bigint(20) DEFAULT NULL,
  `attachment_extension` varchar(10) DEFAULT NULL,
  `attachment_content_type` varchar(255) DEFAULT NULL,
  `attachment_file_name` varchar(255) DEFAULT NULL,
  `attachment_file_size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_uploads`
--

LOCK TABLES `content_uploads` WRITE;
/*!40000 ALTER TABLE `content_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `curated_data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_data_objects_hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_object_id` (`data_object_id`),
  KEY `data_object_id_hierarchy_entry_id` (`data_object_id`,`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_data_objects_hierarchy_entries`
--

LOCK TABLES `curated_data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `curated_hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `equivalent` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `hierarchy_entry_id_2` (`hierarchy_entry_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_hierarchy_entry_relationships`
--

LOCK TABLES `curated_hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_activity_logs_untrust_reasons`
--

DROP TABLE IF EXISTS `curator_activity_logs_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_activity_logs_untrust_reasons` (
  `curator_activity_log_id` int(11) NOT NULL,
  `untrust_reason_id` int(11) NOT NULL,
  PRIMARY KEY (`curator_activity_log_id`,`untrust_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_activity_logs_untrust_reasons`
--

LOCK TABLES `curator_activity_logs_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_levels`
--

DROP TABLE IF EXISTS `curator_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `rating_weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_levels`
--

LOCK TABLES `curator_levels` WRITE;
/*!40000 ALTER TABLE `curator_levels` DISABLE KEYS */;
INSERT INTO `curator_levels` VALUES (1,'Master Curator',1),(2,'Assistant Curator',1),(3,'Full Curator',1);
/*!40000 ALTER TABLE `curator_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_data_object_tags`
--

DROP TABLE IF EXISTS `data_object_data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `data_object_tag_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_data_object_data_object_tags_1` (`data_object_guid`,`data_object_tag_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_data_object_tags`
--

LOCK TABLES `data_object_data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tags`
--

DROP TABLE IF EXISTS `data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `total_usage_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tags`
--

LOCK TABLES `data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_translations`
--

DROP TABLE IF EXISTS `data_object_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `original_data_object_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_translations`
--

LOCK TABLES `data_object_translations` WRITE;
/*!40000 ALTER TABLE `data_object_translations` DISABLE KEYS */;
INSERT INTO `data_object_translations` VALUES (1,272,271,3,'2011-09-13 07:34:03','2011-09-13 07:34:03'),(2,273,271,2,'2011-09-13 07:34:03','2011-09-13 07:34:03');
/*!40000 ALTER TABLE `data_object_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects`
--

DROP TABLE IF EXISTS `data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'this guid is generated by EOL. A 32 character hexadecimal',
  `identifier` varchar(255) DEFAULT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `data_subtype_id` smallint(5) unsigned DEFAULT NULL,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `object_title` varchar(255) NOT NULL COMMENT 'a string title for the object. Generally not used for images',
  `language_id` smallint(5) unsigned NOT NULL,
  `metadata_language_id` smallint(5) unsigned DEFAULT NULL,
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(300) NOT NULL COMMENT 'a brief statement of the copyright protection for this object',
  `rights_holder` text NOT NULL COMMENT 'a string stating the owner of copyright for this object',
  `bibliographic_citation` text NOT NULL,
  `source_url` text COMMENT 'a url where users are to be redirected to learn more about this data object',
  `description` mediumtext NOT NULL,
  `description_linked` mediumtext,
  `object_url` text COMMENT 'recommended; the url which resolves to this data object. Generally used only for images, video, and other multimedia',
  `object_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the object. For example, a value may be 200902090812345 - that will be split by middleware into the parts 2009/02/09/08/12345 which represents the storage directory structure. The directory structure rep',
  `thumbnail_url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; the url which resolves to a thumbnail representation of this object. Generally used only for images, video, and other multimedia',
  `thumbnail_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the thumbnail',
  `location` varchar(255) NOT NULL,
  `latitude` double NOT NULL COMMENT 'the latitude at which the object was first collected/captured. We have no standard way of represdenting this. Usually measured in decimal values, but could also be degrees',
  `longitude` double NOT NULL COMMENT 'the longitude at which the object was first collected/captured',
  `altitude` double NOT NULL COMMENT 'the altitude at which the object was first collected/captured',
  `object_created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was originally created. Information contained within the resource',
  `object_modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified. Information contained within the resource',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when the object was added to the EOL index',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified within the EOL index. This should pretty much always equal the created_at date, therefore is likely not necessary',
  `available_at` timestamp NULL DEFAULT NULL,
  `data_rating` float NOT NULL DEFAULT '2.5',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object is currently published',
  `curated` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object has ever been curated',
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `index_data_objects_on_guid` (`guid`),
  KEY `index_data_objects_on_published` (`published`),
  KEY `created_at` (`created_at`),
  KEY `identifier` (`identifier`),
  KEY `object_url` (`object_url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects`
--

LOCK TABLES `data_objects` WRITE;
/*!40000 ALTER TABLE `data_objects` DISABLE KEYS */;
INSERT INTO `data_objects` VALUES (1,'a509ebdb2fc8083f3a33ea17985bad42','',NULL,1,NULL,1,'',1,NULL,8,'','','','','Test Data Object',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:27','2011-09-11 04:27:27','2011-09-13 04:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(2,'3a117abf96e7fe8793ef87b14d166d5h','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Accusantium quis accusamus ut nostrum illo sint.',NULL,'',200812102286938,'',NULL,'',0,0,0,'2011-09-08 04:27:46','2011-09-11 04:27:46','2011-09-13 03:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(3,'a509ebdb2fc8083f3a33ea17985bad44','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Atque fuga molestias assumenda delectus sed perferendis facere dolor.',NULL,'',200901131511113,'',NULL,'',0,0,0,'2011-09-08 04:27:47','2011-09-11 04:27:47','2011-09-13 02:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(4,'3a117abf96e7fe8793ef87b14d166d5i','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Repudiandae corporis quod alias temporibus ut molestias.',NULL,'',200811131321659,'',NULL,'',0,0,0,'2011-09-08 04:27:48','2011-09-11 04:27:48','2011-09-13 01:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(5,'a509ebdb2fc8083f3a33ea17985bad45','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Cupiditate vitae consequatur esse nostrum.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:27:48','2011-09-11 04:27:48','2011-09-13 00:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(6,'3a117abf96e7fe8793ef87b14d166d5j','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Eum ipsum dolores quae.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2011-09-08 04:27:48','2011-09-11 04:27:48','2011-09-12 23:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(7,'a509ebdb2fc8083f3a33ea17985bad46','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:49','2011-09-11 04:27:49','2011-09-12 22:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(8,'3a117abf96e7fe8793ef87b14d166d5k','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:49','2011-09-11 04:27:49','2011-09-12 21:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(9,'a509ebdb2fc8083f3a33ea17985bad47','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Qui rerum magni delectus ut dignissimos. Rerum et perferendis doloremque consequuntur nihil et necessitatibus occaecati. Asperiores vel minus mollitia qui non.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:50','2011-09-11 04:27:50','2011-09-12 20:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(10,'3a117abf96e7fe8793ef87b14d166d5l','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Harum minus rerum veritatis molestiae dolor quos. Necessitatibus expedita nulla ad. Magnam nostrum accusamus voluptate at iure voluptas omnis. Quod et accusantium adipisci nisi quae dolore.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:50','2011-09-11 04:27:50','2011-09-12 19:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(11,'3a117abf96e7fe8793ef87b14d166d5m','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Minus quas culpa dolor.',NULL,'',200810061535996,'',NULL,'',0,0,0,'2011-09-08 04:27:53','2011-09-11 04:27:53','2011-09-12 18:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(12,'a509ebdb2fc8083f3a33ea17985bad49','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Saepe exercitationem quisquam et.',NULL,'',200810061235832,'',NULL,'',0,0,0,'2011-09-08 04:27:54','2011-09-11 04:27:54','2011-09-12 17:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(13,'3a117abf96e7fe8793ef87b14d166d5n','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Eum consequatur inventore corrupti harum.',NULL,'',200811131394659,'',NULL,'',0,0,0,'2011-09-08 04:27:54','2011-09-11 04:27:54','2011-09-12 16:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(14,'a509ebdb2fc8083f3a33ea17985bad50','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Fuga illum delectus expedita quia sunt rerum.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:27:54','2011-09-11 04:27:54','2011-09-12 15:31:20','2011-09-13 04:31:20',NULL,2.5,1,0),(15,'3a117abf96e7fe8793ef87b14d166d5o','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Dicta voluptatem eveniet inventore accusamus.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2011-09-08 04:27:55','2011-09-11 04:27:55','2011-09-12 14:31:20','2011-09-13 04:31:21',NULL,2.5,1,0),(16,'a509ebdb2fc8083f3a33ea17985bad51','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:55','2011-09-11 04:27:55','2011-09-12 13:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(17,'3a117abf96e7fe8793ef87b14d166d5p','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:55','2011-09-11 04:27:55','2011-09-12 12:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(18,'a509ebdb2fc8083f3a33ea17985bad52','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Mollitia eaque voluptatibus eveniet magnam corrupti repudiandae perferendis. Placeat enim porro praesentium sed itaque ut laborum. Sit exercitationem nihil temporibus voluptates voluptatem. Iste quia modi qui labore qui aliquam eos. Quasi voluptates consequatur nobis doloremque.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:56','2011-09-11 04:27:56','2011-09-12 11:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(19,'3a117abf96e7fe8793ef87b14d166d5q','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Libero numquam nobis est. Aperiam fugit eius autem autem. Provident in est repellat sapiente sed eum qui explicabo.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:27:56','2011-09-11 04:27:56','2011-09-12 10:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(20,'3a117abf96e7fe8793ef87b14d166d5r','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Quas ab voluptatibus delectus.',NULL,'',200810070724291,'',NULL,'',0,0,0,'2011-09-08 04:27:59','2011-09-11 04:27:59','2011-09-12 09:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(21,'a509ebdb2fc8083f3a33ea17985bad54','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Animi doloremque a dolorum minus magni laudantium commodi.',NULL,'',200810070393325,'',NULL,'',0,0,0,'2011-09-08 04:28:00','2011-09-11 04:28:00','2011-09-12 08:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(22,'3a117abf96e7fe8793ef87b14d166d5s','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Sunt cupiditate omnis sapiente sit illo nisi repellat deserunt.',NULL,'',200811131367814,'',NULL,'',0,0,0,'2011-09-08 04:28:00','2011-09-11 04:28:00','2011-09-12 07:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(23,'a509ebdb2fc8083f3a33ea17985bad55','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Voluptas quibusdam impedit omnis excepturi sed tenetur necessitatibus.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:01','2011-09-11 04:28:01','2011-09-12 06:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(24,'3a117abf96e7fe8793ef87b14d166d5t','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Et optio eligendi sunt beatae quia sit eveniet vero.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2011-09-08 04:28:01','2011-09-11 04:28:01','2011-09-12 05:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(25,'a509ebdb2fc8083f3a33ea17985bad56','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:01','2011-09-11 04:28:01','2011-09-12 04:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(26,'3a117abf96e7fe8793ef87b14d166d5u','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:02','2011-09-11 04:28:02','2011-09-12 03:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(27,'a509ebdb2fc8083f3a33ea17985bad57','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Quod ut aut ratione ea eveniet voluptatibus veritatis. Eius magnam vero quasi nam illo enim optio. Iusto amet consequatur reprehenderit sunt sint molestiae error. Quisquam numquam qui qui enim. Sit ipsa odit veniam.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:02','2011-09-11 04:28:02','2011-09-12 02:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(28,'3a117abf96e7fe8793ef87b14d166d5v','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Ullam quibusdam mollitia placeat occaecati eius. Similique dolorem non mollitia. Iure dolore sunt voluptatum recusandae.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:03','2011-09-11 04:28:03','2011-09-12 01:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(29,'3a117abf96e7fe8793ef87b14d166d5w','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Illo culpa pariatur sapiente modi aut quam in dolorem.',NULL,'',200810061499033,'',NULL,'',0,0,0,'2011-09-08 04:28:05','2011-09-11 04:28:05','2011-09-12 00:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(30,'a509ebdb2fc8083f3a33ea17985bad59','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Maiores sit consectetur ut atque.',NULL,'',200810061956645,'',NULL,'',0,0,0,'2011-09-08 04:28:06','2011-09-11 04:28:06','2011-09-11 23:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(31,'3a117abf96e7fe8793ef87b14d166d5x','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Quia quasi aut sed.',NULL,'',200811131351121,'',NULL,'',0,0,0,'2011-09-08 04:28:06','2011-09-11 04:28:06','2011-09-11 22:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(32,'a509ebdb2fc8083f3a33ea17985bad60','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Reiciendis qui vitae aliquid error voluptatem non perspiciatis.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:07','2011-09-11 04:28:07','2011-09-11 21:31:21','2011-09-13 04:31:21',NULL,2.5,1,0),(33,'3a117abf96e7fe8793ef87b14d166d5y','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Consequatur natus ducimus dicta aut dolorem.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2011-09-08 04:28:07','2011-09-11 04:28:07','2011-09-11 20:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(34,'a509ebdb2fc8083f3a33ea17985bad61','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:07','2011-09-11 04:28:07','2011-09-11 19:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(35,'3a117abf96e7fe8793ef87b14d166d5z','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:07','2011-09-11 04:28:07','2011-09-11 18:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(36,'a509ebdb2fc8083f3a33ea17985bad62','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Itaque quasi dolore voluptatum possimus est necessitatibus consectetur. Est aliquid dolorem eos temporibus quibusdam. Est voluptatibus officiis alias ea dolorum repudiandae et quibusdam. Et sit ad odio ipsum sint.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:08','2011-09-11 04:28:08','2011-09-11 17:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(37,'3a117abf96e7fe8793ef87b14d166d6a','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Amet ab eum possimus tempore. Nihil explicabo commodi quo. In tempora minima eum. Dolor sunt qui mollitia voluptatum veritatis. Itaque labore in velit aspernatur ut maiores recusandae.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:09','2011-09-11 04:28:09','2011-09-11 16:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(38,'3a117abf96e7fe8793ef87b14d166d6b','',NULL,1,NULL,1,'',1,NULL,1,'','','','','A ea odio dolor laborum.',NULL,'',200901081611403,'',NULL,'',0,0,0,'2011-09-08 04:28:12','2011-09-11 04:28:12','2011-09-11 15:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(39,'a509ebdb2fc8083f3a33ea17985bad64','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Tenetur in consectetur molestiae sit velit.',NULL,'',200902021821277,'',NULL,'',0,0,0,'2011-09-08 04:28:12','2011-09-11 04:28:12','2011-09-11 14:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(40,'3a117abf96e7fe8793ef87b14d166d6c','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Et consectetur quam et ducimus voluptas officiis ad.',NULL,'',200811131388288,'',NULL,'',0,0,0,'2011-09-08 04:28:12','2011-09-11 04:28:12','2011-09-11 13:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(41,'a509ebdb2fc8083f3a33ea17985bad65','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Nesciunt sequi et dolorum.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:13','2011-09-11 04:28:13','2011-09-11 12:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(42,'3a117abf96e7fe8793ef87b14d166d6d','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Recusandae in ut est omnis fuga minima dolorum.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2011-09-08 04:28:13','2011-09-11 04:28:13','2011-09-11 11:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(43,'a509ebdb2fc8083f3a33ea17985bad66','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:13','2011-09-11 04:28:13','2011-09-11 10:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(44,'3a117abf96e7fe8793ef87b14d166d6e','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:14','2011-09-11 04:28:14','2011-09-11 09:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(45,'a509ebdb2fc8083f3a33ea17985bad67','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Blanditiis aut sed iusto qui ea excepturi nostrum. Dolorem exercitationem harum rerum impedit aut blanditiis nostrum. Doloremque et vel qui dolores.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:14','2011-09-11 04:28:14','2011-09-11 08:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(46,'3a117abf96e7fe8793ef87b14d166d6f','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Est deleniti occaecati repellat dolores libero atque et. Enim tempora ut et. Cumque dolor voluptates cupiditate perspiciatis quia. Soluta aspernatur atque eveniet quia quisquam. Animi dicta ut dolores alias ut.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:15','2011-09-11 04:28:15','2011-09-11 07:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(47,'3a117abf96e7fe8793ef87b14d166d6g','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Quis officiis nobis dicta sed quod.',NULL,'',200810070121645,'',NULL,'',0,0,0,'2011-09-08 04:28:17','2011-09-11 04:28:17','2011-09-11 06:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(48,'a509ebdb2fc8083f3a33ea17985bad69','',NULL,1,NULL,1,'',1,NULL,1,'','','','','inappropriate',NULL,'',200901081525790,'',NULL,'',0,0,0,'2011-09-08 04:28:19','2011-09-11 04:28:19','2011-09-11 05:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(49,'3a117abf96e7fe8793ef87b14d166d6h','',NULL,1,NULL,1,'',1,NULL,1,'','','','','untrusted',NULL,'',200810070370443,'',NULL,'',0,0,0,'2011-09-08 04:28:19','2011-09-11 04:28:19','2011-09-11 04:31:22','2011-09-13 04:31:22',NULL,2.5,1,0),(50,'a509ebdb2fc8083f3a33ea17985bad70','',NULL,1,NULL,1,'',1,NULL,1,'','','','','unknown',NULL,'',200810081234383,'',NULL,'',0,0,0,'2011-09-08 04:28:20','2011-09-11 04:28:20','2011-09-11 03:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(51,'3a117abf96e7fe8793ef87b14d166d6i','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible',NULL,'',200901091228271,'',NULL,'',0,0,0,'2011-09-08 04:28:21','2011-09-11 04:28:21','2011-09-11 02:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(52,'a509ebdb2fc8083f3a33ea17985bad71','',NULL,1,NULL,1,'',1,NULL,1,'','','','','preview',NULL,'',200810061332994,'',NULL,'',0,0,0,'2011-09-08 04:28:21','2011-09-11 04:28:21','2011-09-11 01:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(53,'3a117abf96e7fe8793ef87b14d166d6j','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible, unknown',NULL,'',200810070196948,'',NULL,'',0,0,0,'2011-09-08 04:28:22','2011-09-11 04:28:22','2011-09-11 00:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(54,'a509ebdb2fc8083f3a33ea17985bad72','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible, untrusted',NULL,'',200810070198474,'',NULL,'',0,0,0,'2011-09-08 04:28:22','2011-09-11 04:28:22','2011-09-10 23:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(55,'3a117abf96e7fe8793ef87b14d166d6k','',NULL,1,NULL,1,'',1,NULL,1,'','','','','preview, unknown',NULL,'',200810070110656,'',NULL,'',0,0,0,'2011-09-08 04:28:23','2011-09-11 04:28:23','2011-09-10 22:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(56,'a509ebdb2fc8083f3a33ea17985bad73','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Eos quos quo assumenda rerum qui molestias soluta.',NULL,'',200811131382797,'',NULL,'',0,0,0,'2011-09-08 04:28:23','2011-09-11 04:28:23','2011-09-10 21:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(57,'3a117abf96e7fe8793ef87b14d166d6l','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Quod magni accusantium sint cum maiores et.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:23','2011-09-11 04:28:23','2011-09-10 20:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(58,'a509ebdb2fc8083f3a33ea17985bad74','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Vitae ab rerum quasi soluta adipisci rerum.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2011-09-08 04:28:24','2011-09-11 04:28:24','2011-09-10 19:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(59,'3a117abf96e7fe8793ef87b14d166d6m','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:24','2011-09-11 04:28:24','2011-09-10 18:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(60,'a509ebdb2fc8083f3a33ea17985bad75','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:24','2011-09-11 04:28:24','2011-09-10 17:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(61,'3a117abf96e7fe8793ef87b14d166d6n','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Debitis consequatur odio voluptas sit modi vel cum. Ipsum in dignissimos suscipit accusamus ut voluptas quibusdam. Omnis qui maxime delectus hic cupiditate molestias.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:25','2011-09-11 04:28:25','2011-09-10 16:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(62,'a509ebdb2fc8083f3a33ea17985bad76','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Aut rem non repellat nihil. Quas harum consequatur quo quod voluptatem possimus alias. Qui ab sunt excepturi nulla occaecati voluptates sed iusto. Omnis perferendis minima qui error deserunt molestias assumenda voluptate.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:25','2011-09-11 04:28:25','2011-09-10 15:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(63,'a509ebdb2fc8083f3a33ea17985bad77','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Qui voluptate ut quo aut.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2011-09-08 04:28:31','2011-09-11 04:28:31','2011-09-10 14:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(64,'a509ebdb2fc8083f3a33ea17985bad78','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Voluptas in sit quibusdam voluptatem ipsum.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2011-09-08 04:28:33','2011-09-11 04:28:33','2011-09-10 13:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(65,'a509ebdb2fc8083f3a33ea17985bad79','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Aut dolores sed et nam iure unde.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2011-09-08 04:28:35','2011-09-11 04:28:35','2011-09-10 12:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(66,'a509ebdb2fc8083f3a33ea17985bad80','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Reiciendis odio odit earum.',NULL,'',200810070115930,'',NULL,'',0,0,0,'2011-09-08 04:28:36','2011-09-11 04:28:36','2011-09-10 11:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(67,'3a117abf96e7fe8793ef87b14d166d6s','',NULL,1,NULL,1,'',1,NULL,1,'','','','','inappropriate',NULL,'',200810070134999,'',NULL,'',0,0,0,'2011-09-08 04:28:38','2011-09-11 04:28:38','2011-09-10 10:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(68,'a509ebdb2fc8083f3a33ea17985bad81','',NULL,1,NULL,1,'',1,NULL,1,'','','','','untrusted',NULL,'',200810070120198,'',NULL,'',0,0,0,'2011-09-08 04:28:38','2011-09-11 04:28:38','2011-09-10 09:31:23','2011-09-13 04:31:23',NULL,2.5,1,0),(69,'3a117abf96e7fe8793ef87b14d166d6t','',NULL,1,NULL,1,'',1,NULL,1,'','','','','unknown',NULL,'',200810070145257,'',NULL,'',0,0,0,'2011-09-08 04:28:38','2011-09-11 04:28:38','2011-09-10 08:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(70,'a509ebdb2fc8083f3a33ea17985bad82','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible',NULL,'',200810070184502,'',NULL,'',0,0,0,'2011-09-08 04:28:39','2011-09-11 04:28:39','2011-09-10 07:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(71,'3a117abf96e7fe8793ef87b14d166d6u','',NULL,1,NULL,1,'',1,NULL,1,'','','','','preview',NULL,'',200810070142968,'',NULL,'',0,0,0,'2011-09-08 04:28:39','2011-09-11 04:28:39','2011-09-10 06:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(72,'a509ebdb2fc8083f3a33ea17985bad83','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible, unknown',NULL,'',200810070166596,'',NULL,'',0,0,0,'2011-09-08 04:28:40','2011-09-11 04:28:40','2011-09-10 05:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(73,'3a117abf96e7fe8793ef87b14d166d6v','',NULL,1,NULL,1,'',1,NULL,1,'','','','','invisible, untrusted',NULL,'',200810070180055,'',NULL,'',0,0,0,'2011-09-08 04:28:40','2011-09-11 04:28:40','2011-09-10 04:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(74,'a509ebdb2fc8083f3a33ea17985bad84','',NULL,1,NULL,1,'',1,NULL,1,'','','','','preview, unknown',NULL,'',200810070142875,'',NULL,'',0,0,0,'2011-09-08 04:28:41','2011-09-11 04:28:41','2011-09-10 03:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(75,'3a117abf96e7fe8793ef87b14d166d6w','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Non rerum ipsum sed velit voluptate.',NULL,'',200811131390600,'',NULL,'',0,0,0,'2011-09-08 04:28:41','2011-09-11 04:28:41','2011-09-10 02:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(76,'a509ebdb2fc8083f3a33ea17985bad85','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Quas inventore eaque ut.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:41','2011-09-11 04:28:41','2011-09-10 01:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(77,'3a117abf96e7fe8793ef87b14d166d6x','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Tempora velit nisi explicabo quia natus.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2011-09-08 04:28:41','2011-09-11 04:28:41','2011-09-10 00:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(78,'a509ebdb2fc8083f3a33ea17985bad86','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:42','2011-09-11 04:28:42','2011-09-09 23:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(79,'3a117abf96e7fe8793ef87b14d166d6y','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:43','2011-09-11 04:28:43','2011-09-09 22:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(80,'a509ebdb2fc8083f3a33ea17985bad87','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Laboriosam sed a qui. Voluptates perferendis cupiditate nobis quaerat excepturi. Officia illo voluptatem quo.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:43','2011-09-11 04:28:43','2011-09-09 21:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(81,'3a117abf96e7fe8793ef87b14d166d6z','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Ex repudiandae aliquam dolorem aut dicta vel id numquam. Qui fugiat quo sequi aut iusto quis. Neque non voluptatum dolores libero tempora eos deleniti.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:43','2011-09-11 04:28:43','2011-09-09 20:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(82,'3a117abf96e7fe8793ef87b14d166d7a','',NULL,1,NULL,1,'',1,NULL,1,'','','','','1st image description for re-harvest',NULL,'',200810070122730,'',NULL,'',0,0,0,'2011-09-08 04:28:47','2011-09-11 04:28:47','2011-09-09 19:31:24','2011-09-13 04:31:24',NULL,1,0,0),(83,'a509ebdb2fc8083f3a33ea17985bad89','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Tenetur reiciendis sit adipisci consequatur et natus veniam occaecati.',NULL,'',200811131333916,'',NULL,'',0,0,0,'2011-09-08 04:28:47','2011-09-11 04:28:47','2011-09-09 18:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(84,'3a117abf96e7fe8793ef87b14d166d7b','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Adipisci neque voluptate in nam.',NULL,'',200811131393000,'',NULL,'',0,0,0,'2011-09-08 04:28:48','2011-09-11 04:28:48','2011-09-09 17:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(85,'a509ebdb2fc8083f3a33ea17985bad90','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Eligendi a eum fugit.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:48','2011-09-11 04:28:48','2011-09-09 16:31:24','2011-09-13 04:31:24',NULL,2.5,1,0),(86,'3a117abf96e7fe8793ef87b14d166d7c','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Officiis atque voluptatem laboriosam cumque maxime nobis ipsam.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:48','2011-09-11 04:28:48','2011-09-09 15:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(87,'a509ebdb2fc8083f3a33ea17985bad91','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Ab molestiae autem ipsam.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2011-09-08 04:28:48','2011-09-11 04:28:48','2011-09-09 14:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(88,'3a117abf96e7fe8793ef87b14d166d7d','',NULL,3,NULL,3,'',1,NULL,1,'','','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:49','2011-09-11 04:28:49','2011-09-09 13:31:25','2011-09-13 04:31:25',NULL,1,0,0),(89,'a509ebdb2fc8083f3a33ea17985bad92','',NULL,3,NULL,3,'',1,NULL,1,'','','','','description text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:49','2011-09-11 04:28:49','2011-09-09 12:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(90,'3a117abf96e7fe8793ef87b14d166d7d','',NULL,3,NULL,3,'',1,NULL,1,'','','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:49','2011-09-11 04:28:49','2011-09-09 11:31:25','2011-09-13 04:31:25',NULL,1,1,0),(91,'3a117abf96e7fe8793ef87b14d166d7a','',NULL,1,NULL,1,'',1,NULL,1,'','','','','1st image description for re-harvest',NULL,'',200810070122730,'',NULL,'',0,0,0,'2011-09-08 04:28:47','2011-09-11 04:28:47','2011-09-09 10:31:25','2011-09-13 04:31:25',NULL,1,1,0),(92,'a509ebdb2fc8083f3a33ea17985bad93','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Dolor ratione eveniet consectetur nam exercitationem.',NULL,'',200810070199754,'',NULL,'',0,0,0,'2011-09-08 04:28:55','2011-09-11 04:28:55','2011-09-09 09:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(93,'3a117abf96e7fe8793ef87b14d166d7f','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Ullam qui sunt et sed.',NULL,'',200810070167455,'',NULL,'',0,0,0,'2011-09-08 04:28:55','2011-09-11 04:28:55','2011-09-09 08:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(94,'a509ebdb2fc8083f3a33ea17985bad94','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Officia ducimus cupiditate placeat dicta suscipit molestias.',NULL,'',200811131347554,'',NULL,'',0,0,0,'2011-09-08 04:28:56','2011-09-11 04:28:56','2011-09-09 07:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(95,'3a117abf96e7fe8793ef87b14d166d7g','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Ex recusandae quos debitis et ut in autem ea.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:28:56','2011-09-11 04:28:56','2011-09-09 06:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(96,'a509ebdb2fc8083f3a33ea17985bad95','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Voluptatem autem consequatur sapiente.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2011-09-08 04:28:56','2011-09-11 04:28:56','2011-09-09 05:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(97,'3a117abf96e7fe8793ef87b14d166d7h','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Repellendus quisquam voluptas nesciunt architecto qui aperiam placeat in. Facilis nihil non minus animi repellat exercitationem est. Qui quisquam aut quos aut quasi saepe. Illo aut similique quae et aut. Eligendi in consequuntur earum non fuga possimus.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:57','2011-09-11 04:28:57','2011-09-09 04:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(98,'a509ebdb2fc8083f3a33ea17985bad96','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Rem inventore eaque vel repudiandae. Illo quod adipisci iusto et possimus et quaerat. Voluptatem aliquam quis asperiores expedita deserunt voluptates maiores.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:57','2011-09-11 04:28:57','2011-09-09 03:31:25','2011-09-13 04:31:25',NULL,2.5,1,0),(99,'3a117abf96e7fe8793ef87b14d166d7i','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Et similique vel dolorum aliquid sunt nihil eos. Repellendus labore possimus fugit autem quo. Dolores magnam quisquam aut omnis aut. Necessitatibus ab qui fugiat. Eum et aspernatur voluptates.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:28:58','2011-09-11 04:28:58','2011-09-09 02:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(100,'3a117abf96e7fe8793ef87b14d166d7j','',NULL,1,NULL,1,'',1,NULL,1,'','','','','This should only be seen by ContentPartner Our Testing Content Partner',NULL,'',200810070100654,'',NULL,'',0,0,0,'2011-09-08 04:29:02','2011-09-11 04:29:02','2011-09-09 01:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(101,'a509ebdb2fc8083f3a33ea17985bad99','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et magni quia similique minus nesciunt non accusamus voluptatem.',NULL,'',200810070118167,'',NULL,'',0,0,0,'2011-09-08 04:29:05','2011-09-11 04:29:05','2011-09-09 00:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(102,'3a117abf96e7fe8793ef87b14d166d7l','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Eius ea omnis sed.',NULL,'',200810070157819,'',NULL,'',0,0,0,'2011-09-08 04:29:06','2011-09-11 04:29:06','2011-09-08 23:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(103,'a509ebdb2fc8083f3a33ea17985bae00','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Occaecati quas voluptatibus nisi deserunt modi odio amet.',NULL,'',200811131354820,'',NULL,'',0,0,0,'2011-09-08 04:29:06','2011-09-11 04:29:06','2011-09-08 22:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(104,'3a117abf96e7fe8793ef87b14d166d7m','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Sit repellendus consequatur omnis voluptas voluptas quia dolorem enim.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:06','2011-09-11 04:29:06','2011-09-08 21:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(105,'a509ebdb2fc8083f3a33ea17985bae01','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Ab eligendi itaque ducimus reiciendis provident.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2011-09-08 04:29:07','2011-09-11 04:29:07','2011-09-08 20:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(106,'3a117abf96e7fe8793ef87b14d166d7n','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Autema officiaalius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:07','2011-09-11 04:29:07','2011-09-08 19:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(107,'a509ebdb2fc8083f3a33ea17985bae02','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Autema officiaalius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:07','2011-09-11 04:29:07','2011-09-08 18:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(108,'3a117abf96e7fe8793ef87b14d166d7o','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Sit quo qui ipsum in dolores sequi est. Omnis dolor eum aliquid in quia corporis. Rerum voluptatem ad soluta enim. In sit dolorem adipisci qui error numquam.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:08','2011-09-11 04:29:08','2011-09-08 17:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(109,'a509ebdb2fc8083f3a33ea17985bae03','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Ad consequatur excepturi reprehenderit aut. Quisquam voluptate aut beatae. Sequi quia magnam optio odit quod laborum. Distinctio in quos alias.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:08','2011-09-11 04:29:08','2011-09-08 16:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(110,'a509ebdb2fc8083f3a33ea17985bae07','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Delectus itaque totam quas tempore.',NULL,'',200810070199720,'',NULL,'',0,0,0,'2011-09-08 04:29:13','2011-09-11 04:29:13','2011-09-08 15:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(111,'3a117abf96e7fe8793ef87b14d166d7t','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Nesciunt praesentium laborum dolores nisi.',NULL,'',200810070104387,'',NULL,'',0,0,0,'2011-09-08 04:29:14','2011-09-11 04:29:14','2011-09-08 14:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(112,'a509ebdb2fc8083f3a33ea17985bae08','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Optio facere exercitationem quas quasi eaque quae.',NULL,'',200811131391764,'',NULL,'',0,0,0,'2011-09-08 04:29:14','2011-09-11 04:29:14','2011-09-08 13:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(113,'3a117abf96e7fe8793ef87b14d166d7u','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Doloribus consequatur voluptas dolores ipsam in.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:15','2011-09-11 04:29:15','2011-09-08 12:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(114,'a509ebdb2fc8083f3a33ea17985bae09','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Praesentium facilis repellendus sit possimus nobis numquam inventore.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2011-09-08 04:29:15','2011-09-11 04:29:15','2011-09-08 11:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(115,'3a117abf96e7fe8793ef87b14d166d7v','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:15','2011-09-11 04:29:15','2011-09-08 10:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(116,'a509ebdb2fc8083f3a33ea17985bae10','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:16','2011-09-11 04:29:16','2011-09-08 09:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(117,'3a117abf96e7fe8793ef87b14d166d7w','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Asperiores consequatur aut saepe rerum quia voluptatem sit velit. Sed earum at voluptates ad tempora enim. Voluptatibus hic minima eaque. Asperiores velit nemo excepturi dolorem possimus dolorum voluptatem. Occaecati earum possimus aspernatur.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:16','2011-09-11 04:29:16','2011-09-08 08:31:26','2011-09-13 04:31:26',NULL,2.5,1,0),(118,'a509ebdb2fc8083f3a33ea17985bae11','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Laborum ex aliquid ut enim repudiandae. Et consequatur nemo ea aut. Sunt aut omnis consequatur tempora dolorem. Aut maxime est ex. Totam earum recusandae ut similique.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:17','2011-09-11 04:29:17','2011-09-08 07:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(119,'3a117abf96e7fe8793ef87b14d166d7y','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Consequuntur cupiditate voluptatum debitis ut officia enim ut perspiciatis.',NULL,'',200810070146375,'',NULL,'',0,0,0,'2011-09-08 04:29:22','2011-09-11 04:29:22','2011-09-08 06:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(120,'a509ebdb2fc8083f3a33ea17985bae13','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et ipsum exercitationem voluptates iusto.',NULL,'',200810070152793,'',NULL,'',0,0,0,'2011-09-08 04:29:22','2011-09-11 04:29:22','2011-09-08 05:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(121,'3a117abf96e7fe8793ef87b14d166d7z','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Illum doloribus et velit dolorem consequatur consequuntur.',NULL,'',200811131316882,'',NULL,'',0,0,0,'2011-09-08 04:29:23','2011-09-11 04:29:23','2011-09-08 04:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(122,'a509ebdb2fc8083f3a33ea17985bae14','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Corporis voluptate dolorum qui perferendis dolores repudiandae tempora quisquam.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:24','2011-09-11 04:29:24','2011-09-08 03:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(123,'3a117abf96e7fe8793ef87b14d166d8a','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Et eos eum magnam nemo.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2011-09-08 04:29:24','2011-09-11 04:29:24','2011-09-08 02:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(124,'a509ebdb2fc8083f3a33ea17985bae15','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Autemalius utsimiliqueesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:24','2011-09-11 04:29:24','2011-09-08 01:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(125,'3a117abf96e7fe8793ef87b14d166d8b','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Autemalius utsimiliqueesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:25','2011-09-11 04:29:25','2011-09-08 00:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(126,'a509ebdb2fc8083f3a33ea17985bae16','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Et omnis quisquam eos quis qui ducimus. Quia ducimus delectus aliquid minima aliquam eligendi. Animi expedita laborum et sed. Velit excepturi harum ad quam voluptas illo esse et.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:27','2011-09-11 04:29:27','2011-09-07 23:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(127,'3a117abf96e7fe8793ef87b14d166d8c','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Eius veritatis error aliquid et reiciendis consectetur unde vero. Nostrum unde voluptas vitae quo. Facilis porro fuga in beatae architecto quas aut.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:27','2011-09-11 04:29:27','2011-09-07 22:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(128,'3a117abf96e7fe8793ef87b14d166d8d','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Nisi quas quidem sequi voluptatum consectetur aut.',NULL,'',200810070157267,'',NULL,'',0,0,0,'2011-09-08 04:29:33','2011-09-11 04:29:33','2011-09-07 21:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(129,'a509ebdb2fc8083f3a33ea17985bae18','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Consequatur laudantium inventore architecto non est aperiam doloremque.',NULL,'',200810070119570,'',NULL,'',0,0,0,'2011-09-08 04:29:33','2011-09-11 04:29:33','2011-09-07 20:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(130,'3a117abf96e7fe8793ef87b14d166d8e','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Numquam repellat quaerat vel iste qui voluptate qui molestias.',NULL,'',200811131328300,'',NULL,'',0,0,0,'2011-09-08 04:29:34','2011-09-11 04:29:34','2011-09-07 19:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(131,'a509ebdb2fc8083f3a33ea17985bae19','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Ut facere fugit nesciunt.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:35','2011-09-11 04:29:35','2011-09-07 18:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(132,'3a117abf96e7fe8793ef87b14d166d8f','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Ipsa sunt molestiae nulla.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2011-09-08 04:29:35','2011-09-11 04:29:35','2011-09-07 17:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(133,'a509ebdb2fc8083f3a33ea17985bae20','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:36','2011-09-11 04:29:36','2011-09-07 16:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(134,'3a117abf96e7fe8793ef87b14d166d8g','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:37','2011-09-11 04:29:37','2011-09-07 15:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(135,'a509ebdb2fc8083f3a33ea17985bae21','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Sint amet accusantium qui odio incidunt blanditiis. Eaque ullam earum eos maiores iste explicabo nostrum quaerat. Voluptas vel blanditiis accusamus facere. Non asperiores numquam eius. Sunt ex ipsa eum.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:38','2011-09-11 04:29:38','2011-09-07 14:31:27','2011-09-13 04:31:27',NULL,2.5,1,0),(136,'3a117abf96e7fe8793ef87b14d166d8h','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Sed ut ut eveniet saepe magni unde. Dolor non alias tempora earum ex voluptas voluptas nisi. Labore sunt aspernatur ipsam voluptatem ipsa tempora.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:39','2011-09-11 04:29:39','2011-09-07 13:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(137,'3a117abf96e7fe8793ef87b14d166d8i','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et quas voluptas maxime.',NULL,'',200810070113912,'',NULL,'',0,0,0,'2011-09-08 04:29:44','2011-09-11 04:29:44','2011-09-07 12:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(138,'a509ebdb2fc8083f3a33ea17985bae23','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Omnis quidem cupiditate quisquam excepturi eos sit vel consequatur.',NULL,'',200810070113135,'',NULL,'',0,0,0,'2011-09-08 04:29:45','2011-09-11 04:29:45','2011-09-07 11:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(139,'3a117abf96e7fe8793ef87b14d166d8j','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Neque ipsam esse consequatur voluptatem sint in laboriosam incidunt.',NULL,'',200811131392039,'',NULL,'',0,0,0,'2011-09-08 04:29:45','2011-09-11 04:29:45','2011-09-07 10:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(140,'a509ebdb2fc8083f3a33ea17985bae24','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Deleniti modi laboriosam id a expedita nam.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:46','2011-09-11 04:29:46','2011-09-07 09:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(141,'3a117abf96e7fe8793ef87b14d166d8k','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Omnis impedit maiores dignissimos non odit quia ad.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2011-09-08 04:29:46','2011-09-11 04:29:46','2011-09-07 08:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(142,'a509ebdb2fc8083f3a33ea17985bae25','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:46','2011-09-11 04:29:46','2011-09-07 07:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(143,'3a117abf96e7fe8793ef87b14d166d8l','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:47','2011-09-11 04:29:47','2011-09-07 06:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(144,'a509ebdb2fc8083f3a33ea17985bae26','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Velit consequatur enim voluptatem laudantium sit modi est assumenda. A consequatur quia eos suscipit quia. Nihil dolor est qui eveniet. Aspernatur tempora hic asperiores recusandae fuga ex vitae. Nostrum magni reprehenderit dignissimos.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:48','2011-09-11 04:29:48','2011-09-07 05:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(145,'3a117abf96e7fe8793ef87b14d166d8m','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Ducimus consequatur voluptas tempore est. Recusandae et quisquam ab consequatur ullam explicabo voluptatem est. Vel iusto et maxime.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:48','2011-09-11 04:29:48','2011-09-07 04:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(146,'3a117abf96e7fe8793ef87b14d166d8n','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Tempora nemo earum distinctio.',NULL,'',200810070142243,'',NULL,'',0,0,0,'2011-09-08 04:29:52','2011-09-11 04:29:52','2011-09-07 03:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(147,'a509ebdb2fc8083f3a33ea17985bae28','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Aut nostrum et fugiat aut.',NULL,'',200810070180189,'',NULL,'',0,0,0,'2011-09-08 04:29:52','2011-09-11 04:29:52','2011-09-07 02:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(148,'3a117abf96e7fe8793ef87b14d166d8o','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Sed ut repellat sapiente.',NULL,'',200811131350808,'',NULL,'',0,0,0,'2011-09-08 04:29:54','2011-09-11 04:29:54','2011-09-07 01:31:28','2011-09-13 04:31:28',NULL,2.5,1,0),(149,'a509ebdb2fc8083f3a33ea17985bae29','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Quibusdam eaque molestias eum quos.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:29:54','2011-09-11 04:29:54','2011-09-07 00:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(150,'3a117abf96e7fe8793ef87b14d166d8p','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Qui nisi velit commodi ea nostrum corporis quia inventore.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2011-09-08 04:29:54','2011-09-11 04:29:54','2011-09-06 23:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(151,'a509ebdb2fc8083f3a33ea17985bae30','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:55','2011-09-11 04:29:55','2011-09-06 22:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(152,'3a117abf96e7fe8793ef87b14d166d8q','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:56','2011-09-11 04:29:56','2011-09-06 21:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(153,'a509ebdb2fc8083f3a33ea17985bae31','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Sunt nihil et et et et. Quia voluptatum iusto odit dolorum laboriosam. Ut libero alias sed accusantium est molestiae sit. Et quia similique sed dolor voluptate dolorem placeat blanditiis.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:57','2011-09-11 04:29:57','2011-09-06 20:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(154,'3a117abf96e7fe8793ef87b14d166d8r','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Eius temporibus libero nobis. Vel voluptatibus reiciendis qui. Cum soluta voluptatem natus corporis officia ex voluptatibus commodi.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:29:57','2011-09-11 04:29:57','2011-09-06 19:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(155,'3a117abf96e7fe8793ef87b14d166d8s','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Voluptatem ut dolorum eius autem commodi maxime voluptatem vel.',NULL,'',200810070180684,'',NULL,'',0,0,0,'2011-09-08 04:30:01','2011-09-11 04:30:01','2011-09-06 18:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(156,'a509ebdb2fc8083f3a33ea17985bae33','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Sed neque qui ducimus molestiae sed a hic eaque.',NULL,'',200810070165886,'',NULL,'',0,0,0,'2011-09-08 04:30:02','2011-09-11 04:30:02','2011-09-06 17:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(157,'3a117abf96e7fe8793ef87b14d166d8t','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Dolore harum velit sunt tempore.',NULL,'',200811131333809,'',NULL,'',0,0,0,'2011-09-08 04:30:02','2011-09-11 04:30:02','2011-09-06 16:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(158,'a509ebdb2fc8083f3a33ea17985bae34','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Eos id quae quia rerum ut.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:02','2011-09-11 04:30:02','2011-09-06 15:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(159,'3a117abf96e7fe8793ef87b14d166d8u','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Quaerat facere consequuntur ipsam et et nihil aut.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2011-09-08 04:30:03','2011-09-11 04:30:03','2011-09-06 14:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(160,'a509ebdb2fc8083f3a33ea17985bae35','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:03','2011-09-11 04:30:03','2011-09-06 13:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(161,'3a117abf96e7fe8793ef87b14d166d8v','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:03','2011-09-11 04:30:03','2011-09-06 12:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(162,'a509ebdb2fc8083f3a33ea17985bae36','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Debitis iste nihil vel. Suscipit cupiditate dolor molestias impedit consequatur culpa ad. Libero qui consequatur quibusdam. Voluptas quia est eaque voluptas eum repellat.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:04','2011-09-11 04:30:04','2011-09-06 11:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(163,'3a117abf96e7fe8793ef87b14d166d8w','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Id totam quo quod. Qui provident et ab pariatur quod quam vel. Vitae unde eos vel mollitia beatae est et.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:04','2011-09-11 04:30:04','2011-09-06 10:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(164,'3a117abf96e7fe8793ef87b14d166d8x','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Ut reiciendis minus explicabo soluta quia eos.',NULL,'',200810070137554,'',NULL,'',0,0,0,'2011-09-08 04:30:07','2011-09-11 04:30:07','2011-09-06 09:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(165,'a509ebdb2fc8083f3a33ea17985bae38','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et assumenda magnam totam veniam omnis.',NULL,'',200810070133742,'',NULL,'',0,0,0,'2011-09-08 04:30:07','2011-09-11 04:30:07','2011-09-06 08:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(166,'3a117abf96e7fe8793ef87b14d166d8y','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Error exercitationem assumenda mollitia necessitatibus non sint in nemo.',NULL,'',200811131349975,'',NULL,'',0,0,0,'2011-09-08 04:30:08','2011-09-11 04:30:08','2011-09-06 07:31:29','2011-09-13 04:31:29',NULL,2.5,1,0),(167,'a509ebdb2fc8083f3a33ea17985bae39','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Ipsam nobis sapiente aliquam suscipit consequuntur quam.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:08','2011-09-11 04:30:08','2011-09-06 06:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(168,'3a117abf96e7fe8793ef87b14d166d8z','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Similique ea cupiditate nam et est libero ad quia.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2011-09-08 04:30:09','2011-09-11 04:30:09','2011-09-06 05:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(169,'a509ebdb2fc8083f3a33ea17985bae40','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:09','2011-09-11 04:30:09','2011-09-06 04:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(170,'3a117abf96e7fe8793ef87b14d166d9a','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:10','2011-09-11 04:30:10','2011-09-06 03:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(171,'a509ebdb2fc8083f3a33ea17985bae41','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Animi soluta quo tempora est voluptates harum deleniti. Et distinctio qui architecto at quas ut natus rerum. Sit et saepe non praesentium. Distinctio cum eos consequatur nihil a quam quis.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:13','2011-09-11 04:30:13','2011-09-06 02:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(172,'3a117abf96e7fe8793ef87b14d166d9b','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Dolorem rem sit similique qui et molestiae et voluptate. Saepe exercitationem eos alias. Similique placeat qui enim ut minus illo. Nihil quis voluptates tempore itaque sit minus facere. Officia in in nam eaque quis.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:13','2011-09-11 04:30:13','2011-09-06 01:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(173,'3a117abf96e7fe8793ef87b14d166d9c','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Qui voluptas corporis et eius.',NULL,'',200810070125665,'',NULL,'',0,0,0,'2011-09-08 04:30:20','2011-09-11 04:30:20','2011-09-06 00:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(174,'a509ebdb2fc8083f3a33ea17985bae43','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Modi odit enim quidem omnis tenetur labore.',NULL,'',200810070194814,'',NULL,'',0,0,0,'2011-09-08 04:30:21','2011-09-11 04:30:21','2011-09-05 23:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(175,'3a117abf96e7fe8793ef87b14d166d9d','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Nobis voluptatibus eos non est.',NULL,'',200811131317614,'',NULL,'',0,0,0,'2011-09-08 04:30:21','2011-09-11 04:30:21','2011-09-05 22:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(176,'a509ebdb2fc8083f3a33ea17985bae44','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Qui similique consectetur voluptatibus sed dolor sapiente.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:22','2011-09-11 04:30:22','2011-09-05 21:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(177,'3a117abf96e7fe8793ef87b14d166d9e','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Eius nihil ut voluptatibus libero ut.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2011-09-08 04:30:22','2011-09-11 04:30:22','2011-09-05 20:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(178,'a509ebdb2fc8083f3a33ea17985bae45','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:22','2011-09-11 04:30:22','2011-09-05 19:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(179,'3a117abf96e7fe8793ef87b14d166d9f','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:23','2011-09-11 04:30:23','2011-09-05 18:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(180,'a509ebdb2fc8083f3a33ea17985bae46','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Commodi accusamus culpa earum aliquam vel nemo est. Doloremque rerum asperiores aut et pariatur fugit quibusdam. Modi expedita sunt doloribus tenetur voluptate. Nam quisquam tempore quis.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:26','2011-09-11 04:30:26','2011-09-05 17:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(181,'3a117abf96e7fe8793ef87b14d166d9g','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Cum dolorem molestias non ducimus cumque quis repudiandae mollitia. Ea officiis totam dolore consequatur molestiae doloribus dolorum dolores. Cupiditate vitae illo est quia ex. Voluptates ut qui voluptas enim enim totam rerum.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:26','2011-09-11 04:30:26','2011-09-05 16:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(182,'3a117abf96e7fe8793ef87b14d166d9h','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Aut dolorem nihil dolores molestiae doloremque voluptatem excepturi.',NULL,'',200810070197245,'',NULL,'',0,0,0,'2011-09-08 04:30:29','2011-09-11 04:30:29','2011-09-05 15:31:30','2011-09-13 04:31:30',NULL,2.5,1,0),(183,'a509ebdb2fc8083f3a33ea17985bae48','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Quia vel nostrum qui.',NULL,'',200810070194444,'',NULL,'',0,0,0,'2011-09-08 04:30:30','2011-09-11 04:30:30','2011-09-05 14:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(184,'3a117abf96e7fe8793ef87b14d166d9i','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Magni dolorem veritatis tempore recusandae sequi.',NULL,'',200811131356003,'',NULL,'',0,0,0,'2011-09-08 04:30:30','2011-09-11 04:30:30','2011-09-05 13:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(185,'a509ebdb2fc8083f3a33ea17985bae49','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Quos dolores et nisi soluta.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:31','2011-09-11 04:30:31','2011-09-05 12:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(186,'3a117abf96e7fe8793ef87b14d166d9j','',NULL,2,NULL,2,'',1,NULL,1,'','','','','In totam voluptatem aut.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2011-09-08 04:30:31','2011-09-11 04:30:31','2011-09-05 11:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(187,'a509ebdb2fc8083f3a33ea17985bae50','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Molestiaeus\n    rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:31','2011-09-11 04:30:31','2011-09-05 10:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(188,'3a117abf96e7fe8793ef87b14d166d9k','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Molestiaeus\n    rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:32','2011-09-11 04:30:32','2011-09-05 09:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(189,'a509ebdb2fc8083f3a33ea17985bae51','',NULL,3,NULL,3,'',1,NULL,1,'','','','','In nam quia odio in sequi voluptatibus ipsam. Ad harum doloremque consequatur ex. Quo non culpa velit blanditiis rerum totam cumque. Molestiae consequuntur nemo et quasi consectetur ut.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:32','2011-09-11 04:30:32','2011-09-05 08:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(190,'3a117abf96e7fe8793ef87b14d166d9l','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Nam voluptas animi exercitationem sit et occaecati earum dolores. Neque odit dicta non fugit nulla. Quasi animi nemo atque impedit magnam.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:33','2011-09-11 04:30:33','2011-09-05 07:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(191,'3a117abf96e7fe8793ef87b14d166d9m','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Accusamus voluptatem dolorem ipsa dignissimos atque aut.',NULL,'',200810070118073,'',NULL,'',0,0,0,'2011-09-08 04:30:35','2011-09-11 04:30:35','2011-09-05 06:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(192,'a509ebdb2fc8083f3a33ea17985bae53','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Quia aspernatur dolore consequuntur fuga autem voluptatem et.',NULL,'',200810070166521,'',NULL,'',0,0,0,'2011-09-08 04:30:36','2011-09-11 04:30:36','2011-09-05 05:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(193,'3a117abf96e7fe8793ef87b14d166d9n','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Quae ut occaecati architecto a facere.',NULL,'',200811131372942,'',NULL,'',0,0,0,'2011-09-08 04:30:36','2011-09-11 04:30:36','2011-09-05 04:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(194,'a509ebdb2fc8083f3a33ea17985bae54','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Ut error maxime deserunt corrupti dolor eos.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:36','2011-09-11 04:30:36','2011-09-05 03:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(195,'3a117abf96e7fe8793ef87b14d166d9o','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Laudantium voluptatem deleniti fuga.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2011-09-08 04:30:37','2011-09-11 04:30:37','2011-09-05 02:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(196,'a509ebdb2fc8083f3a33ea17985bae55','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:37','2011-09-11 04:30:37','2011-09-05 01:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(197,'3a117abf96e7fe8793ef87b14d166d9p','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:37','2011-09-11 04:30:37','2011-09-05 00:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(198,'a509ebdb2fc8083f3a33ea17985bae56','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Maiores aliquam illum architecto. Ratione voluptate consectetur laudantium. Facere voluptatem placeat repudiandae quibusdam rerum ut. Itaque omnis cumque unde accusantium reprehenderit minima necessitatibus enim.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:38','2011-09-11 04:30:38','2011-09-04 23:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(199,'3a117abf96e7fe8793ef87b14d166d9q','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Qui sed ad dolores. Tempore eius laudantium blanditiis quo quibusdam est ab natus. Ipsum quod eum quisquam est placeat.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:38','2011-09-11 04:30:38','2011-09-04 22:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(200,'3a117abf96e7fe8793ef87b14d166d9r','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et voluptatem ut ut totam.',NULL,'',200810070161808,'',NULL,'',0,0,0,'2011-09-08 04:30:44','2011-09-11 04:30:44','2011-09-04 21:31:31','2011-09-13 04:31:31',NULL,2.5,1,0),(201,'a509ebdb2fc8083f3a33ea17985bae58','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Dolore sint ut ratione suscipit recusandae ipsa.',NULL,'',200810070157324,'',NULL,'',0,0,0,'2011-09-08 04:30:45','2011-09-11 04:30:45','2011-09-04 20:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(202,'3a117abf96e7fe8793ef87b14d166d9s','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Ut laudantium sed blanditiis aut vitae nobis qui itaque.',NULL,'',200811131393363,'',NULL,'',0,0,0,'2011-09-08 04:30:46','2011-09-11 04:30:46','2011-09-04 19:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(203,'a509ebdb2fc8083f3a33ea17985bae59','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Laudantium voluptatibus aliquid eos.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:46','2011-09-11 04:30:46','2011-09-04 18:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(204,'3a117abf96e7fe8793ef87b14d166d9t','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Numquam architecto velit eum hic quia.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2011-09-08 04:30:46','2011-09-11 04:30:46','2011-09-04 17:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(205,'a509ebdb2fc8083f3a33ea17985bae60','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:47','2011-09-11 04:30:47','2011-09-04 16:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(206,'3a117abf96e7fe8793ef87b14d166d9u','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:47','2011-09-11 04:30:47','2011-09-04 15:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(207,'a509ebdb2fc8083f3a33ea17985bae61','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Est odio reprehenderit possimus eos. Quo amet consequuntur et et. Neque delectus a ut quidem ipsa exercitationem at nemo.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:48','2011-09-11 04:30:48','2011-09-04 14:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(208,'3a117abf96e7fe8793ef87b14d166d9v','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Eum modi dolor commodi quo. Ut velit aliquam cumque harum aspernatur nesciunt. Quod eum perferendis natus cumque temporibus distinctio voluptatem harum.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:48','2011-09-11 04:30:48','2011-09-04 13:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(209,'3a117abf96e7fe8793ef87b14d166d9w','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Non itaque libero molestiae aut accusamus totam.',NULL,'',200810070197865,'',NULL,'',0,0,0,'2011-09-08 04:30:52','2011-09-11 04:30:52','2011-09-04 12:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(210,'a509ebdb2fc8083f3a33ea17985bae63','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Qui dolor est nemo nisi perspiciatis in.',NULL,'',200810070124003,'',NULL,'',0,0,0,'2011-09-08 04:30:52','2011-09-11 04:30:52','2011-09-04 11:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(211,'3a117abf96e7fe8793ef87b14d166d9x','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Omnis soluta quisquam aut est dicta at.',NULL,'',200811131382901,'',NULL,'',0,0,0,'2011-09-08 04:30:53','2011-09-11 04:30:53','2011-09-04 10:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(212,'a509ebdb2fc8083f3a33ea17985bae64','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Consequatur sed dolore autem qui omnis veniam.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:53','2011-09-11 04:30:53','2011-09-04 09:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(213,'3a117abf96e7fe8793ef87b14d166d9y','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Sunt sequi adipisci ipsa dolorem reiciendis maxime architecto.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2011-09-08 04:30:53','2011-09-11 04:30:53','2011-09-04 08:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(214,'a509ebdb2fc8083f3a33ea17985bae65','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:53','2011-09-11 04:30:53','2011-09-04 07:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(215,'3a117abf96e7fe8793ef87b14d166d9z','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:54','2011-09-11 04:30:54','2011-09-04 06:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(216,'a509ebdb2fc8083f3a33ea17985bae66','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Consequuntur libero corporis ut ut. Voluptates enim non aliquid neque excepturi. Dignissimos unde a ab voluptas.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:55','2011-09-11 04:30:55','2011-09-04 05:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(217,'3a117abf96e7fe8793ef87b14d166e0a','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Magni possimus reprehenderit voluptas natus quaerat tempore. Laudantium ad est earum ut. Illum eos aut unde adipisci. Error cum voluptas qui.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:30:55','2011-09-11 04:30:55','2011-09-04 04:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(218,'3a117abf96e7fe8793ef87b14d166e0b','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Ut modi id exercitationem sed reiciendis.',NULL,'',200810070142408,'',NULL,'',0,0,0,'2011-09-08 04:30:58','2011-09-11 04:30:58','2011-09-04 03:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(219,'a509ebdb2fc8083f3a33ea17985bae68','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Eos quidem dolores nostrum quos itaque tenetur.',NULL,'',200810070132172,'',NULL,'',0,0,0,'2011-09-08 04:30:59','2011-09-11 04:30:59','2011-09-04 02:31:32','2011-09-13 04:31:32',NULL,2.5,1,0),(220,'3a117abf96e7fe8793ef87b14d166e0c','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Quia quo quis dolorum fuga.',NULL,'',200811131355461,'',NULL,'',0,0,0,'2011-09-08 04:30:59','2011-09-11 04:30:59','2011-09-04 01:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(221,'a509ebdb2fc8083f3a33ea17985bae69','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Nihil veritatis eaque minus occaecati earum aperiam corrupti.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:30:59','2011-09-11 04:30:59','2011-09-04 00:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(222,'3a117abf96e7fe8793ef87b14d166e0d','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Commodi voluptatem adipisci sed dolores est aperiam.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2011-09-08 04:30:59','2011-09-11 04:30:59','2011-09-03 23:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(223,'a509ebdb2fc8083f3a33ea17985bae70','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:00','2011-09-11 04:31:00','2011-09-03 22:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(224,'3a117abf96e7fe8793ef87b14d166e0e','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:00','2011-09-11 04:31:00','2011-09-03 21:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(225,'a509ebdb2fc8083f3a33ea17985bae71','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Voluptas quos minima deleniti accusamus. Odit ex harum magnam aliquid ut laboriosam ipsa. Tempora saepe necessitatibus vero corrupti beatae laboriosam voluptatem.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:01','2011-09-11 04:31:01','2011-09-03 20:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(226,'3a117abf96e7fe8793ef87b14d166e0f','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Aut et quas saepe. Expedita quae ut perferendis aut doloribus neque. Odit eos ut error praesentium. Tenetur pariatur quasi reiciendis harum.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:01','2011-09-11 04:31:01','2011-09-03 19:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(227,'3a117abf96e7fe8793ef87b14d166e0g','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Reprehenderit voluptatem neque ut.',NULL,'',200810070160538,'',NULL,'',0,0,0,'2011-09-08 04:31:04','2011-09-11 04:31:04','2011-09-03 18:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(228,'a509ebdb2fc8083f3a33ea17985bae73','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Fugiat voluptate dolor ex dolorem.',NULL,'',200810070161438,'',NULL,'',0,0,0,'2011-09-08 04:31:04','2011-09-11 04:31:04','2011-09-03 17:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(229,'3a117abf96e7fe8793ef87b14d166e0h','',NULL,7,NULL,5,'',1,NULL,1,'','','','','Quis occaecati id dolorem quo dolor.',NULL,'',200811131374742,'',NULL,'',0,0,0,'2011-09-08 04:31:05','2011-09-11 04:31:05','2011-09-03 16:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(230,'a509ebdb2fc8083f3a33ea17985bae74','',NULL,8,NULL,5,'',1,NULL,1,'','','','','Voluptas vel qui maxime consequuntur ut hic.',NULL,'',0,'',NULL,'',0,0,0,'2011-09-08 04:31:05','2011-09-11 04:31:05','2011-09-03 15:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(231,'3a117abf96e7fe8793ef87b14d166e0i','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Numquam autem quidem molestiae possimus error maiores vitae minus.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2011-09-08 04:31:05','2011-09-11 04:31:05','2011-09-03 14:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(232,'a509ebdb2fc8083f3a33ea17985bae75','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an overview of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:05','2011-09-11 04:31:05','2011-09-03 13:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(233,'3a117abf96e7fe8793ef87b14d166e0j','',NULL,3,NULL,3,'',1,NULL,1,'','','','','This is an description of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:06','2011-09-11 04:31:06','2011-09-03 12:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(234,'a509ebdb2fc8083f3a33ea17985bae76','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Ab sapiente similique eius fuga ad ducimus et magni. Repudiandae voluptatibus dignissimos soluta eum rerum odio omnis. Architecto porro aperiam molestiae est.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:07','2011-09-11 04:31:07','2011-09-03 11:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(235,'3a117abf96e7fe8793ef87b14d166e0k','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Nihil quia rerum et. Magnam aut provident placeat nulla ea illum. In eum quis aut ipsum repellat omnis in. Nesciunt est tempore id ipsum cupiditate eum necessitatibus. Laboriosam illum distinctio at recusandae quam eligendi.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:07','2011-09-11 04:31:07','2011-09-03 10:31:33','2011-09-13 04:31:33',NULL,2.5,1,0),(236,'3a117abf96e7fe8793ef87b14d166e0l','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Aliquid in porro rerum eum delectus voluptate.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2011-09-08 04:31:58','2011-09-11 04:31:58','2011-09-08 04:31:58','2011-09-10 04:31:58',NULL,2.5,1,0),(237,'a509ebdb2fc8083f3a33ea17985bae78','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:31:59','2011-09-11 04:31:59','2011-09-08 04:31:59','2011-09-10 04:31:59',NULL,2.5,1,0),(238,'a509ebdb2fc8083f3a33ea17985bae79','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Quo neque quam nulla aut repellat sed aut maxime.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2011-09-08 04:32:01','2011-09-11 04:32:01','2011-09-08 04:32:01','2011-09-10 04:32:01',NULL,2.5,1,0),(239,'3a117abf96e7fe8793ef87b14d166e0n','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:01','2011-09-11 04:32:01','2011-09-08 04:32:01','2011-09-10 04:32:01',NULL,2.5,1,0),(240,'3a117abf96e7fe8793ef87b14d166e0o','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Voluptatem est sapiente vitae delectus ab perspiciatis.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2011-09-08 04:32:04','2011-09-11 04:32:04','2011-09-08 04:32:04','2011-09-10 04:32:04',NULL,2.5,1,0),(241,'a509ebdb2fc8083f3a33ea17985bae81','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:04','2011-09-11 04:32:04','2011-09-08 04:32:04','2011-09-10 04:32:04',NULL,2.5,1,0),(242,'a509ebdb2fc8083f3a33ea17985bae82','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Maxime temporibus molestiae in.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2011-09-08 04:32:06','2011-09-11 04:32:06','2011-09-08 04:32:06','2011-09-10 04:32:06',NULL,2.5,1,0),(243,'3a117abf96e7fe8793ef87b14d166e0q','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:06','2011-09-11 04:32:06','2011-09-08 04:32:06','2011-09-10 04:32:06',NULL,2.5,1,0),(244,'3a117abf96e7fe8793ef87b14d166e0r','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Earum quidem et laudantium impedit ut laboriosam.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2011-09-08 04:32:08','2011-09-11 04:32:08','2011-09-08 04:32:08','2011-09-10 04:32:08',NULL,2.5,1,0),(245,'a509ebdb2fc8083f3a33ea17985bae84','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:09','2011-09-11 04:32:09','2011-09-08 04:32:09','2011-09-10 04:32:09',NULL,2.5,1,0),(246,'a509ebdb2fc8083f3a33ea17985bae85','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Laborum alias ad odio pariatur est.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2011-09-08 04:32:11','2011-09-11 04:32:11','2011-09-08 04:32:11','2011-09-10 04:32:11',NULL,2.5,1,0),(247,'3a117abf96e7fe8793ef87b14d166e0t','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:11','2011-09-11 04:32:11','2011-09-08 04:32:11','2011-09-10 04:32:11',NULL,2.5,1,0),(248,'3a117abf96e7fe8793ef87b14d166e0u','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Impedit quis ut dignissimos aut dicta harum ratione excepturi.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2011-09-08 04:32:13','2011-09-11 04:32:13','2011-09-08 04:32:13','2011-09-10 04:32:13',NULL,2.5,1,0),(249,'a509ebdb2fc8083f3a33ea17985bae87','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:13','2011-09-11 04:32:13','2011-09-08 04:32:13','2011-09-10 04:32:13',NULL,2.5,1,0),(250,'a509ebdb2fc8083f3a33ea17985bae88','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Voluptatum reiciendis dolor et dolorem modi.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2011-09-08 04:32:16','2011-09-11 04:32:16','2011-09-08 04:32:16','2011-09-10 04:32:16',NULL,2.5,1,0),(251,'3a117abf96e7fe8793ef87b14d166e0w','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:16','2011-09-11 04:32:16','2011-09-08 04:32:16','2011-09-10 04:32:16',NULL,2.5,1,0),(252,'3a117abf96e7fe8793ef87b14d166e0x','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Consequatur harum et corporis architecto cumque incidunt optio corrupti.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2011-09-08 04:32:18','2011-09-11 04:32:18','2011-09-08 04:32:18','2011-09-10 04:32:18',NULL,2.5,1,0),(253,'a509ebdb2fc8083f3a33ea17985bae90','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:18','2011-09-11 04:32:18','2011-09-08 04:32:18','2011-09-10 04:32:18',NULL,2.5,1,0),(254,'a509ebdb2fc8083f3a33ea17985bae91','',NULL,2,NULL,2,'',1,NULL,1,'','','','','In voluptate ut omnis unde minima.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2011-09-08 04:32:20','2011-09-11 04:32:20','2011-09-08 04:32:20','2011-09-10 04:32:20',NULL,2.5,1,0),(255,'3a117abf96e7fe8793ef87b14d166e0z','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:20','2011-09-11 04:32:20','2011-09-08 04:32:20','2011-09-10 04:32:20',NULL,2.5,1,0),(256,'3a117abf96e7fe8793ef87b14d166e1a','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Ut itaque quia ea eius.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2011-09-08 04:32:22','2011-09-11 04:32:22','2011-09-08 04:32:22','2011-09-10 04:32:22',NULL,2.5,1,0),(257,'a509ebdb2fc8083f3a33ea17985bae93','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:23','2011-09-11 04:32:23','2011-09-08 04:32:23','2011-09-10 04:32:23',NULL,2.5,1,0),(258,'a509ebdb2fc8083f3a33ea17985bae94','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Rerum accusantium modi veniam esse.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2011-09-08 04:32:25','2011-09-11 04:32:25','2011-09-08 04:32:25','2011-09-10 04:32:25',NULL,2.5,1,0),(259,'3a117abf96e7fe8793ef87b14d166e1c','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:26','2011-09-11 04:32:26','2011-09-08 04:32:26','2011-09-10 04:32:26',NULL,2.5,1,0),(260,'3a117abf96e7fe8793ef87b14d166e1d','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Porro amet quae sunt incidunt consequatur non et.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2011-09-08 04:32:28','2011-09-11 04:32:28','2011-09-08 04:32:28','2011-09-10 04:32:28',NULL,2.5,1,0),(261,'a509ebdb2fc8083f3a33ea17985bae96','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:28','2011-09-11 04:32:28','2011-09-08 04:32:28','2011-09-10 04:32:28',NULL,2.5,1,0),(262,'a509ebdb2fc8083f3a33ea17985bae97','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Est ratione natus consequatur quo aut sint officiis.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2011-09-08 04:32:30','2011-09-11 04:32:30','2011-09-08 04:32:30','2011-09-10 04:32:30',NULL,2.5,1,0),(263,'3a117abf96e7fe8793ef87b14d166e1f','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:31','2011-09-11 04:32:31','2011-09-08 04:32:31','2011-09-10 04:32:31',NULL,2.5,1,0),(264,'3a117abf96e7fe8793ef87b14d166e1g','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Quasi quo consectetur dolorem accusantium dolores vel in itaque.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2011-09-08 04:32:33','2011-09-11 04:32:33','2011-09-08 04:32:33','2011-09-10 04:32:33',NULL,2.5,1,0),(265,'a509ebdb2fc8083f3a33ea17985bae99','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Just a placeholder text for the description of this species',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:33','2011-09-11 04:32:33','2011-09-08 04:32:33','2011-09-10 04:32:33',NULL,2.5,1,0),(266,'a509ebdb2fc8083f3a33ea17985baf00','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Voluptas sunt fugit accusamus repudiandae ut quia nam error.',NULL,'',201008242207638,'',NULL,'',0,0,0,'2011-09-08 04:32:36','2011-09-11 04:32:36','2011-09-08 04:32:36','2011-09-10 04:32:36',NULL,2.5,1,0),(267,'3a117abf96e7fe8793ef87b14d166e1i','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Nihil facere dignissimos animi minima est illo rerum.',NULL,'',201101141341094,'',NULL,'',0,0,0,'2011-09-08 04:32:37','2011-09-11 04:32:37','2011-09-08 04:32:37','2011-09-10 04:32:37',NULL,2.5,1,0),(268,'a509ebdb2fc8083f3a33ea17985baf01','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Laboriosam et alias et debitis.',NULL,'',201101141330049,'',NULL,'',0,0,0,'2011-09-08 04:32:37','2011-09-11 04:32:37','2011-09-08 04:32:37','2011-09-10 04:32:37',NULL,2.5,1,0),(269,'3a117abf96e7fe8793ef87b14d166e1j','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Soluta voluptate ut corporis.',NULL,'',201101141305714,'',NULL,'',0,0,0,'2011-09-08 04:32:38','2011-09-11 04:32:38','2011-09-08 04:32:38','2011-09-10 04:32:38',NULL,2.5,1,0),(270,'a509ebdb2fc8083f3a33ea17985baf02','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Quisquam recusandae voluptatum fuga dolores ut voluptas consequatur.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2011-09-08 04:32:38','2011-09-11 04:32:38','2011-09-08 04:32:38','2011-09-10 04:32:38',NULL,2.5,1,0),(271,'3a117abf96e7fe8793ef87b14d166e1k','',NULL,3,NULL,3,'',1,NULL,1,'','','','','<p>Commonly known as the fly agaric or fly Amanita, Amanita muscaria is a mycorrhizal basidiomycete\n    fungus that contains several toxic, psychoactive compounds. Amanita muscaria is the typical “toadstool” mushroom,\n    bearing white gills and white warts on its variably colored cap and growing typically in clusters near conifers\n  or hardwoods throughout the northern hemisphere</p><p>The name fly agaric comes from its use as a control for pesky flies. The old practice was to soaking pieces of\n  the mushroom in a saucer of milk to attract flies. The flies would drink the tainted milk, become intoxicated, and\n  fly into walls to their death.</p>',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:38','2011-09-11 04:32:38','2011-09-08 04:32:38','2011-09-10 04:32:38',NULL,2.5,1,0),(272,'a509ebdb2fc8083f3a33ea17985baf03','',NULL,3,NULL,3,'',3,NULL,1,'','','','','<p>والمعروف باسم غاريقون تطير أو تطير الأمانيت، الأمانيت muscaria هو basidiomycete الميكوريزا\n     الفطريات السامة التي تحتوي على عدة والمركبات النفسانية. الأمانيت muscaria هو نموذجي \"الفطر\" عيش الغراب،\n     مع الخياشيم البيضاء والبثور البيضاء على غطائها الملونة بنسب مختلفة ومتزايدة عادة في مجموعات قرب الصنوبريات\n   أو الأخشاب في جميع أنحاء نصف الكرة الشمالي </ P> وتطير غاريقون اسم يأتي من استخدامه كعنصر تحكم عن الذباب المزعج. كانت الممارسة القديمة لقطع من تمرغ\n   الفطر في الصحن من الحليب لاجتذاب الذباب. فإن الذباب شرب الحليب الملوث، وتصبح حالة سكر، و\n   تطير في الجدران لموتهم. </ P>',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:39','2011-09-11 04:32:39','2011-09-08 04:32:39','2011-09-10 04:32:39',NULL,2.5,1,0),(273,'3a117abf96e7fe8793ef87b14d166e1l','',NULL,3,NULL,3,'',2,NULL,1,'','','','','<p> Communément appelé la volée ou amanite tue-mouche Amanita, Amanita muscaria est un basidiomycète mycorhiziens\n     champignon qui contient plusieurs toxiques, de composés psychoactifs. Amanita muscaria est le typique \"champignon\" champignon,\n     portant des branchies blanches et les verrues blanches sur son capuchon de couleur variable et croissante généralement en grappes à proximité de conifères\n   ou de feuillus dans l\'hémisphère nord </ p> L\'amanite tue-mouche nom vient de son utilisation comme un contrôle des mouches des embêtants. L\'ancienne pratique était de trempage des pièces\n   le champignon dans une soucoupe de lait pour attirer les mouches. Les mouches ne boire le lait contaminé, s\'enivrer, et\n   voler dans les murs de leur mort. </ p>',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:39','2011-09-11 04:32:39','2011-09-08 04:32:39','2011-09-10 04:32:39',NULL,2.5,1,0),(274,'a509ebdb2fc8083f3a33ea17985baf04','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Recent cases highlight the issue of the similarity of A. phalloides to the \n    edible paddy straw mushroom, Volvariella volvacea, with east- and southeast-Asian immigrants in Australia \n    and the west coast of the United States falling victim. In an episode in Oregon, four members of a Korean \n    family required liver transplants (Benjamin 1995). Of the seven people poisoned in the Canberra region between \n    1988 and 1998, three were from Laos (Trimm et al. 1999). This misidentification is a leading cause of mushroom\n     poisoning in the United States.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:39','2011-09-11 04:32:39','2011-09-08 04:32:39','2011-09-10 04:32:39',NULL,2.5,1,0),(275,'3a117abf96e7fe8793ef87b14d166e1m','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Learn how three fiery, painful stings during an early morning swim in Hawaii changed the \n    life of researcher Angel Yanagihara. Once the young biochemist had recovered from her box jelly encounter, \n    Carybdea alata had her full attention. Now she works to unlock the secrets of venom of these beautiful, \n    and sometimes dangerous, angels of the sea. Listen to the box jellyfish podcast on the EOL Learning + \n    Education website, where you can also meet featured scientist Angel Yanagihara, view amazing jellyfish images, \n    and find relevant educational activities.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:40','2011-09-11 04:32:40','2011-09-08 04:32:40','2011-09-10 04:32:40',NULL,2.5,1,0),(276,'3a117abf96e7fe8793ef87b14d166e1n','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Dolor natus et est ut consequatur.',NULL,'',201012041086784,'',NULL,'',0,0,0,'2011-09-08 04:32:43','2011-09-11 04:32:43','2011-09-08 04:32:43','2011-09-10 04:32:43',NULL,2.5,1,0),(277,'a509ebdb2fc8083f3a33ea17985baf06','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Labore temporibus animi est.',NULL,'',201009280303944,'',NULL,'',0,0,0,'2011-09-08 04:32:43','2011-09-11 04:32:43','2011-09-08 04:32:43','2011-09-10 04:32:43',NULL,2.5,1,0),(278,'3a117abf96e7fe8793ef87b14d166e1o','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Eveniet exercitationem omnis dolorem commodi rem.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2011-09-08 04:32:44','2011-09-11 04:32:44','2011-09-08 04:32:44','2011-09-10 04:32:44',NULL,2.5,1,0),(279,'a509ebdb2fc8083f3a33ea17985baf07','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Dinochelus ausubeli is a new species of deepwater lobster (family Nephropidae) first collected in\n    2007 from the Philippine Sea off the island of Luzon and was formally described in 2010. The species is so\n  distinct that it was not only described as a new species but placed in a newly erected genus as well (Dinochelus).\n    \"Dinochelus\" is derived from the Greek dinos, meaning \"terrible\", and chela, meaning \"claw\", an allusion to the\n  massive, spinose major claw. The specific epithet ausubeli honors Jesse Ausubel, an enthusiastic sponsor of the\n  Census of Marine Life, a major effort to document marine life in the first decade of the 21st century. (Ahyong et al. 2010)',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:44','2011-09-11 04:32:44','2011-09-08 04:32:44','2011-09-10 04:32:44',NULL,2.5,1,0),(280,'a509ebdb2fc8083f3a33ea17985baf08','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Eligendi quasi et dolor repellendus ea officia non veritatis.',NULL,'',200812102137415,'',NULL,'',0,0,0,'2011-09-08 04:32:46','2011-09-11 04:32:46','2011-09-08 04:32:46','2011-09-10 04:32:46',NULL,2.5,1,0),(281,'3a117abf96e7fe8793ef87b14d166e1q','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Ea quia nemo occaecati odio aut.',NULL,'',200812102183535,'',NULL,'',0,0,0,'2011-09-08 04:32:47','2011-09-11 04:32:47','2011-09-08 04:32:47','2011-09-10 04:32:47',NULL,2.5,1,0),(282,'a509ebdb2fc8083f3a33ea17985baf09','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Commodi tempora corrupti illum voluptatem odit sapiente.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2011-09-08 04:32:47','2011-09-11 04:32:47','2011-09-08 04:32:47','2011-09-10 04:32:47',NULL,2.5,1,0),(283,'3a117abf96e7fe8793ef87b14d166e1r','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Haramonas (ha-ra-moan-ass) dimorpha, large raphidophyte, with two emergent flagella, anterior\n    flagellum beats with an undulating pattern, posterior flagellum trails. Many small green or yellow green\n  plastids. No eyespot. Phase contrast microscopy.',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:47','2011-09-11 04:32:47','2011-09-08 04:32:47','2011-09-10 04:32:47',NULL,2.5,1,0),(284,'3a117abf96e7fe8793ef87b14d166e1s','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Voluptas sed expedita aliquid repellat sint.',NULL,'',200908250179632,'',NULL,'',0,0,0,'2011-09-08 04:32:50','2011-09-11 04:32:50','2011-09-08 04:32:50','2011-09-10 04:32:50',NULL,2.5,1,0),(285,'a509ebdb2fc8083f3a33ea17985baf11','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Incidunt sed dicta ut facilis sit necessitatibus beatae.',NULL,'',200905130150563,'',NULL,'',0,0,0,'2011-09-08 04:32:50','2011-09-11 04:32:50','2011-09-08 04:32:50','2011-09-10 04:32:50',NULL,2.5,1,0),(286,'3a117abf96e7fe8793ef87b14d166e1t','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Quo animi vel modi et est corrupti.',NULL,'',200905130192503,'',NULL,'',0,0,0,'2011-09-08 04:32:50','2011-09-11 04:32:50','2011-09-08 04:32:50','2011-09-10 04:32:50',NULL,2.5,1,0),(287,'a509ebdb2fc8083f3a33ea17985baf12','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Amet magnam ut consequatur.',NULL,'',200907241171232,'',NULL,'',0,0,0,'2011-09-08 04:32:51','2011-09-11 04:32:51','2011-09-08 04:32:51','2011-09-10 04:32:51',NULL,2.5,1,0),(288,'3a117abf96e7fe8793ef87b14d166e1u','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Voluptate rem dolor similique accusantium itaque iste.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2011-09-08 04:32:51','2011-09-11 04:32:51','2011-09-08 04:32:51','2011-09-10 04:32:51',NULL,2.5,1,0),(289,'a509ebdb2fc8083f3a33ea17985baf13','',NULL,3,NULL,3,'',1,NULL,1,'','','','','%q{<p>Gray wolves usually live in packs, led by an \"alpha pair.\" The pack includes some of the alpha\n    pair\'s offspring and may include some unrelated wolves. A pack\'s territory can be as large as 13,000 square km.\n    Howling probably helps advertise who \"owns\" a particular piece of territory. When pups are born, the mother stays\n  near them for the first three weeks, and her mate and others in the pack bring food to her. The pups are weaned\n    when they about nine weeks old. As adults, they may travel as far as 72 km a day with their pack and run as fast\n      as 70 km per hour.</p><p>\n        Adaptation: This transparent view of the wolf braincase shows how the brain is situated within. The large\n        feature projecting from the front of the brain is the olfactory lobe, an important center related to the\n        sense of smell.</p>}',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:52','2011-09-11 04:32:52','2011-09-08 04:32:52','2011-09-10 04:32:52',NULL,2.5,1,0),(290,'a509ebdb2fc8083f3a33ea17985baf14','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Beatae minima dolor ratione.',NULL,'',201105312325504,'',NULL,'',0,0,0,'2011-09-08 04:32:54','2011-09-11 04:32:54','2011-09-08 04:32:54','2011-09-10 04:32:54',NULL,2.5,1,0),(291,'3a117abf96e7fe8793ef87b14d166e1w','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Tenetur id quo dolorum id molestias.',NULL,'',201102040505636,'',NULL,'',0,0,0,'2011-09-08 04:32:55','2011-09-11 04:32:55','2011-09-08 04:32:55','2011-09-10 04:32:55',NULL,2.5,1,0),(292,'a509ebdb2fc8083f3a33ea17985baf15','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Et fuga eaque qui sunt.',NULL,'',201102040570574,'',NULL,'',0,0,0,'2011-09-08 04:32:55','2011-09-11 04:32:55','2011-09-08 04:32:55','2011-09-10 04:32:55',NULL,2.5,1,0),(293,'3a117abf96e7fe8793ef87b14d166e1x','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Illo ratione et et deserunt enim nostrum.',NULL,'',201105132311043,'',NULL,'',0,0,0,'2011-09-08 04:32:55','2011-09-11 04:32:55','2011-09-08 04:32:55','2011-09-10 04:32:55',NULL,2.5,1,0),(294,'a509ebdb2fc8083f3a33ea17985baf16','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Hic dolorem quis eum deserunt voluptas facilis sunt culpa.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2011-09-08 04:32:56','2011-09-11 04:32:56','2011-09-08 04:32:56','2011-09-10 04:32:56',NULL,2.5,1,0),(295,'3a117abf96e7fe8793ef87b14d166e1y','',NULL,3,NULL,3,'',1,NULL,1,'','','','','<p>Pinus strobus, the Eastern White Pine, is characterized by fascicles of 5 fine needles with a\n    nonpersistent bundle sheath, and relatively soft, unarmed, elongate seed cones whose scales are spread at\n  maturity. The native range of eastern white pine stretches from southeastern Manitoba to Newfoundland in Canada and\n  from Minnesota and Iowa eastward to Maine and Pennsylvania, with a southward Appalachian extension to Tennessee and\n  Georgia and isolated occurrences in western Kentucky, Illinois, and Indiana. The species also has become\n  naturalized from plantings, both within its historical range and elsewhere, including portions of Europe, Asia, New\n  Zealand, and Australia. A related taxon in portions of southern Mexico and Guatemala is sometimes treated as Pinus\n  strobus var. chiapensis, but more often as a distinct species, Pinus chiapensis.\n</p><p>\n  Natural stands of Pinus strobus occur in a variety of habitats, ranging from dune forests to bogs and mixed\n  conifer/hardwood forests. The species also colonizes old fields and other former agricultural lands that are\n  reverting back to forests. It has been planted extensively in plantations and is also used to revegetate mine\n  spoils. The species also is cultivated commonly as a shade and ornamental tree\n</p><p>\n  Eastern White Pine is an important timber tree for the production of softwood lumber. The wood is used for\n  construction, cabinetry and furniture-making, handcrafts, and various other woodworking. Native American tribes\n  used it extensively for various medicinal properties and it is an important food source for wildlife. The long\n  history of cultivation has led to the development of numerous cultivars and forms. The species is affected by the\n  exotic white pine blister rust Cronartium ribicola, an important pathogen of timber trees in the white pine group\n  in temperate North America.</p>',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:32:57','2011-09-11 04:32:57','2011-09-08 04:32:57','2011-09-10 04:32:57',NULL,2.5,1,0),(296,'3a117abf96e7fe8793ef87b14d166e1z','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Hic omnis enim fuga aliquid accusamus.',NULL,'',200901131343523,'',NULL,'',0,0,0,'2011-09-08 04:32:59','2011-09-11 04:32:59','2011-09-08 04:32:59','2011-09-10 04:32:59',NULL,2.5,1,0),(297,'a509ebdb2fc8083f3a33ea17985baf18','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Fugit enim repellendus atque.',NULL,'',200901131383455,'',NULL,'',0,0,0,'2011-09-08 04:32:59','2011-09-11 04:32:59','2011-09-08 04:32:59','2011-09-10 04:32:59',NULL,2.5,1,0),(298,'3a117abf96e7fe8793ef87b14d166e2a','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Omnis facilis quae quibusdam.',NULL,'',200901131367550,'',NULL,'',0,0,0,'2011-09-08 04:33:00','2011-09-11 04:33:00','2011-09-08 04:33:00','2011-09-10 04:33:00',NULL,2.5,1,0),(299,'a509ebdb2fc8083f3a33ea17985baf19','',NULL,1,NULL,1,'',1,NULL,1,'','','','','Laudantium ducimus adipisci magni.',NULL,'',201012100375791,'',NULL,'',0,0,0,'2011-09-08 04:33:00','2011-09-11 04:33:00','2011-09-08 04:33:00','2011-09-10 04:33:00',NULL,2.5,1,0),(300,'3a117abf96e7fe8793ef87b14d166e2b','',NULL,2,NULL,2,'',1,NULL,1,'','','','','Enim corrupti quia voluptas distinctio.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2011-09-08 04:33:01','2011-09-11 04:33:01','2011-09-08 04:33:01','2011-09-10 04:33:01',NULL,2.5,1,0),(301,'a509ebdb2fc8083f3a33ea17985baf20','',NULL,3,NULL,3,'',1,NULL,1,'','','','','Anochetus are presumably predators, using their snapping mandibles much like their larger relatives,\n    Odontomachus. However, there are few direct observations. \"A. mayri is found mostly in forests under stones, in\n    moss on rocks or logs, in rotten twigs on the forest floor, or in larger bodies of rotten wood. The workers and\n    queen feign death, and are difficult to see (Brown 1978).\" There appear to be two distinct forms in the Atlantic\n    lowlands of Costa Rica, one of which may be more arboreal (see below).',NULL,'',NULL,'',NULL,'',0,0,0,'2011-09-08 04:33:01','2011-09-11 04:33:01','2011-09-08 04:33:01','2011-09-10 04:33:01',NULL,2.5,1,0);
/*!40000 ALTER TABLE `data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_harvest_events`
--

DROP TABLE IF EXISTS `data_objects_harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_harvest_events` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`data_object_id`),
  KEY `index_data_objects_harvest_events_on_guid` (`guid`),
  KEY `index_data_objects_harvest_events_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_harvest_events`
--

LOCK TABLES `data_objects_harvest_events` WRITE;
/*!40000 ALTER TABLE `data_objects_harvest_events` DISABLE KEYS */;
INSERT INTO `data_objects_harvest_events` VALUES (2,2,'7e4b28685f095537413f5da9ce5444e1',1),(2,3,'eb4bfd0126a205604b621a763d439f07',1),(2,4,'7b15368d8801287cf6af786d7c2a9640',1),(2,5,'dc823d73ef6823bb1c347b98fc39829d',1),(2,6,'901dc8a090d0bcfbf9dec724fa2c0385',1),(2,7,'2917a99817be1ba685131c4f15faa6fc',1),(2,8,'b110139c5ec43a1a495765342e0b7ed7',1),(2,9,'534bfc41ccb771a90a3c6ad80988364c',1),(2,10,'41ff7912cf18e9fa72ce31049ea793e8',1),(2,11,'374d40a6baad71b487be92e331ca31a3',1),(2,12,'4710f7af9257c115778c602d2cbb8b65',1),(2,13,'bbc0d5be45d141d230ae6cb9e8f1fe35',1),(2,14,'24af3464a8cf93ed61bce09f5feb0fc0',1),(2,15,'93d897b892aa70f8a84c00b51ac6448c',1),(2,16,'5a2679416c62f9fb031b936ccbc708a7',1),(2,17,'a8d0c603f0aed15f8faee138d323b736',1),(2,18,'0c32243ef975cd051130cf983cbf76b6',1),(2,19,'5392822a4ecc5b7722da2a4715265255',1),(2,20,'8f13d130cc59db5892a3c142bb795d5a',1),(2,21,'bc4169349f7ac87ba8e3d74bb05753dc',1),(2,22,'e4ef0979263f54dc4ef12584ecc10437',1),(2,23,'39150198b1eb2358e821c26300245587',1),(2,24,'4035523ff6958e8ebf4ec482cfa48e3b',1),(2,25,'60a024084515f903613c35fcf2c2e23a',1),(2,26,'ea4b6395df2971d40254ef79b8aef0dd',1),(2,27,'5861d2d4c4d639fe941c97d1a60c3632',1),(2,28,'c3b96f5e50c8d405587c95054bb8588b',1),(2,29,'c6ade4783ee4f3db5d95538bc2011b19',1),(2,30,'abbdb491e7c1a3b59bc58cfd029a8884',1),(2,31,'c0fc167a8155af0888216039317614b8',1),(2,32,'1b525a3f2d4d09bb959f0f13ae776143',1),(2,33,'43993ba6953d3fd8a22d8f20e7ca10ca',1),(2,34,'41fab3928e65dc363d80603c48f5fa0a',1),(2,35,'f97d9827c85bc9a82a92b99dffde9b8b',1),(2,36,'f3c908a164afd8a7103de86aec74db94',1),(2,37,'18f231a354c2508aaa87124ba646808e',1),(2,38,'4f3ce32b3122348a84b63c31c6f385be',1),(2,39,'4624831efcf7ed457c413d7309ac327d',1),(2,40,'82034988f5c80dbcc32b30ef4473f164',1),(2,41,'1cd045d1148d4cd48041d524e695a082',1),(2,42,'438a5f4f0ce7302c62a76c2313112d55',1),(2,43,'0b9df8bfc6b39a7502bd28212f203b19',1),(2,44,'2d631d2852004afc8959fc5cf1ad42c0',1),(2,45,'7c7542b62b5aa1e43cd8f7ffd725ae7e',1),(2,46,'93014d5c94e96076d84882fc01c8211d',1),(2,47,'e64d4e243cb8d3fdb58f4424d3a9cc0b',1),(2,48,'38f3171a3503092183867e32c5fb2df0',1),(2,49,'1aeb5fb94b0b39b58b99d8a979cb1ea3',1),(2,50,'24f616ab0e31547361be542b172eb60b',1),(2,51,'e31a90d6c178e63f3213c3e4caf53bdf',1),(2,52,'a558f0b0715439610ceefcbe04460a53',1),(2,53,'6bac8f495818ca03b7fbe7ab58e682a9',1),(2,54,'5a5a3e7c8a3a6bb20f93221e547fd363',1),(2,55,'268eaf055354f7bd10b979a03df41baf',1),(2,56,'7fa5e5b5a41151d19804032eba0f6a69',1),(2,57,'e2a2ce842808fe80e360476c2a815e4d',1),(2,58,'1dc400f2fdce3df5067080e0630df3d8',1),(2,59,'8b50271643dcf836563818a77135819f',1),(2,60,'2323536f0df36896af1abc4d5bda1e0a',1),(2,61,'b269848809c8d0fe394194378c4b9a87',1),(2,62,'ad5e474fcf7481c4193d805b621fb742',1),(2,63,'9eed9fa041910db1f302c01ab784b131',1),(2,64,'c4f73bd6be1d8b94698a8ceda424df05',1),(2,65,'3cf065fe331365609f6272748707dbde',1),(2,66,'45022b4b4b8ea0738671793de719c3f7',1),(2,67,'20e03766d890240214d0cee1a2801f82',1),(2,68,'f6a0bb0d3faf62b89f1d39404257e00c',1),(2,69,'aa3b0b2786261114b7f3670cfd5dc567',1),(2,70,'16a283b29c8449c971d095ef8803adcd',1),(2,71,'5e5c940cf9ac6f657cd3bd0e1cdd62e5',1),(2,72,'0f3e37c000bb0868e7d8e1bea4472507',1),(2,73,'9bf03826d3b0cd95c698afffdcdb1e2b',1),(2,74,'32c3ad6d473b0a097b26ef884589e6eb',1),(2,75,'3c0e18caf053af9f18f4ae31b3ec8bcd',1),(2,76,'26d0b3cc8469da5f8ef1441063a3220a',1),(2,77,'71d5c93e2858dec066b1911f5bc37c05',1),(2,78,'bbb03d82832b4f5921c0ed1ac0c9e9f8',1),(2,79,'cf0fd223c984086cb77d8db7aae1efad',1),(2,80,'1ab64a624ee692581b96bad26b949a0f',1),(2,81,'0b07eddc70cad031eae82b07be65a4f2',1),(2,82,'879fdc0cea72c3aac45c82e30e08781b',1),(2,83,'0dc3005770f8344f1c7312b068d2d446',1),(2,84,'f8c8f9dcadb7da85601c22e2c9bfe0e3',1),(2,85,'24baea92aa4e2e986eddcb9857eda0d2',1),(2,86,'8485c99caeeed9f9a48554316e7efa2c',1),(2,87,'46264d9b4c2d2ec1b72b0a0b9771cd1c',1),(2,88,'d1c9fa1e73e32ca55711eb24a6f02bb8',1),(2,89,'f76a5ea1b61a7f651c6a64be49482f1d',1),(2,101,'6bf58a0a50aa5cc745bb05e749d33eda',1),(2,102,'ed1dab788b8e25bffaaf9b0fe42ddf9e',1),(2,103,'41be640d47d978ec7e3c2963c59d6416',1),(2,104,'fe2b5adb8fce548428c1c702a0d2aeef',1),(2,105,'5792c664f0cc86560f4db7d215dc9b96',1),(2,106,'355e782c33b33ca41b276c73ce87b5d6',1),(2,107,'cd50d1973b5e1aa57a6dc56db05da0c3',1),(2,108,'3e4913dad53118bb35493a701d32348e',1),(2,109,'89955950a85fff3e896362d5ad4131da',1),(2,110,'8081fb9c267a24f3aed5b9616dad5181',1),(2,111,'8901a771bef721c4889b5151117838d3',1),(2,112,'12f2e9fd201b8495f3e58858fcbbd7f6',1),(2,113,'c350c78868318fcaa8b798ff9c492e54',1),(2,114,'98337068b745dcdc2acbace7fe3c0bbf',1),(2,115,'aed5f1399c9dded57c9776848b964fe5',1),(2,116,'fa8fa55cc57e6dbaa1aee0f94bc3dc2d',1),(2,117,'1a63a0790df4eec7552f9fde3e32a981',1),(2,118,'e295eddc867769753fb605fca0f5538e',1),(2,119,'ad42532347e83fab3254838f930feab0',1),(2,120,'addf6a779ae08fc644ce31401467733f',1),(2,121,'d13d3084cc3e88ca7e6f31ca2decc917',1),(2,122,'7d4f9d8d418fb5eee4e1798403da6980',1),(2,123,'c9922edae5ad3008cb6ad329cb8845c7',1),(2,124,'68b6205ec2f40257d1bc3a42f68ae23e',1),(2,125,'ba24190184428cc73034ed973b27d381',1),(2,126,'4dfea57963602121c6d6cc8100270283',1),(2,127,'1a935e2b293990bf9e117781235d1e13',1),(2,128,'c1270f166caee5ecb399f4831e04a140',1),(2,129,'0949a1982f9021c9b2409b5da7e85be7',1),(2,130,'b6669ec5d1cb07db11e813c76e250696',1),(2,131,'80807602bebc1ca7fdaae4ba299b0792',1),(2,132,'23aa39bf72cf412682cd5e3cf3217143',1),(2,133,'a568ca9da17e324b9478c0feb25efd0b',1),(2,134,'ac6da38937fe39e573e0b98689d7e05a',1),(2,135,'7991eee64b31bc561ca426c1cded95a0',1),(2,136,'57d093dfb062683c7a693a90837f175d',1),(2,137,'15e9aa1442679024956252ba97ecf7c7',1),(2,138,'edac1f9c8c965c9154050fb64d68f1b8',1),(2,139,'d6321c8d15e15fce82f14c5637135abd',1),(2,140,'6567cb0451e8af1e06a9f65540c8538a',1),(2,141,'2b5e0ea790eab0c926f4c13340c699e3',1),(2,142,'be3bdd549c3cf15baa86d0877979d207',1),(2,143,'eb1b9691987ca8f63d632c661eaa1435',1),(2,144,'627129acbf8c2b3c70a470f1b8ba37db',1),(2,145,'915f586a6ae8c16135e3ad0ff5106ea5',1),(2,146,'1c2e39a2440d72df7b06708fb715466d',1),(2,147,'20d289dcb345c6c7ae93ad8397bebb0f',1),(2,148,'0c8134e0257d8adc8133a8f58b56bdb9',1),(2,149,'13189286871d0b6cbaa2e8f80953463e',1),(2,150,'62b440bd9557d9f2456d69a21867eb58',1),(2,151,'33cc3787d2d6d5c36671a6670a2000bf',1),(2,152,'b691556522e46d9b57cade5d0a6b847c',1),(2,153,'047e52d4381e21e01f78ecf485d79e7d',1),(2,154,'c224eca9fcce2759cad972a0e706e253',1),(2,155,'3fb13ff91380005c869cdef333cd49d4',1),(2,156,'87e0ff02c5eff6ba668e0ef3323ccee5',1),(2,157,'23ca1d68822e13f76d8ad74a17342b11',1),(2,158,'5f05d165ba335e9d9e206d05c9a0cb0e',1),(2,159,'a58e57f5b2a18cd5d2c02eb1522cdad9',1),(2,160,'9fd7e401abac48ef8101e36d610b9a00',1),(2,161,'9e1683cc698f8d864d9a914ea1621323',1),(2,162,'eaf79642cff0e29614237dea782bb8f6',1),(2,163,'5240824f5270986a7615363e021b17bb',1),(2,164,'653b24b902ff2cd03c93bddc13e67842',1),(2,165,'acd4b6ba7bebcc7097cc180a858ad265',1),(2,166,'6b83d4aeb859e75fb5db6116d02b4f5d',1),(2,167,'037f6d1015d9fb058db814be7aca5f14',1),(2,168,'2ffea6342b21646d80becef300493b12',1),(2,169,'10848b765a065d204a6493fe7f4c813d',1),(2,170,'caaced95803d59dedc70d4f9fa377e44',1),(2,171,'204d1e49679560c7e210054699da14f6',1),(2,172,'af979216d4811a50161749e1a05ddd5f',1),(2,173,'54b6a7b32d707390291f9bb8f21673cd',1),(2,174,'68560968ecfa71e02d7dd04ad5e53b9c',1),(2,175,'1987af818bd3b515ecb8ad13e77e5070',1),(2,176,'9a2ae16f374af31b1e897f4773e9be56',1),(2,177,'23f54134a1714a1048b9f171dce54983',1),(2,178,'ef3f04d5c135a9ec5023cf8238bbe104',1),(2,179,'ae5a07dce35756b1843a9520ec35b871',1),(2,180,'75f983f7aba0e3d626799ce52bdaffe7',1),(2,181,'cda28fb0e68b989fb8e8d860b3c0b129',1),(2,182,'c3cf17589a4c250059c6405fe8c7c502',1),(2,183,'141723b1a7a3bec414cdbb6f6e0f6c78',1),(2,184,'56181a7dce7793bb402068325b4d82d6',1),(2,185,'5590f46874f256ab97e05c89f7d81f3f',1),(2,186,'bcfa7120dbddf0b48ceeb5767d48a090',1),(2,187,'349effa057bea18380ea574d620467f4',1),(2,188,'f8420eb48db4d1d693d04aaa7e16d051',1),(2,189,'b1ef2acbfa4fd86833c8c6436a2a11d3',1),(2,190,'be833b6601762773dd474326e1c16f7b',1),(2,191,'90fddbd8f48337b00ce5f55e7027f016',1),(2,192,'54e645f26b356a7824e8f9eacd13b2e2',1),(2,193,'a9767f56162e331c71d3b50bb741f29a',1),(2,194,'be3e9583b42f838afec857555ef8f61e',1),(2,195,'0f1c191d746fe668ad3665b8ba04779d',1),(2,196,'89b57a13b88530b07b30e4523c9940cc',1),(2,197,'76839e0f3d855737dcfc659ad8732f86',1),(2,198,'2d1d99b7bd57d814246b4b3b5b293c9b',1),(2,199,'0d364c853849d67b7041bbb8cc659b3e',1),(2,200,'3308861ffa0af4347c8103f938055ebd',1),(2,201,'33ab5d6e54652b28d2a7a245e9b2a182',1),(2,202,'2d39ac7735a98aae1d172abca44da82c',1),(2,203,'035021a015a7c657573f1021f85dce0e',1),(2,204,'251f2229a22705d028f914a109f7c9dd',1),(2,205,'4e303fb54cfbacd555241a140b07fddc',1),(2,206,'43b041b28f3f56ae72e6439d2a71aae1',1),(2,207,'0c99e46280cd9f56d661fbe7405a3b0b',1),(2,208,'528fdcdfeac2c8b5978b6c6c6abfce36',1),(2,209,'925cde8bbfcbb9f4a436a104c568d6c6',1),(2,210,'f4936346a44bb120bf1ef83d1835cb44',1),(2,211,'1dc3c97c046f2da73392063c70df6dd6',1),(2,212,'e71127b4926bed9b40238461fcd0fad3',1),(2,213,'340497b2bdf5221a0480926c173c4a3f',1),(2,214,'7b698240a01e535e458fab4bbfb259b9',1),(2,215,'012f0052c78e4d2b8925a0d4afbb7a12',1),(2,216,'c5ba2d20dc339b88873f602f1bfbef1d',1),(2,217,'c5b3ba3f89b494f0513d143ba4987bb7',1),(2,218,'f653e23aa9287694c0dee98e59cb966e',1),(2,219,'02df300b0b6db38dff120062936cbbb0',1),(2,220,'62340b62cafc3819859e42c88c976a79',1),(2,221,'20ba62f3295a9a95967398d71342fbf7',1),(2,222,'63b4a634f1160c7031d9bab789ac9308',1),(2,223,'064d4de7d7ef8e51f831b2c4e9413127',1),(2,224,'a7304766629867dbc3d77ffd72407b55',1),(2,225,'457852058dd2e6975362e0cbc3e307ff',1),(2,226,'a5b9c06c17504d99b8359cb467190466',1),(2,227,'1d350b2eedd900406dc26501d11a77bd',1),(2,228,'49629334c60d5e3733abcc5d7f42b7c5',1),(2,229,'e07737239f7a6c33ec76534892794501',1),(2,230,'e1491795dd80c8745b10241a59cbf0fd',1),(2,231,'877cb4cd075ede8e0d3ac208e01aed66',1),(2,232,'9af4165e126fa20d3e306fb452c6715b',1),(2,233,'035a00299567c86b88949c17fa337a0e',1),(2,234,'b2ded46c1304d78bd677d9856df6ec19',1),(2,235,'8a5a13725bcf60865e48cce320ec33ad',1),(3,82,'879fdc0cea72c3aac45c82e30e08781b',1),(4,88,'d1c9fa1e73e32ca55711eb24a6f02bb8',1),(5,92,'e29afb06ad45f0f7a48325de3cefdbe2',1),(5,93,'ca74c0ef7673196488691bb59aa96a4e',1),(5,94,'e8521960cc3fc5423439cce8e2d17d5b',1),(5,95,'231bac7f5fe39506faff0e8d39b20f9a',1),(5,96,'432feb03c70486833e70c7897292c2b9',1),(5,97,'81b9590b18276856b5bda3700d2cc8c3',1),(5,98,'8333da4988cdebc95ad7626fe948a1f9',1),(5,99,'3880bd495d23cd111a1d478ef442f8a3',1),(5,100,'8d400b2ac8c2b978c2b9eccd86a8b03a',1),(5,236,'a0da8911d7a522ba43036012522f56a2',1),(5,237,'f5060ad38b6662ae12e28f6142d1ecf9',1),(5,238,'fcdc0d708354cca6e4ce418ae2e59c9d',1),(5,239,'7ab092f70241ce060f92b4997d7a5ee7',1),(5,240,'906b825c93396c2989f5c0bab1086bf9',1),(5,241,'ed17fb851f480f6e6db0d6d243d2395f',1),(5,242,'32aeb1ebb3f3a23493f672800ee7d465',1),(5,243,'99bc35255575f9f6b5bc5f2df07b909a',1),(5,244,'ae39770f427f12a56a2e165d5245e554',1),(5,245,'5c0c86fc796a8ce81c93d10f9518fc19',1),(5,246,'4dc2b80c00fee83cfbd1dd5752f96b9a',1),(5,247,'395afacce29c2f7d8cd192f72b4e81b2',1),(5,248,'9113c0de3a9ef382e061e4ca68bec0f0',1),(5,249,'55336878409f3f393ed732915258681d',1),(5,250,'3f85df4b65c6a0632bbf3691b2ec4aff',1),(5,251,'f23ab5513f4d09afa53688daf18fcc77',1),(5,252,'2f65f4a986a5261b50557e3897a33277',1),(5,253,'7ac109c83e94f61c53be2cc49b972683',1),(5,254,'afeac6442e57e92bf1d3f5dbc1030c74',1),(5,255,'5ab8fce9702b16f63557f3e1fb0691ca',1),(5,256,'73f22d2f33bedb7923112a741b41a9bd',1),(5,257,'bf6314e8c9bc0c0e823fa7664b9d93f4',1),(5,258,'11b47d92d878e733f27d82e32af288d2',1),(5,259,'da91eb55d76d9ad29646ed9983e7e012',1),(5,260,'399f19013b63e9e847abb302fe7145c9',1),(5,261,'e45550ede57fbc7a0d86b7ff83b51c8b',1),(5,262,'cb624e0b0af002ffe19943b880556627',1),(5,263,'c7e083665183b90ecd36e374ee2e9c1f',1),(5,264,'137b5a5db201380b11734c8625fbbcf1',1),(5,265,'4a7db7509804883858987852477cb28e',1),(5,266,'1aaad6eaeb212a25a553840868f29b6d',1),(5,267,'47d7dc5e316b97b494acf7e867de5002',1),(5,268,'a922347b8d729f8388a3aed732e7c3ef',1),(5,269,'3cfe8f485e2ba9a11d63f9918cb6e16f',1),(5,270,'c33f180821ed8d781aed8d40a4aca5dc',1),(5,271,'de5d0d8fb6135b4a00da8aec400975a7',1),(5,272,'0be3e22f03d09f25c61566311bb16ac5',1),(5,273,'a89ce0e8fcd7b51c877fb64ad73840a2',1),(5,274,'89c4d960dc9339ff44751a267404bb8d',1),(5,275,'5883948eb075dcf9202eaf4698a4e374',1),(5,276,'7266f1d16af2bf3c586cb3ff3b35771a',1),(5,277,'4911de7519b33685814418ecc7aa005e',1),(5,278,'4d9d90c3764b907d0da40731b15fc551',1),(5,279,'2637031b9844659471a8a01716fec284',1),(5,280,'0b9f5d93c6630f51ac2d9f204eefb178',1),(5,281,'55acd1d1e4b366ad09b384fb12b6fe7a',1),(5,282,'cd414412dc0a6f17348f0b88999ea71c',1),(5,283,'a26a7728ee63ab9ebc3c571937a7a561',1),(5,284,'e944dd892c50660d57f321530482aaaa',1),(5,285,'08db390afcc1c3656c8bee9a1427ee07',1),(5,286,'d00460a9de8dbff6e85217f7e6c1549f',1),(5,287,'100d8b1956575ea9794e6f6a32b24b3f',1),(5,288,'a719fb7e6a88a86624be2aab378e50ec',1),(5,289,'3e9ef8e399a073e917c56e7a33c6ad2a',1),(5,290,'0d2382139e3ec2a2e878753fc247e0ba',1),(5,291,'90f3fe449b6bb198be98a9238f43b13e',1),(5,292,'1830293a5dfef97047e7b14757d3c1ef',1),(5,293,'9a62667beb4a96973044f60d495f9429',1),(5,294,'7932923583927675618c4a5cec4127a7',1),(5,295,'9603481e73cbeb3716f1c8039363de4d',1),(5,296,'033d3f293f59001cb9f62869ab591004',1),(5,297,'d881016326cff6d38dd5e9cd8bab5b79',1),(5,298,'a7894889b39a021d5de7fd04049192e1',1),(5,299,'eab80cc5c3e39e80e4e00662efa72348',1),(5,300,'b36ae2a572b1a43a0bb07e0ea41ee906',1),(5,301,'f0061548ccb1dc1060b4c6c7551367e2',1);
/*!40000 ALTER TABLE `data_objects_harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_hierarchy_entries`
--

LOCK TABLES `data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `data_objects_hierarchy_entries` VALUES (1,1,4,2),(2,2,4,2),(2,3,4,2),(2,4,4,2),(2,5,4,2),(2,6,4,2),(2,7,4,2),(2,8,4,2),(2,9,4,2),(2,10,4,2),(3,11,4,2),(3,12,4,2),(3,13,4,2),(3,14,4,2),(3,15,4,2),(3,16,4,2),(3,17,4,2),(3,18,4,2),(3,19,4,2),(4,20,4,2),(4,21,4,2),(4,22,4,2),(4,23,4,2),(4,24,4,2),(4,25,4,2),(4,26,4,2),(4,27,4,2),(4,28,4,2),(5,29,4,2),(5,30,4,2),(5,31,4,2),(5,32,4,2),(5,33,4,2),(5,34,4,2),(5,35,4,2),(5,36,4,2),(5,37,4,2),(6,38,4,2),(6,39,4,2),(6,40,4,2),(6,41,4,2),(6,42,4,2),(6,43,4,2),(6,44,4,2),(6,45,4,2),(6,46,4,2),(7,47,4,2),(7,48,3,2),(7,49,2,2),(7,50,1,2),(7,51,4,1),(7,52,4,3),(7,53,1,1),(7,54,2,1),(7,55,1,3),(7,56,4,2),(7,57,4,2),(7,58,4,2),(7,59,4,2),(7,60,4,2),(7,61,4,2),(7,62,4,2),(8,63,4,2),(9,64,4,2),(10,65,4,2),(11,66,4,2),(11,67,3,2),(11,68,2,2),(11,69,1,2),(11,70,4,1),(11,71,4,3),(11,72,1,1),(11,73,2,1),(11,74,1,3),(11,75,2,2),(11,76,2,2),(11,77,4,2),(11,78,4,2),(11,79,4,2),(11,80,4,2),(11,81,4,2),(12,82,4,2),(12,83,4,2),(12,84,1,2),(12,85,1,2),(12,86,2,2),(12,87,4,2),(12,88,4,2),(12,89,4,2),(12,90,4,2),(12,91,4,2),(13,92,4,2),(13,93,4,2),(13,94,4,2),(13,95,4,2),(13,96,4,2),(13,97,4,2),(13,98,4,2),(13,99,4,2),(14,100,1,3),(16,101,4,2),(16,102,4,2),(16,103,4,2),(16,104,4,2),(16,105,4,2),(16,106,4,2),(16,107,4,2),(16,108,4,2),(16,109,4,2),(23,110,4,2),(23,111,4,2),(23,112,4,2),(23,113,4,2),(23,114,4,2),(23,115,4,2),(23,116,4,2),(23,117,4,2),(23,118,4,2),(25,119,4,2),(25,120,4,2),(25,121,4,2),(25,122,4,2),(25,123,4,2),(25,124,4,2),(25,125,4,2),(25,126,4,2),(25,127,4,2),(26,128,4,2),(26,129,4,2),(26,130,4,2),(26,131,4,2),(26,132,4,2),(26,133,4,2),(26,134,4,2),(26,135,4,2),(26,136,4,2),(27,137,4,2),(27,138,4,2),(27,139,4,2),(27,140,4,2),(27,141,4,2),(27,142,4,2),(27,143,4,2),(27,144,4,2),(27,145,4,2),(28,146,4,2),(28,147,4,2),(28,148,4,2),(28,149,4,2),(28,150,4,2),(28,151,4,2),(28,152,4,2),(28,153,4,2),(28,154,4,2),(29,155,4,2),(29,156,4,2),(29,157,4,2),(29,158,4,2),(29,159,4,2),(29,160,4,2),(29,161,4,2),(29,162,4,2),(29,163,4,2),(30,164,4,2),(30,165,4,2),(30,166,4,2),(30,167,4,2),(30,168,4,2),(30,169,4,2),(30,170,4,2),(30,171,4,2),(30,172,4,2),(31,173,4,2),(31,174,4,2),(31,175,4,2),(31,176,4,2),(31,177,4,2),(31,178,4,2),(31,179,4,2),(31,180,4,2),(31,181,4,2),(32,182,4,2),(32,183,4,2),(32,184,4,2),(32,185,4,2),(32,186,4,2),(32,187,4,2),(32,188,4,2),(32,189,4,2),(32,190,4,2),(33,191,4,2),(33,192,4,2),(33,193,4,2),(33,194,4,2),(33,195,4,2),(33,196,4,2),(33,197,4,2),(33,198,4,2),(33,199,4,2),(34,200,4,2),(34,201,4,2),(34,202,4,2),(34,203,4,2),(34,204,4,2),(34,205,4,2),(34,206,4,2),(34,207,4,2),(34,208,4,2),(35,209,4,2),(35,210,4,2),(35,211,4,2),(35,212,4,2),(35,213,4,2),(35,214,4,2),(35,215,4,2),(35,216,4,2),(35,217,4,2),(36,218,4,2),(36,219,4,2),(36,220,4,2),(36,221,4,2),(36,222,4,2),(36,223,4,2),(36,224,4,2),(36,225,4,2),(36,226,4,2),(37,227,4,2),(37,228,4,2),(37,229,4,2),(37,230,4,2),(37,231,4,2),(37,232,4,2),(37,233,4,2),(37,234,4,2),(37,235,4,2),(38,236,4,2),(38,237,4,2),(39,238,4,2),(39,239,4,2),(40,240,4,2),(40,241,4,2),(41,242,4,2),(41,243,4,2),(42,244,4,2),(42,245,4,2),(43,246,4,2),(43,247,4,2),(44,248,4,2),(44,249,4,2),(45,250,4,2),(45,251,4,2),(46,252,4,2),(46,253,4,2),(47,254,4,2),(47,255,4,2),(48,256,4,2),(48,257,4,2),(49,258,4,2),(49,259,4,2),(50,260,4,2),(50,261,4,2),(51,262,4,2),(51,263,4,2),(52,264,4,2),(52,265,4,2),(53,266,4,2),(53,267,4,2),(53,268,4,2),(53,269,4,2),(53,270,4,2),(53,271,4,2),(53,272,4,2),(53,273,4,2),(53,274,4,2),(53,275,4,2),(54,276,4,2),(54,277,4,2),(54,278,4,2),(54,279,4,2),(55,280,4,2),(55,281,4,2),(55,282,4,2),(55,283,4,2),(56,284,4,2),(56,285,4,2),(56,286,4,2),(56,287,4,2),(56,288,4,2),(56,289,4,2),(57,290,4,2),(57,291,4,2),(57,292,4,2),(57,293,4,2),(57,294,4,2),(57,295,4,2),(58,296,4,2),(58,297,4,2),(58,298,4,2),(58,299,4,2),(58,300,4,2),(58,301,4,2);
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_info_items`
--

DROP TABLE IF EXISTS `data_objects_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_info_items` (
  `data_object_id` int(10) unsigned NOT NULL,
  `info_item_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`info_item_id`),
  KEY `info_item_id` (`info_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_info_items`
--

LOCK TABLES `data_objects_info_items` WRITE;
/*!40000 ALTER TABLE `data_objects_info_items` DISABLE KEYS */;
INSERT INTO `data_objects_info_items` VALUES (28,1),(88,1),(97,1),(98,1),(8,2),(17,2),(26,2),(35,2),(44,2),(60,2),(79,2),(89,2),(99,2),(107,2),(116,2),(125,2),(134,2),(143,2),(152,2),(161,2),(170,2),(179,2),(188,2),(197,2),(206,2),(215,2),(217,2),(224,2),(233,2),(98,3),(8,5),(17,5),(26,5),(35,5),(44,5),(60,5),(79,5),(89,5),(99,5),(107,5),(116,5),(125,5),(134,5),(143,5),(152,5),(161,5),(170,5),(179,5),(188,5),(197,5),(206,5),(215,5),(217,5),(224,5),(233,5),(8,6),(17,6),(26,6),(35,6),(44,6),(60,6),(79,6),(89,6),(99,6),(107,6),(116,6),(125,6),(134,6),(143,6),(152,6),(161,6),(170,6),(179,6),(188,6),(197,6),(206,6),(215,6),(217,6),(224,6),(233,6),(8,7),(17,7),(26,7),(35,7),(44,7),(60,7),(79,7),(89,7),(99,7),(107,7),(116,7),(125,7),(134,7),(143,7),(152,7),(161,7),(170,7),(179,7),(188,7),(197,7),(206,7),(215,7),(217,7),(224,7),(233,7),(275,8),(8,9),(17,9),(26,9),(35,9),(44,9),(60,9),(79,9),(89,9),(99,9),(107,9),(116,9),(125,9),(134,9),(143,9),(152,9),(161,9),(170,9),(179,9),(188,9),(197,9),(206,9),(215,9),(217,9),(224,9),(233,9),(97,13);
/*!40000 ALTER TABLE `data_objects_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_refs`
--

DROP TABLE IF EXISTS `data_objects_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_refs` (
  `data_object_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`ref_id`),
  KEY `do_id_ref_id` (`data_object_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_refs`
--

LOCK TABLES `data_objects_refs` WRITE;
/*!40000 ALTER TABLE `data_objects_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_objects_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_table_of_contents`
--

DROP TABLE IF EXISTS `data_objects_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_table_of_contents` (
  `data_object_id` int(10) unsigned NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`toc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_table_of_contents`
--

LOCK TABLES `data_objects_table_of_contents` WRITE;
/*!40000 ALTER TABLE `data_objects_table_of_contents` DISABLE KEYS */;
INSERT INTO `data_objects_table_of_contents` VALUES (7,1),(8,4),(9,45),(10,41),(16,1),(17,4),(18,8),(19,18),(25,1),(26,4),(27,26),(28,1),(34,1),(35,4),(36,32),(37,48),(43,1),(44,4),(45,11),(46,20),(59,1),(60,4),(61,47),(62,28),(78,1),(79,4),(80,13),(81,45),(88,1),(89,4),(90,49),(97,1),(98,1),(99,4),(106,1),(107,4),(108,45),(109,19),(115,1),(116,4),(117,32),(118,47),(124,1),(125,4),(126,34),(127,11),(133,1),(134,4),(135,42),(136,17),(142,1),(143,4),(144,9),(145,46),(151,1),(152,4),(153,8),(154,23),(160,1),(161,4),(162,21),(163,23),(169,1),(170,4),(171,11),(172,38),(178,1),(179,4),(180,14),(181,29),(187,1),(188,4),(189,27),(190,26),(196,1),(197,4),(198,14),(199,14),(205,1),(206,4),(207,14),(208,42),(214,1),(215,4),(216,10),(217,4),(223,1),(224,4),(225,27),(226,32),(232,1),(233,4),(234,43),(235,2),(237,2),(239,2),(241,2),(243,2),(245,2),(247,2),(249,2),(251,2),(253,2),(255,2),(257,2),(259,2),(261,2),(263,2),(265,2),(271,2),(272,2),(273,2),(274,9),(275,22),(279,2),(283,2),(289,2),(295,2),(301,2);
/*!40000 ALTER TABLE `data_objects_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_taxon_concepts`
--

DROP TABLE IF EXISTS `data_objects_taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_taxon_concepts` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_taxon_concepts`
--

LOCK TABLES `data_objects_taxon_concepts` WRITE;
/*!40000 ALTER TABLE `data_objects_taxon_concepts` DISABLE KEYS */;
INSERT INTO `data_objects_taxon_concepts` VALUES (7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(12,47),(12,48),(12,49),(12,50),(12,51),(12,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60),(12,61),(12,62),(13,63),(14,64),(15,65),(16,66),(16,67),(16,68),(16,69),(16,70),(16,71),(16,72),(16,73),(16,74),(16,75),(16,76),(16,77),(16,78),(16,79),(16,80),(16,81),(17,82),(17,83),(17,84),(17,85),(17,86),(17,87),(17,88),(17,89),(17,90),(17,91),(18,92),(18,93),(18,94),(18,95),(18,96),(18,97),(18,98),(18,99),(18,100),(910093,101),(910093,102),(910093,103),(910093,104),(910093,105),(910093,106),(910093,107),(910093,108),(910093,109),(20,110),(20,111),(20,112),(20,113),(20,114),(20,115),(20,116),(20,117),(20,118),(21,119),(21,120),(21,121),(21,122),(21,123),(21,124),(21,125),(21,126),(21,127),(22,128),(22,129),(22,130),(22,131),(22,132),(22,133),(22,134),(22,135),(22,136),(23,137),(23,138),(23,139),(23,140),(23,141),(23,142),(23,143),(23,144),(23,145),(24,146),(24,147),(24,148),(24,149),(24,150),(24,151),(24,152),(24,153),(24,154),(25,155),(25,156),(25,157),(25,158),(25,159),(25,160),(25,161),(25,162),(25,163),(26,164),(26,165),(26,166),(26,167),(26,168),(26,169),(26,170),(26,171),(26,172),(27,173),(27,174),(27,175),(27,176),(27,177),(27,178),(27,179),(27,180),(27,181),(28,182),(28,183),(28,184),(28,185),(28,186),(28,187),(28,188),(28,189),(28,190),(29,191),(29,192),(29,193),(29,194),(29,195),(29,196),(29,197),(29,198),(29,199),(30,200),(30,201),(30,202),(30,203),(30,204),(30,205),(30,206),(30,207),(30,208),(31,209),(31,210),(31,211),(31,212),(31,213),(31,214),(31,215),(31,216),(31,217),(32,218),(32,219),(32,220),(32,221),(32,222),(32,223),(32,224),(32,225),(32,226),(33,227),(33,228),(33,229),(33,230),(33,231),(33,232),(33,233),(33,234),(33,235),(5559,236),(5559,237),(3352,238),(3352,239),(281,240),(281,241),(2861424,242),(2861424,243),(18878,244),(18878,245),(7160,246),(7160,247),(17954507,248),(17954507,249),(3594,250),(3594,251),(89513,252),(89513,253),(7676,254),(7676,255),(14460,256),(14460,257),(6747,258),(6747,259),(14031,260),(14031,261),(699,262),(699,263),(49148,264),(49148,265),(2866150,266),(2866150,267),(2866150,268),(2866150,269),(2866150,270),(2866150,271),(2866150,272),(2866150,273),(2866150,274),(2866150,275),(17924149,276),(17924149,277),(17924149,278),(17924149,279),(921737,280),(921737,281),(921737,282),(921737,283),(328607,284),(328607,285),(328607,286),(328607,287),(328607,288),(328607,289),(1061748,290),(1061748,291),(1061748,292),(1061748,293),(1061748,294),(1061748,295),(491753,296),(491753,297),(491753,298),(491753,299),(491753,300),(491753,301);
/*!40000 ALTER TABLE `data_objects_taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'http://purl.org/dc/dcmitype/StillImage'),(2,'http://purl.org/dc/dcmitype/Sound'),(3,'http://purl.org/dc/dcmitype/Text'),(4,'http://purl.org/dc/dcmitype/MovingImage'),(5,''),(6,'IUCN'),(7,'Flash'),(8,'YouTube'),(9,'Map');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exception_name` varchar(250) DEFAULT NULL,
  `backtrace` text,
  `url` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_error_logs_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_data_objects`
--

DROP TABLE IF EXISTS `feed_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_data_objects` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_data_objects`
--

LOCK TABLES `feed_data_objects` WRITE;
/*!40000 ALTER TABLE `feed_data_objects` DISABLE KEYS */;
INSERT INTO `feed_data_objects` VALUES (7,2,1,'2011-09-13 02:27:51'),(7,3,1,'2011-09-13 02:27:51'),(7,4,7,'2011-09-13 02:27:51'),(7,5,8,'2011-09-13 02:27:51'),(7,6,2,'2011-09-13 02:27:51'),(7,7,3,'2011-09-13 02:27:52'),(7,8,3,'2011-09-13 02:27:52'),(7,9,3,'2011-09-13 02:27:52'),(7,10,3,'2011-09-13 02:27:52'),(8,11,1,'2011-09-13 02:27:57'),(8,12,1,'2011-09-13 02:27:57'),(8,13,7,'2011-09-13 02:27:57'),(8,14,8,'2011-09-13 02:27:57'),(8,15,2,'2011-09-13 02:27:57'),(8,16,3,'2011-09-13 02:27:57'),(8,17,3,'2011-09-13 02:27:57'),(8,18,3,'2011-09-13 02:27:58'),(8,19,3,'2011-09-13 02:27:58'),(9,20,1,'2011-09-13 02:28:03'),(9,21,1,'2011-09-13 02:28:03'),(9,22,7,'2011-09-13 02:28:04'),(9,23,8,'2011-09-13 02:28:04'),(9,24,2,'2011-09-13 02:28:04'),(9,25,3,'2011-09-13 02:28:04'),(9,26,3,'2011-09-13 02:28:04'),(9,27,3,'2011-09-13 02:28:04'),(9,28,3,'2011-09-13 02:28:04'),(10,29,1,'2011-09-13 02:28:10'),(10,30,1,'2011-09-13 02:28:10'),(10,31,7,'2011-09-13 02:28:10'),(10,32,8,'2011-09-13 02:28:10'),(10,33,2,'2011-09-13 02:28:10'),(10,34,3,'2011-09-13 02:28:10'),(10,35,3,'2011-09-13 02:28:10'),(10,36,3,'2011-09-13 02:28:10'),(10,37,3,'2011-09-13 02:28:10'),(11,38,1,'2011-09-13 02:28:15'),(11,39,1,'2011-09-13 02:28:15'),(11,40,7,'2011-09-13 02:28:16'),(11,41,8,'2011-09-13 02:28:16'),(11,42,2,'2011-09-13 02:28:16'),(11,43,3,'2011-09-13 02:28:16'),(11,44,3,'2011-09-13 02:28:16'),(11,45,3,'2011-09-13 02:28:16'),(11,46,3,'2011-09-13 02:28:16'),(12,47,1,'2011-09-13 02:28:26'),(12,48,1,'2011-09-13 02:28:26'),(12,49,1,'2011-09-13 02:28:26'),(12,50,1,'2011-09-13 02:28:26'),(12,51,1,'2011-09-13 02:28:26'),(12,52,1,'2011-09-13 02:28:26'),(12,53,1,'2011-09-13 02:28:26'),(12,54,1,'2011-09-13 02:28:26'),(12,55,1,'2011-09-13 02:28:26'),(12,56,7,'2011-09-13 02:28:27'),(12,57,8,'2011-09-13 02:28:27'),(12,58,2,'2011-09-13 02:28:27'),(12,59,3,'2011-09-13 02:28:27'),(12,60,3,'2011-09-13 02:28:27'),(12,61,3,'2011-09-13 02:28:27'),(12,62,3,'2011-09-13 02:28:27'),(13,63,2,'2011-09-13 02:28:31'),(14,64,2,'2011-09-13 02:28:33'),(15,65,2,'2011-09-13 02:28:35'),(16,66,1,'2011-09-13 02:28:44'),(16,67,1,'2011-09-13 02:28:44'),(16,68,1,'2011-09-13 02:28:44'),(16,69,1,'2011-09-13 02:28:45'),(16,70,1,'2011-09-13 02:28:45'),(16,71,1,'2011-09-13 02:28:45'),(16,72,1,'2011-09-13 02:28:45'),(16,73,1,'2011-09-13 02:28:45'),(16,74,1,'2011-09-13 02:28:45'),(16,75,7,'2011-09-13 02:28:45'),(16,76,8,'2011-09-13 02:28:45'),(16,77,2,'2011-09-13 02:28:45'),(16,78,3,'2011-09-13 02:28:45'),(16,79,3,'2011-09-13 02:28:45'),(16,80,3,'2011-09-13 02:28:45'),(16,81,3,'2011-09-13 02:28:45'),(17,82,1,'2011-09-13 02:28:50'),(17,83,7,'2011-09-13 02:28:50'),(17,84,7,'2011-09-13 02:28:50'),(17,85,8,'2011-09-13 02:28:50'),(17,86,8,'2011-09-13 02:28:50'),(17,87,2,'2011-09-13 02:28:50'),(17,88,3,'2011-09-13 02:28:50'),(17,89,3,'2011-09-13 02:28:50'),(18,92,1,'2011-09-13 02:28:58'),(18,93,1,'2011-09-13 02:28:59'),(18,94,7,'2011-09-13 02:28:59'),(18,95,8,'2011-09-13 02:28:59'),(18,96,2,'2011-09-13 02:28:59'),(18,97,3,'2011-09-13 02:28:59'),(18,98,3,'2011-09-13 02:28:59'),(18,99,3,'2011-09-13 02:28:59'),(20,110,1,'2011-09-13 02:29:18'),(20,111,1,'2011-09-13 02:29:18'),(20,112,7,'2011-09-13 02:29:18'),(20,113,8,'2011-09-13 02:29:18'),(20,114,2,'2011-09-13 02:29:18'),(20,115,3,'2011-09-13 02:29:18'),(20,116,3,'2011-09-13 02:29:18'),(20,117,3,'2011-09-13 02:29:18'),(20,118,3,'2011-09-13 02:29:18'),(21,119,1,'2011-09-13 02:29:29'),(21,120,1,'2011-09-13 02:29:29'),(21,121,7,'2011-09-13 02:29:30'),(21,122,8,'2011-09-13 02:29:30'),(21,123,2,'2011-09-13 02:29:30'),(21,124,3,'2011-09-13 02:29:30'),(21,125,3,'2011-09-13 02:29:30'),(21,126,3,'2011-09-13 02:29:30'),(21,127,3,'2011-09-13 02:29:31'),(22,128,1,'2011-09-13 02:29:41'),(22,129,1,'2011-09-13 02:29:41'),(22,130,7,'2011-09-13 02:29:41'),(22,131,8,'2011-09-13 02:29:41'),(22,132,2,'2011-09-13 02:29:41'),(22,133,3,'2011-09-13 02:29:41'),(22,134,3,'2011-09-13 02:29:41'),(22,135,3,'2011-09-13 02:29:42'),(22,136,3,'2011-09-13 02:29:42'),(23,137,1,'2011-09-13 02:29:50'),(23,138,1,'2011-09-13 02:29:50'),(23,139,7,'2011-09-13 02:29:50'),(23,140,8,'2011-09-13 02:29:50'),(23,141,2,'2011-09-13 02:29:50'),(23,142,3,'2011-09-13 02:29:50'),(23,143,3,'2011-09-13 02:29:50'),(23,144,3,'2011-09-13 02:29:50'),(23,145,3,'2011-09-13 02:29:51'),(24,146,1,'2011-09-13 02:29:58'),(24,147,1,'2011-09-13 02:29:58'),(24,148,7,'2011-09-13 02:29:59'),(24,149,8,'2011-09-13 02:29:59'),(24,150,2,'2011-09-13 02:29:59'),(24,151,3,'2011-09-13 02:29:59'),(24,152,3,'2011-09-13 02:29:59'),(24,153,3,'2011-09-13 02:29:59'),(24,154,3,'2011-09-13 02:29:59'),(25,155,1,'2011-09-13 02:30:05'),(25,156,1,'2011-09-13 02:30:05'),(25,157,7,'2011-09-13 02:30:05'),(25,158,8,'2011-09-13 02:30:05'),(25,159,2,'2011-09-13 02:30:05'),(25,160,3,'2011-09-13 02:30:05'),(25,161,3,'2011-09-13 02:30:05'),(25,162,3,'2011-09-13 02:30:06'),(25,163,3,'2011-09-13 02:30:06'),(26,164,1,'2011-09-13 02:30:17'),(26,165,1,'2011-09-13 02:30:17'),(26,166,7,'2011-09-13 02:30:17'),(26,167,8,'2011-09-13 02:30:17'),(26,168,2,'2011-09-13 02:30:17'),(26,169,3,'2011-09-13 02:30:17'),(26,170,3,'2011-09-13 02:30:17'),(26,171,3,'2011-09-13 02:30:17'),(26,172,3,'2011-09-13 02:30:18'),(27,173,1,'2011-09-13 02:30:28'),(27,174,1,'2011-09-13 02:30:28'),(27,175,7,'2011-09-13 02:30:28'),(27,176,8,'2011-09-13 02:30:28'),(27,177,2,'2011-09-13 02:30:28'),(27,178,3,'2011-09-13 02:30:28'),(27,179,3,'2011-09-13 02:30:28'),(27,180,3,'2011-09-13 02:30:28'),(27,181,3,'2011-09-13 02:30:28'),(28,182,1,'2011-09-13 02:30:33'),(28,183,1,'2011-09-13 02:30:33'),(28,184,7,'2011-09-13 02:30:33'),(28,185,8,'2011-09-13 02:30:34'),(28,186,2,'2011-09-13 02:30:34'),(28,187,3,'2011-09-13 02:30:34'),(28,188,3,'2011-09-13 02:30:34'),(28,189,3,'2011-09-13 02:30:34'),(28,190,3,'2011-09-13 02:30:34'),(29,191,1,'2011-09-13 02:30:40'),(29,192,1,'2011-09-13 02:30:40'),(29,193,7,'2011-09-13 02:30:40'),(29,194,8,'2011-09-13 02:30:40'),(29,195,2,'2011-09-13 02:30:40'),(29,196,3,'2011-09-13 02:30:40'),(29,197,3,'2011-09-13 02:30:40'),(29,198,3,'2011-09-13 02:30:40'),(29,199,3,'2011-09-13 02:30:40'),(30,200,1,'2011-09-13 02:30:49'),(30,201,1,'2011-09-13 02:30:49'),(30,202,7,'2011-09-13 02:30:49'),(30,203,8,'2011-09-13 02:30:49'),(30,204,2,'2011-09-13 02:30:49'),(30,205,3,'2011-09-13 02:30:49'),(30,206,3,'2011-09-13 02:30:50'),(30,207,3,'2011-09-13 02:30:50'),(30,208,3,'2011-09-13 02:30:50'),(31,209,1,'2011-09-13 02:30:56'),(31,210,1,'2011-09-13 02:30:56'),(31,211,7,'2011-09-13 02:30:56'),(31,212,8,'2011-09-13 02:30:56'),(31,213,2,'2011-09-13 02:30:57'),(31,214,3,'2011-09-13 02:30:57'),(31,215,3,'2011-09-13 02:30:57'),(31,216,3,'2011-09-13 02:30:57'),(31,217,3,'2011-09-13 02:30:57'),(32,218,1,'2011-09-13 02:31:02'),(32,219,1,'2011-09-13 02:31:02'),(32,220,7,'2011-09-13 02:31:02'),(32,221,8,'2011-09-13 02:31:02'),(32,222,2,'2011-09-13 02:31:02'),(32,223,3,'2011-09-13 02:31:02'),(32,224,3,'2011-09-13 02:31:02'),(32,225,3,'2011-09-13 02:31:02'),(32,226,3,'2011-09-13 02:31:02'),(33,227,1,'2011-09-13 02:31:08'),(33,228,1,'2011-09-13 02:31:08'),(33,229,7,'2011-09-13 02:31:08'),(33,230,8,'2011-09-13 02:31:08'),(33,231,2,'2011-09-13 02:31:08'),(33,232,3,'2011-09-13 02:31:08'),(33,233,3,'2011-09-13 02:31:08'),(33,234,3,'2011-09-13 02:31:09'),(33,235,3,'2011-09-13 02:31:09'),(281,240,2,'2011-09-13 02:32:05'),(281,241,3,'2011-09-13 02:32:05'),(699,262,2,'2011-09-13 02:32:32'),(699,263,3,'2011-09-13 02:32:32'),(3352,238,2,'2011-09-13 02:32:02'),(3352,239,3,'2011-09-13 02:32:02'),(3594,250,2,'2011-09-13 02:32:16'),(3594,251,3,'2011-09-13 02:32:16'),(5559,236,2,'2011-09-13 02:31:59'),(5559,237,3,'2011-09-13 02:31:59'),(6747,258,2,'2011-09-13 02:32:26'),(6747,259,3,'2011-09-13 02:32:27'),(7160,246,2,'2011-09-13 02:32:12'),(7160,247,3,'2011-09-13 02:32:12'),(7676,254,2,'2011-09-13 02:32:21'),(7676,255,3,'2011-09-13 02:32:21'),(14031,260,2,'2011-09-13 02:32:29'),(14031,261,3,'2011-09-13 02:32:29'),(14460,256,2,'2011-09-13 02:32:24'),(14460,257,3,'2011-09-13 02:32:24'),(18878,244,2,'2011-09-13 02:32:09'),(18878,245,3,'2011-09-13 02:32:09'),(49148,264,2,'2011-09-13 02:32:35'),(49148,265,3,'2011-09-13 02:32:35'),(89513,252,2,'2011-09-13 02:32:18'),(89513,253,3,'2011-09-13 02:32:19'),(328607,284,1,'2011-09-13 02:32:52'),(328607,285,1,'2011-09-13 02:32:52'),(328607,286,1,'2011-09-13 02:32:52'),(328607,287,1,'2011-09-13 02:32:53'),(328607,288,2,'2011-09-13 02:32:53'),(328607,289,3,'2011-09-13 02:32:53'),(491753,296,1,'2011-09-13 02:33:02'),(491753,297,1,'2011-09-13 02:33:02'),(491753,298,1,'2011-09-13 02:33:02'),(491753,299,1,'2011-09-13 02:33:02'),(491753,300,2,'2011-09-13 02:33:02'),(491753,301,3,'2011-09-13 02:33:02'),(910093,101,1,'2011-09-13 02:29:09'),(910093,102,1,'2011-09-13 02:29:09'),(910093,103,7,'2011-09-13 02:29:09'),(910093,104,8,'2011-09-13 02:29:09'),(910093,105,2,'2011-09-13 02:29:09'),(910093,106,3,'2011-09-13 02:29:09'),(910093,107,3,'2011-09-13 02:29:09'),(910093,108,3,'2011-09-13 02:29:10'),(910093,109,3,'2011-09-13 02:29:10'),(921737,280,1,'2011-09-13 02:32:48'),(921737,281,1,'2011-09-13 02:32:48'),(921737,282,2,'2011-09-13 02:32:48'),(921737,283,3,'2011-09-13 02:32:48'),(1061748,290,1,'2011-09-13 02:32:57'),(1061748,291,1,'2011-09-13 02:32:57'),(1061748,292,1,'2011-09-13 02:32:57'),(1061748,293,1,'2011-09-13 02:32:57'),(1061748,294,2,'2011-09-13 02:32:58'),(1061748,295,3,'2011-09-13 02:32:58'),(2861424,242,2,'2011-09-13 02:32:07'),(2861424,243,3,'2011-09-13 02:32:07'),(2866150,266,1,'2011-09-13 02:32:41'),(2866150,267,1,'2011-09-13 02:32:41'),(2866150,268,1,'2011-09-13 02:32:41'),(2866150,269,1,'2011-09-13 02:32:41'),(2866150,270,2,'2011-09-13 02:32:41'),(2866150,271,3,'2011-09-13 02:32:41'),(2866150,272,3,'2011-09-13 02:32:41'),(2866150,273,3,'2011-09-13 02:32:41'),(2866150,274,3,'2011-09-13 02:32:41'),(2866150,275,3,'2011-09-13 02:32:41'),(17924149,276,1,'2011-09-13 02:32:45'),(17924149,277,1,'2011-09-13 02:32:45'),(17924149,278,2,'2011-09-13 02:32:45'),(17924149,279,3,'2011-09-13 02:32:45'),(17954507,248,2,'2011-09-13 02:32:14'),(17954507,249,3,'2011-09-13 02:32:14');
/*!40000 ALTER TABLE `feed_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item_types`
--

DROP TABLE IF EXISTS `feed_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item_types`
--

LOCK TABLES `feed_item_types` WRITE;
/*!40000 ALTER TABLE `feed_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_items`
--

DROP TABLE IF EXISTS `feed_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `feed_type` varchar(255) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `feed_item_type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_items`
--

LOCK TABLES `feed_items` WRITE;
/*!40000 ALTER TABLE `feed_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_terms`
--

DROP TABLE IF EXISTS `glossary_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) DEFAULT NULL,
  `definition` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_terms`
--

LOCK TABLES `glossary_terms` WRITE;
/*!40000 ALTER TABLE `glossary_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_page_stats`
--

DROP TABLE IF EXISTS `google_analytics_page_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_page_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `page_views` int(10) unsigned NOT NULL,
  `unique_page_views` int(10) unsigned NOT NULL,
  `time_on_page` time NOT NULL,
  KEY `taxon_concept_id` (`taxon_concept_id`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `page_views` (`page_views`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_page_stats`
--

LOCK TABLES `google_analytics_page_stats` WRITE;
/*!40000 ALTER TABLE `google_analytics_page_stats` DISABLE KEYS */;
INSERT INTO `google_analytics_page_stats` VALUES (16,2012,9,548,90,'00:25:31'),(16,2012,8,548,90,'00:25:31'),(16,2012,7,548,90,'00:25:31'),(16,2012,6,548,90,'00:25:31'),(16,2012,5,548,90,'00:25:31'),(16,2012,4,548,90,'00:25:31'),(16,2012,3,548,90,'00:25:31'),(16,2012,2,548,90,'00:25:31'),(16,2012,1,548,90,'00:25:31'),(16,2011,12,548,90,'00:25:31'),(16,2011,11,548,90,'00:25:31'),(16,2011,10,548,90,'00:25:31'),(16,2011,9,548,90,'00:25:31'),(16,2011,8,548,90,'00:25:31'),(16,2011,7,548,90,'00:25:31'),(16,2011,6,548,90,'00:25:31'),(16,2011,5,548,90,'00:25:31'),(16,2011,4,548,90,'00:25:31'),(16,2011,3,548,90,'00:25:31'),(16,2011,2,548,90,'00:25:31'),(16,2011,1,548,90,'00:25:31'),(16,2010,12,548,90,'00:25:31'),(16,2010,11,548,90,'00:25:31'),(16,2010,10,548,90,'00:25:31'),(16,2010,9,548,90,'00:25:31');
/*!40000 ALTER TABLE `google_analytics_page_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_summaries`
--

DROP TABLE IF EXISTS `google_analytics_partner_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_summaries` (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `unique_page_views` int(11) DEFAULT NULL,
  `page_views` int(11) DEFAULT NULL,
  `time_on_page` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_summaries`
--

LOCK TABLES `google_analytics_partner_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_summaries` VALUES (2010,9,2,812,28,429,3543,763.00),(2010,10,2,812,28,429,3543,763.00),(2010,11,2,812,28,429,3543,763.00),(2010,12,2,812,28,429,3543,763.00),(2011,1,2,812,28,429,3543,763.00),(2011,2,2,812,28,429,3543,763.00),(2011,3,2,812,28,429,3543,763.00),(2011,4,2,812,28,429,3543,763.00),(2011,5,2,812,28,429,3543,763.00),(2011,6,2,812,28,429,3543,763.00),(2011,7,2,812,28,429,3543,763.00),(2011,8,2,812,28,429,3543,763.00),(2011,9,2,812,28,429,3543,763.00),(2011,10,2,812,28,429,3543,763.00),(2011,11,2,812,28,429,3543,763.00),(2011,12,2,812,28,429,3543,763.00),(2012,1,2,812,28,429,3543,763.00),(2012,2,2,812,28,429,3543,763.00),(2012,3,2,812,28,429,3543,763.00),(2012,4,2,812,28,429,3543,763.00),(2012,5,2,812,28,429,3543,763.00),(2012,6,2,812,28,429,3543,763.00),(2012,7,2,812,28,429,3543,763.00),(2012,8,2,812,28,429,3543,763.00),(2012,9,2,812,28,429,3543,763.00);
/*!40000 ALTER TABLE `google_analytics_partner_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_taxa`
--

DROP TABLE IF EXISTS `google_analytics_partner_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_taxa` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  KEY `taxon_concept_id` (`taxon_concept_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_taxa`
--

LOCK TABLES `google_analytics_partner_taxa` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_taxa` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_taxa` VALUES (16,2,2012,9),(16,2,2012,8),(16,2,2012,7),(16,2,2012,6),(16,2,2012,5),(16,2,2012,4),(16,2,2012,3),(16,2,2012,2),(16,2,2012,1),(16,2,2011,12),(16,2,2011,11),(16,2,2011,10),(16,2,2011,9),(16,2,2011,8),(16,2,2011,7),(16,2,2011,6),(16,2,2011,5),(16,2,2011,4),(16,2,2011,3),(16,2,2011,2),(16,2,2011,1),(16,2,2010,12),(16,2,2010,11),(16,2,2010,10),(16,2,2010,9);
/*!40000 ALTER TABLE `google_analytics_partner_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_summaries`
--

DROP TABLE IF EXISTS `google_analytics_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_summaries` (
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `visitors` int(11) DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `unique_pageviews` int(11) DEFAULT NULL,
  `ave_pages_per_visit` float DEFAULT NULL,
  `ave_time_on_site` time DEFAULT NULL,
  `ave_time_on_page` time DEFAULT NULL,
  `per_new_visits` float DEFAULT NULL,
  `bounce_rate` float DEFAULT NULL,
  `per_exit` float DEFAULT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `time_on_pages` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_summaries`
--

LOCK TABLES `google_analytics_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_summaries` VALUES (2010,9,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2010,10,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2010,11,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2010,12,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,1,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,2,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,3,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,4,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,5,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,6,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,7,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,8,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,9,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,10,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,11,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2011,12,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,1,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,2,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,3,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,4,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,5,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,6,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,7,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,8,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254),(2012,9,478,3,8079,9,5.1,'00:33:04','00:03:33',1.1,9.8,5,180,42,254);
/*!40000 ALTER TABLE `google_analytics_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events`
--

DROP TABLE IF EXISTS `harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(10) unsigned NOT NULL,
  `began_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events`
--

LOCK TABLES `harvest_events` WRITE;
/*!40000 ALTER TABLE `harvest_events` DISABLE KEYS */;
INSERT INTO `harvest_events` VALUES (1,2,'2011-09-12 23:27:19','2011-09-13 00:27:19','2011-09-13 01:27:19'),(2,3,'2011-09-12 23:27:43','2011-09-13 00:27:43','2011-09-13 01:27:43'),(3,3,'2011-09-12 23:28:52','2011-09-13 00:28:52','2011-09-13 01:28:52'),(4,3,'2011-09-12 23:28:52','2011-09-13 00:28:52','2011-09-13 01:28:52'),(5,4,'2011-09-12 23:28:54','2011-09-13 00:28:54','2011-09-13 01:28:54'),(6,5,'2011-09-12 23:29:02','2011-09-13 00:29:02','2011-09-13 01:29:02');
/*!40000 ALTER TABLE `harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events_hierarchy_entries`
--

DROP TABLE IF EXISTS `harvest_events_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events_hierarchy_entries` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`hierarchy_entry_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events_hierarchy_entries`
--

LOCK TABLES `harvest_events_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `harvest_events_hierarchy_entries` VALUES (2,2,'',4),(2,3,'',5),(2,4,'',6),(2,5,'',7),(2,6,'',8),(2,7,'',9),(2,8,'',10),(2,9,'',11),(2,10,'',12),(2,11,'',13),(2,12,'',14),(2,16,'',16),(2,23,'',17),(2,25,'',18),(2,26,'',19),(2,27,'',20),(2,28,'',21),(2,29,'',22),(2,30,'',23),(2,31,'',24),(2,32,'',25),(2,33,'',26),(2,34,'',27),(2,35,'',28),(2,36,'',29),(2,37,'',30),(5,13,'',15),(5,38,'',31),(5,39,'',32),(5,40,'',33),(5,41,'',34),(5,42,'',35),(5,43,'',36),(5,44,'',37),(5,45,'',38),(5,46,'',39),(5,47,'',40),(5,48,'',41),(5,49,'',42),(5,50,'',43),(5,51,'',44),(5,52,'',45),(5,53,'',46),(5,54,'',47),(5,55,'',48),(5,56,'',49),(5,57,'',50),(5,58,'',51);
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_process_logs`
--

DROP TABLE IF EXISTS `harvest_process_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_process_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(255) DEFAULT NULL,
  `began_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_process_logs`
--

LOCK TABLES `harvest_process_logs` WRITE;
/*!40000 ALTER TABLE `harvest_process_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_process_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies`
--

DROP TABLE IF EXISTS `hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL COMMENT 'recommended; our internal id of the source agent responsible for the entire hierarchy',
  `label` varchar(255) NOT NULL COMMENT 'recommended; succinct title for the hierarchy (e.g. Catalogue of Life: Annual Checklist 2009)',
  `descriptive_label` varchar(255) DEFAULT NULL,
  `description` text NOT NULL COMMENT 'not required; a more verbose description describing the hierarchy. Could be a paragraph describing what it is and what it contains',
  `indexed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'required; the date which we created and indexed the hierarchy',
  `hierarchy_group_id` int(10) unsigned NOT NULL COMMENT 'not required; there is no hierarchy_groups table, but this field was meant to identify hierarchies of the same source so they can be verioned and older versions retained but not presented',
  `hierarchy_group_version` tinyint(3) unsigned NOT NULL COMMENT 'not required; this is mean to uniquely identify hierarchies within the same group. This version number has been an internal incrementing value',
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; a link back to a web page describing this hierarchy',
  `outlink_uri` varchar(255) DEFAULT NULL,
  `ping_host_url` varchar(255) DEFAULT NULL,
  `browsable` int(11) DEFAULT NULL,
  `complete` tinyint(3) unsigned DEFAULT '1',
  `request_publish` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='A container for hierarchy_entries. These are usually taxonom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies`
--

LOCK TABLES `hierarchies` WRITE;
/*!40000 ALTER TABLE `hierarchies` DISABLE KEYS */;
INSERT INTO `hierarchies` VALUES (1,2,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2011-09-12 23:27:10',0,0,'',NULL,NULL,0,1,0),(2,5,'LigerCat',NULL,'LigerCat Biomedical Terms Tag Cloud','2011-09-12 23:27:12',0,0,'http://ligercat.ubio.org','http://ligercat.ubio.org/eol/%%ID%%.cloud',NULL,0,1,0),(3,6,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2011-09-12 23:27:13',0,0,'',NULL,NULL,0,1,0),(4,3,'Species 2000 & ITIS Catalogue of Life: Annual Checklist 2010',NULL,'','2011-09-12 23:27:15',0,0,'',NULL,NULL,1,1,0),(5,3,'Species 2000 & ITIS Catalogue of Life: Annual Checklist 2007',NULL,'','2011-09-12 23:27:15',0,0,'',NULL,NULL,0,1,0),(6,7,'Encyclopedia of Life Contributors',NULL,'','2011-09-12 23:27:15',0,0,'',NULL,NULL,0,1,0),(7,4,'NCBI Taxonomy',NULL,'','2011-09-12 23:27:15',101,2,'',NULL,NULL,1,1,0),(8,8,'GBIF Nub Taxonomy',NULL,'','2011-09-12 23:27:15',0,0,'',NULL,NULL,0,1,0),(9,9,'IUCN',NULL,'','2011-09-12 23:27:19',0,0,'',NULL,NULL,0,1,0),(10,10,'GBIF Nub Taxonomy',NULL,'','2011-09-12 23:27:44',0,0,'',NULL,NULL,0,1,0),(11,40,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2011-09-12 23:28:54',0,0,'',NULL,NULL,0,1,0),(12,45,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2011-09-12 23:29:02',0,0,'',NULL,NULL,0,1,0),(13,44,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2011-09-12 23:29:02',0,0,'',NULL,NULL,0,1,0),(14,49,'AntWeb',NULL,'Currently AntWeb contains information on the ant faunas of several areas in the Nearctic and Malagasy biogeographic regions, and global coverage of all ant genera.','2011-09-12 23:29:11',0,0,'http://www.antweb.org/','http://www.antweb.org/specimen.do?name=%%ID%%',NULL,0,1,0),(15,50,'National Center for Biotechnology Information',NULL,'Established in 1988 as a national resource for molecular biology information, NCBI creates public databases, conducts research in computational biology, develops software tools for analyzing genome data, and disseminates biomedical information - all for the better understanding of molecular processes affecting human health and disease','2011-09-12 23:29:11',0,0,'http://www.ncbi.nlm.nih.gov/','http://www.ncbi.nlm.nih.gov/sites/entrez?Db=genomeprj&cmd=ShowDetailView&TermToSearch=%%ID%%',NULL,0,1,0);
/*!40000 ALTER TABLE `hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies_content`
--

DROP TABLE IF EXISTS `hierarchies_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies_content` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summarizes the data types available to a given hierarchy ent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies_content`
--

LOCK TABLES `hierarchies_content` WRITE;
/*!40000 ALTER TABLE `hierarchies_content` DISABLE KEYS */;
INSERT INTO `hierarchies_content` VALUES (2,1,0,1,0,0,0,1,1,0,4,0),(3,1,0,1,0,0,0,1,1,0,4,0),(4,1,0,1,0,0,0,1,1,0,4,0),(5,1,0,1,0,0,0,1,1,0,4,0),(6,1,0,1,0,0,0,1,1,0,4,0),(7,1,0,1,0,0,0,1,1,0,4,0),(8,1,0,1,0,0,0,1,1,0,4,0),(9,1,0,1,0,0,0,1,1,0,4,0),(10,1,0,1,0,0,0,1,1,0,4,0),(11,1,0,1,0,0,0,1,1,0,4,0),(12,1,0,1,0,0,0,1,1,0,4,0),(13,1,0,1,0,0,0,1,1,0,4,0),(14,1,0,1,0,0,0,1,1,0,4,0),(15,1,0,1,0,0,0,1,1,0,4,0),(16,1,0,1,0,0,0,1,1,0,4,0),(23,1,0,1,0,0,0,1,1,0,4,0),(24,1,0,1,0,0,0,1,1,0,4,0),(25,1,0,1,0,0,0,1,1,0,4,0),(26,1,0,1,0,0,0,1,1,0,4,0),(27,1,0,1,0,0,0,1,1,0,4,0),(28,1,0,1,0,0,0,1,1,0,4,0),(29,1,0,1,0,0,0,1,1,0,4,0),(30,1,0,1,0,0,0,1,1,0,4,0),(31,1,0,1,0,0,0,1,1,0,4,0),(32,1,0,1,0,0,0,1,1,0,4,0),(33,1,0,1,0,0,0,1,1,0,4,0),(34,1,0,1,0,0,0,1,1,0,4,0),(35,1,0,1,0,0,0,1,1,0,4,0),(36,1,0,1,0,0,0,1,1,0,4,0),(37,1,0,1,0,0,0,1,1,0,4,0),(38,1,0,1,0,0,0,1,1,0,4,0),(39,1,0,1,0,0,0,1,1,0,4,0),(40,1,0,1,0,0,0,1,1,0,4,0),(41,1,0,1,0,0,0,1,1,0,4,0),(42,1,0,1,0,0,0,1,1,0,4,0),(43,1,0,1,0,0,0,1,1,0,4,0),(44,1,0,1,0,0,0,1,1,0,4,0),(45,1,0,1,0,0,0,1,1,0,4,0),(46,1,0,1,0,0,0,1,1,0,4,0),(47,1,0,1,0,0,0,1,1,0,4,0),(48,1,0,1,0,0,0,1,1,0,4,0),(49,1,0,1,0,0,0,1,1,0,4,0),(50,1,0,1,0,0,0,1,1,0,4,0),(51,1,0,1,0,0,0,1,1,0,4,0),(52,1,0,1,0,0,0,1,1,0,4,0),(53,1,0,1,0,0,0,1,1,0,4,0),(54,1,0,1,0,0,0,1,1,0,4,0),(55,1,0,1,0,0,0,1,1,0,4,0),(56,1,0,1,0,0,0,1,1,0,4,0),(57,1,0,1,0,0,0,1,1,0,4,0),(58,1,0,1,0,0,0,1,1,0,4,0);
/*!40000 ALTER TABLE `hierarchies_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries`
--

DROP TABLE IF EXISTS `hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `identifier` varchar(255) NOT NULL COMMENT 'recommended; a unique id from the provider for this node',
  `source_url` text,
  `name_id` int(10) unsigned NOT NULL COMMENT 'recommended; the name string for this node. It is possible that nodes have no names, but most of the time they will',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'recommended; the parent_id references the hierarchy_entry_id of the parent of this node. Used to create trees. Root nodes will have a partent_id of 0',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'required; the id of the container hierarchy',
  `rank_id` smallint(5) unsigned NOT NULL COMMENT 'recommended; when available, this is the id of the rank string which defines the taxonomic rank of the node',
  `ancestry` varchar(500) CHARACTER SET ascii NOT NULL COMMENT 'not required; perhaps now obsolete. Used to store the materialized path of this node''s ancestors',
  `lft` int(10) unsigned NOT NULL COMMENT 'required; the left value of this node within the hierarchy''s nested set',
  `rgt` int(10) unsigned NOT NULL COMMENT 'required; the right value of this node within the hierarchy''s nested set',
  `depth` tinyint(3) unsigned NOT NULL COMMENT 'recommended; the depth of this node in within the hierarchy''s tree',
  `taxon_concept_id` int(10) unsigned NOT NULL COMMENT 'required; the id of the taxon_concept described by this hierarchy_entry',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `name_id` (`name_id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`),
  KEY `taxon_concept_id` (`taxon_concept_id`),
  KEY `vetted_id` (`vetted_id`),
  KEY `visibility_id` (`visibility_id`),
  KEY `published` (`published`),
  KEY `identifier` (`identifier`),
  KEY `hierarchy_parent` (`hierarchy_id`,`parent_id`),
  KEY `concept_published_visible` (`taxon_concept_id`,`published`,`visibility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries`
--

LOCK TABLES `hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries` DISABLE KEYS */;
INSERT INTO `hierarchy_entries` VALUES (1,'3a117abf96e7fe8793ef87b14d166d5g','','',1,0,4,12,'',1,20,2,1,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(2,'a509ebdb2fc8083f3a33ea17985bad43','','',2,0,4,1,'',21,42,0,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(3,'a509ebdb2fc8083f3a33ea17985bad48','','',4,2,4,0,'',22,41,2,8,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(4,'a509ebdb2fc8083f3a33ea17985bad53','','',6,3,4,0,'',23,40,3,9,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(5,'a509ebdb2fc8083f3a33ea17985bad58','','',8,4,4,0,'',24,39,4,10,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(6,'a509ebdb2fc8083f3a33ea17985bad63','','',10,5,4,0,'',25,38,5,11,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(7,'a509ebdb2fc8083f3a33ea17985bad68','','',12,6,4,0,'',34,35,6,12,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(8,'3a117abf96e7fe8793ef87b14d166d6o','','',14,6,4,0,'',28,29,6,13,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(9,'3a117abf96e7fe8793ef87b14d166d6p','','',21,6,4,0,'',32,33,6,14,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(10,'3a117abf96e7fe8793ef87b14d166d6q','','',22,6,4,0,'',30,31,6,15,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(11,'3a117abf96e7fe8793ef87b14d166d6r','','',23,6,4,0,'',26,27,6,16,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(12,'a509ebdb2fc8083f3a33ea17985bad88','','',25,6,4,0,'',36,37,6,17,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(13,'3a117abf96e7fe8793ef87b14d166d7e','','',27,0,4,0,'',43,44,6,18,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(14,'a509ebdb2fc8083f3a33ea17985bad97','','',28,0,13,0,'',1,2,0,18,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:27:03'),(15,'a509ebdb2fc8083f3a33ea17985bad98','13810203','',28,0,10,0,'',1,2,0,18,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:27:03'),(16,'3a117abf96e7fe8793ef87b14d166d7k','','',29,0,4,0,'',45,46,6,910093,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(17,'3a117abf96e7fe8793ef87b14d166d7p','910093','',29,0,3,13,'',1,2,2,910093,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:27:03'),(18,'a509ebdb2fc8083f3a33ea17985bae04','casent0129891','',2,0,14,14,'',1,2,2,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:27:03'),(19,'3a117abf96e7fe8793ef87b14d166d7q','casent0496198','',2,0,14,15,'',3,4,2,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(20,'a509ebdb2fc8083f3a33ea17985bae05','casent0179524','',2,0,14,16,'',5,6,2,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(21,'3a117abf96e7fe8793ef87b14d166d7r','13646','',2,0,15,17,'',1,2,2,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:27:03'),(22,'a509ebdb2fc8083f3a33ea17985bae06','9551','',2,0,15,18,'',3,4,2,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(23,'3a117abf96e7fe8793ef87b14d166d7s','','',33,0,7,19,'',1,20,0,20,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(24,'3a117abf96e7fe8793ef87b14d166d7x','33154','',35,23,7,1,'',2,19,0,7,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(25,'a509ebdb2fc8083f3a33ea17985bae12','','',37,24,7,0,'',3,4,1,21,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:16'),(26,'a509ebdb2fc8083f3a33ea17985bae17','','',39,24,7,0,'',5,18,1,22,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(27,'a509ebdb2fc8083f3a33ea17985bae22','','',41,26,7,0,'',6,7,2,23,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(28,'a509ebdb2fc8083f3a33ea17985bae27','','',43,26,7,0,'',8,17,2,24,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(29,'a509ebdb2fc8083f3a33ea17985bae32','','',45,28,7,0,'',9,10,3,25,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(30,'a509ebdb2fc8083f3a33ea17985bae37','','',47,28,7,0,'',11,16,3,26,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(31,'a509ebdb2fc8083f3a33ea17985bae42','','',49,30,7,0,'',12,13,4,27,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(32,'a509ebdb2fc8083f3a33ea17985bae47','','',51,30,7,0,'',14,15,4,28,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(33,'a509ebdb2fc8083f3a33ea17985bae52','','',53,0,7,19,'',21,30,0,29,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(34,'a509ebdb2fc8083f3a33ea17985bae57','','',65,33,7,0,'',22,29,1,30,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(35,'a509ebdb2fc8083f3a33ea17985bae62','','',67,34,7,0,'',23,28,2,31,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(36,'a509ebdb2fc8083f3a33ea17985bae67','','',69,35,7,0,'',24,27,3,32,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:18'),(37,'a509ebdb2fc8083f3a33ea17985bae72','','',71,36,7,0,'',25,26,4,33,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:31:17'),(38,'a509ebdb2fc8083f3a33ea17985bae77','','',73,0,4,1,'',47,54,1,5559,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(39,'3a117abf96e7fe8793ef87b14d166e0m','','',75,0,4,1,'',55,62,1,3352,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(40,'a509ebdb2fc8083f3a33ea17985bae80','','',76,0,4,1,'',63,70,1,281,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(41,'3a117abf96e7fe8793ef87b14d166e0p','','',78,38,4,5,'',48,53,5,2861424,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(42,'a509ebdb2fc8083f3a33ea17985bae83','','',79,41,4,6,'',49,52,4,18878,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(43,'3a117abf96e7fe8793ef87b14d166e0s','','',80,1,4,5,'',14,19,5,7160,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(44,'a509ebdb2fc8083f3a33ea17985bae86','','',81,43,4,6,'',15,18,5,17954507,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(45,'3a117abf96e7fe8793ef87b14d166e0v','','',82,39,4,5,'',56,61,4,3594,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(46,'a509ebdb2fc8083f3a33ea17985bae89','','',83,45,4,6,'',57,60,5,89513,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(47,'3a117abf96e7fe8793ef87b14d166e0y','','',84,1,4,5,'',2,7,4,7676,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(48,'a509ebdb2fc8083f3a33ea17985bae92','','',86,47,4,6,'',3,6,5,14460,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(49,'3a117abf96e7fe8793ef87b14d166e1b','','',88,40,4,5,'',64,69,4,6747,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(50,'a509ebdb2fc8083f3a33ea17985bae95','','',90,49,4,6,'',65,68,5,14031,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(51,'3a117abf96e7fe8793ef87b14d166e1e','','',92,1,4,5,'',8,13,4,699,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(52,'a509ebdb2fc8083f3a33ea17985bae98','','',93,51,4,6,'',9,12,5,49148,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(53,'3a117abf96e7fe8793ef87b14d166e1h','','',94,42,4,7,'',50,51,6,2866150,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(54,'a509ebdb2fc8083f3a33ea17985baf05','','',96,44,4,7,'',16,17,6,17924149,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(55,'3a117abf96e7fe8793ef87b14d166e1p','','',98,46,4,7,'',58,59,6,921737,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:16'),(56,'a509ebdb2fc8083f3a33ea17985baf10','','',99,48,4,7,'',4,5,6,328607,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15'),(57,'3a117abf96e7fe8793ef87b14d166e1v','','',100,50,4,7,'',66,67,6,1061748,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:17'),(58,'a509ebdb2fc8083f3a33ea17985baf17','','',102,52,4,7,'',10,11,6,491753,4,1,2,'2011-09-13 04:27:03','2011-09-13 04:33:15');
/*!40000 ALTER TABLE `hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_flattened`
--

DROP TABLE IF EXISTS `hierarchy_entries_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_flattened` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_flattened`
--

LOCK TABLES `hierarchy_entries_flattened` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_flattened` DISABLE KEYS */;
INSERT INTO `hierarchy_entries_flattened` VALUES (3,2),(4,2),(4,3),(5,2),(5,3),(5,4),(6,2),(6,3),(6,4),(6,5),(7,2),(7,3),(7,4),(7,5),(7,6),(8,2),(8,3),(8,4),(8,5),(8,6),(9,2),(9,3),(9,4),(9,5),(9,6),(10,2),(10,3),(10,4),(10,5),(10,6),(11,2),(11,3),(11,4),(11,5),(11,6),(12,2),(12,3),(12,4),(12,5),(12,6),(24,23),(25,23),(25,24),(26,23),(26,24),(27,23),(27,24),(27,26),(28,23),(28,24),(28,26),(29,23),(29,24),(29,26),(29,28),(30,23),(30,24),(30,26),(30,28),(31,23),(31,24),(31,26),(31,28),(31,30),(32,23),(32,24),(32,26),(32,28),(32,30),(34,33),(35,33),(35,34),(36,33),(36,34),(36,35),(37,33),(37,34),(37,35),(37,36),(41,38),(42,38),(42,41),(43,1),(44,1),(44,43),(45,39),(46,39),(46,45),(47,1),(48,1),(48,47),(49,40),(50,40),(50,49),(51,1),(52,1),(52,51),(53,38),(53,41),(53,42),(54,1),(54,43),(54,44),(55,39),(55,45),(55,46),(56,1),(56,47),(56,48),(57,40),(57,49),(57,50),(58,1),(58,51),(58,52);
/*!40000 ALTER TABLE `hierarchy_entries_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_refs`
--

DROP TABLE IF EXISTS `hierarchy_entries_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_refs` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_refs`
--

LOCK TABLES `hierarchy_entries_refs` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entries_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `score` double NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_relationships`
--

LOCK TABLES `hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_stats`
--

DROP TABLE IF EXISTS `hierarchy_entry_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_stats` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  `all_text_trusted` mediumint(8) unsigned NOT NULL,
  `all_text_untrusted` mediumint(8) unsigned NOT NULL,
  `have_text` mediumint(8) unsigned NOT NULL,
  `all_image_trusted` mediumint(8) unsigned NOT NULL,
  `all_image_untrusted` mediumint(8) unsigned NOT NULL,
  `have_images` mediumint(8) unsigned NOT NULL,
  `all_bhl` int(10) unsigned NOT NULL,
  `total_children` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_stats`
--

LOCK TABLES `hierarchy_entry_stats` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_stats` DISABLE KEYS */;
INSERT INTO `hierarchy_entry_stats` VALUES (2,177,53,774,940,542,705,337,230,381,811,368,551,51),(3,595,381,48,889,502,445,779,920,872,983,22,939,210),(4,890,613,988,322,923,182,361,717,147,273,91,239,2),(5,208,609,621,833,937,485,956,543,809,717,330,796,951),(6,195,900,534,497,783,189,320,274,16,57,192,759,1),(7,851,882,474,659,367,607,928,262,760,347,266,212,766),(8,123,476,850,445,553,468,556,36,925,99,710,344,152),(9,122,924,460,454,846,46,336,9,109,962,865,428,707),(10,675,902,475,609,298,721,315,459,641,156,233,332,654),(11,998,862,502,278,587,812,579,429,322,28,597,446,65),(12,860,581,78,50,711,512,268,832,899,255,638,748,818),(13,669,482,764,924,692,581,723,92,7,599,195,919,989),(14,341,766,351,469,840,703,506,969,66,682,183,493,230),(15,441,328,634,389,620,411,831,68,728,127,570,236,738),(16,338,68,997,808,59,660,650,498,464,968,724,196,2),(23,812,206,578,267,531,291,612,57,784,478,190,675,737),(24,33,484,26,823,975,364,131,319,441,47,471,818,975),(25,444,400,88,528,202,708,439,420,185,308,165,728,215),(26,505,154,456,424,401,87,315,987,850,999,582,350,966),(27,280,785,602,249,738,324,23,891,882,107,656,748,555),(28,401,831,347,182,633,747,517,784,933,532,765,639,32),(29,893,485,42,169,944,416,306,123,158,540,333,701,590),(30,19,873,784,656,521,849,562,265,962,382,134,442,229),(31,90,909,457,15,188,918,647,842,92,303,779,280,939),(32,130,533,665,220,29,924,739,242,8,44,873,784,178),(33,41,781,417,199,471,380,113,460,773,831,146,918,871),(34,808,947,307,801,518,868,864,432,296,951,796,961,393),(35,902,820,208,260,548,73,297,768,894,519,867,670,345),(36,564,943,234,974,526,591,113,590,220,893,181,89,297),(37,299,76,473,460,152,318,371,266,972,883,319,354,663),(38,461,825,513,136,723,295,643,917,528,36,247,859,445),(39,159,255,27,210,135,940,924,818,366,632,18,416,809),(40,175,965,680,350,343,569,710,695,636,26,474,855,943),(41,341,446,736,979,581,446,323,503,42,470,261,584,161),(42,469,118,90,518,619,312,630,701,427,419,557,739,600),(43,366,523,417,165,912,723,91,252,831,805,253,709,836),(44,235,943,79,791,50,228,333,934,535,601,734,775,927),(45,113,925,202,399,4,643,853,901,859,803,473,988,240),(46,847,237,935,25,5,24,676,449,457,576,536,557,411),(47,356,896,573,107,32,45,492,137,952,299,997,46,495),(48,295,106,381,304,363,887,806,647,762,600,58,164,296),(49,999,591,556,718,422,105,545,459,311,12,778,365,339),(50,333,690,127,7,220,276,361,801,68,85,547,908,897),(51,250,144,332,830,820,281,122,674,422,165,642,582,959),(52,293,214,118,608,186,14,729,708,401,561,374,229,650),(53,201,815,985,118,404,51,140,814,206,809,757,934,157),(54,834,304,479,72,952,226,558,166,603,246,356,560,512),(55,549,995,461,479,235,356,686,856,971,477,842,627,433),(56,656,811,146,250,254,120,778,624,234,474,542,530,400),(57,526,849,879,776,376,155,403,597,497,795,564,258,772),(58,334,969,484,692,571,584,78,252,866,186,881,215,738);
/*!40000 ALTER TABLE `hierarchy_entry_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_items`
--

DROP TABLE IF EXISTS `info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_items` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_items`
--

LOCK TABLES `info_items` WRITE;
/*!40000 ALTER TABLE `info_items` DISABLE KEYS */;
INSERT INTO `info_items` VALUES (1,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TaxonBiology',1),(2,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#GeneralDescription',4),(3,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Distribution',6),(4,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Habitat',6),(5,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Morphology',4),(6,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Conservation',4),(7,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Uses',4),(8,'http://www.eol.org/voc/table_of_contents#Education',22),(9,'http://www.eol.org/voc/table_of_contents#IdentificationResources',4),(10,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Associations',0),(11,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Behaviour',0),(12,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#ConservationStatus',0),(13,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cyclicity',0),(14,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cytology',0),(15,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#DiagnosticDescription',0),(16,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Diseases',0),(17,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Dispersal',0),(18,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Evolution',0),(19,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Genetics',0),(20,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Growth',0),(21,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Legislation',0),(22,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeCycle',0),(23,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeExpectancy',0),(24,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LookAlikes',0),(25,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Management',0),(26,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Migration',0),(27,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#MolecularBiology',0),(28,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Physiology',0),(29,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#PopulationBiology',0),(30,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Procedures',0),(31,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Reproduction',0),(32,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#RiskStatement',0),(33,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Size',0),(34,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Threats',0),(35,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Trends',0),(36,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TrophicStrategy',0);
/*!40000 ALTER TABLE `info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pages`
--

DROP TABLE IF EXISTS `item_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_item_id` int(10) unsigned NOT NULL,
  `year` varchar(20) NOT NULL,
  `volume` varchar(20) NOT NULL,
  `issue` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  `page_type` varchar(20) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The publication items have many pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pages`
--

LOCK TABLES `item_pages` WRITE;
/*!40000 ALTER TABLE `item_pages` DISABLE KEYS */;
INSERT INTO `item_pages` VALUES (1,1,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(2,2,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(3,3,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(4,4,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(5,5,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(6,6,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(7,7,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(8,8,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(9,9,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(10,10,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(11,11,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(12,12,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(13,13,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(14,14,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(15,15,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(16,16,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(17,17,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(18,18,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(19,19,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(20,20,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(21,21,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(22,22,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(23,23,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(24,24,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(25,25,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(26,26,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(27,27,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(28,28,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(29,29,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(30,30,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(31,31,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(32,32,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(33,33,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(34,34,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(35,35,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(36,36,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(37,37,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(38,38,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(39,39,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(40,40,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(41,41,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(42,42,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(43,43,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(44,44,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(45,45,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(46,46,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(47,47,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(48,48,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(49,49,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(50,50,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(51,51,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(52,52,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(53,53,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(54,54,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(55,55,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(56,56,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(57,57,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(58,58,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(59,59,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(60,60,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(61,61,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(62,62,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(63,63,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(64,64,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(65,65,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(66,66,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(67,67,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(68,68,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(69,69,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(70,70,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(71,71,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(72,72,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(73,73,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(74,74,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(75,75,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(76,76,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(77,77,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(78,78,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(79,79,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(80,80,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(81,81,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(82,82,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(83,83,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(84,84,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(85,85,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(86,86,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(87,87,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(88,88,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(89,89,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(90,90,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(91,91,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(92,92,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(93,93,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(94,94,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(95,95,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(96,96,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(97,97,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(98,98,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(99,99,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(100,100,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(101,101,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(102,102,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(103,103,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(104,104,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(105,105,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(106,106,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(107,107,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(108,108,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(109,109,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(110,110,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(111,111,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(112,112,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(113,113,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(114,114,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(115,115,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(116,116,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(117,117,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(118,118,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(119,119,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(120,120,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(121,121,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(122,122,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(123,123,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(124,124,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(125,125,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(126,126,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(127,127,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(128,128,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(129,129,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(130,130,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(131,131,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(132,132,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting','');
/*!40000 ALTER TABLE `item_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `iso_639_1` varchar(6) NOT NULL,
  `iso_639_2` varchar(6) NOT NULL,
  `iso_639_3` varchar(6) NOT NULL,
  `source_form` varchar(100) NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '1',
  `activated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iso_639_1` (`iso_639_1`),
  KEY `iso_639_2` (`iso_639_2`),
  KEY `iso_639_3` (`iso_639_3`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','','','English',1,'2011-09-12 04:27:05'),(2,'fr','fre','','Français',2,'2011-09-12 04:27:15'),(3,'ar','','','العربية',3,'2011-09-12 04:27:16'),(4,'','','','Scientific Name',4,NULL),(5,'','','','Unknown',5,NULL),(6,'de','','','',55,'2011-09-12 04:30:41');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `source_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `version` varchar(6) CHARACTER SET ascii NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `show_to_content_partners` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `source_url` (`source_url`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'cc-by 3.0','http://creativecommons.org/licenses/by/3.0/','0','/images/licenses/cc_by_small.png',1),(2,'public domain','http://creativecommons.org/licenses/publicdomain/','0','/images/licenses/cc_by_small.png',1),(3,'all rights reserved','http://creativecommons.org/licenses/by/3.0/','0','/images/licenses/cc_by_small.png',0),(4,'cc-by-nc 3.0','http://creativecommons.org/licenses/by-nc/3.0/','0','/images/licenses/cc_by_nc_small.png',1),(5,'cc-by 3.0','http://creativecommons.org/licenses/by/3.0/','0','/images/licenses/cc_by_small.png',1),(6,'cc-by-sa 3.0','http://creativecommons.org/licenses/by-sa/3.0/','0','/images/licenses/cc_by_sa_small.png',1),(7,'cc-by-nc-sa 3.0','http://creativecommons.org/licenses/by-nc-sa/3.0/','0','/images/licenses/cc_by_nc_sa_small.png',1),(8,'cc-by 3.0','http://creativecommons.org/licenses/by/3.0/','0','/images/licenses/cc_by_small.png',1),(9,'gnu-fdl','http://www.gnu.org/licenses/fdl.html','0','/images/licenses/gnu_fdl_small.png',0),(10,'gnu-gpl','http://www.gnu.org/licenses/gpl.html','0','/images/licenses/gnu_fdl_small.png',0),(11,'no license','http://creativecommons.org/licenses/by/3.0/','0','/images/licenses/cc_by_small.png',0);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `manager` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,1,'2011-09-13 07:33:03','2011-09-13 07:33:03',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mime_types`
--

DROP TABLE IF EXISTS `mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Type of data object. Controlled list used in the EOL schema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mime_types`
--

LOCK TABLES `mime_types` WRITE;
/*!40000 ALTER TABLE `mime_types` DISABLE KEYS */;
INSERT INTO `mime_types` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21);
/*!40000 ALTER TABLE `mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_languages`
--

DROP TABLE IF EXISTS `name_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_languages` (
  `name_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'required; the language of the string. ''Scientific name'' is a language',
  `parent_name_id` int(10) unsigned NOT NULL COMMENT 'not required; associated a common name or surrogate with its proper scientific name',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'not required; identifies if the common names is preferred for the given scientific name in the given language',
  PRIMARY KEY (`name_id`,`language_id`,`parent_name_id`),
  KEY `parent_name_id` (`parent_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used mainly to identify which names are scientific names, an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_languages`
--

LOCK TABLES `name_languages` WRITE;
/*!40000 ALTER TABLE `name_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `name_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namebank_id` int(10) unsigned NOT NULL COMMENT 'required; this identifies the uBio NameBank id for this string so that we can stay in sync. Many newer names will have this set to 0 as it is unknown if the name is in NameBank',
  `string` varchar(300) NOT NULL COMMENT 'the actual name. This is unique - every unique sequence of characters has one and only one name_id (we should probably add a unique index to this field)',
  `clean_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'there is a one to one reltaionship between a name string and a clean name. The clean name takes the string and lowercases it (uncluding diacriticals), removes leading/trailing whitespace, removes some punctuation (periods and more), and pads remaining pun',
  `italicized` varchar(300) NOT NULL COMMENT 'required; this includes html <i> tags in the proper place to display the string in its italicized form. Generally only species and subspecific names are italizied. Usually algorithmically generated',
  `italicized_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; if an editor verifies the italicized form is correct, or corrects it, this should be set to 1 so it is not algorithmically replaced if we change the algorithm',
  `canonical_form_id` int(10) unsigned NOT NULL COMMENT 'required; every name string has a canonical form',
  `ranked_canonical_form_id` int(10) unsigned DEFAULT NULL,
  `canonical_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; same as with italicized form, if an editor verifies the canonical form we want to maintin their edits if we were to redo the canonical form algorithm',
  PRIMARY KEY (`id`),
  KEY `canonical_form_id` (`canonical_form_id`),
  KEY `clean_name` (`clean_name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='Represents the name of a taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,0,'Animalia','animalia','<i>Animalia</i>',1,1,NULL,1),(2,0,'Animalia Linn.','animalia linn','<i>Animalia</i> Linn.',1,2,2,1),(3,0,'Animals','animals','<i>Animals</i>',0,3,NULL,0),(4,0,'Autrecusandaees repudiandaeica Linnaeus','autrecusandaees repudiandaeica linnaeus','<i>Autrecusandaees repudiandaeica</i> Linnaeus',1,4,4,1),(5,0,'ravenous clover','ravenous clover','<i>ravenous clover</i>',0,5,NULL,0),(6,0,'Nihileri voluptasus G. D\'Amore','nihileri voluptasus g d\'amore','<i>Nihileri voluptasus</i> G. D\'Amore',1,6,6,1),(7,0,'red suntus','red suntus','<i>red suntus</i>',0,7,NULL,0),(8,0,'Dignissimosii inutes R. Bergstrom','dignissimosii inutes r bergstrom','<i>Dignissimosii inutes</i> R. Bergstrom',1,8,8,1),(9,0,'darning needle','darning needle','<i>darning needle</i>',0,9,NULL,0),(10,0,'Fugais utharumatus L.','fugais utharumatus l','<i>Fugais utharumatus</i> L.',1,10,10,1),(11,0,'tiger','tiger','<i>tiger</i>',0,11,NULL,0),(12,0,'Minuseli ullamens Linn','minuseli ullamens linn','<i>Minuseli ullamens</i> Linn',1,12,12,1),(13,0,'Tiger moth','tiger moth','<i>Tiger moth</i>',0,13,NULL,0),(14,0,'Dignissimosatus nobisosyne R. Cartwright','dignissimosatus nobisosyne r cartwright','<i>Dignissimosatus nobisosyne</i> R. Cartwright',1,14,14,1),(15,0,'Tiger lilly','tiger lilly','<i>Tiger lilly</i>',0,15,NULL,0),(16,0,'Tiger water lilly','tiger water lilly','<i>Tiger water lilly</i>',0,16,NULL,0),(17,0,'lilly of the tiger','lilly of the tiger','<i>lilly of the tiger</i>',0,17,NULL,0),(18,0,'Tiger flower','tiger flower','<i>Tiger flower</i>',0,18,NULL,0),(19,0,'Tiger-stripe lilly','tiger - stripe lilly','<i>Tiger-stripe lilly</i>',0,19,NULL,0),(20,0,'Tiger-eye lilly','tiger - eye lilly','<i>Tiger-eye lilly</i>',0,20,NULL,0),(21,0,'Expeditaalia evenietelia L.','expeditaalia evenietelia l','<i>Expeditaalia evenietelia</i> L.',1,21,21,1),(22,0,'Earumeles\n    beataeata Linn.','earumeles\n beataeata linn','<i>Earumeles\n    beataeata</i> Linn.',1,22,22,1),(23,0,'Culpaensis sapienteesi Linnaeus','culpaensis sapienteesi linnaeus','<i>Culpaensis sapienteesi</i> Linnaeus',1,23,23,1),(24,0,'frizzlebek','frizzlebek','<i>frizzlebek</i>',0,24,NULL,0),(25,0,'Utomnisesi sequialis N. Upton','utomnisesi sequialis n upton','<i>Utomnisesi sequialis</i> N. Upton',1,25,25,1),(26,0,'purple dust crab','purple dust crab','<i>purple dust crab</i>',0,26,NULL,0),(27,0,'Autaliquideri minimais L. Carroll','autaliquideri minimais l carroll','<i>Autaliquideri minimais</i> L. Carroll',1,27,27,1),(28,0,'Beataeelia etnemoiae','beataeelia etnemoiae','<i>Beataeelia etnemoiae</i>',1,27,NULL,1),(29,0,'Autema officiaalius M. Port','autema officiaalius m port','<i>Autema officiaalius</i> M. Port',1,28,28,1),(30,0,'wumpus','wumpus','<i>wumpus</i>',0,29,NULL,0),(31,0,'wompus','wompus','<i>wompus</i>',0,30,NULL,0),(32,0,'wampus','wampus','<i>wampus</i>',0,31,NULL,0),(33,0,'Eukaryota S. Posford','eukaryota s posford','<i>Eukaryota</i> S. Posford',1,32,32,1),(34,0,'eukaryotes','eukaryotes','<i>eukaryotes</i>',0,33,NULL,0),(35,0,'Metazoa','metazoa','<i>Metazoa</i>',1,34,NULL,1),(36,0,'opisthokonts','opisthokonts','<i>opisthokonts</i>',1,35,NULL,1),(37,0,'Autemalius utsimiliqueesi Posford & Ram','autemalius utsimiliqueesi posford & ram','<i>Autemalius utsimiliqueesi</i> Posford & Ram',1,36,36,1),(38,0,'cloud swallow','cloud swallow','<i>cloud swallow</i>',0,37,NULL,0),(39,0,'Etconsequaturelia autenimalia L.','etconsequaturelia autenimalia l','<i>Etconsequaturelia autenimalia</i> L.',1,38,38,1),(40,0,'spiny possom','spiny possom','<i>spiny possom</i>',0,39,NULL,0),(41,0,'Quoautesi natuseri Linnaeus','quoautesi natuseri linnaeus','<i>Quoautesi natuseri</i> Linnaeus',1,40,40,1),(42,0,'common desert mouse','common desert mouse','<i>common desert mouse</i>',0,41,NULL,0),(43,0,'Voluptatumeri esseensis','voluptatumeri esseensis','<i>Voluptatumeri esseensis</i>',1,42,42,1),(44,0,'fisher','fisher','<i>fisher</i>',0,43,NULL,0),(45,0,'Ameti maioresis P. Leary','ameti maioresis p leary','<i>Ameti maioresis</i> P. Leary',1,44,44,1),(46,0,'chartruse turtle','chartruse turtle','<i>chartruse turtle</i>',0,45,NULL,0),(47,0,'Ipsamalius distinctioerox Padderson','ipsamalius distinctioerox padderson','<i>Ipsamalius distinctioerox</i> Padderson',1,46,46,1),(48,0,'horny toad','horny toad','<i>horny toad</i>',0,47,NULL,0),(49,0,'Maximees veritatisatus Linnaeus','maximees veritatisatus linnaeus','<i>Maximees veritatisatus</i> Linnaeus',1,48,48,1),(50,0,'scarlet vermillion','scarlet vermillion','<i>scarlet vermillion</i>',0,49,NULL,0),(51,0,'Molestiaeus\n    rationealia L.','molestiaeus\n rationealia l','<i>Molestiaeus\n    rationealia</i> L.',1,50,50,1),(52,0,'Mozart\'s nemesis','mozart\'s nemesis','<i>Mozart\'s nemesis</i>',0,51,NULL,0),(53,0,'Bacteria M. Mayer','bacteria m mayer','<i>Bacteria</i> M. Mayer',1,52,52,1),(54,0,'bacteria','bacteria','<i>bacteria</i>',0,52,NULL,0),(55,0,'bugs','bugs','<i>bugs</i>',0,53,NULL,0),(56,0,'grime','grime','<i>grime</i>',0,54,NULL,0),(57,0,'critters','critters','<i>critters</i>',0,55,NULL,0),(58,0,'bakteria','bakteria','<i>bakteria</i>',0,56,NULL,0),(59,0,'die buggen','die buggen','<i>die buggen</i>',0,57,NULL,0),(60,0,'das greim','das greim','<i>das greim</i>',0,58,NULL,0),(61,0,'baseteir','baseteir','<i>baseteir</i>',0,59,NULL,0),(62,0,'le grimme','le grimme','<i>le grimme</i>',0,60,NULL,0),(63,0,'ler petit bugge','ler petit bugge','<i>ler petit bugge</i>',0,61,NULL,0),(64,0,'microbia','microbia','microbia',1,52,NULL,1),(65,0,'Fugitens dolorealius L.','fugitens dolorealius l','<i>Fugitens dolorealius</i> L.',1,62,62,1),(66,0,'quick brown fox','quick brown fox','<i>quick brown fox</i>',0,63,NULL,0),(67,0,'Quisquamator sequieles Linn.','quisquamator sequieles linn','<i>Quisquamator sequieles</i> Linn.',1,64,64,1),(68,0,'painted horse','painted horse','<i>painted horse</i>',0,65,NULL,0),(69,0,'Essees eaqueata Linnaeus','essees eaqueata linnaeus','<i>Essees eaqueata</i> Linnaeus',1,66,66,1),(70,0,'thirsty aphid','thirsty aphid','<i>thirsty aphid</i>',0,67,NULL,0),(71,0,'Animiens atdoloribuseron G. D\'Amore','animiens atdoloribuseron g d\'amore','<i>Animiens atdoloribuseron</i> G. D\'Amore',1,68,68,1),(72,0,'bloody eel','bloody eel','<i>bloody eel</i>',0,69,NULL,0),(73,0,'Fungi','fungi','<i>Fungi</i>',1,70,70,1),(74,0,'Mushrooms, sac fungi, lichens, yeast, molds, rusts, etc.','mushrooms sac fungi lichens yeast molds rusts etc','<i>Mushrooms, sac fungi, lichens, yeast, molds, rusts, etc.</i>',0,71,NULL,0),(75,0,'Chromista','chromista','<i>Chromista</i>',1,72,72,1),(76,0,'Plantae','plantae','<i>Plantae</i>',1,73,73,1),(77,0,'Plants','plants','<i>Plants</i>',0,74,NULL,0),(78,0,'Amanitaceae','amanitaceae','<i>Amanitaceae</i>',1,75,75,1),(79,0,'Amanita','amanita','<i>Amanita</i>',1,76,76,1),(80,0,'Nephropidae','nephropidae','<i>Nephropidae</i>',1,77,77,1),(81,0,'Dinochelus','dinochelus','<i>Dinochelus</i>',1,78,78,1),(82,0,'Raphidophyceae','raphidophyceae','<i>Raphidophyceae</i>',1,79,79,1),(83,0,'Haramonas','haramonas','<i>Haramonas</i>',1,80,80,1),(84,0,'Canidae','canidae','<i>Canidae</i>',1,81,81,1),(85,0,'Coyotes, dogs, foxes, jackals, and wolves','coyotes dogs foxes jackals & wolves','<i>Coyotes, dogs, foxes, jackals, and wolves</i>',0,82,NULL,0),(86,0,'Canis','canis','<i>Canis</i>',1,83,83,1),(87,0,'Wolf','wolf','<i>Wolf</i>',0,84,NULL,0),(88,0,'Pinaceae','pinaceae','<i>Pinaceae </i>',1,85,85,1),(89,0,'Pine trees','pine trees','<i>Pine trees</i>',0,86,NULL,0),(90,0,'Pinus','pinus','<i>Pinus </i>',1,87,87,1),(91,0,'Pine','pine','<i>Pine</i>',0,88,NULL,0),(92,0,'Formicidae','formicidae','<i>Formicidae</i>',1,89,89,1),(93,0,'Anochetus','anochetus','<i>Anochetus</i>',1,90,90,1),(94,0,'Amanita muscaria (L. ex Fr.) Hook.','amanita muscaria ( l ex fr ) hook','<i>Amanita muscaria</i> (L. ex Fr.) Hook.',1,91,91,1),(95,0,'Fly Agaric','fly agaric','<i>Fly Agaric</i>',0,92,NULL,0),(96,0,'Dinochelus ausubeli Ahyong, Chan & Bouchet, 2010','dinochelus ausubeli ahyong chan & bouchet 2010','<i>Dinochelus ausubeli</i> Ahyong, Chan & Bouchet, 2010',1,93,93,1),(97,0,'Ausubel\'s Mighty Claws Lobster','ausubel\'s mighty claws lobster','<i>Ausubel\'s Mighty Claws Lobster</i>',0,94,NULL,0),(98,0,'Haramonas dimorpha Horiguchi','haramonas dimorpha horiguchi','<i>Haramonas dimorpha</i> Horiguchi',1,95,95,1),(99,0,'Canis lupus Linnaeus, 1758','canis lupus linnaeus 1758','<i>Canis lupus</i> Linnaeus, 1758',1,96,96,1),(100,0,'Pinus strobus L.','pinus strobus l','<i>Pinus strobus</i> L.',1,97,97,1),(101,0,'Eastern white pine','eastern white pine','<i>Eastern white pine</i>',0,98,NULL,0),(102,0,'Anochetus mayri Emery, 1884','anochetus mayri emery 1884','<i>Anochetus mayri</i> Emery, 1884',1,99,99,1);
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_date` datetime DEFAULT NULL,
  `activated_on` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_items`
--

LOCK TABLES `news_items` WRITE;
/*!40000 ALTER TABLE `news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_names`
--

DROP TABLE IF EXISTS `page_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_names` (
  `item_page_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name_id`,`item_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Links name strings to BHL page identifiers. Ma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_names`
--

LOCK TABLES `page_names` WRITE;
/*!40000 ALTER TABLE `page_names` DISABLE KEYS */;
INSERT INTO `page_names` VALUES (1,2),(2,2),(3,2),(4,4),(5,4),(6,4),(7,6),(8,6),(9,6),(10,8),(11,8),(12,8),(13,10),(14,10),(15,10),(16,12),(17,12),(18,12),(19,21),(20,21),(21,21),(22,27),(23,27),(24,27),(25,29),(26,29),(27,29),(28,33),(29,33),(30,33),(31,37),(32,37),(33,37),(34,39),(35,39),(36,39),(37,41),(38,41),(39,41),(40,43),(41,43),(42,43),(43,45),(44,45),(45,45),(46,47),(47,47),(48,47),(49,49),(50,49),(51,49),(52,51),(53,51),(54,51),(55,53),(56,53),(57,53),(58,65),(59,65),(60,65),(61,67),(62,67),(63,67),(64,69),(65,69),(66,69),(67,71),(68,71),(69,71),(70,73),(71,73),(72,73),(73,75),(74,75),(75,75),(76,76),(77,76),(78,76),(79,78),(80,78),(81,78),(82,79),(83,79),(84,79),(85,80),(86,80),(87,80),(88,81),(89,81),(90,81),(91,82),(92,82),(93,82),(94,83),(95,83),(96,83),(97,84),(98,84),(99,84),(100,86),(101,86),(102,86),(103,88),(104,88),(105,88),(106,90),(107,90),(108,90),(109,92),(110,92),(111,92),(112,93),(113,93),(114,93),(115,94),(116,94),(117,94),(118,96),(119,96),(120,96),(121,98),(122,98),(123,98),(124,99),(125,99),(126,99),(127,100),(128,100),(129,100),(130,102),(131,102),(132,102);
/*!40000 ALTER TABLE `page_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_dataobjects`
--

DROP TABLE IF EXISTS `page_stats_dataobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_dataobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` varchar(1) DEFAULT 'n',
  `taxa_count` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_unknown_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_vetted_unknown_published_visible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_visible_uniqueGuid` longtext,
  `a_vetted_unknown_published_notVisible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_notVisible_uniqueGuid` longtext,
  `user_submitted_text` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_dataobjects`
--

LOCK TABLES `page_stats_dataobjects` WRITE;
/*!40000 ALTER TABLE `page_stats_dataobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_dataobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_marine`
--

DROP TABLE IF EXISTS `page_stats_marine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_marine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '0',
  `names_from_xml` int(11) DEFAULT NULL,
  `names_in_eol` int(11) DEFAULT NULL,
  `marine_pages` int(11) DEFAULT NULL,
  `pages_with_objects` int(11) DEFAULT NULL,
  `pages_with_vetted_objects` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_marine`
--

LOCK TABLES `page_stats_marine` WRITE;
/*!40000 ALTER TABLE `page_stats_marine` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_marine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_taxa`
--

DROP TABLE IF EXISTS `page_stats_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxa_count` int(11) DEFAULT NULL,
  `taxa_text` int(11) DEFAULT NULL,
  `taxa_images` int(11) DEFAULT NULL,
  `taxa_text_images` int(11) DEFAULT NULL,
  `taxa_BHL_no_text` int(11) DEFAULT NULL,
  `taxa_links_no_text` int(11) DEFAULT NULL,
  `taxa_images_no_text` int(11) DEFAULT NULL,
  `taxa_text_no_images` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj` int(11) DEFAULT NULL,
  `no_vet_obj2` int(11) DEFAULT NULL,
  `with_BHL` int(11) DEFAULT NULL,
  `vetted_not_published` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_inCol` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_notinCol` int(11) DEFAULT NULL,
  `pages_incol` int(11) DEFAULT NULL,
  `pages_not_incol` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lifedesk_taxa` int(11) DEFAULT NULL,
  `lifedesk_dataobject` int(11) DEFAULT NULL,
  `data_objects_count_per_category` text,
  `content_partners_count_per_category` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_taxa`
--

LOCK TABLES `page_stats_taxa` WRITE;
/*!40000 ALTER TABLE `page_stats_taxa` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_titles`
--

DROP TABLE IF EXISTS `publication_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marc_bib_id` varchar(40) NOT NULL,
  `marc_leader` varchar(40) NOT NULL,
  `title` varchar(300) NOT NULL,
  `short_title` varchar(300) NOT NULL,
  `details` varchar(300) NOT NULL,
  `call_number` varchar(40) NOT NULL,
  `start_year` varchar(10) NOT NULL,
  `end_year` varchar(10) NOT NULL,
  `language` varchar(10) NOT NULL,
  `author` varchar(150) NOT NULL,
  `abbreviation` varchar(150) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The main publications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_titles`
--

LOCK TABLES `publication_titles` WRITE;
/*!40000 ALTER TABLE `publication_titles` DISABLE KEYS */;
INSERT INTO `publication_titles` VALUES (1,'','','Great Big Journal of Fun','hello','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st'),(2,'','','The Journal You Cannot Afford','hello','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st');
/*!40000 ALTER TABLE `publication_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `random_hierarchy_images`
--

DROP TABLE IF EXISTS `random_hierarchy_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `random_hierarchy_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `hierarchy_entry_id` int(11) DEFAULT NULL,
  `hierarchy_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `hierarchy_id` (`hierarchy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `random_hierarchy_images`
--

LOCK TABLES `random_hierarchy_images` WRITE;
/*!40000 ALTER TABLE `random_hierarchy_images` DISABLE KEYS */;
INSERT INTO `random_hierarchy_images` VALUES (30,3,2,4,7,'<i>Adaliasii iurea</i> Factory TestFramework'),(31,12,3,4,8,'<i>Nonnumquamerus numquamerus</i> Factory TestFramework'),(32,21,4,4,9,'<i>Autvoluptatesus temporaalis</i> Factory TestFramework'),(33,30,5,4,10,'<i>Excepturialia omnisa</i> Factory TestFramework'),(34,39,6,4,11,'<i>Estveroalia nihilata</i> Factory TestFramework'),(35,47,7,4,12,'<i>Quiincidunta culpaelia</i> Factory TestFramework'),(36,66,11,4,16,'<i>Providentalia estquaeratens</i> Factory TestFramework'),(37,91,12,4,17,'<i>Placeatalia uteosensis</i> Factory TestFramework'),(38,93,13,4,18,'<i>Ipsaensis architectoalius</i> Factory TestFramework'),(39,93,14,13,18,'<i>Deserunterox facererox</i> Factory TestFramework'),(40,93,15,10,18,'<i>Suntalia estsitalius</i> Factory TestFramework'),(41,102,16,4,910093,'<i>Aliasosyne quiadipisciatus</i> Factory TestFramework'),(42,102,17,3,910093,'<i>Illoica exexplicaboalia</i> Factory TestFramework'),(43,3,18,14,7,'<i>Laboriosamerus quisis</i> Factory TestFramework'),(44,3,19,14,7,'<i>Optiois molestiasalia</i> Factory TestFramework'),(45,3,20,14,7,'<i>Ipsuma animius</i> Factory TestFramework'),(46,3,21,15,7,'<i>Quiserox\n    eligendii</i> Factory TestFramework'),(47,3,22,15,7,'<i>Eteaiae nullais</i> Factory TestFramework'),(48,111,23,7,20,'<i>Quibusdameli estculpaatut</i> Factory TestFramework'),(49,3,24,7,7,'<i>Estasperioreseli etquidemit</i> Factory TestFramework'),(50,120,25,7,21,'<i>Nesciunterox autrerumalit</i> Factory TestFramework'),(51,129,26,7,22,'<i>Voluptasalius optioerut</i> Factory TestFramework'),(52,138,27,7,23,'<i>Remrerumeron auteterut</i> Factory TestFramework'),(53,147,28,7,24,'<i>Veritatises idofficiisiaf</i> Factory TestFramework'),(54,156,29,7,25,'<i>Accusamusalis pariaturb</i> Factory TestFramework'),(55,165,30,7,26,'<i>Voluptateseri doloremosynf</i> Factory TestFramework'),(56,174,31,7,27,'<i>Autrecusandaees repudiandaeicb</i> Factory TestFramework'),(57,183,32,7,28,'<i>Nihileri voluptasut</i> Factory TestFramework'),(58,192,33,7,29,'<i>Dignissimosii inutet</i> Factory TestFramework'),(59,201,34,7,30,'<i>Fugais utharumatut</i> Factory TestFramework'),(60,210,35,7,31,'<i>Minuseli ullament</i> Factory TestFramework'),(61,219,36,7,32,'<i>Dignissimosatus nobisosynf</i> Factory TestFramework'),(62,228,37,7,33,'<i>Expeditaalia evenietelib</i> Factory TestFramework'),(63,269,53,4,2866150,'<i>Amanita muscaria</i> (L. ex Fr.) Hook.'),(64,277,54,4,17924149,'<i>Dinochelus ausubeli</i> Ahyong, Chan & Bouchet, 2010'),(65,281,55,4,921737,'<i>Haramonas dimorpha</i> Horiguchi'),(66,287,56,4,328607,'<i>Canis lupus</i> Linnaeus, 1758'),(67,293,57,4,1061748,'<i>Pinus strobus</i> L.'),(68,299,58,4,491753,'<i>Anochetus mayri</i> Emery, 1884');
/*!40000 ALTER TABLE `random_hierarchy_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_group_id` smallint(6) NOT NULL COMMENT 'not required; there is no rank_groups table. This is used to group (reconcile) different strings for the same rank',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Stores taxonomic ranks (ex: phylum, order, class, family...)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifier_types`
--

DROP TABLE IF EXISTS `ref_identifier_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifier_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifier_types`
--

LOCK TABLES `ref_identifier_types` WRITE;
/*!40000 ALTER TABLE `ref_identifier_types` DISABLE KEYS */;
INSERT INTO `ref_identifier_types` VALUES (2,'bici'),(3,'coden'),(4,'doi'),(5,'eissn'),(6,'handle'),(7,'isbn'),(8,'issn'),(9,'lsid'),(10,'oclc'),(11,'sici'),(1,'url'),(12,'urn');
/*!40000 ALTER TABLE `ref_identifier_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifiers`
--

DROP TABLE IF EXISTS `ref_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifiers` (
  `ref_id` int(10) unsigned NOT NULL,
  `ref_identifier_type_id` smallint(5) unsigned NOT NULL,
  `identifier` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`ref_id`,`ref_identifier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifiers`
--

LOCK TABLES `ref_identifiers` WRITE;
/*!40000 ALTER TABLE `ref_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_reference` text NOT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `editors` varchar(255) DEFAULT NULL,
  `publication_created_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `page_start` varchar(50) DEFAULT NULL,
  `page_end` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL,
  `user_submitted` tinyint(1) NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `full_reference` (`full_reference`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores reference full strings. References are linked to data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_statuses`
--

DROP TABLE IF EXISTS `resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='The status of the resource in harvesting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_statuses`
--

LOCK TABLES `resource_statuses` WRITE;
/*!40000 ALTER TABLE `resource_statuses` DISABLE KEYS */;
INSERT INTO `resource_statuses` VALUES (1,'2011-09-13 07:27:12','2011-09-13 07:27:12'),(2,'2011-09-13 07:27:38','2011-09-13 07:27:38'),(3,'2011-09-13 07:27:38','2011-09-13 07:27:38'),(4,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(5,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(6,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(7,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(8,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(9,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(10,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(11,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(12,'2011-09-13 07:27:39','2011-09-13 07:27:39'),(13,'2011-09-13 07:27:39','2011-09-13 07:27:39');
/*!40000 ALTER TABLE `resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `accesspoint_url` varchar(255) DEFAULT NULL COMMENT 'recommended; the url where the resource can be accessed. Not used when the resource is a file which was uploaded',
  `metadata_url` varchar(255) DEFAULT NULL,
  `dwc_archive_url` varchar(255) DEFAULT NULL,
  `service_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'recommended; if accesspoint_url is defined, this will indicate what kind of protocal can be expected to be found there. (this is perhaps misued right now)',
  `service_version` varchar(255) DEFAULT NULL,
  `resource_set_code` varchar(255) DEFAULT NULL COMMENT 'not required; if the resource contains several subsets (such as DiGIR providers) theis indicates the set we are to harvest',
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL COMMENT 'not required; the default language of the contents of the resource',
  `subject` varchar(255) NOT NULL,
  `bibliographic_citation` varchar(400) DEFAULT NULL COMMENT 'not required; the default bibliographic citation for all data objects whithin the resource',
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(400) DEFAULT NULL,
  `rights_holder` varchar(255) DEFAULT NULL,
  `refresh_period_hours` smallint(5) unsigned DEFAULT NULL COMMENT 'recommended; if the resource is to be harvested regularly, this field indicates how frequent the updates are',
  `resource_modified_at` datetime DEFAULT NULL,
  `resource_created_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` datetime DEFAULT NULL COMMENT 'required; this field is updated each time the resource is harvested',
  `dataset_file_name` varchar(255) DEFAULT NULL,
  `dataset_content_type` varchar(255) DEFAULT NULL,
  `dataset_file_size` int(11) DEFAULT NULL,
  `resource_status_id` int(11) DEFAULT NULL,
  `auto_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; indicates whether the resource is to be published immediately after harvesting',
  `vetted` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text,
  `hierarchy_id` int(10) unsigned DEFAULT NULL,
  `dwc_hierarchy_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `preview_collection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`),
  KEY `content_partner_id` (`content_partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Content parters supply resource files which contain data obj';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,3,'LigerCat resource','http://services.eol.org/eol_php_code/tests/fixtures/files/test_resource.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,1,NULL,NULL,0,NULL,'2011-09-11 07:27:03','2011-09-13 04:27:13',NULL,NULL,NULL,NULL,1,0,0,NULL,3,NULL,NULL,NULL),(2,1,'Initial IUCN Import','http://services.eol.org/eol_php_code/tests/fixtures/files/test_resource.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,1,NULL,NULL,0,NULL,'2011-09-11 07:27:03','2011-09-13 04:27:19',NULL,NULL,NULL,NULL,1,0,0,NULL,9,NULL,NULL,NULL),(3,2,'Bootstrapper','http://services.eol.org/eol_php_code/tests/fixtures/files/test_resource.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,1,NULL,NULL,0,NULL,'2011-09-11 07:27:03','2011-09-13 04:27:43',NULL,NULL,NULL,NULL,1,0,0,NULL,4,NULL,NULL,NULL),(4,4,'Test Framework Import','http://services.eol.org/eol_php_code/tests/fixtures/files/test_resource.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,1,NULL,NULL,0,NULL,'2011-09-11 07:27:03','2011-09-13 04:28:54',NULL,NULL,NULL,NULL,1,0,0,NULL,11,NULL,NULL,NULL),(5,6,'Test ContentPartner import','http://services.eol.org/eol_php_code/tests/fixtures/files/test_resource.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,1,NULL,NULL,0,NULL,'2011-09-11 07:27:03','2011-09-13 04:29:02',NULL,NULL,NULL,NULL,9,0,0,NULL,12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090115212906'),('20090115213352'),('20090115213411'),('20090319151552'),('20090323180749'),('20090323215240'),('20090324155132'),('20090402221944'),('20090406173750'),('20090406182730'),('20090407151453'),('20090409205033'),('20090410182243'),('20090420224929'),('20090423202740'),('20090519174155'),('20090521180952'),('20090522151058'),('20090522175548'),('20090529155256'),('20090602162422'),('20090608140632'),('20090609183650'),('20090611220129'),('20090611222305'),('20090618152533'),('20090626215229'),('20090629204613'),('20090702154334'),('20090706193825'),('20090707151031'),('20090708165109'),('20090713181051'),('20090713195100'),('20090716160138'),('20090716175237'),('20090728141951'),('20090728142015'),('20090731201059'),('20090806141928'),('20090807211358'),('20090811135956'),('20090813192245'),('20090821195247'),('20090827183713'),('20090831215022'),('20090908153909'),('20090923145607'),('20091008181739'),('20091013150945'),('20091013171219'),('20091013171333'),('20091014184550'),('20091014184606'),('20091015210148'),('20091020152937'),('20091027175416'),('20091119210135'),('20091202215023'),('20091203154810'),('20091207203811'),('20091208223503'),('20091209190050'),('20091210220545'),('20091214155922'),('20091215164740'),('20091216190856'),('20091217214145'),('20091217214235'),('20091218162923'),('20091231200414'),('20100104204617'),('20100106160912'),('20100107151836'),('20100107164806'),('20100111205322'),('20100112163230'),('20100122171742'),('20100128154029'),('20100201162954'),('20100325172152'),('20100330030438'),('20100401162942'),('20100405172003'),('20100405173159'),('20100426164755'),('20100429210443'),('20100503214259'),('20100505194614'),('20100506165339'),('20100511192752'),('20100512193519'),('20100513160829'),('20100521062746'),('20100610163907'),('20100610165216'),('20100610184534'),('20100614180351'),('20100622134206'),('20100623151829'),('20100623200014'),('20100629191006'),('20100701154917'),('20100712183308'),('20100714154046'),('20100720145443'),('20100726163758'),('20100803150006'),('20100803152158'),('20100803153959'),('20100803155120'),('20100808130923'),('20100808131955'),('20100808154208'),('20100815165326'),('20100819133838'),('20101014005638'),('20101014012220'),('20101022152421'),('20101027160407'),('20101104161105'),('20101110175627'),('20101118155310'),('20101118160003'),('20101122212749'),('20101129152519'),('20101129215057'),('20101201145519'),('20101209190016'),('20101212235741'),('20101214220823'),('20101215153623'),('20101228214749'),('20110103142227'),('20110118222256'),('20110208174703'),('20110211161826'),('20110214151140'),('20110218105242'),('20110218202311'),('20110223184616'),('20110228163133'),('20110228183902'),('20110305012601'),('20110314214023'),('20110315020158'),('20110323203714'),('20110325185220'),('20110328131020'),('20110413172734'),('20110427211118'),('20110504163954'),('20110504193206'),('20110517143339'),('20110519155453'),('20110527191903'),('20110527192130'),('20110527192743'),('20110531144832'),('20110531210038'),('20110601144759'),('20110606125605'),('20110606125658'),('20110606125908'),('20110607141703'),('20110609191611'),('20110609204104'),('20110610153227'),('20110610153900'),('20110610173545'),('20110610201053'),('20110610202548'),('20110610203418'),('20110613163724'),('20110614084303'),('20110614084359'),('20110614084532'),('20110614084547'),('20110614084609'),('20110614090047'),('20110614090547'),('20110614091209'),('20110614142024'),('20110614160101'),('20110614205659'),('20110616084715'),('20110616084734'),('20110617131152'),('20110617131429'),('20110617132000'),('20110617170932'),('20110621190836'),('20110623144126'),('20110623200457'),('20110624185307'),('20110624185316'),('20110627120448'),('20110627120853'),('20110628191742'),('20110628210857'),('20110629131641'),('20110701142214'),('20110701142404'),('20110709185910'),('20110711034815'),('20110711040235'),('20110711174635'),('20110714110104'),('20110717220033'),('20110718143317'),('20110720073755'),('20110721212837'),('20110725182102'),('20110726032947'),('20110726192906'),('20110726192914'),('20110803195125'),('20110803205530'),('20110804011653'),('20110804031653'),('20110805130000'),('20110805130550'),('20110805141920'),('20110805152109'),('20110806194659'),('20110808163025'),('20110808170216'),('20110811153656'),('20110811173357'),('20110812022507'),('20110812144443'),('20110816204203'),('20110817231547'),('20110826143935'),('20110901150910');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_suggestions`
--

DROP TABLE IF EXISTS `search_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL DEFAULT '',
  `language_label` varchar(255) NOT NULL DEFAULT 'en',
  `taxon_id` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `content_notes` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_suggestions`
--

LOCK TABLES `search_suggestions` WRITE;
/*!40000 ALTER TABLE `search_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_types` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='What type of protocol the content partners are exposing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
/*!40000 ALTER TABLE `service_types` DISABLE KEYS */;
INSERT INTO `service_types` VALUES (1);
/*!40000 ALTER TABLE `service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_options`
--

DROP TABLE IF EXISTS `site_configuration_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_site_configuration_options_on_parameter` (`parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_options`
--

LOCK TABLES `site_configuration_options` WRITE;
/*!40000 ALTER TABLE `site_configuration_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_configuration_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sort_styles`
--

DROP TABLE IF EXISTS `sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_styles`
--

LOCK TABLES `sort_styles` WRITE;
/*!40000 ALTER TABLE `sort_styles` DISABLE KEYS */;
INSERT INTO `sort_styles` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_collections`
--

DROP TABLE IF EXISTS `special_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_collections`
--

LOCK TABLES `special_collections` WRITE;
/*!40000 ALTER TABLE `special_collections` DISABLE KEYS */;
INSERT INTO `special_collections` VALUES (1,'Focus'),(2,'Watch');
/*!40000 ALTER TABLE `special_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='Generic status table designed to be used in several places. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_id` varchar(255) DEFAULT NULL,
  `user_response` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responses`
--

LOCK TABLES `survey_responses` WRITE;
/*!40000 ALTER TABLE `survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonym_relations`
--

DROP TABLE IF EXISTS `synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_relations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonym_relations`
--

LOCK TABLES `synonym_relations` WRITE;
/*!40000 ALTER TABLE `synonym_relations` DISABLE KEYS */;
INSERT INTO `synonym_relations` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49);
/*!40000 ALTER TABLE `synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_id` int(10) unsigned NOT NULL,
  `synonym_relation_id` tinyint(3) unsigned NOT NULL COMMENT 'the relationship this synonym has with the preferred name for this node',
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'generally only set when the synonym is a common name',
  `hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'associated node in the hierarchy',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'set to 1 if this is a common name and is the preferred common name for the node in its language',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'this is redundant as it can be found via the synonym''s hierarchy_entry. I think its here for legacy reasons, but we can probably get rid of it',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_names` (`name_id`,`synonym_relation_id`,`language_id`,`hierarchy_entry_id`,`hierarchy_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='Used to assigned taxonomic synonyms and common names to hier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (1,2,1,4,2,1,6,1,0),(2,3,2,1,2,1,6,1,0),(3,4,1,4,3,1,6,1,0),(4,5,2,1,3,1,6,1,0),(5,6,1,4,4,1,6,1,0),(6,7,2,1,4,1,6,1,0),(7,8,1,4,5,1,6,1,0),(8,9,2,1,5,1,6,1,0),(9,10,1,4,6,1,6,1,0),(10,11,2,1,6,1,6,1,0),(11,12,1,4,7,1,6,1,0),(12,13,2,1,7,1,6,1,0),(13,14,1,4,8,1,6,1,0),(14,15,2,1,8,1,6,1,0),(15,16,2,1,8,0,6,1,0),(16,17,2,1,8,0,6,1,0),(17,18,2,1,8,0,6,1,0),(18,19,2,1,8,0,6,1,0),(19,20,2,1,8,0,6,1,0),(20,21,1,4,9,1,6,1,0),(21,11,2,1,9,1,6,1,0),(22,22,1,4,10,1,6,1,0),(23,23,1,4,11,1,6,1,0),(24,24,2,1,11,1,6,1,0),(25,26,2,1,12,1,6,1,0),(26,25,1,4,12,1,6,1,0),(27,27,1,4,13,1,6,1,0),(28,30,2,1,16,1,6,1,0),(29,31,2,1,16,0,6,1,0),(30,32,2,1,16,0,6,1,0),(31,29,1,4,16,1,6,1,0),(32,34,2,1,23,1,6,1,0),(33,33,1,4,23,1,6,1,0),(34,38,2,1,25,1,6,1,0),(35,37,1,4,25,1,6,1,0),(36,40,2,1,26,1,6,1,0),(37,39,1,4,26,1,6,1,0),(38,42,2,1,27,1,6,1,0),(39,41,1,4,27,1,6,1,0),(40,44,2,1,28,1,6,1,0),(41,43,1,4,28,1,6,1,0),(42,46,2,1,29,1,6,1,0),(43,45,1,4,29,1,6,1,0),(44,48,2,1,30,1,6,1,0),(45,47,1,4,30,1,6,1,0),(46,50,2,1,31,1,6,1,0),(47,49,1,4,31,1,6,1,0),(48,52,2,1,32,1,6,1,0),(49,51,1,4,32,1,6,1,0),(50,53,1,4,33,1,6,1,0),(51,54,2,1,33,1,6,1,0),(52,55,2,1,33,0,6,1,0),(53,56,2,1,33,0,6,1,0),(54,57,2,1,33,0,6,1,0),(55,58,2,6,33,1,6,1,0),(56,59,2,6,33,0,6,1,0),(57,60,2,6,33,0,6,1,0),(58,61,2,2,33,1,6,1,0),(59,62,2,2,33,0,6,1,0),(60,63,2,2,33,0,6,1,0),(61,64,1,4,33,0,6,1,0),(62,66,2,1,34,1,6,1,0),(63,65,1,4,34,1,6,1,0),(64,68,2,1,35,1,6,1,0),(65,67,1,4,35,1,6,1,0),(66,70,2,1,36,1,6,1,0),(67,69,1,4,36,1,6,1,0),(68,72,2,1,37,1,6,1,0),(69,71,1,4,37,1,6,1,0),(70,74,2,1,38,1,6,1,0),(71,73,1,4,38,1,6,1,0),(72,75,1,4,39,1,6,1,0),(73,77,2,1,40,1,6,1,0),(74,76,1,4,40,1,6,1,0),(75,78,1,4,41,1,6,1,0),(76,79,1,4,42,1,6,1,0),(77,80,1,4,43,1,6,1,0),(78,81,1,4,44,1,6,1,0),(79,82,1,4,45,1,6,1,0),(80,83,1,4,46,1,6,1,0),(81,85,2,1,47,1,6,1,0),(82,84,1,4,47,1,6,1,0),(83,87,2,1,48,1,6,1,0),(84,86,1,4,48,1,6,1,0),(85,89,2,1,49,1,6,1,0),(86,88,1,4,49,1,6,1,0),(87,91,2,1,50,1,6,1,0),(88,90,1,4,50,1,6,1,0),(89,92,1,4,51,1,6,1,0),(90,93,1,4,52,1,6,1,0),(91,95,2,1,53,1,6,1,0),(92,94,1,4,53,1,6,1,0),(93,97,2,1,54,1,6,1,0),(94,96,1,4,54,1,6,1,0),(95,98,1,4,55,1,6,1,0),(96,87,2,1,56,1,6,1,0),(97,99,1,4,56,1,6,1,0),(98,101,2,1,57,1,6,1,0),(99,100,1,4,57,1,6,1,0),(100,102,1,4,58,1,6,1,0);
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_of_contents`
--

DROP TABLE IF EXISTS `table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_of_contents` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL COMMENT 'refers to the parent taxon_of_contents id. Our table of content is only two levels deep',
  `view_order` smallint(5) unsigned DEFAULT '0' COMMENT 'used to organize the view of the table of contents on the species page in order of priority, not alphabetically',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_of_contents`
--

LOCK TABLES `table_of_contents` WRITE;
/*!40000 ALTER TABLE `table_of_contents` DISABLE KEYS */;
INSERT INTO `table_of_contents` VALUES (1,0,1),(2,1,2),(3,0,2),(4,0,3),(5,4,4),(6,0,5),(7,6,6),(8,0,7),(9,4,8),(10,0,50),(11,10,51),(12,10,52),(13,10,53),(14,0,57),(15,14,58),(16,0,61),(17,0,62),(18,0,42),(19,17,65),(20,17,66),(21,17,67),(22,17,68),(23,4,23),(24,4,24),(25,4,25),(26,4,26),(27,4,27),(28,4,28),(29,4,29),(30,4,30),(31,4,31),(32,4,32),(33,4,33),(34,4,34),(35,4,35),(36,4,36),(37,4,37),(38,0,39),(39,0,40),(40,0,41),(41,0,43),(42,41,44),(43,41,45),(44,41,46),(45,41,47),(46,41,48),(47,41,49),(48,41,50),(49,0,55);
/*!40000 ALTER TABLE `table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_content`
--

DROP TABLE IF EXISTS `taxon_concept_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_content` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_content`
--

LOCK TABLES `taxon_concept_content` WRITE;
/*!40000 ALTER TABLE `taxon_concept_content` DISABLE KEYS */;
INSERT INTO `taxon_concept_content` VALUES (7,0,0,0,0,0,0,0,0,0,4,0),(8,0,0,0,0,0,0,0,0,0,4,0),(9,0,0,0,0,0,0,0,0,0,4,0),(10,0,0,0,0,0,0,0,0,0,4,0),(11,0,0,0,0,0,0,0,0,0,4,0),(12,0,0,0,0,0,0,0,0,0,4,0),(13,0,0,0,0,0,0,0,0,0,4,0),(14,0,0,0,0,0,0,0,0,0,4,0),(15,0,0,0,0,0,0,0,0,0,4,0),(16,0,0,0,0,0,0,0,0,0,4,0),(17,0,0,0,0,0,0,0,0,0,4,0),(18,0,0,0,0,0,0,0,0,0,4,0),(20,0,0,0,0,0,0,0,0,0,4,0),(21,0,0,0,0,0,0,0,0,0,4,0),(22,0,0,0,0,0,0,0,0,0,4,0),(23,0,0,0,0,0,0,0,0,0,4,0),(24,0,0,0,0,0,0,0,0,0,4,0),(25,0,0,0,0,0,0,0,0,0,4,0),(26,0,0,0,0,0,0,0,0,0,4,0),(27,0,0,0,0,0,0,0,0,0,4,0),(28,0,0,0,0,0,0,0,0,0,4,0),(29,0,0,0,0,0,0,0,0,0,4,0),(30,0,0,0,0,0,0,0,0,0,4,0),(31,0,0,0,0,0,0,0,0,0,4,0),(32,0,0,0,0,0,0,0,0,0,4,0),(33,0,0,0,0,0,0,0,0,0,4,0),(281,0,0,0,0,0,0,0,0,0,4,0),(699,0,0,0,0,0,0,0,0,0,4,0),(3352,0,0,0,0,0,0,0,0,0,4,0),(3594,0,0,0,0,0,0,0,0,0,4,0),(5559,0,0,0,0,0,0,0,0,0,4,0),(6747,0,0,0,0,0,0,0,0,0,4,0),(7160,0,0,0,0,0,0,0,0,0,4,0),(7676,0,0,0,0,0,0,0,0,0,4,0),(14031,0,0,0,0,0,0,0,0,0,4,0),(14460,0,0,0,0,0,0,0,0,0,4,0),(18878,0,0,0,0,0,0,0,0,0,4,0),(49148,0,0,0,0,0,0,0,0,0,4,0),(89513,0,0,0,0,0,0,0,0,0,4,0),(328607,0,0,0,0,0,0,0,0,0,4,0),(491753,0,0,0,0,0,0,0,0,0,4,0),(910093,0,0,0,0,0,0,0,0,0,4,0),(921737,0,0,0,0,0,0,0,0,0,4,0),(1061748,0,0,0,0,0,0,0,0,0,4,0),(2861424,0,0,0,0,0,0,0,0,0,4,0),(2866150,0,0,0,0,0,0,0,0,0,4,0),(17924149,0,0,0,0,0,0,0,0,0,4,0),(17954507,0,0,0,0,0,0,0,0,0,4,0);
/*!40000 ALTER TABLE `taxon_concept_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_exemplar_images`
--

DROP TABLE IF EXISTS `taxon_concept_exemplar_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_exemplar_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_exemplar_images`
--

LOCK TABLES `taxon_concept_exemplar_images` WRITE;
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_metrics`
--

DROP TABLE IF EXISTS `taxon_concept_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_metrics` (
  `taxon_concept_id` int(11) NOT NULL DEFAULT '0',
  `image_total` mediumint(9) DEFAULT NULL,
  `image_trusted` mediumint(9) DEFAULT NULL,
  `image_untrusted` mediumint(9) DEFAULT NULL,
  `image_unreviewed` mediumint(9) DEFAULT NULL,
  `image_total_words` mediumint(9) DEFAULT NULL,
  `image_trusted_words` mediumint(9) DEFAULT NULL,
  `image_untrusted_words` mediumint(9) DEFAULT NULL,
  `image_unreviewed_words` mediumint(9) DEFAULT NULL,
  `text_total` mediumint(9) DEFAULT NULL,
  `text_trusted` mediumint(9) DEFAULT NULL,
  `text_untrusted` mediumint(9) DEFAULT NULL,
  `text_unreviewed` mediumint(9) DEFAULT NULL,
  `text_total_words` mediumint(9) DEFAULT NULL,
  `text_trusted_words` mediumint(9) DEFAULT NULL,
  `text_untrusted_words` mediumint(9) DEFAULT NULL,
  `text_unreviewed_words` mediumint(9) DEFAULT NULL,
  `video_total` mediumint(9) DEFAULT NULL,
  `video_trusted` mediumint(9) DEFAULT NULL,
  `video_untrusted` mediumint(9) DEFAULT NULL,
  `video_unreviewed` mediumint(9) DEFAULT NULL,
  `video_total_words` mediumint(9) DEFAULT NULL,
  `video_trusted_words` mediumint(9) DEFAULT NULL,
  `video_untrusted_words` mediumint(9) DEFAULT NULL,
  `video_unreviewed_words` mediumint(9) DEFAULT NULL,
  `sound_total` mediumint(9) DEFAULT NULL,
  `sound_trusted` mediumint(9) DEFAULT NULL,
  `sound_untrusted` mediumint(9) DEFAULT NULL,
  `sound_unreviewed` mediumint(9) DEFAULT NULL,
  `sound_total_words` mediumint(9) DEFAULT NULL,
  `sound_trusted_words` mediumint(9) DEFAULT NULL,
  `sound_untrusted_words` mediumint(9) DEFAULT NULL,
  `sound_unreviewed_words` mediumint(9) DEFAULT NULL,
  `flash_total` mediumint(9) DEFAULT NULL,
  `flash_trusted` mediumint(9) DEFAULT NULL,
  `flash_untrusted` mediumint(9) DEFAULT NULL,
  `flash_unreviewed` mediumint(9) DEFAULT NULL,
  `flash_total_words` mediumint(9) DEFAULT NULL,
  `flash_trusted_words` mediumint(9) DEFAULT NULL,
  `flash_untrusted_words` mediumint(9) DEFAULT NULL,
  `flash_unreviewed_words` mediumint(9) DEFAULT NULL,
  `youtube_total` mediumint(9) DEFAULT NULL,
  `youtube_trusted` mediumint(9) DEFAULT NULL,
  `youtube_untrusted` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed` mediumint(9) DEFAULT NULL,
  `youtube_total_words` mediumint(9) DEFAULT NULL,
  `youtube_trusted_words` mediumint(9) DEFAULT NULL,
  `youtube_untrusted_words` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed_words` mediumint(9) DEFAULT NULL,
  `iucn_total` tinyint(3) DEFAULT NULL,
  `iucn_trusted` tinyint(3) DEFAULT NULL,
  `iucn_untrusted` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed` tinyint(3) DEFAULT NULL,
  `iucn_total_words` tinyint(3) DEFAULT NULL,
  `iucn_trusted_words` tinyint(3) DEFAULT NULL,
  `iucn_untrusted_words` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed_words` tinyint(3) DEFAULT NULL,
  `data_object_references` smallint(6) DEFAULT NULL,
  `info_items` smallint(6) DEFAULT NULL,
  `BHL_publications` smallint(6) DEFAULT NULL,
  `content_partners` smallint(6) DEFAULT NULL,
  `outlinks` smallint(6) DEFAULT NULL,
  `has_GBIF_map` tinyint(1) DEFAULT NULL,
  `has_biomedical_terms` tinyint(1) DEFAULT NULL,
  `user_submitted_text` smallint(6) DEFAULT NULL,
  `submitted_text_providers` smallint(6) DEFAULT NULL,
  `common_names` smallint(6) DEFAULT NULL,
  `common_name_providers` smallint(6) DEFAULT NULL,
  `synonyms` smallint(6) DEFAULT NULL,
  `synonym_providers` smallint(6) DEFAULT NULL,
  `page_views` mediumint(9) DEFAULT NULL,
  `unique_page_views` mediumint(9) DEFAULT NULL,
  `richness_score` float DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_metrics`
--

LOCK TABLES `taxon_concept_metrics` WRITE;
/*!40000 ALTER TABLE `taxon_concept_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_names`
--

DROP TABLE IF EXISTS `taxon_concept_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_names` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  `source_hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'recommended; if the name came from a certain hierarchy entry or its associated synonyms, the id of the entry will be listed here. This can be used to track down the source or attribution for a given name',
  `language_id` int(10) unsigned NOT NULL,
  `vern` tinyint(3) unsigned NOT NULL COMMENT 'boolean; if this is a common name, set this field to 1',
  `preferred` tinyint(3) unsigned NOT NULL,
  `synonym_id` int(11) NOT NULL DEFAULT '0',
  `vetted_id` int(11) DEFAULT '0',
  PRIMARY KEY (`taxon_concept_id`,`name_id`,`source_hierarchy_entry_id`,`language_id`,`synonym_id`),
  KEY `vern` (`vern`),
  KEY `name_id` (`name_id`),
  KEY `source_hierarchy_entry_id` (`source_hierarchy_entry_id`),
  KEY `index_taxon_concept_names_on_synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_names`
--

LOCK TABLES `taxon_concept_names` WRITE;
/*!40000 ALTER TABLE `taxon_concept_names` DISABLE KEYS */;
INSERT INTO `taxon_concept_names` VALUES (7,2,2,4,0,1,1,1),(7,3,2,1,1,1,2,1),(7,35,24,4,0,1,0,4),(7,36,24,1,1,1,0,4),(8,4,3,4,0,1,3,1),(8,5,3,1,1,1,4,1),(9,6,4,4,0,1,5,1),(9,7,4,1,1,1,6,1),(10,8,5,4,0,1,7,1),(10,9,5,1,1,1,8,1),(11,10,6,4,0,1,9,1),(11,11,6,1,1,1,10,1),(12,12,7,4,0,1,11,1),(12,13,7,1,1,1,12,1),(13,14,8,4,0,1,13,1),(13,15,8,1,1,1,14,1),(13,16,8,1,1,0,15,1),(13,17,8,1,1,0,16,1),(13,18,8,1,1,0,17,1),(13,19,8,1,1,0,18,1),(13,20,8,1,1,0,19,1),(14,11,9,1,1,1,21,1),(14,21,9,4,0,1,20,1),(15,22,10,4,0,1,22,1),(16,23,11,4,0,1,23,1),(16,24,11,1,1,1,24,1),(17,25,12,4,0,1,26,1),(17,26,12,1,1,1,25,1),(18,27,13,4,0,1,27,1),(20,33,23,4,0,1,33,1),(20,34,23,1,1,1,32,1),(21,37,25,4,0,1,35,1),(21,38,25,1,1,1,34,1),(22,39,26,4,0,1,37,1),(22,40,26,1,1,1,36,1),(23,41,27,4,0,1,39,1),(23,42,27,1,1,1,38,1),(24,43,28,4,0,1,41,1),(24,44,28,1,1,1,40,1),(25,45,29,4,0,1,43,1),(25,46,29,1,1,1,42,1),(26,47,30,4,0,1,45,1),(26,48,30,1,1,1,44,1),(27,49,31,4,0,1,47,1),(27,50,31,1,1,1,46,1),(28,51,32,4,0,1,49,1),(28,52,32,1,1,1,48,1),(29,53,33,4,0,1,50,1),(29,54,33,1,1,1,51,1),(29,55,33,1,1,0,52,1),(29,56,33,1,1,0,53,1),(29,57,33,1,1,0,54,1),(29,58,33,6,1,1,55,1),(29,59,33,6,1,0,56,1),(29,60,33,6,1,0,57,1),(29,61,33,2,1,1,58,1),(29,62,33,2,1,0,59,1),(29,63,33,2,1,0,60,1),(29,64,33,4,0,0,61,1),(30,65,34,4,0,1,63,1),(30,66,34,1,1,1,62,1),(31,67,35,4,0,1,65,1),(31,68,35,1,1,1,64,1),(32,69,36,4,0,1,67,1),(32,70,36,1,1,1,66,1),(33,71,37,4,0,1,69,1),(33,72,37,1,1,1,68,1),(281,76,40,4,0,1,74,1),(281,77,40,1,1,1,73,1),(699,92,51,4,0,1,89,1),(3352,75,39,4,0,1,72,1),(3594,82,45,4,0,1,79,1),(5559,73,38,4,0,1,71,1),(5559,74,38,1,1,1,70,1),(6747,88,49,4,0,1,86,1),(6747,89,49,1,1,1,85,1),(7160,80,43,4,0,1,77,1),(7676,84,47,4,0,1,82,1),(7676,85,47,1,1,1,81,1),(14031,90,50,4,0,1,88,1),(14031,91,50,1,1,1,87,1),(14460,86,48,4,0,1,84,1),(14460,87,48,1,1,1,83,1),(18878,79,42,4,0,1,76,1),(49148,93,52,4,0,1,90,1),(89513,83,46,4,0,1,80,1),(328607,87,56,1,1,1,96,1),(328607,99,56,4,0,1,97,1),(491753,102,58,4,0,1,100,1),(910093,29,16,4,0,1,31,1),(910093,30,16,1,1,1,28,1),(910093,31,16,1,1,0,29,1),(910093,32,16,1,1,0,30,1),(921737,98,55,4,0,1,95,1),(1061748,100,57,4,0,1,99,1),(1061748,101,57,1,1,1,98,1),(2861424,78,41,4,0,1,75,1),(2866150,94,53,4,0,1,92,1),(2866150,95,53,1,1,1,91,1),(17924149,96,54,4,0,1,94,1),(17924149,97,54,1,1,1,93,1),(17954507,81,44,4,0,1,78,1);
/*!40000 ALTER TABLE `taxon_concept_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_stats`
--

DROP TABLE IF EXISTS `taxon_concept_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_stats`
--

LOCK TABLES `taxon_concept_stats` WRITE;
/*!40000 ALTER TABLE `taxon_concept_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts`
--

DROP TABLE IF EXISTS `taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supercedure_id` int(10) unsigned NOT NULL COMMENT 'if concepts are at first thought to be distinct, there will be two concepts with two different ids. When they are confirmed to be the same one will be superceded by the other, and that replacement is kept track of so that older URLs can be redirected to t',
  `split_from` int(10) unsigned NOT NULL,
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from untrusted resources and are left untrusted until the resources become trusted',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from resource left unpublished until the resource becomes published',
  PRIMARY KEY (`id`),
  KEY `supercedure_id` (`supercedure_id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='This table is poorly named. Used to group similar hierarchy ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts`
--

LOCK TABLES `taxon_concepts` WRITE;
/*!40000 ALTER TABLE `taxon_concepts` DISABLE KEYS */;
INSERT INTO `taxon_concepts` VALUES (1,0,0,4,1),(7,0,0,4,1),(8,0,0,4,1),(9,0,0,4,1),(10,0,0,4,1),(11,0,0,4,1),(12,0,0,4,1),(13,0,0,2,1),(14,0,0,1,1),(15,0,0,4,1),(16,0,0,4,1),(17,0,0,4,1),(18,0,0,4,1),(20,0,0,4,1),(21,0,0,4,1),(22,0,0,4,1),(23,0,0,4,1),(24,0,0,4,1),(25,0,0,4,1),(26,0,0,4,1),(27,0,0,4,1),(28,0,0,4,1),(29,0,0,4,1),(30,0,0,4,1),(31,0,0,4,1),(32,0,0,4,1),(33,0,0,4,1),(281,0,0,4,1),(699,0,0,4,1),(3352,0,0,4,1),(3594,0,0,4,1),(5559,0,0,4,1),(6747,0,0,4,1),(7160,0,0,4,1),(7676,0,0,4,1),(14031,0,0,4,1),(14460,0,0,4,1),(18878,0,0,4,1),(49148,0,0,4,1),(89513,0,0,4,1),(328607,0,0,4,1),(491753,0,0,4,1),(910093,0,0,4,1),(921737,0,0,4,1),(1061748,0,0,4,1),(2861424,0,0,4,1),(2866150,0,0,4,1),(17924149,0,0,4,1),(17954507,0,0,4,1);
/*!40000 ALTER TABLE `taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts_flattened`
--

DROP TABLE IF EXISTS `taxon_concepts_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts_flattened` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts_flattened`
--

LOCK TABLES `taxon_concepts_flattened` WRITE;
/*!40000 ALTER TABLE `taxon_concepts_flattened` DISABLE KEYS */;
INSERT INTO `taxon_concepts_flattened` VALUES (7,20),(8,7),(9,7),(9,8),(10,7),(10,8),(10,9),(11,7),(11,8),(11,9),(11,10),(12,7),(12,8),(12,9),(12,10),(12,11),(13,7),(13,8),(13,9),(13,10),(13,11),(14,7),(14,8),(14,9),(14,10),(14,11),(15,7),(15,8),(15,9),(15,10),(15,11),(16,7),(16,8),(16,9),(16,10),(16,11),(17,7),(17,8),(17,9),(17,10),(17,11),(21,7),(21,20),(22,7),(22,20),(23,7),(23,20),(23,22),(24,7),(24,20),(24,22),(25,7),(25,20),(25,22),(25,24),(26,7),(26,20),(26,22),(26,24),(27,7),(27,20),(27,22),(27,24),(27,26),(28,7),(28,20),(28,22),(28,24),(28,26),(30,29),(31,29),(31,30),(32,29),(32,30),(32,31),(33,29),(33,30),(33,31),(33,32),(699,1),(3594,3352),(6747,281),(7160,1),(7676,1),(14031,281),(14031,6747),(14460,1),(14460,7676),(18878,5559),(18878,2861424),(49148,1),(49148,699),(89513,3352),(89513,3594),(328607,1),(328607,7676),(328607,14460),(491753,1),(491753,699),(491753,49148),(921737,3352),(921737,3594),(921737,89513),(1061748,281),(1061748,6747),(1061748,14031),(2861424,5559),(2866150,5559),(2866150,18878),(2866150,2861424),(17924149,1),(17924149,7160),(17924149,17954507),(17954507,1),(17954507,7160);
/*!40000 ALTER TABLE `taxon_concepts_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_items`
--

DROP TABLE IF EXISTS `title_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publication_title_id` int(10) unsigned NOT NULL,
  `bar_code` varchar(50) NOT NULL,
  `marc_item_id` varchar(50) NOT NULL,
  `call_number` varchar(100) NOT NULL,
  `volume_info` varchar(100) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'url for the description page for this item',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Publications can have different volumes, versi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_items`
--

LOCK TABLES `title_items` WRITE;
/*!40000 ALTER TABLE `title_items` DISABLE KEYS */;
INSERT INTO `title_items` VALUES (1,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(2,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(3,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(4,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(5,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(6,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(7,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(8,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(9,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(10,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(11,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(12,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(13,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(14,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(15,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(16,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(17,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(18,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(19,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(20,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(21,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(22,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(23,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(24,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(25,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(26,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(27,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(28,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(29,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(30,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(31,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(32,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(33,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(34,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(35,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(36,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(37,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(38,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(39,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(40,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(41,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(42,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(43,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(44,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(45,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(46,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(47,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(48,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(49,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(50,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(51,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(52,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(53,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(54,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(55,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(56,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(57,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(58,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(59,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(60,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(61,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(62,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(63,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(64,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(65,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(66,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(67,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(68,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(69,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(70,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(71,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(72,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(73,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(74,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(75,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(76,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(77,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(78,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(79,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(80,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(81,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(82,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(83,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(84,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(85,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(86,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(87,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(88,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(89,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(90,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(91,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(92,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(93,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(94,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(95,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(96,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(97,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(98,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(99,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(100,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(101,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(102,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(103,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(104,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(105,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(106,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(107,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(108,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(109,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(110,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(111,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(112,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(113,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(114,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(115,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(116,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(117,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(118,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(119,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(120,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(121,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(122,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(123,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(124,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(125,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(126,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(127,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(128,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(129,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(130,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(131,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(132,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting');
/*!40000 ALTER TABLE `title_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_concept_images`
--

DROP TABLE IF EXISTS `top_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_concept_images`
--

LOCK TABLES `top_concept_images` WRITE;
/*!40000 ALTER TABLE `top_concept_images` DISABLE KEYS */;
INSERT INTO `top_concept_images` VALUES (7,2,1),(7,3,1),(8,11,1),(8,12,1),(9,20,1),(9,21,1),(10,29,1),(10,30,1),(11,38,1),(11,39,1),(12,47,1),(12,48,1),(12,49,1),(12,50,1),(12,51,1),(12,52,1),(12,53,1),(12,54,1),(12,55,1),(16,66,1),(16,67,1),(16,68,1),(16,69,1),(16,70,1),(16,71,1),(16,72,1),(16,73,1),(16,74,1),(17,91,1),(18,92,1),(18,93,1),(18,100,1),(20,110,1),(20,111,1),(21,119,1),(21,120,1),(22,128,1),(22,129,1),(23,137,1),(23,138,1),(24,146,1),(24,147,1),(25,155,1),(25,156,1),(26,164,1),(26,165,1),(27,173,1),(27,174,1),(28,182,1),(28,183,1),(29,191,1),(29,192,1),(30,200,1),(30,201,1),(31,209,1),(31,210,1),(32,218,1),(32,219,1),(33,227,1),(33,228,1),(328607,284,1),(328607,285,1),(328607,286,1),(328607,287,1),(491753,296,1),(491753,297,1),(491753,298,1),(491753,299,1),(910093,101,1),(910093,102,1),(921737,280,1),(921737,281,1),(1061748,290,1),(1061748,291,1),(1061748,292,1),(1061748,293,1),(2866150,266,1),(2866150,267,1),(2866150,268,1),(2866150,269,1),(17924149,276,1),(17924149,277,1);
/*!40000 ALTER TABLE `top_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_images`
--

DROP TABLE IF EXISTS `top_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_images`
--

LOCK TABLES `top_images` WRITE;
/*!40000 ALTER TABLE `top_images` DISABLE KEYS */;
INSERT INTO `top_images` VALUES (2,2,1),(2,3,1),(3,11,1),(3,12,1),(4,20,1),(4,21,1),(5,29,1),(5,30,1),(6,38,1),(6,39,1),(7,47,1),(7,48,1),(7,49,1),(7,50,1),(7,51,1),(7,52,1),(7,53,1),(7,54,1),(7,55,1),(11,66,1),(11,67,1),(11,68,1),(11,69,1),(11,70,1),(11,71,1),(11,72,1),(11,73,1),(11,74,1),(12,91,1),(13,92,1),(13,93,1),(14,100,1),(16,101,1),(16,102,1),(23,110,1),(23,111,1),(25,119,1),(25,120,1),(26,128,1),(26,129,1),(27,137,1),(27,138,1),(28,146,1),(28,147,1),(29,155,1),(29,156,1),(30,164,1),(30,165,1),(31,173,1),(31,174,1),(32,182,1),(32,183,1),(33,191,1),(33,192,1),(34,200,1),(34,201,1),(35,209,1),(35,210,1),(36,218,1),(36,219,1),(37,227,1),(37,228,1),(53,266,1),(53,267,1),(53,268,1),(53,269,1),(54,276,1),(54,277,1),(55,280,1),(55,281,1),(56,284,1),(56,285,1),(56,286,1),(56,287,1),(57,290,1),(57,291,1),(57,292,1),(57,293,1),(58,296,1),(58,297,1),(58,298,1),(58,299,1);
/*!40000 ALTER TABLE `top_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_species_images`
--

DROP TABLE IF EXISTS `top_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_species_images`
--

LOCK TABLES `top_species_images` WRITE;
/*!40000 ALTER TABLE `top_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_concept_images`
--

DROP TABLE IF EXISTS `top_unpublished_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_concept_images`
--

LOCK TABLES `top_unpublished_concept_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_concept_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_images`
--

DROP TABLE IF EXISTS `top_unpublished_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_images`
--

LOCK TABLES `top_unpublished_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_species_images`
--

DROP TABLE IF EXISTS `top_unpublished_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_species_images`
--

LOCK TABLES `top_unpublished_species_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_agent_roles`
--

DROP TABLE IF EXISTS `translated_agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_agent_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_role_id` (`agent_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_agent_roles`
--

LOCK TABLES `translated_agent_roles` WRITE;
/*!40000 ALTER TABLE `translated_agent_roles` DISABLE KEYS */;
INSERT INTO `translated_agent_roles` VALUES (1,1,1,'Author',NULL),(2,2,1,'Photographer',NULL),(3,3,1,'Contributor',NULL),(4,4,1,'Source',NULL),(5,5,1,'Source Database',NULL),(6,6,1,'Animator',NULL),(7,7,1,'Compiler',NULL),(8,8,1,'Composer',NULL),(9,9,1,'Creator',NULL),(10,10,1,'Director',NULL),(11,11,1,'Editor',NULL),(12,12,1,'Illustrator',NULL),(13,13,1,'Project',NULL),(14,14,1,'Publisher',NULL),(15,15,1,'Recorder',NULL),(16,16,1,'Contact Person',NULL);
/*!40000 ALTER TABLE `translated_agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_audiences`
--

DROP TABLE IF EXISTS `translated_audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_id` (`audience_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_audiences`
--

LOCK TABLES `translated_audiences` WRITE;
/*!40000 ALTER TABLE `translated_audiences` DISABLE KEYS */;
INSERT INTO `translated_audiences` VALUES (1,1,1,'Children',NULL),(2,2,1,'Expert users',NULL),(3,3,1,'General public',NULL);
/*!40000 ALTER TABLE `translated_audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_collection_types`
--

DROP TABLE IF EXISTS `translated_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_collection_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_type_id` (`collection_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_collection_types`
--

LOCK TABLES `translated_collection_types` WRITE;
/*!40000 ALTER TABLE `translated_collection_types` DISABLE KEYS */;
INSERT INTO `translated_collection_types` VALUES (1,1,1,'Links',NULL),(2,2,1,'Literature',NULL),(3,3,1,'Images',NULL),(4,4,1,'Specimen',NULL),(5,5,1,'Natural',NULL),(6,6,1,'Species Pages',NULL),(7,7,1,'Molecular',NULL),(8,8,1,'Novice',NULL),(9,9,1,'Expert',NULL),(10,10,1,'Marine',NULL),(11,11,1,'Bugs',NULL);
/*!40000 ALTER TABLE `translated_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_roles`
--

DROP TABLE IF EXISTS `translated_contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_contact_role_id` (`contact_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_roles`
--

LOCK TABLES `translated_contact_roles` WRITE;
/*!40000 ALTER TABLE `translated_contact_roles` DISABLE KEYS */;
INSERT INTO `translated_contact_roles` VALUES (1,1,1,'Primary Contact',NULL),(2,2,1,'Administrative Contact',NULL),(3,3,1,'Technical Contact',NULL);
/*!40000 ALTER TABLE `translated_contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_subjects`
--

DROP TABLE IF EXISTS `translated_contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `phonetic_action_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_subject_id` (`contact_subject_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_subjects`
--

LOCK TABLES `translated_contact_subjects` WRITE;
/*!40000 ALTER TABLE `translated_contact_subjects` DISABLE KEYS */;
INSERT INTO `translated_contact_subjects` VALUES (1,1,1,'Media Contact',NULL);
/*!40000 ALTER TABLE `translated_contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_page_archives`
--

DROP TABLE IF EXISTS `translated_content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translated_content_page_id` int(11) DEFAULT NULL,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `original_creation_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_page_archives`
--

LOCK TABLES `translated_content_page_archives` WRITE;
/*!40000 ALTER TABLE `translated_content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_pages`
--

DROP TABLE IF EXISTS `translated_content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active_translation` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_pages`
--

LOCK TABLES `translated_content_pages` WRITE;
/*!40000 ALTER TABLE `translated_content_pages` DISABLE KEYS */;
INSERT INTO `translated_content_pages` VALUES (1,1,1,'Home','<h3>This is Left Content in a Home</h3>','<h1>Main Content for Home ROCKS!</h1>','keywords for Home','description for Home','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(2,2,1,'Who We Are','<h3>This is Left Content in a Who We Are</h3>','<h1>Main Content for Who We Are ROCKS!</h1>','keywords for Who We Are','description for Who We Are','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(3,3,1,'Working Groups','<h3>This is Left Content in a Working Groups</h3>','<h1>Main Content for Working Groups ROCKS!</h1>','keywords for Working Groups','description for Working Groups','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(4,4,1,'Working Group A','<h3>This is Left Content in a Working Group A</h3>','<h1>Main Content for Working Group A ROCKS!</h1>','keywords for Working Group A','description for Working Group A','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(5,5,1,'Working Group B','<h3>This is Left Content in a Working Group B</h3>','<h1>Main Content for Working Group B ROCKS!</h1>','keywords for Working Group B','description for Working Group B','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(6,6,1,'Working Group C','<h3>This is Left Content in a Working Group C</h3>','<h1>Main Content for Working Group C ROCKS!</h1>','keywords for Working Group C','description for Working Group C','2011-09-13 07:27:06','2011-09-13 07:27:06',NULL),(7,7,1,'Working Group D','<h3>This is Left Content in a Working Group D</h3>','<h1>Main Content for Working Group D ROCKS!</h1>','keywords for Working Group D','description for Working Group D','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(8,8,1,'Working Group E','<h3>This is Left Content in a Working Group E</h3>','<h1>Main Content for Working Group E ROCKS!</h1>','keywords for Working Group E','description for Working Group E','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(9,9,1,'Contact Us','<h3>This is Left Content in a Contact Us</h3>','<h1>Main Content for Contact Us ROCKS!</h1>','keywords for Contact Us','description for Contact Us','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(10,10,1,'Screencasts','<h3>This is Left Content in a Screencasts</h3>','<h1>Main Content for Screencasts ROCKS!</h1>','keywords for Screencasts','description for Screencasts','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(11,11,1,'Press Releases','<h3>This is Left Content in a Press Releases</h3>','<h1>Main Content for Press Releases ROCKS!</h1>','keywords for Press Releases','description for Press Releases','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(12,12,1,'Terms Of Use','<h3>This is Left Content in a Terms Of Use</h3>','<h1>Main Content for Terms Of Use ROCKS!</h1>','keywords for Terms Of Use','description for Terms Of Use','2011-09-13 07:27:07','2011-09-13 07:27:07',NULL),(13,13,1,'Curator central','','<h1>Main Content for Curator central ROCKS!</h1>','keywords for Curator central','description for Curator central','2011-09-13 07:29:10','2011-09-13 07:29:10',NULL);
/*!40000 ALTER TABLE `translated_content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_partner_statuses`
--

DROP TABLE IF EXISTS `translated_content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_partner_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_status_id` (`content_partner_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_partner_statuses`
--

LOCK TABLES `translated_content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `translated_content_partner_statuses` DISABLE KEYS */;
INSERT INTO `translated_content_partner_statuses` VALUES (1,1,1,'Active',NULL),(2,2,1,'Archived',NULL),(3,3,1,'Pending',NULL);
/*!40000 ALTER TABLE `translated_content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_tables`
--

DROP TABLE IF EXISTS `translated_content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_table_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_tables`
--

LOCK TABLES `translated_content_tables` WRITE;
/*!40000 ALTER TABLE `translated_content_tables` DISABLE KEYS */;
INSERT INTO `translated_content_tables` VALUES (1,1,1,'Details',''),(2,2,1,'Details','');
/*!40000 ALTER TABLE `translated_content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_data_types`
--

DROP TABLE IF EXISTS `translated_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_data_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_type_id` (`data_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_data_types`
--

LOCK TABLES `translated_data_types` WRITE;
/*!40000 ALTER TABLE `translated_data_types` DISABLE KEYS */;
INSERT INTO `translated_data_types` VALUES (1,1,1,'Image',NULL),(2,2,1,'Sound',NULL),(3,3,1,'Text',NULL),(4,4,1,'Video',NULL),(5,5,1,'GBIF Image',NULL),(6,6,1,'IUCN',NULL),(7,7,1,'Flash',NULL),(8,8,1,'YouTube',NULL),(9,9,1,'Map',NULL);
/*!40000 ALTER TABLE `translated_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_info_items`
--

DROP TABLE IF EXISTS `translated_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_info_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_item_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `info_item_id` (`info_item_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_info_items`
--

LOCK TABLES `translated_info_items` WRITE;
/*!40000 ALTER TABLE `translated_info_items` DISABLE KEYS */;
INSERT INTO `translated_info_items` VALUES (1,1,1,'TaxonBiology',NULL),(2,2,1,'GeneralDescription',NULL),(3,3,1,'Distribution',NULL),(4,4,1,'Habitat',NULL),(5,5,1,'Morphology',NULL),(6,6,1,'Conservation',NULL),(7,7,1,'Uses',NULL),(8,8,1,'Education',NULL),(9,9,1,'IdentificationResources',NULL),(10,10,1,'Associations',NULL),(11,11,1,'Behaviour',NULL),(12,12,1,'ConservationStatus',NULL),(13,13,1,'Cyclicity',NULL),(14,14,1,'Cytology',NULL),(15,15,1,'DiagnosticDescription',NULL),(16,16,1,'Diseases',NULL),(17,17,1,'Dispersal',NULL),(18,18,1,'Evolution',NULL),(19,19,1,'Genetics',NULL),(20,20,1,'Growth',NULL),(21,21,1,'Legislation',NULL),(22,22,1,'LifeCycle',NULL),(23,23,1,'LifeExpectancy',NULL),(24,24,1,'LookAlikes',NULL),(25,25,1,'Management',NULL),(26,26,1,'Migration',NULL),(27,27,1,'MolecularBiology',NULL),(28,28,1,'Physiology',NULL),(29,29,1,'PopulationBiology',NULL),(30,30,1,'Procedures',NULL),(31,31,1,'Reproduction',NULL),(32,32,1,'RiskStatement',NULL),(33,33,1,'Size',NULL),(34,34,1,'Threats',NULL),(35,35,1,'Trends',NULL),(36,36,1,'TrophicStrategy',NULL);
/*!40000 ALTER TABLE `translated_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_languages`
--

DROP TABLE IF EXISTS `translated_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_language_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `original_language_id` (`original_language_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_languages`
--

LOCK TABLES `translated_languages` WRITE;
/*!40000 ALTER TABLE `translated_languages` DISABLE KEYS */;
INSERT INTO `translated_languages` VALUES (1,1,1,'English',NULL),(2,2,1,'French',NULL),(3,3,1,'Arabic',NULL),(4,4,1,'Scientific Name',NULL),(5,5,1,'Unknown',NULL),(6,6,1,'German',NULL);
/*!40000 ALTER TABLE `translated_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_licenses`
--

DROP TABLE IF EXISTS `translated_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `description` varchar(400) NOT NULL,
  `phonetic_description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_id` (`license_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_licenses`
--

LOCK TABLES `translated_licenses` WRITE;
/*!40000 ALTER TABLE `translated_licenses` DISABLE KEYS */;
INSERT INTO `translated_licenses` VALUES (1,1,1,'Some rights reserved',NULL),(2,2,1,'No rights reserved',NULL),(3,3,1,'&#169; All rights reserved',NULL),(4,4,1,'Some rights reserved',NULL),(5,5,1,'Some rights reserved',NULL),(6,6,1,'Some rights reserved',NULL),(7,7,1,'Some rights reserved',NULL),(8,8,1,'Some rights reserved',NULL),(9,9,1,'Some rights reserved',NULL),(10,10,1,'Some rights reserved',NULL),(11,11,1,'The material cannot be licensed',NULL);
/*!40000 ALTER TABLE `translated_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_mime_types`
--

DROP TABLE IF EXISTS `translated_mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_mime_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mime_type_id` (`mime_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_mime_types`
--

LOCK TABLES `translated_mime_types` WRITE;
/*!40000 ALTER TABLE `translated_mime_types` DISABLE KEYS */;
INSERT INTO `translated_mime_types` VALUES (1,1,1,'image/jpeg',NULL),(2,2,1,'audio/mpeg',NULL),(3,3,1,'text/html',NULL),(4,4,1,'text/plain',NULL),(5,5,1,'video/x-flv',NULL),(6,6,1,'video/quicktime',NULL),(7,7,1,'audio/x-ms-wma',NULL),(8,8,1,'audio/x-pn-realaudio',NULL),(9,9,1,'audio/x-realaudio',NULL),(10,10,1,'audio/x-wav',NULL),(11,11,1,'image/bmp',NULL),(12,12,1,'image/gif',NULL),(13,13,1,'image/png',NULL),(14,14,1,'image/svg+xml',NULL),(15,15,1,'image/tiff',NULL),(16,16,1,'text/richtext',NULL),(17,17,1,'text/rtf',NULL),(18,18,1,'text/xml',NULL),(19,19,1,'video/mp4',NULL),(20,20,1,'video/mpeg',NULL),(21,21,1,'video/x-ms-wmv',NULL);
/*!40000 ALTER TABLE `translated_mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_news_items`
--

DROP TABLE IF EXISTS `translated_news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_item_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `body` varchar(1500) NOT NULL,
  `phonetic_body` varchar(1500) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `phonetic_title` varchar(255) DEFAULT NULL,
  `active_translation` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_item_id` (`news_item_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_news_items`
--

LOCK TABLES `translated_news_items` WRITE;
/*!40000 ALTER TABLE `translated_news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_ranks`
--

DROP TABLE IF EXISTS `translated_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank_id` (`rank_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_ranks`
--

LOCK TABLES `translated_ranks` WRITE;
/*!40000 ALTER TABLE `translated_ranks` DISABLE KEYS */;
INSERT INTO `translated_ranks` VALUES (1,1,1,'kingdom',NULL),(2,2,1,'phylum',NULL),(3,3,1,'order',NULL),(4,4,1,'class',NULL),(5,5,1,'family',NULL),(6,6,1,'genus',NULL),(7,7,1,'species',NULL),(8,8,1,'subspecies',NULL),(9,9,1,'infraspecies',NULL),(10,10,1,'variety',NULL),(11,11,1,'form',NULL),(12,19,1,'superkingdom',NULL);
/*!40000 ALTER TABLE `translated_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_resource_statuses`
--

DROP TABLE IF EXISTS `translated_resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_status_id` int(11) NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_status_id` (`resource_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_resource_statuses`
--

LOCK TABLES `translated_resource_statuses` WRITE;
/*!40000 ALTER TABLE `translated_resource_statuses` DISABLE KEYS */;
INSERT INTO `translated_resource_statuses` VALUES (1,1,1,'Published',NULL),(2,2,1,'Uploading',NULL),(3,3,1,'Uploaded',NULL),(4,4,1,'Upload Failed',NULL),(5,5,1,'Moved to Content Server',NULL),(6,6,1,'Validated',NULL),(7,7,1,'Validation Failed',NULL),(8,8,1,'Being Processed',NULL),(9,9,1,'Processed',NULL),(10,10,1,'Processing Failed',NULL),(11,11,1,'Publish Pending',NULL),(12,12,1,'Unpublish Pending',NULL),(13,13,1,'Force Harvest',NULL);
/*!40000 ALTER TABLE `translated_resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_service_types`
--

DROP TABLE IF EXISTS `translated_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_type_id` (`service_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_service_types`
--

LOCK TABLES `translated_service_types` WRITE;
/*!40000 ALTER TABLE `translated_service_types` DISABLE KEYS */;
INSERT INTO `translated_service_types` VALUES (1,1,1,'EOL Transfer Schema',NULL);
/*!40000 ALTER TABLE `translated_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_sort_styles`
--

DROP TABLE IF EXISTS `translated_sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `sort_style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_sort_styles`
--

LOCK TABLES `translated_sort_styles` WRITE;
/*!40000 ALTER TABLE `translated_sort_styles` DISABLE KEYS */;
INSERT INTO `translated_sort_styles` VALUES (1,'Recently Added',1,1),(2,'Oldest',1,2),(3,'Alphabetical',1,3),(4,'Reverse Alphabetical',1,4),(5,'Richness',1,5),(6,'Rating',1,6);
/*!40000 ALTER TABLE `translated_sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_statuses`
--

DROP TABLE IF EXISTS `translated_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_id` (`status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_statuses`
--

LOCK TABLES `translated_statuses` WRITE;
/*!40000 ALTER TABLE `translated_statuses` DISABLE KEYS */;
INSERT INTO `translated_statuses` VALUES (1,1,1,'Inserted',NULL),(2,2,1,'Unchanged',NULL),(3,3,1,'Updated',NULL);
/*!40000 ALTER TABLE `translated_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_synonym_relations`
--

DROP TABLE IF EXISTS `translated_synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_synonym_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `synonym_relation_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `synonym_relation_id` (`synonym_relation_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_synonym_relations`
--

LOCK TABLES `translated_synonym_relations` WRITE;
/*!40000 ALTER TABLE `translated_synonym_relations` DISABLE KEYS */;
INSERT INTO `translated_synonym_relations` VALUES (1,1,1,'synonym',NULL),(2,2,1,'common name',NULL),(3,3,1,'genbank common name',NULL),(4,4,1,'acronym',NULL),(5,5,1,'anamorph',NULL),(6,6,1,'blast name',NULL),(7,7,1,'equivalent name',NULL),(8,8,1,'genbank acronym',NULL),(9,9,1,'genbank anamorph',NULL),(10,10,1,'genbank synonym',NULL),(11,11,1,'in-part',NULL),(12,12,1,'includes',NULL),(13,13,1,'misnomer',NULL),(14,14,1,'misspelling',NULL),(15,15,1,'teleomorph',NULL),(16,16,1,'ambiguous synonym',NULL),(17,17,1,'misapplied name',NULL),(18,18,1,'provisionally accepted name',NULL),(19,19,1,'accepted name',NULL),(20,20,1,'database artifact',NULL),(21,21,1,'other, see comments',NULL),(22,22,1,'orthographic variant (misspelling)',NULL),(23,23,1,'misapplied',NULL),(24,24,1,'rejected name',NULL),(25,25,1,'homonym (illegitimate)',NULL),(26,26,1,'pro parte',NULL),(27,27,1,'superfluous renaming (illegitimate)',NULL),(28,28,1,'nomen oblitum',NULL),(29,29,1,'junior synonym',NULL),(30,30,1,'unavailable, database artifact',NULL),(31,31,1,'unnecessary replacement',NULL),(32,32,1,'subsequent name/combination',NULL),(33,33,1,'unavailable, literature misspelling',NULL),(34,34,1,'original name/combination',NULL),(35,35,1,'unavailable, incorrect orig. spelling',NULL),(36,36,1,'junior homonym',NULL),(37,37,1,'homonym & junior synonym',NULL),(38,38,1,'unavailable, suppressed by ruling',NULL),(39,39,1,'unjustified emendation',NULL),(40,40,1,'unavailable, other',NULL),(41,41,1,'unavailable, nomen nudum',NULL),(42,42,1,'nomen dubium',NULL),(43,43,1,'invalidly published, other',NULL),(44,44,1,'invalidly published, nomen nudum',NULL),(45,45,1,'basionym',NULL),(46,46,1,'heterotypic synonym',NULL),(47,47,1,'homotypic synonym',NULL),(48,48,1,'unavailable name',NULL),(49,49,1,'valid name',NULL);
/*!40000 ALTER TABLE `translated_synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_table_of_contents`
--

DROP TABLE IF EXISTS `translated_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_table_of_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_of_contents_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_of_contents_id` (`table_of_contents_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_table_of_contents`
--

LOCK TABLES `translated_table_of_contents` WRITE;
/*!40000 ALTER TABLE `translated_table_of_contents` DISABLE KEYS */;
INSERT INTO `translated_table_of_contents` VALUES (1,1,1,'Overview',NULL),(2,2,1,'Brief Summary',NULL),(3,3,1,'Comprehensive Description',NULL),(4,4,1,'Description',NULL),(5,5,1,'Nucleotide Sequences',NULL),(6,6,1,'Ecology and Distribution',NULL),(7,7,1,'Distribution',NULL),(8,8,1,'Wikipedia',NULL),(9,9,1,'Identification Resources',NULL),(10,10,1,'Names and Taxonomy',NULL),(11,11,1,'Related Names',NULL),(12,12,1,'Synonyms',NULL),(13,13,1,'Common Names',NULL),(14,14,1,'Page Statistics',NULL),(15,15,1,'Content Summary',NULL),(16,16,1,'Biodiversity Heritage Library',NULL),(17,17,1,'References and More Information',NULL),(18,18,1,'Literature References',NULL),(19,19,1,'Content Partners',NULL),(20,20,1,'Biomedical Terms',NULL),(21,21,1,'Search the Web',NULL),(22,22,1,'Education',NULL),(23,23,1,'Succinct',NULL),(24,24,1,'Diagnosis of genus and species',NULL),(25,25,1,'Physical Description',NULL),(26,26,1,'Formal Description',NULL),(27,27,1,'Molecular Biology and Genetics',NULL),(28,28,1,'Phenology',NULL),(29,29,1,'Life History',NULL),(30,30,1,'Geographical Distribution',NULL),(31,31,1,'Etymology',NULL),(32,32,1,'Adult Characteristics',NULL),(33,33,1,'Comparison with Similar Species',NULL),(34,34,1,'Host, Oviposition, and Larval Feeding Habits',NULL),(35,35,1,'Type',NULL),(36,36,1,'Characteristics',NULL),(37,37,1,'General Description',NULL),(38,38,1,'Reproductive Behavior',NULL),(39,39,1,'Conservation',NULL),(40,40,1,'Evolution and Systematics',NULL),(41,41,1,'Relevance',NULL),(42,42,1,'Harmful Blooms',NULL),(43,43,1,'Relation to Humans',NULL),(44,44,1,'Toxicity, Symptoms and Treatment',NULL),(45,45,1,'Cultivation',NULL),(46,46,1,'Culture',NULL),(47,47,1,'Ethnobotany',NULL),(48,48,1,'Suppliers',NULL);
/*!40000 ALTER TABLE `translated_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_untrust_reasons`
--

DROP TABLE IF EXISTS `translated_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `untrust_reason_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `untrust_reason_id` (`untrust_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_untrust_reasons`
--

LOCK TABLES `translated_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `translated_untrust_reasons` DISABLE KEYS */;
INSERT INTO `translated_untrust_reasons` VALUES (1,1,1,'misidentified',NULL),(2,2,1,'incorrect/misleading',NULL),(3,3,1,'low quality',NULL),(4,4,1,'duplicate',NULL);
/*!40000 ALTER TABLE `translated_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_user_identities`
--

DROP TABLE IF EXISTS `translated_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_user_identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_identity_id` (`user_identity_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_user_identities`
--

LOCK TABLES `translated_user_identities` WRITE;
/*!40000 ALTER TABLE `translated_user_identities` DISABLE KEYS */;
INSERT INTO `translated_user_identities` VALUES (1,1,1,'an enthusiast'),(2,2,1,'a student'),(3,3,1,'an educator'),(4,4,1,'a citizen scientist'),(5,5,1,'a professional scientist');
/*!40000 ALTER TABLE `translated_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_vetted`
--

DROP TABLE IF EXISTS `translated_vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vetted_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vetted_id` (`vetted_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_vetted`
--

LOCK TABLES `translated_vetted` WRITE;
/*!40000 ALTER TABLE `translated_vetted` DISABLE KEYS */;
INSERT INTO `translated_vetted` VALUES (1,1,1,'Unknown',NULL),(2,2,1,'Untrusted',NULL),(3,3,1,'Inappropriate',NULL),(4,4,1,'Trusted',NULL);
/*!40000 ALTER TABLE `translated_vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_visibilities`
--

DROP TABLE IF EXISTS `translated_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visibility_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visibility_id` (`visibility_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_visibilities`
--

LOCK TABLES `translated_visibilities` WRITE;
/*!40000 ALTER TABLE `translated_visibilities` DISABLE KEYS */;
INSERT INTO `translated_visibilities` VALUES (1,1,1,'Invisible',NULL),(2,2,1,'Visible',NULL),(3,3,1,'Preview',NULL);
/*!40000 ALTER TABLE `translated_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_visitors`
--

DROP TABLE IF EXISTS `unique_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_visitors`
--

LOCK TABLES `unique_visitors` WRITE;
/*!40000 ALTER TABLE `unique_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `unique_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untrust_reasons`
--

DROP TABLE IF EXISTS `untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `class_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untrust_reasons`
--

LOCK TABLES `untrust_reasons` WRITE;
/*!40000 ALTER TABLE `untrust_reasons` DISABLE KEYS */;
INSERT INTO `untrust_reasons` VALUES (1,'2011-09-13 07:27:03','2011-09-13 07:27:24','misidentified'),(2,'2011-09-13 07:27:03','2011-09-13 07:27:24','incorrect'),(3,'2011-09-13 07:27:03','2011-09-13 07:27:24','poor'),(4,'2011-09-13 07:27:03','2011-09-13 07:27:24','duplicate');
/*!40000 ALTER TABLE `untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_identities`
--

DROP TABLE IF EXISTS `user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_identities` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sort_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_identities`
--

LOCK TABLES `user_identities` WRITE;
/*!40000 ALTER TABLE `user_identities` DISABLE KEYS */;
INSERT INTO `user_identities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areas_of_interest` varchar(255) DEFAULT NULL,
  `heard_of_eol` varchar(128) DEFAULT NULL,
  `interested_in_contributing` tinyint(1) DEFAULT NULL,
  `interested_in_curating` tinyint(1) DEFAULT NULL,
  `interested_in_advisory_forum` tinyint(1) DEFAULT NULL,
  `show_information` tinyint(1) DEFAULT NULL,
  `age_range` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_primary_role_id` int(11) DEFAULT NULL,
  `interested_in_development` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_primary_roles`
--

DROP TABLE IF EXISTS `user_primary_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_primary_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_primary_roles`
--

LOCK TABLES `user_primary_roles` WRITE;
/*!40000 ALTER TABLE `user_primary_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_primary_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_taxonomic_browser` varchar(24) DEFAULT NULL,
  `expertise` varchar(24) DEFAULT NULL,
  `remote_ip` varchar(24) DEFAULT NULL,
  `content_level` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `hashed_password` varchar(32) DEFAULT NULL,
  `flash_enabled` tinyint(1) DEFAULT NULL,
  `vetted` tinyint(1) DEFAULT NULL,
  `mailing_list` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` text,
  `curator_approved` tinyint(1) NOT NULL DEFAULT '0',
  `curator_verdict_by_id` int(11) DEFAULT NULL,
  `curator_verdict_at` datetime DEFAULT NULL,
  `credentials` text NOT NULL,
  `validation_code` varchar(255) DEFAULT '',
  `failed_login_attempts` int(11) DEFAULT '0',
  `curator_scope` text NOT NULL,
  `default_hierarchy_id` int(11) DEFAULT NULL,
  `secondary_hierarchy_id` int(11) DEFAULT NULL,
  `filter_content_by_hierarchy` tinyint(1) DEFAULT '0',
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `password_reset_token` char(40) DEFAULT NULL,
  `password_reset_token_expires_at` datetime DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  `api_key` char(40) DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `tag_line` varchar(255) DEFAULT NULL,
  `agreed_with_terms` tinyint(1) DEFAULT NULL,
  `bio` text,
  `curator_level_id` int(11) DEFAULT NULL,
  `requested_curator_level_id` int(11) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_password_reset_token` (`password_reset_token`),
  UNIQUE KEY `index_users_on_agent_id` (`agent_id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `index_users_on_created_at` (`created_at`),
  KEY `index_users_on_api_key` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'text','middle','123.45.67.15',2,'bob1@smith.com','IUCN','Jacobs',NULL,'i_jacobs','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:11','2011-09-13 07:33:02',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,1,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(2,'text','middle','123.45.67.10',2,'bob2@smith.com','Helmer','Crona',NULL,'h_crona','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:12','2011-09-13 07:33:03',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,3,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(3,'text','middle','123.45.67.18',2,'bob3@smith.com','Fiona','Parisian',NULL,'f_parisian','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:12','2011-09-13 07:33:03',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,5,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(4,'text','middle','123.45.67.17',2,'bob4@smith.com','Roxane','Connelly',NULL,'r_connelly','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:43','2011-09-13 07:33:03',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,10,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(5,'text','middle','123.45.67.17',2,'bob5@smith.com','Mariana','Runolfsson',NULL,'m_runolfsson','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:45','2011-09-13 07:33:03',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,12,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(6,'text','middle','123.45.67.19',2,'bob6@smith.com','Joshuah','Ernser',NULL,'j_ernser','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:27:45','2011-09-13 07:33:09',NULL,1,5,'2011-09-11 07:27:45','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,13,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(7,'text','middle','123.45.67.15',2,'bob7@smith.com','Antonia','Nolan',NULL,'a_nolan','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:53','2011-09-13 07:33:09',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,14,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(8,'text','middle','123.45.67.15',2,'bob8@smith.com','Eugene','Mosciski',NULL,'e_mosciski','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:27:53','2011-09-13 07:33:09',NULL,1,7,'2011-09-11 07:27:53','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,15,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(9,'text','middle','123.45.67.14',2,'bob9@smith.com','Kaitlin','Larkin',NULL,'k_larkin','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:27:59','2011-09-13 07:33:09',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,16,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(10,'text','middle','123.45.67.13',2,'bob10@smith.com','Otho','Willms',NULL,'o_willms','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:27:59','2011-09-13 07:33:09',NULL,1,9,'2011-09-11 07:27:59','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,17,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(11,'text','middle','123.45.67.14',2,'bob11@smith.com','Camila','Deckow',NULL,'c_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:05','2011-09-13 07:33:09',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,18,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(12,'text','middle','123.45.67.17',2,'bob12@smith.com','Colt','Stracke',NULL,'c_stracke','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:05','2011-09-13 07:33:09',NULL,1,11,'2011-09-11 07:28:05','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,19,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(13,'text','middle','123.45.67.12',2,'bob13@smith.com','Mathew','Deckow',NULL,'m_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:11','2011-09-13 07:33:09',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,20,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(14,'text','middle','123.45.67.19',2,'bob14@smith.com','Electa','Na',NULL,'e_na','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:11','2011-09-13 07:33:09',NULL,1,13,'2011-09-11 07:28:11','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,21,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(15,'text','middle','123.45.67.16',2,'bob15@smith.com','Damaris','Torphy',NULL,'d_torphy','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:17','2011-09-13 07:33:09',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,22,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(16,'text','middle','123.45.67.17',2,'bob16@smith.com','Aidan','Mills',NULL,'a_mills','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:17','2011-09-13 07:33:10',NULL,1,15,'2011-09-11 07:28:17','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,23,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(17,'text','middle','123.45.67.15',2,'bob16@smith.com','Dora','Pollich',NULL,'d_pollich','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:27','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,24,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(18,'text','middle','123.45.67.11',2,'bob17@smith.com','Emmanuelle','Beatty',NULL,'e_beatty','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:30','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,25,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(19,'text','middle','123.45.67.15',2,'bob18@smith.com','Sam','Hettinger',NULL,'s_hettinger','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:30','2011-09-13 07:33:10',NULL,1,18,'2011-09-11 07:28:30','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,26,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(20,'text','middle','123.45.67.14',2,'bob19@smith.com','Betty','Okuneva',NULL,'b_okuneva','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:33','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,27,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(21,'text','middle','123.45.67.14',2,'bob20@smith.com','Reuben','Olson',NULL,'r_olson','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:33','2011-09-13 07:33:10',NULL,1,20,'2011-09-11 07:28:33','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,28,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(22,'text','middle','123.45.67.16',2,'bob21@smith.com','Ashley','West',NULL,'a_west','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:34','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,29,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(23,'text','middle','123.45.67.10',2,'bob22@smith.com','Vicente','Schowalter',NULL,'v_schowalter','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:34','2011-09-13 07:33:10',NULL,1,22,'2011-09-11 07:28:34','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,30,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(24,'text','middle','123.45.67.10',2,'bob23@smith.com','Heber','Hill',NULL,'h_hill','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:35','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,31,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(25,'text','middle','123.45.67.19',2,'bob24@smith.com','Maybell','Schneider',NULL,'m_schneider','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:36','2011-09-13 07:33:10',NULL,1,24,'2011-09-11 07:28:35','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,32,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(26,'text','middle','123.45.67.19',2,'bob25@smith.com','Okey','McCullough',NULL,'o_mccullough','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:45','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,33,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(27,'text','middle','123.45.67.14',2,'bob26@smith.com','test','curator',NULL,'test_curator','5f4dcc3b5aa765d61d8327deb882cf99',1,1,1,1,1,'2011-09-13 07:28:46','2011-09-13 07:33:10',NULL,1,26,'2011-09-11 07:28:46','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,34,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(28,'text','middle','123.45.67.16',2,'bob27@smith.com','Leonardo','Schamberger',NULL,'l_schamberge','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:47','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,35,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(29,'text','middle','123.45.67.11',2,'bob28@smith.com','Gerhard','Bode',NULL,'g_bode','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:47','2011-09-13 07:33:10',NULL,1,28,'2011-09-11 07:28:47','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,36,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(30,'text','middle','123.45.67.16',2,'bob29@smith.com','Cicero','Stehr',NULL,'c_stehr','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:50','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,37,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(31,'text','middle','123.45.67.12',2,'bob30@smith.com','Maritza','Kuhic',NULL,'curator_for_tc','5f4dcc3b5aa765d61d8327deb882cf99',1,1,1,1,1,'2011-09-13 07:28:50','2011-09-13 07:33:10',NULL,1,30,'2011-09-11 07:28:50','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,38,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(32,'text','middle','123.45.67.14',2,'bob31@smith.com','Alvah','Wisozk',NULL,'a_wisozk','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:53','2011-09-13 07:33:10',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,39,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(33,'text','middle','123.45.67.18',2,'bob32@smith.com','Ming','Spencer',NULL,'m_spencer','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:28:54','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,41,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(34,'text','middle','123.45.67.11',2,'bob33@smith.com','Shane','Eichmann',NULL,'s_eichmann','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:28:54','2011-09-13 07:33:11',NULL,1,33,'2011-09-11 07:28:54','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,42,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(35,'text','middle','123.45.67.14',2,'bob34@smith.com','Ralph','Wiggum',NULL,'testcp','f5ec1938b346bf01dc3be259aa270dfa',1,0,1,1,1,'2011-09-13 07:29:01','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,43,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(36,'text','middle','123.45.67.13',2,'bob35@smith.com','George','Rolfson',NULL,'test_cp','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:01','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,44,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(37,'text','middle','123.45.67.10',2,'bob36@smith.com','Admin','User',NULL,'admin','21232f297a57a5a743894a0e4a801fc3',1,0,1,1,1,'2011-09-13 07:29:03','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,46,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,1),(38,'text','middle','123.45.67.14',2,'bob37@smith.com','Rosalia','Toy',NULL,'r_toy','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:05','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,47,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(39,'text','middle','123.45.67.15',2,'bob38@smith.com','Christie','Ankunding',NULL,'c_ankunding','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:05','2011-09-13 07:33:11',NULL,1,38,'2011-09-11 07:29:05','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,48,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(40,'text','middle','123.45.67.17',2,'bob39@smith.com','Lavada','Mann',NULL,'l_mann','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:12','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,4,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(41,'text','middle','123.45.67.12',2,'bob40@smith.com','Kailey','Ankunding',NULL,'k_ankunding','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:13','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,51,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(42,'text','middle','123.45.67.15',2,'bob41@smith.com','Duane','Leuschke',NULL,'d_leuschke','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:13','2011-09-13 07:33:11',NULL,1,41,'2011-09-11 07:29:13','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,52,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(43,'text','middle','123.45.67.19',2,'bob42@smith.com','Herbert','Senger',NULL,'h_senger','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:21','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,53,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(44,'text','middle','123.45.67.10',2,'bob43@smith.com','Rolfe','Luettgen',NULL,'r_luettgen','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:21','2011-09-13 07:33:11',NULL,1,43,'2011-09-11 07:29:21','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,54,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(45,'text','middle','123.45.67.18',2,'bob44@smith.com','Kali','Lubowitz',NULL,'k_lubowitz','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:32','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,55,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(46,'text','middle','123.45.67.13',2,'bob45@smith.com','Jacky','Welch',NULL,'j_welch','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:32','2011-09-13 07:33:11',NULL,1,45,'2011-09-11 07:29:32','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,56,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(47,'text','middle','123.45.67.11',2,'bob46@smith.com','Marilie','Harvey',NULL,'m_harvey','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:43','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,57,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(48,'text','middle','123.45.67.14',2,'bob47@smith.com','Jon','Schultz',NULL,'j_schultz','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:43','2011-09-13 07:33:11',NULL,1,47,'2011-09-11 07:29:43','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,58,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(49,'text','middle','123.45.67.14',2,'bob48@smith.com','Rachel','Keebler',NULL,'r_keebler','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:29:51','2011-09-13 07:33:11',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,59,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(50,'text','middle','123.45.67.10',2,'bob49@smith.com','Scot','Hudson',NULL,'s_hudson','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:29:51','2011-09-13 07:33:12',NULL,1,49,'2011-09-11 07:29:51','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,60,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(51,'text','middle','123.45.67.16',2,'bob50@smith.com','Rhea','Leffler',NULL,'r_leffler','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:00','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,61,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(52,'text','middle','123.45.67.16',2,'bob51@smith.com','Greta','Gleason',NULL,'g_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:01','2011-09-13 07:33:12',NULL,1,51,'2011-09-11 07:30:00','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,62,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(53,'text','middle','123.45.67.17',2,'bob52@smith.com','Dameon','Schmidt',NULL,'d_schmidt','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:07','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,63,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(54,'text','middle','123.45.67.17',2,'bob53@smith.com','Rasheed','Skiles',NULL,'r_skiles','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:07','2011-09-13 07:33:12',NULL,1,53,'2011-09-11 07:30:07','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,64,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(55,'text','middle','123.45.67.14',2,'bob54@smith.com','Bertrand','Gleason',NULL,'b_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:19','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,65,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(56,'text','middle','123.45.67.16',2,'bob55@smith.com','Seao','Cummerata',NULL,'s_cummerata','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:19','2011-09-13 07:33:12',NULL,1,55,'2011-09-11 07:30:19','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,66,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(57,'text','middle','123.45.67.14',2,'bob56@smith.com','Janif','Stamm',NULL,'j_stamm','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:29','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,67,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(58,'text','middle','123.45.67.14',2,'bob57@smith.com','Helmes','Beier',NULL,'h_beier','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:29','2011-09-13 07:33:12',NULL,1,57,'2011-09-11 07:30:29','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,68,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(59,'text','middle','123.45.67.13',2,'bob58@smith.com','Fionb','Dickens',NULL,'f_dickens','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:35','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,69,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(60,'text','middle','123.45.67.15',2,'bob59@smith.com','Spences','Kulas',NULL,'s_kulas','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:35','2011-09-13 07:33:12',NULL,1,59,'2011-09-11 07:30:35','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,70,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(61,'text','middle','123.45.67.10',2,'bob60@smith.com','Camreo','Franecki',NULL,'c_franecki','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:43','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,71,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(62,'text','middle','123.45.67.19',2,'bob61@smith.com','Ahmae','Kuhic',NULL,'a_kuhic','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:44','2011-09-13 07:33:12',NULL,1,61,'2011-09-11 07:30:44','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,72,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(63,'text','middle','123.45.67.18',2,'bob62@smith.com','Roxanf','Padberg',NULL,'r_padberg','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:51','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,73,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(64,'text','middle','123.45.67.17',2,'bob63@smith.com','Marianb','Haley',NULL,'m_haley','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:51','2011-09-13 07:33:12',NULL,1,63,'2011-09-11 07:30:51','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,74,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(65,'text','middle','123.45.67.11',2,'bob64@smith.com','Joshuai','Gorczany',NULL,'j_gorczany','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:30:58','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,75,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(66,'text','middle','123.45.67.12',2,'bob65@smith.com','Antonib','Hoeger',NULL,'a_hoeger','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:30:58','2011-09-13 07:33:12',NULL,1,65,'2011-09-11 07:30:58','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,76,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(67,'text','middle','123.45.67.15',2,'bob66@smith.com','Eugenf','Cronio',NULL,'e_cronio','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:31:03','2011-09-13 07:33:12',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,77,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(68,'text','middle','123.45.67.17',2,'bob67@smith.com','Kaitlio','Reinges',NULL,'k_reinges','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:31:03','2011-09-13 07:33:12',NULL,1,67,'2011-09-11 07:31:03','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,78,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(69,'text','middle','123.45.67.12',2,'bob68@smith.com','Othp','Jacobt',NULL,'o_jacobt','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:31:58','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,79,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(70,'text','middle','123.45.67.15',2,'bob69@smith.com','Camilb','Cronb',NULL,'c_cronb','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:31:58','2011-09-13 07:33:13',NULL,1,69,'2011-09-11 07:31:58','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,80,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(71,'text','middle','123.45.67.18',2,'bob70@smith.com','Colu','Parisiao',NULL,'c_parisiao','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:00','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,81,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(72,'text','middle','123.45.67.17',2,'bob71@smith.com','Mathex','Bergstron',NULL,'m_bergstron','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:00','2011-09-13 07:33:13',NULL,1,71,'2011-09-11 07:32:00','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,82,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(73,'text','middle','123.45.67.11',2,'bob72@smith.com','Electb','Rhyt',NULL,'e_rhyt','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:03','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,83,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(74,'text','middle','123.45.67.12',2,'bob73@smith.com','Damarit','Murphz',NULL,'d_murphz','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:03','2011-09-13 07:33:13',NULL,1,73,'2011-09-11 07:32:03','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,84,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(75,'text','middle','123.45.67.17',2,'bob74@smith.com','Aidao','Connellz',NULL,'a_connellz','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:06','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,85,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(76,'text','middle','123.45.67.10',2,'bob75@smith.com','Dorb','Runolfssoo',NULL,'d_runolfssoo','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:06','2011-09-13 07:33:13',NULL,1,75,'2011-09-11 07:32:06','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,86,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(77,'text','middle','123.45.67.15',2,'bob76@smith.com','Emmanuellf','Ernses',NULL,'e_ernses','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:08','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,87,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(78,'text','middle','123.45.67.10',2,'bob77@smith.com','San','Nolao',NULL,'s_nolao','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:08','2011-09-13 07:33:13',NULL,1,77,'2011-09-11 07:32:08','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,88,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(79,'text','middle','123.45.67.11',2,'bob78@smith.com','Bettz','Mosciskj',NULL,'b_mosciskj','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:10','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,89,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(80,'text','middle','123.45.67.19',2,'bob79@smith.com','Reubeo','Larkio',NULL,'r_larkio','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:10','2011-09-13 07:33:13',NULL,1,79,'2011-09-11 07:32:10','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,90,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(81,'text','middle','123.45.67.15',2,'bob80@smith.com','Ashlez','Willmt',NULL,'a_willmt','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:13','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,91,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(82,'text','middle','123.45.67.12',2,'bob81@smith.com','Vicentf','Deckox',NULL,'v_deckox','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:13','2011-09-13 07:33:13',NULL,1,81,'2011-09-11 07:32:13','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,92,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(83,'text','middle','123.45.67.14',2,'bob82@smith.com','Hebes','Strackf',NULL,'h_strackf','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:15','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,93,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(84,'text','middle','123.45.67.11',2,'bob83@smith.com','Maybelm','Deckox',NULL,'m_deckox','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:15','2011-09-13 07:33:13',NULL,1,83,'2011-09-11 07:32:15','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,94,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(85,'text','middle','123.45.67.19',2,'bob84@smith.com','Okez','Nb',NULL,'o_nb','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:17','2011-09-13 07:33:13',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,95,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(86,'text','middle','123.45.67.19',2,'bob85@smith.com','Leonardp','Torphz',NULL,'l_torphz','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:17','2011-09-13 07:33:14',NULL,1,85,'2011-09-11 07:32:17','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,96,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(87,'text','middle','123.45.67.13',2,'bob86@smith.com','Gerhare','Millt',NULL,'g_millt','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:19','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,97,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(88,'text','middle','123.45.67.11',2,'bob87@smith.com','Cicerp','Pollici',NULL,'c_pollici','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:20','2011-09-13 07:33:14',NULL,1,87,'2011-09-11 07:32:19','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,98,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(89,'text','middle','123.45.67.12',2,'bob88@smith.com','Maritzb','Beattz',NULL,'m_beattz','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:22','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,99,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(90,'text','middle','123.45.67.11',2,'bob89@smith.com','Alvai','Hettinges',NULL,'a_hettinges','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:22','2011-09-13 07:33:14',NULL,1,89,'2011-09-11 07:32:22','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,100,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(91,'text','middle','123.45.67.19',2,'bob90@smith.com','Wyatu','Okunevb',NULL,'w_okunevb','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:25','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,101,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(92,'text','middle','123.45.67.10',2,'bob91@smith.com','Minh','Olsoo',NULL,'m_olsoo','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:25','2011-09-13 07:33:14',NULL,1,91,'2011-09-11 07:32:25','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,102,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(93,'text','middle','123.45.67.14',2,'bob92@smith.com','Shanf','Wesu',NULL,'s_wesu','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:27','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,103,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(94,'text','middle','123.45.67.17',2,'bob93@smith.com','Bentoo','Schowaltes',NULL,'b_schowaltes','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:27','2011-09-13 07:33:14',NULL,1,93,'2011-09-11 07:32:27','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,104,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(95,'text','middle','123.45.67.14',2,'bob94@smith.com','Georgf','Hilm',NULL,'g_hilm','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:30','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,105,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(96,'text','middle','123.45.67.11',2,'bob95@smith.com','Chanem','Schneides',NULL,'c_schneides','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:30','2011-09-13 07:33:14',NULL,1,95,'2011-09-11 07:32:30','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,106,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(97,'text','middle','123.45.67.15',2,'bob96@smith.com','Rosalib','McCullougi',NULL,'r_mccullougi','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:33','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,107,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(98,'text','middle','123.45.67.13',2,'bob97@smith.com','Christif','Schamberges',NULL,'c_schamberge','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:33','2011-09-13 07:33:14',NULL,1,97,'2011-09-11 07:32:33','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,108,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(99,'text','middle','123.45.67.19',2,'bob98@smith.com','Madelyno','Bodf',NULL,'m_bodf','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:35','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,109,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(100,'text','middle','123.45.67.10',2,'bob99@smith.com','Jeramif','Stehs',NULL,'j_stehs','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:36','2011-09-13 07:33:14',NULL,1,99,'2011-09-11 07:32:36','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,110,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(101,'text','middle','123.45.67.12',2,'bob100@smith.com','Lavadb','Kuhid',NULL,'l_kuhid','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:42','2011-09-13 07:33:14',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,111,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(102,'text','middle','123.45.67.17',2,'bob101@smith.com','Kailez','Wisozl',NULL,'k_wisozl','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:42','2011-09-13 07:33:15',NULL,1,101,'2011-09-11 07:32:42','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,112,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(103,'text','middle','123.45.67.12',2,'bob102@smith.com','Duanf','Hanseo',NULL,'d_hanseo','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:46','2011-09-13 07:33:15',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,113,24,NULL,NULL,NULL,201107131306848,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(104,'text','middle','123.45.67.17',2,'bob103@smith.com','Herberu','Spences',NULL,'h_spences','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:46','2011-09-13 07:33:15',NULL,1,103,'2011-09-11 07:32:46','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,114,24,NULL,NULL,NULL,201107131262769,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(105,'text','middle','123.45.67.14',2,'bob104@smith.com','Rolff','Eichmano',NULL,'r_eichmano','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:49','2011-09-13 07:33:15',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,115,24,NULL,NULL,NULL,201107131223670,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(106,'text','middle','123.45.67.12',2,'bob105@smith.com','Kalj','Corwio',NULL,'k_corwio','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:49','2011-09-13 07:33:15',NULL,1,105,'2011-09-11 07:32:49','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,116,24,NULL,NULL,NULL,201107131271546,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(107,'text','middle','123.45.67.11',2,'bob106@smith.com','Jackz','Rolfsoo',NULL,'j_rolfsoo','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:54','2011-09-13 07:33:15',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,117,24,NULL,NULL,NULL,201107131220085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(108,'text','middle','123.45.67.17',2,'bob107@smith.com','Marilif','Kelles',NULL,'m_kelles','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:54','2011-09-13 07:33:15',NULL,1,107,'2011-09-11 07:32:54','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,118,24,NULL,NULL,NULL,201107131267336,NULL,NULL,0,NULL,1,NULL,3,NULL,0),(109,'text','middle','123.45.67.10',2,'bob108@smith.com','Joo','Toz',NULL,'j_toz','2aaa8335fd030e054a98e3b2c5852b34',1,0,1,1,1,'2011-09-13 07:32:58','2011-09-13 07:33:15',NULL,0,NULL,NULL,'','',0,'',1,NULL,0,NULL,NULL,NULL,NULL,119,24,NULL,NULL,NULL,201107131283648,NULL,NULL,0,NULL,1,NULL,NULL,NULL,0),(110,'text','middle','123.45.67.10',2,'bob109@smith.com','Rachem','Ankundinh',NULL,'r_ankundinh','2aaa8335fd030e054a98e3b2c5852b34',1,1,1,1,1,'2011-09-13 07:32:58','2011-09-13 07:33:15',NULL,1,109,'2011-09-11 07:32:58','Curator','',0,'scope',1,NULL,0,NULL,NULL,NULL,NULL,120,24,NULL,NULL,NULL,201107131271653,NULL,NULL,0,NULL,1,NULL,3,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects`
--

DROP TABLE IF EXISTS `users_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_data_objects_on_data_object_id` (`data_object_id`),
  KEY `index_users_data_objects_on_taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects`
--

LOCK TABLES `users_data_objects` WRITE;
/*!40000 ALTER TABLE `users_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects_ratings`
--

DROP TABLE IF EXISTS `users_data_objects_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_data_objects_ratings_1` (`data_object_guid`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects_ratings`
--

LOCK TABLES `users_data_objects_ratings` WRITE;
/*!40000 ALTER TABLE `users_data_objects_ratings` DISABLE KEYS */;
INSERT INTO `users_data_objects_ratings` VALUES (1,31,NULL,1,'3a117abf96e7fe8793ef87b14d166d7d','2011-09-13 07:28:51','2011-09-13 07:28:51',1),(2,31,NULL,1,'3a117abf96e7fe8793ef87b14d166d7a','2011-09-13 07:28:51','2011-09-13 07:28:51',1);
/*!40000 ALTER TABLE `users_data_objects_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_identities`
--

DROP TABLE IF EXISTS `users_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_identities` (
  `user_id` int(10) unsigned NOT NULL,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_identities`
--

LOCK TABLES `users_user_identities` WRITE;
/*!40000 ALTER TABLE `users_user_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vetted`
--

DROP TABLE IF EXISTS `vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `view_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Vetted statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vetted`
--

LOCK TABLES `vetted` WRITE;
/*!40000 ALTER TABLE `vetted` DISABLE KEYS */;
INSERT INTO `vetted` VALUES (1,'2011-09-13 07:27:24','2011-09-13 07:27:24',2),(2,'2011-09-13 07:27:24','2011-09-13 07:27:25',3),(3,'2011-09-13 07:27:25','2011-09-13 07:27:25',4),(4,'2011-09-13 07:27:25','2011-09-13 07:27:25',1);
/*!40000 ALTER TABLE `vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibilities`
--

DROP TABLE IF EXISTS `visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibilities`
--

LOCK TABLES `visibilities` WRITE;
/*!40000 ALTER TABLE `visibilities` DISABLE KEYS */;
INSERT INTO `visibilities` VALUES (1,'2011-09-13 07:27:25','2011-09-13 07:27:25'),(2,'2011-09-13 07:27:25','2011-09-13 07:27:25'),(3,'2011-09-13 07:27:25','2011-09-13 07:27:25');
/*!40000 ALTER TABLE `visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whats_this`
--

DROP TABLE IF EXISTS `whats_this`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whats_this` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whats_this`
--

LOCK TABLES `whats_this` WRITE;
/*!40000 ALTER TABLE `whats_this` DISABLE KEYS */;
/*!40000 ALTER TABLE `whats_this` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikipedia_queue`
--

DROP TABLE IF EXISTS `wikipedia_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipedia_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` timestamp NULL DEFAULT NULL,
  `harvest_succeeded` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipedia_queue`
--

LOCK TABLES `wikipedia_queue` WRITE;
/*!40000 ALTER TABLE `wikipedia_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipedia_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worklist_ignored_data_objects`
--

DROP TABLE IF EXISTS `worklist_ignored_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklist_ignored_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_worklist_ignored_data_objects_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklist_ignored_data_objects`
--

LOCK TABLES `worklist_ignored_data_objects` WRITE;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-13 14:03:12
