<?php
	class BLL_archived_a_data_objects {
		
		static function Insert_archived_a_data_objects_ByID(
			$data_object_id,
			$user_id,
	   		$process_id,   		
	   		$object_title,
	   		$location,
	   		$rights_statement,
	   		$rights_holder,
	   		$description, 
	   		$locked,
	   		$taxon_concept_id
		) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("INSERT INTO archived_a_data_objects 
		  	(data_object_id, user_id, process_id, object_title, location, rights_statement, rights_holder, description, modified_at, locked, taxon_concept_id )
		  	 VALUES(?,?,?,?,?,?,?,?,NOW(),?,?);");
		  	$query->bindParam(1, $data_object_id);			  		 	
		  	$query->bindParam(2, $user_id);
			$query->bindParam(3, $process_id);
			$query->bindParam(4, $object_title);
			$query->bindParam(5, $location);
			$query->bindParam(6, $rights_statement);
			$query->bindParam(7, $rights_holder);
			$query->bindParam(8, $description);
			$query->bindParam(9, $locked);
			$query->bindParam(10, $taxon_concept_id);  		  			  			  	
		    $query->execute();		
			$con->Close();
		}
	}