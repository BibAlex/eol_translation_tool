<?php

include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_updated_harvest_batch.php';
include_once '../../../classes/DAL/DAL_updated_harvest_batch.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';

echo "\r\nWelcome in the harvest updated data objects Job";

//create new batch update record by the current datetime
$updated_harvested_batch_id = BLL_updated_harvest_batch::Insert_updated_harvest_batch();
echo "\r\nNew updated batch record is created with id= ".$updated_harvested_batch_id;

//Select all distinct guids from the english data_object table
$guids = BLL_data_objects::Select_all_data_objects_guid('slave');
echo "\r\nAvailable guids= ".COUNT($guids);

$count_problems=0;
foreach ($guids as $guid){
	$data_objects = BLL_data_objects::Select_latest_DataObjects_ByGuid('master',$guid->guid);
	echo "\r\n".$guid->guid."  -".COUNT($data_objects)."-" ;
	if (COUNT($data_objects)==1)
	{
		//if data object update id is not available in the dataobject table of AEOL database 
		if(BLL_data_objects::Exist_DataObjects_ByID('slave',$data_objects[0]->id)==0)
		{
			//delete any exsisting data object with same guid in the Updated_DataObject table
			BLL_updated_data_objects::Delete_updated_dataObjects_By_guid($guid->guid);
			
			//select the latest data object version from master db	
			$do = BLL_data_objects::Select_DataObjects_ByID('master',$data_objects[0]->id);
			
			//insert that new data object into the updated data object table 
			BLL_updated_data_objects::Insert_Updated_DataObject($do,$updated_harvested_batch_id);
			echo "----new insert----"	;			
		}
		 
	}
	else//if 0 so no updates, if more than 1 then a problem occur
	{
		//echo "\r\n".$guid->guid."  ".COUNT($data_objects) ;
		foreach ($data_objects as $data_object){
			echo "\r\ndo->id= ".$data_object->id;
		}
		$count_problems ++;
	} 	
}
echo "\r\n Problems occured = ".$count_problems; 
echo "\r\nDone";


?>