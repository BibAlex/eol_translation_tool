--Conflict Test
ALTER TABLE `a_data_objects` CHANGE COLUMN `object_title` `object_title` VARCHAR(500) NULL DEFAULT NULL  , CHANGE COLUMN `rights_statement` `rights_statement` VARCHAR(500) NULL DEFAULT NULL  , CHANGE COLUMN `rights_holder` `rights_holder` VARCHAR(500) NULL DEFAULT NULL  ;
ALTER TABLE `archived_a_data_objects` CHANGE COLUMN `object_title` `object_title` VARCHAR(500) NULL DEFAULT NULL  , CHANGE COLUMN `rights_statement` `rights_statement` VARCHAR(500) NULL DEFAULT NULL  , CHANGE COLUMN `rights_holder` `rights_holder` VARCHAR(500) NULL DEFAULT NULL  ;
ALTER TABLE `a_data_objects` CHANGE COLUMN `location` `location` VARCHAR(500) NULL DEFAULT NULL  ;
ALTER TABLE `archived_a_data_objects` CHANGE COLUMN `location` `location` VARCHAR(500) NULL DEFAULT NULL  ;


