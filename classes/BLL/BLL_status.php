<?php
	class BLL_status {
	    
		
	    static function Select_Status_ByID($status_id) {
	    	if($status_id==0)
	    		return 'Distribution';
	        $con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("select * from status where id = ?;");
		  	$query->bindParam(1, $status_id);		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_status');
			$con->Close();   				    	
	    	return $records[0]->label;
	    }
	    
	 	static function Select_Status() {
	        $con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("select * from status;");
		  	$query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_status');
			$con->Close();   				    	
	    	return $records;
	    }
	    
	    
	}
?>