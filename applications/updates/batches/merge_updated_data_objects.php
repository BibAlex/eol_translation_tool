<?php
/**
 * Author: Sara Elshobaky
 * Date: 2012-02-13
 * 
 * This file is a batch that should run after the updated_harvest batch 
 * It moves all updated data objects with all their updated taxon_concept relations 
 * then handles their translation types
 *   
 * Steps for each updated_data_object:
 * 1. Create the new data object record	
 * 2. Relate that new data object with all related updated_taxon_concepts
 * 3. Delete the current updated_data_object
 * 4. For each data object with same guid
 *   4.1
 */
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';

echo "\r\nWelcome in the merging process of the updated_data_objects into updated data objects Job";

//create new batch update record by the current datetime
$updated_data_objects = BLL_updated_data_objects::Select_all_updated_dataObjects();
echo "\r\nNumber of pending updated dataobjects= ".COUNT($updated_data_objects);

//loop on each updated data_object  
foreach ($updated_data_objects as $updated_data_object){
	
  ////1. create the new data object record	
  BLL_data_objects::Insert_Updated_DataObject($updated_data_object);	
  
  ////2. relate that new data object with all related updated_taxon_concepts 
  //Get all related taxon concept ids 
  $related_taxons = BLL_updated_data_objects_taxon_concepts::Select_Updated_data_objects_taxon_concepts_By_DataObjectID('slave',$updated_data_object->id);
  foreach ($related_taxons as $related_taxon)
  {
  	 //insert the relation between new data object and related taxon concepts
  	 BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave', $related_taxon->taxon_concept_id, $updated_data_object->id );
  	 //delete that relation from the updated_data_objects_taxon_concept table
  	 BLL_updated_data_objects_taxon_concepts::Delete_updated_dataObjects_taxon_concepts($updated_data_object->id,  $related_taxon->taxon_concept_id); 	 
  }
  ////3. delete the current updated_data_object
  BLL_updated_data_objects::Delete_updated_dataObjects_By_id($updated_data_object->id);

  
  
  //get all old data objects with same guid
  $old_data_objects = BLL_data_objects::Select_DataObjects_ByGuid('slave',$updated_data_object->guid, $updated_data_object->data_type_id);
  
  ////3. hide all old data objects   
  foreach ($old_data_objects as $old_data_object)
  {  	
  	//if no translation record available for it
  	if(Exist_a_data_objects($old_data_object->id)==0)
  	{
  		//just hide it, since no translation available
    	BLL_data_objects::Hide_DataObject($old_data_object->id);
  	}
    
  }
  
  
}

echo "\r\nDone";


?>