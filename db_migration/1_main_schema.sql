-- MySQL dump 10.13  Distrib 5.5.12, for Linux (x86_64)
--
-- Host: localhost    Database: aeol_production
-- ------------------------------------------------------
-- Server version      5.5.12
 
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
-- Temporary table structure for view `Unique_DO`
--
 
DROP TABLE IF EXISTS `Unique_DO`;
/*!50001 DROP VIEW IF EXISTS `Unique_DO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Unique_DO` (
  `data_object_id` int(10) unsigned
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
 
--
-- Table structure for table `a_data_objects`
--
 
DROP TABLE IF EXISTS `a_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_data_objects` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `process_id` int(10) unsigned NOT NULL,
  `object_title` varchar(255) DEFAULT NULL,
  `rights_statement` varchar(255) DEFAULT NULL,
  `rights_holder` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `modified_at` datetime DEFAULT NULL,
  `locked` tinyint(1) unsigned DEFAULT NULL,
  `taxon_concept_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `translator_id` int(10) DEFAULT NULL,
  `linguistic_reviewer_id` int(10) DEFAULT NULL,
  `scientific_reviewer_id` int(10) DEFAULT NULL,
  `final_editor_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `a_names`
--
 
DROP TABLE IF EXISTS `a_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
  `name` varchar(400) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified_person` int(10) unsigned NOT NULL,
  `last_modified_date` datetime NOT NULL,
  `name_status_id` int(10) unsigned NOT NULL DEFAULT '2' COMMENT '2: accepted, 3: rejected',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `archived_a_data_objects`
--
 
DROP TABLE IF EXISTS `archived_a_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archived_a_data_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `process_id` int(10) unsigned DEFAULT NULL,
  `object_title` varchar(255) DEFAULT NULL,
  `rights_statement` varchar(255) DEFAULT NULL,
  `rights_holder` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `modified_at` datetime DEFAULT NULL,
  `locked` tinyint(1) unsigned DEFAULT NULL,
  `taxon_concept_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52274 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `conditions`
--
 
DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `country`
--
 
DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `name` varchar(80) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `data_objects`
--
 
DROP TABLE IF EXISTS `data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects` (
  `id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `data_type_id` smallint(5) unsigned DEFAULT NULL,
  `mime_type_id` smallint(5) unsigned DEFAULT NULL,
  `object_title` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL,
  `license_id` tinyint(3) unsigned DEFAULT NULL,
  `rights_statement` varchar(300) DEFAULT NULL,
  `rights_holder` varchar(255) DEFAULT NULL,
  `bibliographic_citation` varchar(300) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL COMMENT 'a url where users are to be redirected to learn more about this data object',
  `description` mediumtext,
  `description_linked` mediumtext,
  `object_url` varchar(255) DEFAULT NULL COMMENT 'recommended; the url which resolves to this data object. Generally used only for images, video, and other multimedia',
  `object_cache_url` bigint(20) unsigned DEFAULT NULL,
  `thumbnail_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `thumbnail_cache_url` bigint(20) unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `object_created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `object_modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_rating` float DEFAULT '2.5',
  `vetted_id` tinyint(3) unsigned DEFAULT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `curated` tinyint(1) unsigned DEFAULT '0',
  `aeol_translation` tinyint(1) unsigned DEFAULT NULL,
  `words_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `index_data_objects_on_visibility_id` (`visibility_id`),
  KEY `index_data_objects_on_guid` (`guid`),
  KEY `index_data_objects_on_published` (`published`),
  KEY `object_url` (`object_url`),
  KEY `created_at` (`created_at`),
  KEY `identifier` (`identifier`),
  KEY `description` (`description`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE TRIGGER DO_Insert Before insert on data_objects
  FOR EACH ROW BEGIN   
        SET New.words_count = (wordcount(fnStripTags(New.object_title))
                        +wordcount(fnStripTags(New.description))
                        +wordcount(fnStripTags(New.location)));     
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
 
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `data_types`
--
 
DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `info_items`
--
 
DROP TABLE IF EXISTS `info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_items` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  `label` varchar(255) NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `licenses`
--
 
DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(400) NOT NULL,
  `source_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `version` varchar(6) CHARACTER SET ascii NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `show_to_content_partners` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `source_url` (`source_url`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `mime_types`
--
 
DROP TABLE IF EXISTS `mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `name_languages`
--
 
DROP TABLE IF EXISTS `name_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_languages` (
  `name_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `parent_name_id` int(10) unsigned NOT NULL,
  `preferred` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`name_id`,`language_id`,`parent_name_id`),
  KEY `parent_name_id` (`parent_name_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `name_status`
--
 
DROP TABLE IF EXISTS `name_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `names`
--
 
DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `namebank_id` int(10) unsigned NOT NULL,
  `string` varchar(300) NOT NULL,
  `clean_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'there is a one to one reltaionship between a name string and a clean name. The clean name takes the string and lowercases it (uncluding diacriticals), removes leading/trailing whitespace, removes some punctuation (periods and more), and pads remaining pun',
  `italicized` varchar(300) NOT NULL,
  `italicized_verified` tinyint(3) unsigned NOT NULL,
  `canonical_form_id` int(10) unsigned NOT NULL,
  `canonical_verified` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `canonical_form_id` (`canonical_form_id`),
  KEY `clean_name` (`clean_name`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `selection_batches`
--
 
DROP TABLE IF EXISTS `selection_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selection_batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `criteria` text CHARACTER SET latin1,
  `comments` varchar(500) NOT NULL DEFAULT '',
  `date_selected` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_distributed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `finished` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `status`
--
 
DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `table_of_contents`
--
 
DROP TABLE IF EXISTS `table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_of_contents` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `view_order` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `taxon_concept_assign_log`
--
 
DROP TABLE IF EXISTS `taxon_concept_assign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_assign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL,
  `assign_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3885 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `taxon_concept_names`
--
 
DROP TABLE IF EXISTS `taxon_concept_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_names` (
  `taxon_concept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name_id` int(10) unsigned NOT NULL,
  `source_hierarchy_entry_id` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `vern` tinyint(3) unsigned NOT NULL,
  `preferred` tinyint(3) unsigned NOT NULL,
  `synonym_id` int(11) DEFAULT NULL,
  `vetted_id` int(10) unsigned DEFAULT NULL,
  `name_status_id` int(10) unsigned DEFAULT '1' COMMENT '1: not viewed, 2:accepted, 3 rejected',
  `last_modified_date` datetime DEFAULT NULL,
  `last_modified_person` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`,`name_id`,`source_hierarchy_entry_id`,`language_id`),
  KEY `vern` (`vern`),
  KEY `name_id` (`name_id`),
  KEY `source_hierarchy_entry_id` (`source_hierarchy_entry_id`),
  KEY `index_taxon_concept_names_on_synonym_id` (`synonym_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `taxon_concepts`
--
 
DROP TABLE IF EXISTS `taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `supercedure_id` int(10) unsigned NOT NULL,
  `split_from` int(10) unsigned NOT NULL,
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `selection_id` int(11) NOT NULL DEFAULT '0',
  `translator_id` int(10) unsigned NOT NULL DEFAULT '0',
  `translator_assigned` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `linguistic_reviewer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `linguistic_assigned` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `scientific_reviewer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `final_editor_id` int(10) unsigned NOT NULL DEFAULT '0',
  `taxon_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `scientificName` varchar(500) NOT NULL DEFAULT '''',
  `selection_date` datetime DEFAULT NULL,
  `taskdistribution_date` datetime DEFAULT NULL,
  `translation_date` datetime DEFAULT NULL COMMENT 'The finish of this phase',
  `linguisticreview_date` datetime DEFAULT NULL COMMENT 'date of finishing this pase',
  `scientificreview_date` datetime DEFAULT NULL COMMENT 'date of finishing this pase',
  `finalediting_date` datetime DEFAULT NULL COMMENT 'date of finishing this pase',
  `publish_date` datetime DEFAULT NULL COMMENT 'date of finishing this pase',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `supercedure_id` (`supercedure_id`),
  KEY `FK_taxon_concepts_selection_batches` (`selection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `templates`
--
 
DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(1000) DEFAULT NULL,
  `name_ar` varchar(1000) DEFAULT NULL,
  `IsRightsHolder` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3609 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Table structure for table `users`
--
 
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `super_admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `task_distributor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `translator` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linguistic_reviewer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `scientific_reviewer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `final_editor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `selector` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(10) unsigned NOT NULL DEFAULT '0',
  `it_admin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Final view structure for view `Unique_DO`
--
 
/*!50001 DROP TABLE IF EXISTS `Unique_DO`*/;
/*!50001 DROP VIEW IF EXISTS `Unique_DO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `Unique_DO` AS select `DOTC1`.`data_object_id` AS `data_object_id` from ((`data_objects_taxon_concepts` `DOTC1` join `taxon_concepts` `TC1` on((`TC1`.`id` = `DOTC1`.`taxon_concept_id`))) join `a_data_objects` `ADO1` on(((`ADO1`.`translator_id` = `TC1`.`translator_id`) and (`ADO1`.`id` = `DOTC1`.`data_object_id`)))) order by `TC1`.`taxon_status_id`,`TC1`.`id` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
 
-- Dump completed on 2011-09-13 10:37:34
 
-- Adding Status
 
LOCK TABLES `status` WRITE;
INSERT INTO `status` VALUES (1,'Distribution'),(2,'Translation'),(3,'Linguistic Review'),(4,'Scientific Review'),(5,'Final Editing'),(6,'To be published'),(7,'Published');
UNLOCK TABLES;
 
-- Adding Countries
LOCK TABLES `country` WRITE;
INSERT INTO `country` VALUES ('Andorra',1),('United Arab Emirates',2),('Afghanistan',3),('Antigua and Barbuda',4),('Anguilla',5),('Albania',6),('Armenia',7),('Netherlands Antilles',8),('Angola',9),('Antarctica',10),('Argentina',11),('American Samoa',12),('Austria',13),('Australia',14),('Aruba',15),('Azerbaijan',16),('Bosnia and Herzegovina',17),('Barbados',18),('Bangladesh',19),('Belgium',20),('Burkina Faso',21),('Bulgaria',22),('Bahrain',23),('Burundi',24),('Benin',25),('Bermuda',26),('Brunei Darussalam',27),('Bolivia',28),('Brazil',29),('Bahamas',30),('Bhutan',31),('Bouvet Island',32),('Botswana',33),('Belarus',34),('Belize',35),('Canada',36),('Cocos (Keeling) Islands',37),('Congo, the Democratic Republic of the',38),('Central African Republic',39),('Congo',40),('Switzerland',41),('Cote D\'Ivoire',42),('Cook Islands',43),('Chile',44),('Cameroon',45),('China',46),('Colombia',47),('Costa Rica',48),('Serbia and Montenegro',49),('Cuba',50),('Cape Verde',51),('Christmas Island',52),('Cyprus',53),('Czech Republic',54),('Germany',55),('Djibouti',56),('Denmark',57),('Dominica',58),('Dominican Republic',59),('Algeria',60),('Ecuador',61),('Estonia',62),('Egypt',63),('Western Sahara',64),('Eritrea',65),('Spain',66),('Ethiopia',67),('Finland',68),('Fiji',69),('Falkland Islands (Malvinas)',70),('Micronesia, Federated States of',71),('Faroe Islands',72),('France',73),('Gabon',74),('United Kingdom',75),('Grenada',76),('Georgia',77),('French Guiana',78),('Ghana',79),('Gibraltar',80),('Greenland',81),('Gambia',82),('Guinea',83),('Guadeloupe',84),('Equatorial Guinea',85),('Greece',86),('South Georgia and the South Sandwich Islands',87),('Guatemala',88),('Guam',89),('Guinea-Bissau',90),('Guyana',91),('Hong Kong',92),('Heard Island and Mcdonald Islands',93),('Honduras',94),('Croatia',95),('Haiti',96),('Hungary',97),('Indonesia',98),('Ireland',99),('Israel',100),('India',101),('British Indian Ocean Territory',102),('Iraq',103),('Iran, Islamic Republic of',104),('Iceland',105),('Italy',106),('Jamaica',107),('Jordan',108),('Japan',109),('Kenya',110),('Kyrgyzstan',111),('Cambodia',112),('Kiribati',113),('Comoros',114),('Saint Kitts and Nevis',115),('Korea, Democratic People\'s Republic of',116),('Korea, Republic of',117),('Kuwait',118),('Cayman Islands',119),('Kazakhstan',120),('Lao People\'s Democratic Republic',121),('Lebanon',122),('Saint Lucia',123),('Liechtenstein',124),('Sri Lanka',125),('Liberia',126),('Lesotho',127),('Lithuania',128),('Luxembourg',129),('Latvia',130),('Libyan Arab Jamahiriya',131),('Morocco',132),('Monaco',133),('Moldova, Republic of',134),('Madagascar',135),('Marshall Islands',136),('Macedonia, the Former Yugoslav Republic of',137),('Mali',138),('Myanmar',139),('Mongolia',140),('Macao',141),('Northern Mariana Islands',142),('Martinique',143),('Mauritania',144),('Montserrat',145),('Malta',146),('Mauritius',147),('Maldives',148),('Malawi',149),('Mexico',150),('Malaysia',151),('Mozambique',152),('Namibia',153),('New Caledonia',154),('Niger',155),('Norfolk Island',156),('Nigeria',157),('Nicaragua',158),('Netherlands',159),('Norway',160),('Nepal',161),('Nauru',162),('Niue',163),('New Zealand',164),('Oman',165),('Panama',166),('Peru',167),('French Polynesia',168),('Papua New Guinea',169),('Philippines',170),('Pakistan',171),('Poland',172),('Saint Pierre and Miquelon',173),('Pitcairn',174),('Puerto Rico',175),('Palestinian Territory, Occupied',176),('Portugal',177),('Palau',178),('Paraguay',179),('Qatar',180),('Reunion',181),('Romania',182),('Russian Federation',183),('Rwanda',184),('Saudi Arabia',185),('Solomon Islands',186),('Seychelles',187),('Sudan',188),('Sweden',189),('Singapore',190),('Saint Helena',191),('Slovenia',192),('Svalbard and Jan Mayen',193),('Slovakia',194),('Sierra Leone',195),('San Marino',196),('Senegal',197),('Somalia',198),('Suriname',199),('Sao Tome and Principe',200),('El Salvador',201),('Syrian Arab Republic',202),('Swaziland',203),('Turks and Caicos Islands',204),('Chad',205),('French Southern Territories',206),('Togo',207),('Thailand',208),('Tajikistan',209),('Tokelau',210),('Timor-Leste',211),('Turkmenistan',212),('Tunisia',213),('Tonga',214),('Turkey',215),('Trinidad and Tobago',216),('Tuvalu',217),('Taiwan, Province of China',218),('Tanzania, United Republic of',219),('Ukraine',220),('Uganda',221),('United States Minor Outlying Islands',222),('United States',223),('Uruguay',224),('Uzbekistan',225),('Holy See (Vatican City State)',226),('Saint Vincent and the Grenadines',227),('Venezuela',228),('Virgin Islands, British',229),('Virgin Islands, U.s.',230),('Viet Nam',231),('Vanuatu',232),('Wallis and Futuna',233),('Samoa',234),('Yemen',235),('Mayotte',236),('South Africa',237),('Zambia',238),('Zimbabwe',239);
UNLOCK TABLES;
 

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'http://purl.org/dc/dcmitype/StillImage','Image','Images'),(2,'http://purl.org/dc/dcmitype/Sound','Sound','Video/Audio'),(3,'http://purl.org/dc/dcmitype/Text','Text','Table of Contents'),(4,'http://purl.org/dc/dcmitype/MovingImage','Video','Video/Audio'),(5,'','GBIF Image','Images'),(6,'IUCN','IUCN','Images'),(7,'Flash','Flash','Video/Audio'),(8,'YouTube','YouTube','Video/Audio');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

-- Adding Test User

LOCK TABLE users WRITE;
INSERT INTO `users` (`name`, `username`, `password`, `super_admin`, `task_distributor`, `translator`, `linguistic_reviewer`, `scientific_reviewer`, `final_editor`, `active`, `selector`, `email`, `country_id`, `it_admin`) VALUES ('Test User', 'test', 'test', 1, 1, 1, 1, 1, 1, 1, 1, '', 63, 1);
UNLOCK TABLES;



 
