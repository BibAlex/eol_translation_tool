<?php
/*
 * Created on Apr 23, 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

	class Species_Functions {
		static function SubmitAction($objectID,$userID,$process, $actionType, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id)
		{
			$cur_process = $process;
			if($actionType==1)//finishscientific_reviewer_id
			{
				$locked=0;
				$process =$process+1;
			}
			else
				$locked=1;//Save only in current process
				
			//if a record already exsist so update
			$exists = BLL_a_data_objects::Exist_a_data_objects($objectID); 
			if($exists>0)
				BLL_a_data_objects::Update_a_data_objects($objectID, $userID, $process, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id, $locked);
			else //insert new
				BLL_a_data_objects::Insert_a_data_objects($objectID, $userID, $process, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id, $locked);
			BLL_a_data_objects::Update_User_of_a_data_objects($objectID, $userID, $cur_process);
			
			return $process;
		}
		
		static function FinishAll($tid, $process, $userID)
		{	
			$locked=0;
			$arObjs = BLL_a_data_objects::Select_a_data_objects_ByTaxonID($tid);	
			foreach($arObjs as $arObj)
			{
				if($arObj->process_id == $process && ($arObj->locked==0 || $arObj->user_id==$userID))
				{
					BLL_a_data_objects::Update_a_data_objects($arObj->id,$userID,$process+1,  $arObj->object_title,$arObj->location, $arObj->rights_statement , $arObj->rights_holder, $arObj->description, $tid, $locked);
					BLL_a_data_objects::Update_User_of_a_data_objects($arObj->id, $userID, $process);
				}
			}
			//Update status of all taxon concetps related to this taxon object
			$updated_taxons = BLL_data_objects_taxon_concepts::Select_taxons_incommon_ByTaxon_ID('slave',$tid);
			return Species_Functions::Update_Status($updated_taxons,$process+1,$userID);
		}
		
		static function Update_Status($updated_taxons,$process, $userID)
		{
			foreach ($updated_taxons as  $updated_taxon)
			{
				$curtax = BLL_taxon_concepts::Select_taxon_concept('slave', $updated_taxon->taxon_concept_id);
				if($curtax != null && $curtax->taxon_status_id<$process)
				{
					$number_of_en_objects = BLL_data_objects::Count_DataObjects_ByTaxonConceptID('slave',$curtax->id);
					$number_of_ar_objects = BLL_a_data_objects::Count_a_dataObjects_ByTaxonConceptID($curtax->id,$process);
					if($number_of_en_objects == $number_of_ar_objects)
					{
						//If this is taxon of hte current page
						if($GLOBALS['taxonID']==$updated_taxon->taxon_concept_id){
							$GLOBALS['UpdateTaxonStatus']=1;//update the global variable defined
							$update = Species_Functions::checkUpdate($updated_taxon->taxon_concept_id);
							if(!$update){
								BLL_taxon_concepts::Update_taxon_concepts_Status($curtax->id,$process,$userID);
								//Send email for the next step assigned person
								BLL_taxon_concepts::SendMailNotification($curtax,$process,$userID);
							}
						}
						else{
							BLL_taxon_concepts::Update_taxon_concepts_Status($curtax->id,$process,$userID);
							//Send email for the next step assigned person
							BLL_taxon_concepts::SendMailNotification($curtax,$process,$userID);							
						}				
					}
				}
			}
			return $update;
		}
		
		static function checkUpdate($taxonID){
			//checkUpdates
			if(BLL_data_objects::Exist_Updated_Object_Select_By_Taxon_id($taxonID) > 0){//ther are updated object(s)
				//Check updated and locked
				$updated_objects = BLL_data_objects::Select_Updated_Data_Objects_By_Taxon_id($taxonID);
				$reverse = false;
				foreach ($updated_objects as $updated_DO) {
//       				if($updated_DO->locked_update == 0){
       					$reverse = true;
//       				}
//       				else{
//       					BLL_data_objects::Update_Locked_update_DataObject($updated_DO->id, 0);	
//       				}
       				BLL_data_objects::Update_Hidden_DataObject($updated_DO->id, 0);
       				//Select all updated objects, set there hidden to 0 and there old objects hidden to 1
					$old_data_objects = BLL_data_objects::Select_DataObjects_ByGuid_NOT_Hidden($updated_DO->guid, $updated_DO->data_type_id);
					if(COUNT($old_data_objects) > 0){
						foreach ($old_data_objects as $old_data_object) {
							BLL_data_objects::Update_Hidden_DataObject($old_data_object->id, 1);  				
						}//end for each old_data Object	
					}
				}
				if($reverse){
					BLL_taxon_concepts::Update_reverse_taxon($taxonID);	//reverse taxon to updated taxon distribution
					return true;
				}
			}
			return false;
		}
	}
?>
