<?php


class BLL_updated_data_objects_taxon_concepts {
	
	 static function Insert_updated_data_objects_taxon_concepts($taxon_concept_id, $data_object_id, $harvest_batch_id) 
	 {
	 	 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("INSERT INTO  updated_data_objects_taxon_concepts VALUES(?,?,?);");
	  	 $query->bindParam(1, $taxon_concept_id);	 	
	  	 $query->bindParam(2, $data_object_id);
	  	 $query->bindParam(3, $harvest_batch_id);	 		 		 	
	     $query->execute();
		 $con->Close();            
	}
	
	static function Delete_updated_dataObjects_taxon_concepts_By_guid($guid, $id, $data_type_id)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  
	  	 $stmt = $con->connection->prepare("DELETE FROM  updated_data_objects_taxon_concepts WHERE data_object_id IN 
	  	 		(SELECT id FROM updated_data_objects WHERE guid=? AND id <>? AND data_type_id=?);");			 
		 $stmt->bindParam(1, $guid);
		 $stmt->bindParam(2, $id);
		 $stmt->bindParam(3, $data_type_id);
		 $stmt->execute();
		 $con->Close();
	}
	
	static function Exist_Updated_data_object_taxon_concepts($tc_id, $do_id)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("SELECT COUNT(*) FROM updated_data_objects_taxon_concepts WHERE data_object_id=? AND taxon_concept_id=?;");
	  	 $query->bindParam(1, $do_id);	 	
	  	 $query->bindParam(2, $tc_id);
	     $query->execute();		
		 $results = $query->fetchColumn();
		 $con->Close();    
		 return  $results;	        
	}
	
	static function Select_Updated_data_objects_taxon_concepts_By_DataObjectID( $data_object_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("SELECT * FROM updated_data_objects_taxon_concepts WHERE data_object_id=?;");
	  	 $query->bindParam(1, $data_object_id);	 	
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_updated_data_objects_taxon_concepts');
		 $con->Close();    
		 return  $records;	        
	}
	
	static function Delete_updated_dataObjects_taxon_concepts($do_id, $tc_id)
	{
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  
	  	 $stmt = $con->connection->prepare("DELETE FROM updated_data_objects_taxon_concepts WHERE data_object_id =? AND taxon_concept_id=?;");			 
		 $stmt->bindParam(1, $do_id);
		 $stmt->bindParam(2, $tc_id);
		 $stmt->execute();
		 $con->Close();
	}
	
	static function Count_updated_objects_by_taxon_concept_id($taxon_id){
		$con = new PDO_Connection();
	  	 $con->Open('slave');	  
	  	 $stmt = $con->connection->prepare("SELECT COUNT(data_object_id)
			FROM updated_data_objects_taxon_concepts  
			WHERE taxon_concept_id =?;");			 
		 $stmt->bindParam(1, $taxon_id);
		 $stmt->execute();
		 $results = $stmt->fetchColumn();
		 $con->Close();
		 return $results;
	}
	
	//Added by Yosra 10-4-2012 to select all taxon_concepts of a dataobject in order to find states of each
	static function Select_taxon_concepts_status_By_DataObjectID($reverse_id)
	{
		echo "Select_taxon_concepts_status_By_DataObjectID " . $reverse_id. "<br/>";
		 $con = new PDO_Connection();
	  	 $con->Open('slave');	  
	  	 $query = $con->connection->prepare("SELECT taxon_concepts.*
			FROM taxon_concepts 
			INNER JOIN updated_data_objects_taxon_concepts 
				ON (taxon_concepts.id = updated_data_objects_taxon_concepts.taxon_concept_id) 
			WHERE updated_data_objects_taxon_concepts.data_object_id =?;");			 
		 $query->bindParam(1, $reverse_id);
		 $query->execute();
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		 $con->Close();
		 return  $records;
	}
}

?>