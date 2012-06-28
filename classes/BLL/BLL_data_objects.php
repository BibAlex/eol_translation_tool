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
	
	static function Insert_Updated_DataObject(DAL_updated_data_objects $dal_updated_data_objects)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');
	  	
	  	 $stmt = $con->connection->prepare("INSERT INTO data_objects 
	  	 										(id, guid, identifier, data_type_id, mime_type_id,
	  	 										object_title, language_id, license_id, rights_statement,
	  	 										rights_holder, bibliographic_citation, source_url, description, 
	  	 										description_linked, object_url, object_cache_url, thumbnail_url, 
	  	 										thumbnail_cache_url, location, latitude, longitude, altitude, object_created_at,
	  	 										object_modified_at, created_at, updated_at, data_rating, vetted_id,
	  	 										visibility_id, published, curated, aeol_translation,harvest_batch_id, harvest_batch_type) 
	  	 									VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");			 
		 $stmt->bindParam(1, $dal_updated_data_objects->id);
		 $stmt->bindParam(2, $dal_updated_data_objects->guid);
		 $stmt->bindParam(3, $dal_updated_data_objects->identifier);
		 $stmt->bindParam(4, $dal_updated_data_objects->data_type_id);
		 $stmt->bindParam(5, $dal_updated_data_objects->mime_type_id);
		 $stmt->bindParam(6, $dal_updated_data_objects->object_title);
		 $stmt->bindParam(7, $dal_updated_data_objects->language_id);
		 $stmt->bindParam(8, $dal_updated_data_objects->license_id);
		 $stmt->bindParam(9, $dal_updated_data_objects->rights_statement);
		 $stmt->bindParam(10, $dal_updated_data_objects->rights_holder);
		 $stmt->bindParam(11, $dal_updated_data_objects->bibliographic_citation);
		 $stmt->bindParam(12, $dal_updated_data_objects->source_url);
		 $stmt->bindParam(13, $dal_updated_data_objects->description);
		 $stmt->bindParam(14, $dal_updated_data_objects->description_linked);
		 $stmt->bindParam(15, $dal_updated_data_objects->object_url);
		 $stmt->bindParam(16, $dal_updated_data_objects->object_cache_url);
		 $stmt->bindParam(17, $dal_updated_data_objects->thumbnail_url);
		 $stmt->bindParam(18, $dal_updated_data_objects->thumbnail_cache_url);
		 $stmt->bindParam(19, $dal_updated_data_objects->location);
		 $stmt->bindParam(20, $dal_updated_data_objects->latitude);
		 $stmt->bindParam(21, $dal_updated_data_objects->longitude);
		 $stmt->bindParam(22, $dal_updated_data_objects->altitude);
		 $stmt->bindParam(23, $dal_updated_data_objects->object_created_at);
		 $stmt->bindParam(24, $dal_updated_data_objects->object_modified_at);
		 $stmt->bindParam(25, $dal_updated_data_objects->created_at);
		 $stmt->bindParam(26, $dal_updated_data_objects->updated_at);
		 $stmt->bindParam(27, $dal_updated_data_objects->data_rating);
		 $stmt->bindParam(28, $dal_updated_data_objects->vetted_id);
		 $stmt->bindParam(29, $dal_updated_data_objects->visibility_id);
		 $stmt->bindParam(30, $dal_updated_data_objects->published);
		 $stmt->bindParam(31, $dal_updated_data_objects->curated);
		 $stmt->bindParam(32, $dal_updated_data_objects->aeol_translation);
		 $stmt->bindParam(33, $dal_updated_data_objects->harvested_batch_id);
		 $stmt->bindParam(34, $GLOBALS['harvest_batch_type_updates_batch']);
		 	
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
	                               AND language_id=".$GLOBALS['language_en']."
	                               AND data_objects.published=1 AND dohe.visibility_id=".$GLOBALS['visibility_visible']." AND 
	                               		(
	                               			data_type_id=".$GLOBALS['data_types_images']." 
	                               			OR data_type_id in (".$GLOBALS['data_types_media'].")
	                               			OR
	                               			(
	                               				data_type_id=".$GLOBALS['data_types_text']."
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
	                               AND published=1 AND visibility_id=".$GLOBALS['visibility_visible']." AND 
	                               		(
	                               			data_type_id=".$GLOBALS['data_types_images']." 
	                               			OR data_type_id in (".$GLOBALS['data_types_media'].")
	                               			OR
	                               			(
	                               				data_type_id=".$GLOBALS['data_types_text']."
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
	  	 if ($DB == 'master') {
	  	 	$str = "select distinct(data_objects.id) from data_objects
	                        	Inner join top_concept_images tc on tc.data_object_id=data_objects.id
	                        	Inner join data_objects_hierarchy_entries dohe on dohe.data_object_id=data_objects.id	                        	
	                            where language_id=".$GLOBALS['language_en']."
	                            	and published=1 
	                            	and tc.taxon_concept_id=?
									and dohe.visibility_id<>".$GLOBALS['visibility_invisible'];
	  	} else {
	  		$str = "select distinct do.*
					  	  from data_objects do
					  	  Inner join top_images ti on ti.data_object_id=do.id
					  	  Inner join hierarchy_entries he on he.id=ti.hierarchy_entry_id
					  	  Inner join data_objects_hierarchy_entries dohe on dohe.data_object_id=do.id					  	  
	  	 			where taxon_concept_id=? 
	  	 				and do.published=1 AND dohe.visibility_id=".$GLOBALS['visibility_visible'].";";
	  	} 	
	  	  
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
	                               AND data_types.type=? AND data_objects.published=1 AND data_objects.visibility_id=".$GLOBALS['visibility_visible'].";");
	 	
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
	                               AND data_types.type=? AND hidden=0;"); /* "AND hidden = 0" added by Yosra to avoid dispaying old english objects 12-3-2-12*/
	 	
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
	                           WHERE  data_objects_taxon_concepts.taxon_concept_id=? AND data_objects.hidden=0;");
	 	
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
	  	$query = $con->connection->prepare("SELECT id FROM data_objects WHERE data_type_id=".$GLOBALS['data_types_text']."  AND id>=? ORDER BY id");
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
	
	static function Exist_DataObjects_ByGUID($DB, $GUID) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);
		  	
	  	 $stmt = $con->connection->prepare("SELECT COUNT(id) FROM data_objects WHERE guid=?;");
	 	
	    $stmt->bindParam(1, $GUID);
		$stmt->execute();		
		$result = $stmt->fetchColumn();		
	    $con->Close();   
	    return $result;    
	}
	
     static function Select_all_data_objects_guid($DB) 
	{
		$con = new PDO_Connection();
	  	$con->Open($DB);		  	
	  	$query = $con->connection->prepare("SELECT distinct guid FROM data_objects WHERE guid IS NOT NULL ");
	  	$query->execute();
	  	$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;
	}
	
	static function Select_latest_DataObjects_ByGuid($DB, $guid) 
	{
	 	$con = new PDO_Connection();
	  	$con->Open($DB);
		  	
	  	$stmt = $con->connection->prepare("SELECT distinct data_objects.id FROM data_objects 
	  	INNER JOIN data_objects_hierarchy_entries dohe  ON (dohe.data_object_id=data_objects.id)
	  	WHERE published=1 AND  guid=? AND (language_id=?  OR language_id=0 )AND dohe.visibility_id<>?;");
	    $stmt->bindParam(1, $guid);
	    $stmt->bindParam(2,$GLOBALS['language_en']);
	    $stmt->bindParam(3,$GLOBALS['visibility_invisible']);
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	static function Select_DataObjects_ByGuid($guid, $data_type_id) 
	{
	 	$con = new PDO_Connection();
	  	$con->Open('slave');
		  	
	  	$stmt = $con->connection->prepare("SELECT dos.* 
	  										FROM data_objects dos
	  										 	INNER JOIN  a_data_objects ado  ON (ado.id=dos.id)
	  										WHERE guid = ? 
	  											AND data_type_id=? 
	  										ORDER BY ado.process_id DESC;");
	    $stmt->bindParam(1, $guid);	   
	    $stmt->bindParam(2, $data_type_id);	   
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	static function Select_DataObjects_ByGuid_NOT_Hidden($guid, $data_type_id) 
	{
	 	$con = new PDO_Connection();
	  	$con->Open('slave');
		  	
	  	$stmt = $con->connection->prepare("SELECT dos.* 
	  										FROM data_objects dos
	  										 	INNER JOIN  a_data_objects ado  ON (ado.id=dos.id)
	  										WHERE guid = ? 
	  											AND data_type_id=? 
	  											AND hidden<>1  
	  										ORDER BY ado.process_id DESC;");
	    $stmt->bindParam(1, $guid);	   
	    $stmt->bindParam(2, $data_type_id);	   
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}
	
	
	static function Select_Latest_DataObjects_ByGuid_AND_Hidden_AND_Has_Parent($guid, $data_type_id) 
	{
	 	$con = new PDO_Connection();
	  	$con->Open('slave');
		  	
	  	$stmt = $con->connection->prepare("SELECT * 
	  										FROM data_objects 
	  										WHERE guid = ? 
	  											AND data_type_id=? 
	  											AND hidden=1 
	  											AND parent_data_object_id IS NOT NULL 
	  										ORDER BY id DESC
	  										LIMIT 0,1;");
	    $stmt->bindParam(1, $guid);	   
	    $stmt->bindParam(2, $data_type_id);	   
		$stmt->execute();		
		$records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');		
	    $con->Close();    
	    return $records;    
	}

	static function Update_data_object_set_Parent($data_object_id, $parent_data_object_id)
	{
		$con = new PDO_Connection();
	  	$con->Open('slave');
		  	
	  	$stmt = $con->connection->prepare("UPDATE data_objects SET parent_data_object_id=? WHERE id=?");
	    $stmt->bindParam(1, $parent_data_object_id);
	    $stmt->bindParam(2, $data_object_id);
		$stmt->execute();		
	    $con->Close();
	}
	
	static function Update_data_object_set_Hidden($data_object_id, $hidden)
	{
		$con = new PDO_Connection();
	  	$con->Open('slave');
		  	
	  	$stmt = $con->connection->prepare("UPDATE data_objects SET hidden=? WHERE id=?");
	    $stmt->bindParam(1, $hidden);
	    $stmt->bindParam(2, $data_object_id);
		$stmt->execute();		
	    $con->Close();
	}
	
	static function Hide_DataObject_If_no_adata_object($guid, $data_type_id)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  	
	  	 $stmt = $con->connection->prepare("UPDATE data_objects dos set hidden=1 
	  	 									WHERE dos.guid=? 
	  	 										AND dos.data_type_id=? 
	  	 										AND hidden<>1 
	  	 										AND id NOT IN (SELECT ado.id FROM a_data_objects ado WHERE ado.id=dos.id);");	  	 									
		 $stmt->bindParam(1,$guid);	
		 $stmt->bindParam(2,$data_type_id);	 	
		 $stmt->execute();
		 $con->Close();
	}
	
	static function Show_DataObject_If_no_adata_object($guid, $data_type_id)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  	
	  	 $stmt = $con->connection->prepare("UPDATE data_objects dos set hidden=0 
	  	 									WHERE dos.guid=? 
	  	 										AND dos.data_type_id=? 
	  	 										AND hidden=1 
	  	 										AND id NOT IN (SELECT ado.id FROM a_data_objects ado WHERE ado.id=dos.id);");	  	 									
		 $stmt->bindParam(1,$guid);	
		 $stmt->bindParam(2,$data_type_id);	 	
		 $stmt->execute();
		 $con->Close();
	}
	
	static function Update_Hidden_DataObject($data_object_id, $hidden)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  	
	  	 $stmt = $con->connection->prepare("UPDATE data_objects set hidden=? WHERE id=?	;");	  	 					  	
		 $stmt->bindParam(1,$hidden);
		 $stmt->bindParam(2,$data_object_id);
		 $stmt->execute();
		 $con->Close();
	}
	
	static function Update_Locked_update_DataObject($data_object_id, $locked_update)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  	
	  	 $stmt = $con->connection->prepare("UPDATE data_objects set locked_update=? WHERE id=?	;");	  	 									
		 
		 $stmt->bindParam(1,$locked_update);
		 $stmt->bindParam(2,$data_object_id);
		 $stmt->execute();
		 $con->Close();
	}
	
	//Function added on 19-4-2012 by Yosra to perform a check if there exist an updated object (hidden = 2) within the taxon on Finish All
	static function Exist_Updated_Object_Select_By_Taxon_id($taxonID){
		$con = new PDO_Connection();
	  	$con->Open('slave');
	  	$stmt = $con->connection->prepare("SELECT COUNT(id)
											FROM data_objects
											INNER JOIN data_objects_taxon_concepts
												ON (data_objects.id = data_objects_taxon_concepts.data_object_id)
											WHERE data_objects_taxon_concepts.taxon_concept_id =?
												AND data_objects.hidden =2;");
	    $stmt->bindParam(1, $taxonID);  
		$stmt->execute();		
		$result = $stmt->fetchColumn();			
	    $con->Close();    
	    return $result;    
	}
	
	//Function added on 19-4-2012 by Yosra to perform a check to return all updated objects (hidden = 2) within the taxon on Finish All	
	static function Select_Updated_Data_Objects_By_Taxon_id($taxonID){
		$con = new PDO_Connection();
	  	$con->Open('slave');
	  	$stmt = $con->connection->prepare("SELECT data_objects.*
											FROM data_objects
											INNER JOIN data_objects_taxon_concepts
												ON (data_objects.id = data_objects_taxon_concepts.data_object_id)
											WHERE data_objects_taxon_concepts.taxon_concept_id =?
												AND data_objects.hidden =2;");
	    $stmt->bindParam(1, $taxonID);  
		$stmt->execute();		
		$result = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');
	    $con->Close();    
	    return $result;    
	}
}

?>