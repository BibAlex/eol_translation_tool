<?php
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';


// $master_do =  BLL_data_objects::Select_DataObjects_ByID('master', 1149080);
// BLL_data_objects::Insert_DataObject('slave', $master_do);
 BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave',339021,1149080);
  
  
 
?>