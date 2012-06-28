<?php
/**
 * Author: Yosra Alaa
 * Date: 2012-06-13
 * 
 * This file is a customization code to merge "certain" updated data objects 
 * updated objects processed in this code
 * 1. New data objects (no old data objects - no guids)	
 * 2. Updated data objects to old data objects that have no translation
 * 3. Updated data objects where the new updated objects is equal to the old data object
 * 4. Updated data objects where old = new only if phase is <2 or phase >6
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
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';


echo "Welcome in the customized merging process of the updated_data_objects into updated data objects Job\r\n";

//create new batch update record by the current datetime
$updated_data_objects = BLL_updated_data_objects::Select_all_updated_dataObjects();

echo "Number of pending updated dataobjects= " . COUNT($updated_data_objects) . "\r\n";

$cnt_new_do_in_tr=0;
$cnt_new_do_not_in_tr=0;
$cnt_upd_do_no_tr=0;
$cnt_upd_do_exact_tr=0;
$cnt_upd_do_not_exact_tr=0;
//loop on each updated data_object  
foreach ($updated_data_objects as $updated_data_object){
	echo "--------------------------\r\n";
	echo "updated_data_object_id" . $updated_data_object->id . "\r\n";
	//if this updated data_object has never been available in the data_objects table 
  	if(BLL_data_objects::Exist_DataObjects_ByID('slave',$updated_data_object->id)==0)//the normal case, no mistake
  	{  	
  		echo "if normal case, no mistake\r\n";
  		//1. Check if the object is new
  		if(BLL_data_objects::Exist_DataObjects_ByGUID('slave', $updated_data_object->guid)==0){	//has no old data objects
  			echo ("1. object has no old data objects - no guids found\r\n");
  			if(checkTranslationPhase($updated_data_object->id))
  			{
  				echo ("1. migrate object as it is in translation phase\r\n");
  				migrate_updated_data_objects_and_its_taxons_relations($updated_data_object);
  				$cnt_new_do_in_tr++; 	
  			}
  			else
  			{
  				$cnt_new_do_not_in_tr++;
  			}
  			
  		}
  		else{	//has old data objects
  			// Hide all old data objects if they have no translations yet and are not marked as hidden  
  			// will show them again if no processing, the updated data object did not migrated to the data object table
  			echo ("hide all objects with no translation\r\n");
  			BLL_data_objects::Hide_DataObject_If_no_adata_object($updated_data_object->guid, $updated_data_object->data_type_id);
  			//get all old data objects with same guid and not hidden
  			$old_data_objects = BLL_data_objects::Select_DataObjects_ByGuid_NOT_Hidden($updated_data_object->guid, $updated_data_object->data_type_id);
  			if(COUNT($old_data_objects)==0)
	  		{
	  			echo ("2. object has old data objects but non translated\r\n");
	  			migrate_updated_data_objects_and_its_taxons_relations($updated_data_object);
	  			$cnt_upd_do_no_tr++;				  				
	  		}
	  		else //There is a translation in old data objects
	  		{
	  			echo ("object has old data objects some of which are translated\r\n");
	  			$parent_id = $old_data_objects[0]->id;//because first 1 is the most advanced one in the translation workflow (ORDER BY proess_id DESC;)
	  			$are_exact = compare_data_objects($parent_id, $updated_data_object->id);
	  			if($are_exact==true)
	  			{
	  				$cnt_upd_do_exact_tr++;
	  				echo ("old and updated objects are exact\r\n");
	  				//Get all related taxon concept ids
	  				echo ("3. migrate and hide old data objects\r\n");
  					migrate_updated_data_objects_and_its_taxons_relations($updated_data_object); 
					//set the new_DO->parent_do_id=do_old[0]->id
		  			BLL_data_objects::Update_data_object_set_Parent($updated_data_object->id,$parent_id);
	  				
	  				//create the new arabic data object
	  				$old_a_data_object = BLL_a_data_objects::Select_a_data_objects_ByID($parent_id);
	  				BLL_a_data_objects::Insert_updated_a_data_objects($updated_data_object->id
	  						, $old_a_data_object->user_id
	  						, $old_a_data_object->process_id
	  						, $old_a_data_object->object_title
	  						, $old_a_data_object->location
	  						, $old_a_data_object->rights_statement
	  						, $old_a_data_object->rights_holder
	  						, $old_a_data_object->description
	  						, $old_a_data_object->taxon_concept_id
	  						, $old_a_data_object->locked
	  						, $old_a_data_object->translator_id
	  						, $old_a_data_object->linguistic_reviewer_id
	  						, $old_a_data_object->scientific_reviewer_id
	  						, $old_a_data_object->final_editor_id
	  						, 1/*Automatically upadted*/
	  				);  	
		  			//Hide all old data objects
		  			foreach ($old_data_objects as $old_data_object)
		  			{
		  				BLL_data_objects::Update_Hidden_DataObject($old_data_object->id, 1);  				
		  			}//end for each old_data Object
	  			}//end if are exact
	  			else{
	  				$cnt_upd_do_not_exact_tr++;
					//To return the already hidden data objects made in the start of the code 
  					//because no actions are done on the new data objects because the updated data object 
					//not equal to the old one while the old already has a translation 
  					BLL_data_objects::Show_DataObject_If_no_adata_object($updated_data_object->guid, $updated_data_object->data_type_id);	  				
	  			}
	  		}	
  		}
  	}//end if normal case, no mistake
  	else
  	{
  		echo "\r\nMistake: Already exists!!!!!!!!!!!!!!!!!!!!!!!\r\n";
  	}
}

echo "\r\nDone\r\n--------------------------";
echo "\r\ncnt_new_do_in_tr= $cnt_new_do_in_tr \r\ncnt_new_do_not_in_tr= $cnt_new_do_not_in_tr \r\ncnt_upd_do_no_tr= $cnt_upd_do_no_tr \r\ncnt_upd_do_exact_tr= $cnt_upd_do_exact_tr \r\ncnt_upd_do_not_exact_tr= $cnt_upd_do_not_exact_tr";



///////////////////////////Some internal Functions//////////////////////////////////////

function migrate_updated_data_objects_and_its_taxons_relations($updated_data_object)
{
	// Create the new data object record
	BLL_data_objects::Insert_Updated_DataObject($updated_data_object);
	// Delete the current updated_data_object
	BLL_updated_data_objects::Delete_updated_dataObjects_By_id($updated_data_object->id);	
	$related_taxons = BLL_updated_data_objects_taxon_concepts::Select_Updated_data_objects_taxon_concepts_By_DataObjectID($updated_data_object->id);
	foreach ($related_taxons as $related_taxon)
	{
		//insert the relation between new data object and related taxon concepts
		BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave', $related_taxon->taxon_concept_id, $updated_data_object->id );
		//delete that relation from the updated_data_objects_taxon_concept table
		BLL_updated_data_objects_taxon_concepts::Delete_updated_dataObjects_taxon_concepts($updated_data_object->id,  $related_taxon->taxon_concept_id);
	}
}

function compare_data_objects($old_id, $new_id)
{
	$old_do = BLL_data_objects::Select_DataObjects_ByID('slave', $old_id);
	$new_do = BLL_updated_data_objects::Select_DataObject_ByID($new_id);
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
	$clean_str = str_replace('&nbsp;',' ',$clean_str); //replace html spaces tags	//Yosra changes str_replace('&nbsp;',' ',$str) to str_replace('&nbsp;',' ',$clean_str)
	$clean_str = strip_tags($clean_str,'<img><a>'); //remove html tags except images and links <a> According to http://php.net/manual/en/function.strip-tags.php manual
	$pattern= "/[^A-Za-z0-9 ]/";	
	$clean_str = preg_replace($pattern, '', $clean_str);//Perform a regular expression search and remove all non alphabet and non numeric characters 
	$clean_str = str_replace(' ','',$clean_str);//remove all spaces
	$clean_str = str_replace('\r\n','',$clean_str);//remove new lines
	$clean_str = str_replace('\n','',$clean_str);//remove new lines
	return $clean_str;	
}

function checkTranslationPhase($data_object_id){
	$taxons = BLL_updated_data_objects_taxon_concepts::Select_taxon_concepts_status_By_DataObjectID($data_object_id);
	foreach ($taxons as $taxon) {
		if ($taxon->taxon_status_id > 2){
			return false;
		}
	}
	return true;
}
?>