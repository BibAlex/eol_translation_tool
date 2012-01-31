<?php
	class BLL_updated_data_objects {
	   	    
		static function Insert_Updated_DataObject(DAL_data_objects $dal_data_objects,$harvested_batch_id)
		{
			 $con = new PDO_Connection();
		  	 $con->Open('slave');
		  	
		  	 $stmt = $con->connection->prepare("INSERT INTO updated_data_objects 
		  	 										(id,guid,identifier,data_type_id,mime_type_id
		  	 										,object_title,language_id,license_id
		  	 										,rights_statement,rights_holder,bibliographic_citation
		  	 										,source_url,description,description_linked,object_url,object_cache_url
		  	 										,thumbnail_url,thumbnail_cache_url,location,latitude,longitude
		  	 										,altitude,object_created_at,object_modified_at,created_at,updated_at
		  	 										,data_rating,vetted_id,visibility_id,published,curated,harvested_batch_id) 
		  	 									VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");			 
			 $stmt->bindParam(1, $dal_data_objects->id);
			 $stmt->bindParam(2, $dal_data_objects->guid);
			 $stmt->bindParam(3, $dal_data_objects->identifier);
			 $stmt->bindParam(4, $dal_data_objects->data_type_id);
			 $stmt->bindParam(5, $dal_data_objects->mime_type_id);
			 $stmt->bindParam(6, $dal_data_objects->object_title);
			 $stmt->bindParam(7, $dal_data_objects->language_id);		
			 $stmt->bindParam(8, $dal_data_objects->license_id);			 
			 $stmt->bindParam(9, $dal_data_objects->rights_statement);
			 $stmt->bindParam(10, $dal_data_objects->rights_holder);
			 $stmt->bindParam(11, $dal_data_objects->bibliographic_citation);
			 $stmt->bindParam(12, $dal_data_objects->source_url);
			 $stmt->bindParam(13, $dal_data_objects->description);
			 $stmt->bindParam(14, $dal_data_objects->description_linked);
			 $stmt->bindParam(15, $dal_data_objects->object_url);
			 $stmt->bindParam(16, $dal_data_objects->object_cache_url);
			 $stmt->bindParam(17, $dal_data_objects->thumbnail_url);
			 $stmt->bindParam(18, $dal_data_objects->thumbnail_cache_url);
			 $stmt->bindParam(19, $dal_data_objects->location);
			 $stmt->bindParam(20, $dal_data_objects->latitude);
			 $stmt->bindParam(21, $dal_data_objects->longitude);
			 $stmt->bindParam(22, $dal_data_objects->altitude);
			 $stmt->bindParam(23, $dal_data_objects->object_created_at);
			 $stmt->bindParam(24, $dal_data_objects->object_modified_at);
			 $stmt->bindParam(25, $dal_data_objects->created_at);
			 $stmt->bindParam(26, $dal_data_objects->updated_at);
			 $stmt->bindParam(27, $dal_data_objects->data_rating);
			 $stmt->bindParam(28, $dal_data_objects->vetted_id);
			 $stmt->bindParam(29, $dal_data_objects->visibility_id);
			 $stmt->bindParam(30, $dal_data_objects->published);
			 $stmt->bindParam(31, $dal_data_objects->curated);
			 $stmt->bindParam(32, $harvested_batch_id);
			 	
			 $stmt->execute();
			 $con->Close();
		}
		
		
		static function Delete_updated_dataObjects_By_guid($guid)
		{
			 $con = new PDO_Connection();
		  	 $con->Open('slave');	  
		  	 $stmt = $con->connection->prepare("DELETE FROM  updated_data_objects WHERE guid=?");			 
			 $stmt->bindParam(1, $guid);
			 $stmt->execute();
			 $con->Close();
		}
		
		static function Select_all_updated_dataObjects() 
		{
		 	$con = new PDO_Connection();
		  	$con->Open('slave');			  	
		  	$stmt = $con->connection->prepare("SELECT * FROM updated_data_objects;");		 	
		    $stmt->execute();		
			$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_updated_data_objects');		
		    $con->Close();    
		    return $records;    
		}
	}
?>