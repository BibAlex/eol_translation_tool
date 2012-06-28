delimiter $$

--  Create the updated_data_objects_table that will contains the newly harvested updates temporary
CREATE TABLE `updated_data_objects` (
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
  `harvested_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8$$

--  Create the updated_data_objects_taxon_concepts table that will contains the newly harvested updates temporary
delimiter $$
CREATE TABLE `updated_data_objects_taxon_concepts` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `harvested_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8$$

--  Create the harvest batch_type table that will only contain an identifier for that batch job
delimiter $$
CREATE TABLE `updated_harvest_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `harvest_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8$$

--  Create the harvest batch_type table to differenticate between already select data objects by selectors and  the updated data objects selected through updates batch
delimiter $$
CREATE TABLE `harvest_batch_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8$$

--  Fill the harvest_batch_type table with only 2 different types
INSERT INTO harvest_batch_type (name) VALUES ('selection phase'),('Updates batch');

-- Modify the data object table to include the required updates
ALTER TABLE `data_objects` 
  ADD COLUMN `harvest_batch_id` INT NULL  AFTER `words_count` , 
  ADD COLUMN `harvest_batch_type` INT NULL  AFTER `harvest_batch_id` , 
  ADD COLUMN `hidden` TINYINT(1) NULL DEFAULT '0'  AFTER `harvest_batch_type` , 
  ADD COLUMN `parent_data_object_id` INT(10) UNSIGNED NULL  AFTER `hidden` ;
  
-- Set all data_object harvest batch type to selection phase
UPDATE data_objects SET  harvest_batch_type=1;

-- Modify the a_data_objects table to include the update status type
ALTER TABLE `a_data_objects` 
  ADD COLUMN `update_status_id` INT NULL  AFTER `final_editor_id` ;

-- Create the update status type table of the 
CREATE  TABLE `update_status` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(200) NULL ,
  PRIMARY KEY (`id`) );

INSERT INTO update_status (name) VALUES ('Automatically updated'),('Manually updated from scratch'),('Manually updated from already exisiting data_object');

-- Added by Yosra

-- Add column in table taxon_concepts
ALTER TABLE `taxon_concepts` ADD COLUMN `taxon_update` TINYINT(1) UNSIGNED NOT NULL  AFTER `publish_date` ;

-- Add column in table data_objects
-- ALTER TABLE `aeol_test`.`data_objects` ADD COLUMN `locked_update` TINYINT(1) UNSIGNED NULL DEFAULT '0'  AFTER `parent_data_object_id` ;







  
  
  




