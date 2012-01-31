<?php
	class BLL_updated_harvest_batch {
	   	    
	    static function Insert_updated_harvest_batch() {
	    	$con = new PDO_Connection();
		  	$con->Open('slave');		
		  	$query = $con->connection->prepare("INSERT INTO updated_harvest_batch (harvest_date) VALUES (NOW());");
		  	$query->execute();		
		  	$query = $con->connection->prepare("SELECT MAX(id) FROM updated_harvest_batch;");
		  	$query->execute();	
			$id = $query->fetchColumn();
			$con->Close();  				    	
	    	return $id;
	    }
	}
	
?>