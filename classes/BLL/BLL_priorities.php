<?php
	
	class BLL_priorities {
		
		static function load_all() {
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM priorities order by sort_order desc;");
		  	$query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_priorities');
			$con->Close();
			return $records;
		}
				
		static function find_label($id) {
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM priorities where id=$id;");
		  	$query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_priorities');
			$con->Close();			
			if(COUNT($records)==0)
				return '';
			else
				return $records[0]->label;
		}
		
	}



?>