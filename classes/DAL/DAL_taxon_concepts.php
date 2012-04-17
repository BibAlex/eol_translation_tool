<?php

	class DAL_taxon_concepts{	

		  public $id;
		  public $supercedure_id;
		  public $split_from;
		  public $vetted_id;
		  public $published;
		  public $selection_id;
		  public $translator_id;
		  public $translator_assigned;
		  public $linguistic_reviewer_id;
		  public $linguistic_assigned;
		  public $scientific_reviewer_id;
		  public $final_editor_id;
		  public $taxon_status_id;
		  public $scientificName;
		  public $total_text_objects;
		  public $total_image_objects;
		  public $total_other_objects;
		  public $taxon_status;
		  public $selection_date;
		  public $taskdistribution_date;/*date of finishing the task distribution*/
		  public $translation_date;/*date of finishing translation of all data objectes*/
		  public $scientificreview_date;/*date of finishing scientific review*/
		  public $linguisticreview_date;/*date of finishing linguistic review*/
		  public $finalediting_date;/*date of finishing final editing*/
		  public $publish_date;/*date of publishing*/
		  public $total_EnglishObjects;
		  public $total_ArabicObjects;
		  public $selected_by;
		  public $priority; /* Priorities -> label "virtual denormalized field "*/
		  public $taxon_update; //added by Yosra 01-04-2012 for "updating scenario" 1=> Taxon has been reversed (to be displayed in task distribution page under "Updated Species" category) 
		  
		  public function Dates($date)
		  {
		  	if($date=='0000-00-00 00:00:00' || $date=='')
		  		return '---';
		  	else return $date;
		  }
		  
		  public function getTranslatorName()
		  {
			return BLL_users::get_user_name($this->translator_id);	  	
		  }
		  public function getLinguisticReviewerName()
		  {
			return BLL_users::get_user_name($this->linguistic_reviewer_id);	  	
		  }
		  public function getScientificReviewerName()
		  {
			return BLL_users::get_user_name($this->scientific_reviewer_id);	  	
		  }
		  public function getFinalEditorName()
		  {
			return BLL_users::get_user_name($this->final_editor_id);	  	
		  }
	 	 		  
		  public function getSelection_date()
		  {
		  	return $this->Dates($this->selection_date);
		  }
		  
		  public function getTaskdistribution_date()
		  {
		  	return $this->Dates($this->taskdistribution_date);
		  }
		  
		  public function getTranslation_date()
		  {
		  	return $this->Dates($this->translation_date);
		  }		  
		  
		  public function getLinguisticreview_date()
		  {
		  	return $this->Dates($this->linguisticreview_date);
		  }		  
		  
		  public function getScientificreview_date()
		  {
		  	return $this->Dates($this->scientificreview_date);
		  }
		  
		  public function getFinalediting_date()
		  {
		  	return $this->Dates($this->finalediting_date);
		  }
		  
		  public function getPublish_date()
		  {		  	
		 	 return $this->Dates($this->publish_date);
		  }
		  
		  public function getSelectorName()
		  {		  	
		 	 $user = BLL_selection_batches::Select_SelectorName_ByBatchId($this->selection_id);		 	 
		 	 return $user->name;
		  }
		  
	}
?>