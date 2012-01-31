<?php

include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';

echo "\r\nWelcome in the merging process of the updated_data_objects into updated data objects Job";

//create new batch update record by the current datetime
$updated_data_objects = BLL_updated_data_objects::Select_all_updated_dataObjects()
echo "\r\nNumber of pending updated dataobjects= ".COUNT($updated_data_objects);

//loop on each updated data_object and  
foreach ($updated_data_objects as $updated_data_object){
    	
}

echo "\r\nDone";


?>