<?php

	class DAL_a_data_objects{	
   
		public $id;
		public $user_id;
   		public $process_id;   		
   		public $object_title;
   		public $rights_statement;
   		public $rights_holder;
   		public $description;
   		public $modified_at;   
   		public $locked;
   		public $location;	
   		public $taxon_concept_id;/*this field help to know the common object is locked by wich taxon page*/
   		public $translator_id;
   		public $linguistic_reviewer_id;
   		public $scientific_reviewer_id;
   		public $final_editor_id;
   		public $update_status_id;
   		
	}
?>