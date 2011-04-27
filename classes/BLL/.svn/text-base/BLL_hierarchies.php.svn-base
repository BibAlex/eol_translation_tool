<?php
	class BLL_hierarchies {
		
		static function load_all() {
			$con = new PDO_Connection();
		  	$con->Open('master');		  	
		  	$query = $con->connection->prepare("select id, label from hierarchies where browsable=1 order by label;");		  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchies');
			$con->Close();

			return $records;
		}
		
		static function get_name($id) {
			// returns string
			$con = new PDO_Connection();
		  	$con->Open('master');		  	
		  	$query = $con->connection->prepare("select label from hierarchies where id=?;");		  
		  	$query->bindParam(1, $id);	 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchies');
			$con->Close();
			
			if (count($records) >0)
				return $records[0]->label;
			else 
				return '';
		}		
	
	}
?>