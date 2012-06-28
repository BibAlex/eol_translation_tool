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
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';


echo "Welcome in the merging process of the updated_data_objects into updated data objects Job\r\n";

//create new batch update record by the current datetime
$updated_data_objects = BLL_updated_data_objects::Select_all_updated_dataObjects();
//$updated_data_objects = BLL_updated_data_objects::Select_DataObject_ByID(10669712);
echo "Number of pending updated dataobjects= " . COUNT($updated_data_objects) . "\r\n";

//loop on each updated data_object  
foreach ($updated_data_objects as $updated_data_object){
	echo "--------------------------\r\n";
	echo "updated_data_object_id" . $updated_data_object->id . "\r\n";
	//if this updated data_object has never been available in the data_objects table 
  	if(BLL_data_objects::Exist_DataObjects_ByID('slave',$updated_data_object->id)==0)//the normal case, no mistake
  	{  	
  		echo "if normal case, no mistake\r\n";
  		// Hide all old data objects if they have no translations yet and are not marked as hidden
  		BLL_data_objects::Hide_DataObject_If_no_adata_object($updated_data_object->guid, $updated_data_object->data_type_id);
  		// Create the new data object record
  		BLL_data_objects::Insert_Updated_DataObject($updated_data_object);
  		//get all old data objects with same guid and not hidden
  		$old_data_objects = BLL_data_objects::Select_DataObjects_ByGuid_NOT_Hidden($updated_data_object->guid, $updated_data_object->data_type_id);
  		
  		//if data_object is totally a new one and there is no old one
  		if(COUNT($old_data_objects)==0)
  		{
  			echo "no old data_objects\r\n";
  			// Delete the current updated_data_object
			BLL_updated_data_objects::Delete_updated_dataObjects_By_id($updated_data_object->id);
			echo "reverse_taxon_first_case\r\n";
	  		reverse_taxons($updated_data_object, $old_data_objects);	  				
  		}  		
  		//Cases edited by Yosra 8-4-2012 to adjust data_objects and taxons  		
  		else //There is a translation in old data objects
  		{
  			echo "there are old data_objects for id\r\n";
  			$parent_id = $old_data_objects[0]->id;//because first 1 is the most advanced one in the translation workflow (ORDER BY proess_id DESC;)
  			$are_exact = compare_data_objects($parent_id, $updated_data_object->id);
  			
  			//set the new_DO->parent_do_id=do_old[0]->id
	  		BLL_data_objects::Update_data_object_set_Parent($updated_data_object->id,$parent_id);
	  			
  			if($are_exact==true)
  			{
  				echo "old and new data objects are the same for id\r\n";
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
  			else{	//else not exact, data_object needs to be "RE-Translated"
  				echo "old and new data objects are not the same\r\n";
  				echo "reverse_method_second_case\r\n";
  				reverse_taxons($updated_data_object, $old_data_objects);
  			}
  		}
  	}//end if normal case, no mistake
  	else
  	{
  		echo "\r\nMistake: Already exists!!!!!!!!!!!!!!!!!!!!!!!\r\n";
  	}
  	//Get all related taxon concept ids
  	migrate_updated_data_objects_and_its_taxons_relations($updated_data_object->id);  	
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
	$clean_str = str_replace('&nbsp;',' ',$clean_str); //replace html spaces tags	//Yosra changes str_replace('&nbsp;',' ',$str) to str_replace('&nbsp;',' ',$clean_str)
	$clean_str = strip_tags($clean_str,'<img><a>'); //remove html tags except images and links <a> According to http://php.net/manual/en/function.strip-tags.php manual
	$pattern= "/[^A-Za-z0-9 ]/";	
	$clean_str = preg_replace($pattern, '', $clean_str);//Perform a regular expression search and remove all non alphabet and non numeric characters 
	$clean_str = str_replace(' ','',$clean_str);//remove all spaces
	$clean_str = str_replace('\r\n','',$clean_str);//remove new lines
	$clean_str = str_replace('\n','',$clean_str);//remove new lines
	return $clean_str;	
}

//Added by Yosra 10-4-2012
function reverse_taxons($data_object, $old_data_objects){
	//Get all taxon of the data_object to check their states
	$taxons = BLL_updated_data_objects_taxon_concepts::Select_taxon_concepts_status_By_DataObjectID($data_object->id);
	$intermediate = false;	//a variable to determine if there is ONE OR MORE related taxon in intermediate phases (translation, linguistic, scientific review,...)
	echo "Number of Taxons attached to data objects" . COUNT($taxons) . "\r\n";
	foreach ($taxons as $taxon) {
		if ($taxon->taxon_status_id != 1 && $taxon->taxon_status_id != 6){ //if ONE OR MORE are in intermediate states, set the new_DO->hidden=2
			echo "intermediate = true\r\n";
			//set the new_DO->hidden=2
			BLL_data_objects::Update_data_object_set_Hidden($data_object->id, 2);//hidden=0> visible, hidden=1>invisible, hidden=2>updated and pending to be visible
			$intermediate = true;
			break;	
		}
	}
	if(!$intermediate)
	{//this means that all related taxons are before translation or published
		echo "no intermediate case\r\n";
		$max_updatedObj = 0;	//a variable to determine which attached taxon has the most number of attached updated data_objects
		$max_taxon_id = 0;
		
		//loop taxons states to determine which has the most number of updated species 
		foreach ($taxons as $taxon) {
			//Count the number of updataed data objects attached to each taxons
				//the count is done in two steps and from two tables
					//the updated objects in table "updated" which returns the number of the updated objects that have not been processed yet
					//and updated objects in table "data_objecys" which returns the number of the updated objects that have been process and thus have hidden = 2
			echo "current taxon " . $taxon->id . "\r\n"; 
			$count = BLL_updated_data_objects_taxon_concepts::Count_updated_objects_by_taxon_concept_id($taxon->id);
			echo "count in table updated" . $count . "\r\n";
			$count += BLL_data_objects_taxon_concepts::Count_updated_objects_by_taxon_concept_id($taxon->id, $data_object->harvested_batch_id, $GLOBALS['harvest_batch_type_updates_batch']);
			echo "count total" . $count . "\r\n";
			//count will be 1 min because the current taxon already exisist in teh updated table
			if($max_updatedObj < $count){
				$max_updatedObj = $count;
				$max_taxon_id = $taxon->id;
			}
		}
		
		echo "Max Taxon id " . $max_taxon_id . "\r\n";
		BLL_taxon_concepts::Update_reverse_taxon($max_taxon_id);
		if(COUNT($old_data_objects) != 0){
			echo "Number of old objects " . COUNT($old_data_objects) . "\r\n";
			foreach ($old_data_objects as $old_data_object) {
				BLL_data_objects::Update_Hidden_DataObject($old_data_object->id, 1);  				
			}//end for each old_data Object	
		}
	}//end if not itermediate phase
}
?>