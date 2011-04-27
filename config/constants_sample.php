<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$default_hierarchy_id=529; // Default
$published=7; // id for published in taxon_status table 
$pending_publishing=6; 
$items_per_page=20;
$eol_site_url = 'http://www.eol.org';
$eol_site_content = 'http://content1.eol.bibalex.org/content/';
$TOC_included_parent_ids='1, 3, 4, 5, 6, 8, 256, 303, 315, 326, 346';
$From_Mail='user@mail.com';
$External_Mail_Server='mail_server_address';
$Internal_Mail_Server='internal_mail_address';
$AEOL_url='http://localhost/eol_translation';
$Email_Signature= '<br/><br/>Regards,<br/>Arabic EOL Team<br/><a href=\''.$AEOL_url.'\'/>'.$AEOL_url.'</a>';
$arabic_language_id=22;
$to_language_abbreviation = 'ar';
$accepted_name_status_id = 2;
$rejected_name_status_id = 3;

/*******************************/
/*Kamal Please do not uncomment those below, just copy and past from them to top*/
/******************************/







/*local*/
/*********************************************
$Internal_Mail_Server='mail_address';
$AEOL_url='http://localhost/eol_translation';
*********************************************/

/*DMZ*/
/*********************************************
$Internal_Mail_Server='mail_address';
$AEOL_url='http://172.16.0.71/eol_translation';
*********************************************/


/*********************************************/
/**************TRUNCATED TABLES***************/
/*
truncate table a_data_objects;
truncate table a_names;
truncate table archived_a_data_objects;
truncate table data_objects;
truncate table data_objects_table_of_contents;
truncate table data_objects_taxon_concepts;
truncate table names;
truncate table selection_batches;
truncate table taxon_concepts;
truncate table taxon_concept_names;
truncate table taxon_concept_assign_log;
*/
 



?>
