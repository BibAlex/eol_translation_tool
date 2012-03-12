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
 * 4. Hide all old data objects if they have no translations yet and are not marked as hidden 
 * For each data object with same guid
 *   4.1
 */
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_a_data_objects.php';
include_once '../../../classes/DAL/DAL_a_data_objects.php';
include_once '../../../classes/BLL/BLL_archived_a_data_objects.php';
include_once '../../../classes/DAL/DAL_archived_a_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';
include_once '../../../classes/BLL/BLL_updated_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_updated_data_objects_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';


echo "\r\nWelcome in the merging process of the updated_data_objects into updated data objects Job";

//create new batch update record by the current datetime
$updated_data_objects = BLL_updated_data_objects::Select_all_updated_dataObjects();
echo "\r\nNumber of pending updated dataobjects= ".COUNT($updated_data_objects);

//loop on each updated data_object  
foreach ($updated_data_objects as $updated_data_object){
	
	//if this updated data_object has never been available in the data_objects table 
  	if(BLL_data_objects::Exist_DataObjects_ByID('slave',$updated_data_object->id)>0)
  	{
  		//seems a mistake appeared so, delete the updated data object and all its taxons relations
  		migrate_updated_data_objects_and_its_taxons_relations($updated_data_object->id);
  	}
  	else//the normal case, no mistake
  	{
  		// Hide all old data objects if they have no translations yet and are not marked as hidden
  		BLL_data_objects::Hide_DataObject_If_no_adata_object($updated_data_object->guid, $updated_data_object->data_type_id);
  		
  		// Create the new data object record
  		BLL_data_objects::Insert_Updated_DataObject($updated_data_object);
  		
  		//get all old data objects with same guid and not hidden
  		$old_data_objects = BLL_data_objects::Select_DataObjects_ByGuid_NOT_Hidden($updated_data_object->guid, $updated_data_object->data_type_id);
  		
  		//if data_object is totally a new one and there is no old one
  		if(COUNT($old_data_objects)==0)
  		{
  			// Delete the current updated_data_object
			BLL_updated_data_objects::Delete_updated_dataObjects_By_id($updated_data_object->id);
	  		//Get all related taxon concept ids 
			migrate_updated_data_objects_and_its_taxons_relations($updated_data_object->id);			
  		}
  		else //There is a translation in old data objects
  		{
  			$parent_id = $old_data_objects[0]->id;//because first 1 is the most advanced one in the translation workflow (ORDER BY proess_id DESC;)
  			$are_exact = compare_data_objects($parent_id, $updated_data_object->id);
  			if($are_exact==true)
  			{
  				//create the new arabic data object
  				$old_a_data_object = BLL_a_data_objects::Select_a_data_objects_ByID($parent_id);
  				BLL_a_data_objects::Insert_a_data_objects( $updated_data_object->id
  						, $old_a_data_object->user_id
  						, $old_a_data_object->process_id
  						, $old_a_data_object->object_title
  						, $old_a_data_object->location
  						, $old_a_data_object->rights_statement
  						, $old_a_data_object->rights_holder
  						, $old_a_data_object->description
  						, $old_a_data_object->taxon_concept_id
  						, $old_a_data_object->locked
  						, 1/*Automatically upadted*/
  				);  				
  			}//end if are exact
  			
  			//set the new_DO->parent_do_id=do_old[0]->id
  			BLL_data_objects::Update_data_object_set_Parent($updated_data_object->id,$parent_id);  	
  					
  			//Hide all old data objects
  			foreach ($old_data_objects as $old_data_object)
  			{
  				BLL_data_objects::Hide_DataObject($old_data_object->id);  				
  			}//end for each old_data Object

  			//Get all related taxon concept ids
  			migrate_updated_data_objects_and_its_taxons_relations($updated_data_object->id);
  		}
  		
  	}
	  	
}

echo "\r\nDone";



///////////////////////////Some internal Functions//////////////////////////////////////

function migrate_updated_data_objects_and_its_taxons_relations($updated_data_object_id)
{
	BLL_updated_data_objects::Delete_updated_dataObjects_By_id($updated_data_object_id);
	$related_taxons = BLL_updated_data_objects_taxon_concepts::Select_Updated_data_objects_taxon_concepts_By_DataObjectID($updated_data_object_id);
	foreach ($related_taxons as $related_taxon)
	{
		//insert the relation between new data object and related taxon concepts
		BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave', $related_taxon->taxon_concept_id, $updated_data_object_id );
		//delete that relation from the updated_data_objects_taxon_concept table
		BLL_updated_data_objects_taxon_concepts::Delete_updated_dataObjects_taxon_concepts($updated_data_object_id,  $related_taxon->taxon_concept_id);
	}
}

function compare_data_objects($old_id, $new_id)
{
	$old_do = BLL_data_objects::Select_DataObjects_ByID('slave', $old_id);
	$new_do = BLL_data_objects::Select_DataObjects_ByID('slave', $new_id);
	if(    strcmp(clean_string($old_do->object_title)		, clean_string($new_do->object_title)) ==0 
		&& strcmp(clean_string($old_do->description)		, clean_string($new_do->description)) ==0
		&& strcmp(clean_string($old_do->rights_statement)	, clean_string($new_do->rights_statement)) ==0
		&& strcmp(clean_string($old_do->rights_holder)		, clean_string($new_do->rights_holder)) ==0
		&& strcmp(clean_string($old_do->location)			, clean_string($new_do->location)) ==0
		) 	
		return true;
	else
		return false;	  
}

function clean_string($str)
{
	$clean_str = strtolower($str); //change to lower case 
	$clean_str = str_replace('&nbsp;',' ',$str); //replace html spaces tags	
	$clean_str = strip_tags($clean_str,'<img>'); //remove html tags except images
	$pattern= "/[^A-Za-z0-9 ]/";	
	$clean_str = preg_replace($pattern, '', $clean_str);//Perform a regular expression search and remove all non alphabet and non numeric characters 
	$clean_str = str_replace(' ','',$clean_str);//remove all spaces
	$clean_str = str_replace('\r\n','',$clean_str);//remove new lines
	$clean_str = str_replace('\n','',$clean_str);//remove new lines
	return $clean_str;	
}

function Redirect_species_to_task_distributor_or_translator()
{
	
}


?>