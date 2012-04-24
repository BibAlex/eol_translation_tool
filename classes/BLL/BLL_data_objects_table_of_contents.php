<?php


	class BLL_data_objects_table_of_contents {
		
		static function Select_data_objects_table_of_contents_ByDataObjectId($DB, $data_object_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open($DB);		  	
		  	$query = $con->connection->prepare("SELECT * FROM data_objects_table_of_contents WHERE  data_object_id=?;");
		  	$query->bindParam(1, $data_object_id);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_table_of_contents');
			$con->Close();

			return $records;
		}
						
		static function Insert_data_objects_table_of_contents($data_object_id, $toc_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("INSERT IGNORE INTO data_objects_table_of_contents (data_object_id, toc_id) VALUES(?,?);");
		  	$query->bindParam(1, $data_object_id);			  		 	
		  	$query->bindParam(2, $toc_id);
		    $query->execute();		
			$con->Close();			
		}
			
	}
?>