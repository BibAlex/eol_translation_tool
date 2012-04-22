<?php

	class DAL_data_objects{		 
		  public $id;
		  public $guid;
		  public $identifier;
		  public $data_type_id;
		  public $data_type;
		  public $mime_type_id;
		  public $mime_type;
		  public $object_title;
		  public $language_id;
		  public $language;
		  public $license_id;
		  public $license;
		  public $rights_statement;
		  public $rights_holder;
		  public $bibliographic_citation;
		  public $source_url;
		  public $description;
		  public $description_linked;
		  public $object_url;
		  public $object_cache_url;
		  public $thumbnail_url;
		  public $thumbnail_cache_url;
		  public $location;
		  public $latitude;
		  public $longitude;
		  public $altitude;
		  public $object_created_at;
		  public $object_modified_at;
		  public $created_at;
		  public $updated_at;
		  public $data_rating;
		  public $vetted_id;
		  public $visibility_id;
		  public $published;
		  public $curated;
		  public $words_count;		
		  
		  // added for harvesting
		  public $object_title_source;
		  public $rights_statement_source;
		  public $rights_holder_source;
		  public $description_source;
		  public $location_source;
		  
		  public $harvest_batch_id;
		  public $harvest_batch_type;
		  public $hidden;
		  public $parent_data_object_id;
		  public $locked_update; 
	}
?>