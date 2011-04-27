<?php
	class BLL_a_names {
		
		static function Insert_a_names($taxon_id, $name, $user) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("INSERT INTO  a_names(taxon_id,name,created_by,creation_date,last_modified_person,last_modified_date,name_status_id ) 
		  	VALUES(?,?,?,Now(),?,Now(),2);");
		  	$query->bindParam(1, $taxon_id);
		  	$query->bindParam(2, $name);	
		  	$query->bindParam(3, $user);	
		  	$query->bindParam(4, $user);				  		 	
		    $query->execute();		
			$con->Close();
		}
		
		static function Update_a_names($id, $status, $user) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("UPDATE a_names SET last_modified_person=?, last_modified_date=NOW(), name_status_id=? 
		  	WHERE id=?;");
		  	$query->bindParam(1, $user);
		  	$query->bindParam(2, $status);	
		  	$query->bindParam(3, $id);				  		 	
		    $query->execute();		
			$con->Close();
			
		}
		
		static function Select_a_names_ByTaxonID($taxon_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM   a_names WHERE taxon_id=?;");
		  	$query->bindParam(1, $taxon_id);			  		 	
		    $query->execute();		
		    $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_names');
			$con->Close();
			return $records;
		}
	}
?>
	