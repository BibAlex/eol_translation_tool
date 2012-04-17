<?php


class BLL_data_objects_taxon_concepts {
	
	 static function Insert_data_objects_taxon_concepts($DB, $taxon_concept_id, $data_object_id) 
	 {
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("INSERT IGNORE INTO  data_objects_taxon_concepts VALUES(?,?);");
	  	 $query->bindParam(1, $taxon_concept_id);	 	
	  	 $query->bindParam(2, $data_object_id);	 		 	
	     $query->execute();
		 $con->Close();            
	}
	
 	static function Select_data_objects_taxon_concepts_By_TaxonConceptID($DB, $taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("SELECT * FROM data_objects_taxon_concepts WHERE taxon_concept_id=?;");
	  	 $query->bindParam(1, $taxon_concept_id);	 	
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_taxon_concepts');
		 $con->Close();    
		 return  $records;	        
	}
	
	static function Select_data_objects_taxon_concepts_By_DataObjectID($DB, $data_object_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("SELECT * FROM data_objects_taxon_concepts WHERE data_object_id=?;");
	  	 $query->bindParam(1, $data_object_id);	 	
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_taxon_concepts');
		 $con->Close();    
		 return  $records;	        
	}
	
	static function Exist_data_objects_taxon_concepts($DB, $data_object_id, $taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("SELECT COUNT(*) FROM data_objects_taxon_concepts WHERE data_object_id=? AND taxon_concept_id=?;");
	  	 $query->bindParam(1, $data_object_id);	 	
	  	 $query->bindParam(2, $taxon_concept_id);
	     $query->execute();		
		 $results = $query->fetchColumn();
		 $con->Close();    
		 return  $results;	        
	}
	
	static function Select_taxons_incommon_ByTaxon_ID($DB, $taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("
		  	 SELECT distinct taxon_concept_id 
		  	 FROM data_objects_taxon_concepts 
		  	 WHERE data_object_id IN(
		  	 	SELECT data_object_id FROM data_objects_taxon_concepts WHERE taxon_concept_id=?
		  	 );");
	  	 $query->bindParam(1, $taxon_concept_id);	 	
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_taxon_concepts');
		 $con->Close();    
		 return  $records;	        
	}	
	
	static function Select_taxons_of_data_object_guids($DB, $guid) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open($DB);		  	
	  	 $query = $con->connection->prepare("
		  	 SELECT distinct taxon_concept_id 
		  	 FROM data_objects_taxon_concepts 
		  	 WHERE data_object_id IN(
		  	 	SELECT id FROM data_objects where guid = ?
		  	 );");
	  	 $query->bindParam(1, $guid);	 	
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_taxon_concepts');
		 $con->Close();    
		 return  $records;	        
	}		
	static function Count_updated_objects_by_taxon_concept_id($taxon_concept_id, $harvest_batch, $harvest_type){
		 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("
		  	SELECT COUNT(data_object_id) 
			FROM data_objects_taxon_concepts 
				INNER JOIN data_objects
					ON (data_objects_taxon_concepts.data_object_id = data_objects.id)
			WHERE data_objects_taxon_concepts.taxon_concept_id = ?
				AND harvest_batch_id = ? AND harvest_batch_type = ?;");
	  	 $query->bindParam(1, $taxon_concept_id);
	  	 $query->bindParam(2, $harvest_batch);
	  	 $query->bindParam(3, $harvest_type);	 	
	     $query->execute();		
		 $records = $query->fetchColumn();
		 $con->Close();    
		 return $records;
	}
}

?>