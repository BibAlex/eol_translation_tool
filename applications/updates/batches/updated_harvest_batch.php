<?php

/**
 * Author: Sara Elshobaky
 * Date: 2012-02-12
 * 
 * This file is a batch that should run periodically to search for upadted data objects 
 * or a totally new ones and insert them into the pending update data object table
 *   
 * Steps:
 * 1. Create a new batch record
 * 2. Pass by all taxon concepts already assigned or in a higer status to ensure that their english data objects are harvested *  
 * 3. For each data object in each taxons:
 *      3.1. Delete any old versions of that data object guid from the updated data object table except if it has the same current data object id
 * 		3.2. If data object ID is not available in the data object table nor in the updated data_object table, then add it to the updated dataobjects table
 *      3.3. If same data object ID already exists in the data object table, then neglect it 
 */

include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_updated_harvest_batch.php';
include_once '../../../classes/DAL/DAL_updated_harvest_batch.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_updated_data_objects_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

echo "\r\nWelcome in the harvest updated data objects Job";

////1. Create new batch record
//create new batch update record by the current datetime
$updated_harvested_batch_id = BLL_updated_harvest_batch::Insert_updated_harvest_batch();
echo "\r\nNew updated batch record is created with id= ".$updated_harvested_batch_id;

////2. Pass by all taxon concepts already assigned or in a higer status to ensure that their english data objects are harvested
$taxon_concepts = BLL_taxon_concepts::Select_taxon_concepts_after_task_distribution('slave');
echo "\r\n Number of Taxon Concepts= ".COUNT($taxon_concepts);
$do_counter=0;
$tc_counter=COUNT($taxon_concepts);
foreach ($taxon_concepts as $taxon_concept){
  $master_data_objects = BLL_data_objects::Select_DataObjects_ByTaxonConceptID('master', $taxon_concept->id);
  //echo "\r\n  TC_ID= ".$taxon_concept->id;
  ////3. For each data object in each taxons:
  foreach ($master_data_objects as $master_data_object)
  {  	
  	////3.1. Delete any old versions of that data object guid from the updated data object table except if it has the same current data object id
  	BLL_updated_data_objects_taxon_concepts::Delete_updated_dataObjects_taxon_concepts_By_guid($master_data_object->guid, $master_data_object->id, $master_data_object->data_type_id);
	BLL_updated_data_objects::Delete_updated_dataObjects_By_guid($master_data_object->guid, $master_data_object->id, $master_data_object->data_type_id);
    ////3.2. If data object ID is not available in the data object table 
	if( BLL_data_objects::Exist_DataObjects_ByID('slave',$master_data_object->id)==0 )
	{
		//If the data object id is not available in the updated data_object table, then add it to the updated dataobjects table
		if(BLL_updated_data_objects::Exist_Updated_DataObjects_ByID($master_data_object->id)==0)
		{
			$do_counter ++;
			//insert that new data object into the updated data object table		 
			BLL_updated_data_objects::Insert_Updated_DataObject($master_data_object, $updated_harvested_batch_id);
			echo "\r\n      Insert DO_ID= ".$master_data_object->id;
		}
		//insert the updated data_objectID_taxon_concept_id if not exsist
		if(BLL_updated_data_objects_taxon_concepts::Exist_Updated_data_object_taxon_concepts($taxon_concept->id, $master_data_object->id)==0)
		{
			BLL_updated_data_objects_taxon_concepts::Insert_updated_data_objects_taxon_concepts($taxon_concept->id, $master_data_object->id, $updated_harvested_batch_id);
			echo "\r\n      Insert DO_TC= ".$master_data_object->id.",".$taxon_concept->id;
		}
				
	}//end if	
	////3.3. If same data object ID already exists in the data object table, then neglect it
	else
	{
		//echo "\r\n      Neglect DO_ID= ".$master_data_object->id;
	} 
  }//end for each DO    
 // echo "\r\n  Remaining taxons= ".$tc_counter;
  $tc_counter--;
}//end for each TC
echo "\r\n Number of new data objects= ".$do_counter;
echo "\r\nSearch for updated data objects is done ";


?>