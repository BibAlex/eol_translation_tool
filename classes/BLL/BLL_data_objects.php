<?php


class BLL_data_objects {
   
	
	static function Insert_DataObject($DB, DAL_data_objects $dal_data_objects)
	{
		 $con = new PDO_Connection();
	  	 $con->Open($DB);
	  	
	  	 $stmt = $con->connection->prepare("INSERT INTO data_objects 
	  	 										(id, guid, identifier, data_type_id, mime_type_id,
	  	 										object_title, language_id, license_id, rights_statement,
	  	 										rights_holder, bibliographic_citation, source_url, description, 
	  	 										description_linked, object_url, object_cache_url, thumbnail_url, 
	  	 										thumbnail_cache_url, location, latitude, longitude, altitude, object_created_at,
	  	 										object_modified_at, created_at, updated_at, data_rating, vetted_id,
	  	 										visibility_id, published, curated, aeol_translation) 
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
		 $stmt->bindParam(32, $dal_data_objects->aeol_translation);
		 	
		 $stmt->execute();
		 $con->Close();

	}

	
	static function Select_DataObjects_ByTaxonConceptID($DB, $_taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);

	  	 if ($DB == 'master') {
	  	 	// some changes for switching to V2 DB
	  	 	$str = "SELECT distinct data_objects.* 
	  	 					   FROM data_objects
	  	 					   
	                           INNER JOIN data_objects_hierarchy_entries dohe ON (data_objects.id=dohe.data_object_id)
                               INNER JOIN hierarchy_entries he ON (he.id=dohe.hierarchy_entry_id)
	                           LEFT OUTER JOIN 	data_objects_table_of_contents 		ON (data_objects_table_of_contents.data_object_id = data_objects.id)
							   LEFT OUTER JOIN 	table_of_contents 			  		ON (toc_id= table_of_contents.id)
	                           
							   WHERE he.taxon_concept_id=".$_taxon_concept_id."
	                               AND data_objects.published=1 AND dohe.visibility_id=2 AND 
	                               		(
	                               			data_type_id=1 or data_type_id=2 or data_type_id=4 or data_type_id=7 or data_type_id=8 
	                               			OR
	                               			(
	                               				data_type_id=3
	                               				AND
	                               				(
		                               			toc_id IN (".$GLOBALS['TOC_included_parent_ids'].")
		                                		 OR 
	                                			table_of_contents.parent_id IN (".$GLOBALS['TOC_included_parent_ids'].")	                               			
	                               				)	
                               				)
	                               		);";
	  	 } else {
	  	 	$str = "SELECT data_objects.* 
	  	 					   FROM data_objects
	  	 					   
	                           INNER JOIN 		data_objects_taxon_concepts         ON (data_objects.id=data_objects_taxon_concepts.data_object_id)
                               LEFT OUTER JOIN 	data_objects_table_of_contents 		ON (data_objects_table_of_contents.data_object_id = data_objects.id)
							   LEFT OUTER JOIN 	table_of_contents 			  		ON (toc_id= table_of_contents.id)
	                           
							   WHERE data_objects_taxon_concepts.taxon_concept_id=".$_taxon_concept_id."
	                               AND published=1 AND visibility_id=2 AND 
	                               		(
	                               			data_type_id=1 or data_type_id=2 or data_type_id=4 or data_type_id=7 or data_type_id=8 
	                               			OR
	                               			(
	                               				data_type_id=3
	                               				AND
	                               				(
		                               			toc_id IN (".$GLOBALS['TOC_included_parent_ids'].")
		                                		 OR 
	                                			table_of_contents.parent_id IN (".$GLOBALS['TOC_included_parent_ids'].")	                               			
	                               				)	
                               				)
	                               		);";
	  	 }
	  	 
	  	 
	  	 
	  	 
	  	 $stmt = $con->connection->prepare($str);	 	
	    
	    	    
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	static function Select_Images_ByTaxonConceptID($DB, $taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $str = "select distinct do.*
					  	  from data_objects do
					  	  Inner join top_images ti on ti.data_object_id=do.id
					  	  Inner join hierarchy_entries he on he.id=ti.hierarchy_entry_id
					  	  Inner join data_objects_hierarchy_entries dohe on dohe.data_object_id=do.id					  	  
	  	 			where taxon_concept_id=? and do.published=1 AND dohe.visibility_id=2;";
	  	 
	  	$stmt = $con->connection->prepare($str);
	    $stmt->bindParam(1, $taxon_concept_id);	    
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	
	static function Select_DataObjects_ByTaxonConceptID_ByType($DB, $taxon_concept_id,$type) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT data_objects.* FROM data_objects
	                           INNER JOIN  data_objects_taxon_concepts
	                                ON (data_objects.id=data_object_id)
	                           INNER JOIN data_types 
	                           		ON (data_types.id = data_objects.data_type_id)
	                           WHERE  data_objects_taxon_concepts.taxon_concept_id=?
	                               AND data_types.type=? AND data_objects.published=1 AND data_objects.visibility_id=1;");
	 	
	    $stmt->bindParam(1, $taxon_concept_id);
	    $stmt->bindParam(2, $type);//type is 'image','text','video'
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	static function Select_Light_DataObjects_ByTaxonConceptID_ByType($DB, $taxon_concept_id,$type) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT 
	  	 								data_objects.id, 
	  	 								data_objects.object_title,
	  	 								data_objects.data_type_id,
	  	 								data_objects.object_cache_url
	  	 						
	  	 						FROM data_objects
	                           INNER JOIN  data_objects_taxon_concepts
	                                ON (data_objects.id=data_object_id)
	                           INNER JOIN data_types 
	                           		ON (data_types.id = data_objects.data_type_id)
	                           		
	                           WHERE  data_objects_taxon_concepts.taxon_concept_id=?
	                               AND data_types.type=?;");
	 	
	    $stmt->bindParam(1, $taxon_concept_id);
	    $stmt->bindParam(2, $type);//type is 'image','text','video'
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	static function Count_DataObjects_ByTaxonConceptID($DB, $taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT COUNT(id)
	  	 						FROM data_objects
	                           INNER JOIN  data_objects_taxon_concepts
	                                ON (data_objects.id=data_object_id)	                        
	                           WHERE  data_objects_taxon_concepts.taxon_concept_id=?;");
	 	
	    $stmt->bindParam(1, $taxon_concept_id);
		$stmt->execute();		
		$records = $stmt->fetchColumn();		
	    $con->Close();    
	    return $records;    
	}
	
	static function Select_DataObjects_ByID($DB, $ObjID) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT * FROM data_objects WHERE id=?;");
	 	
	    $stmt->bindParam(1, $ObjID);
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records[0];    
	}
	
	static function Select_all_text_data_objects_id($DB,$startID) 
	{
		$con = new PDO_Connection();
	  	$con->Open($DB);		  	
	  	$query = $con->connection->prepare("SELECT id FROM data_objects WHERE data_type_id=3  AND id>=? ORDER BY id");
	  	$query->bindParam(1, $startID);
	  	$query->execute();
	  	$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;
	}

	static function Exist_DataObjects_ByID($DB, $ObjID) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT COUNT(id) FROM data_objects WHERE id=?;");
	 	
	    $stmt->bindParam(1, $ObjID);
		$stmt->execute();		
		$result = $stmt->fetchColumn();		
	    $con->Close();   
	    return $result;    
	}
	
}

?>