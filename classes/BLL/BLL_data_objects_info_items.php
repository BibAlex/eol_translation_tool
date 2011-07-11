<?php


	class BLL_data_objects_info_items {
		
		static function Select_info_items_ByDataObjectId($DB, $data_object_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open($DB);		  	
		  	$query = $con->connection->prepare("SELECT info_items.* FROM data_objects_info_items inner join info_items on(info_item_id=info_items.id) WHERE  data_object_id=?;");
		  	$query->bindParam(1, $data_object_id);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_info_items');
			$con->Close();
			if(COUNT($records)==0)
				return null;
			else
				return $records[0];
			return $records;
		}
		
		static function Select_data_objects_info_items_ByDataObjectId($DB, $data_object_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open($DB);		  	
		  	$query = $con->connection->prepare("SELECT data_objects_info_items.* FROM data_objects_info_items WHERE  data_object_id=?;");
		  	$query->bindParam(1, $data_object_id);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects_info_items');
			$con->Close();			
			return $records;
		}
		
		static function Exist_data_objects_info_items($DB, $data_object_id, $info_item_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open($DB);		  	
		  	$query = $con->connection->prepare("SELECT count(*) FROM data_objects_info_items WHERE  data_object_id=? AND info_item_id=?;");
		  	$query->bindParam(1, $data_object_id);
		  	$query->bindParam(2, $info_item_id);				  		 	
		    $query->execute();		
			$results = $query->fetchColumn();
			$con->Close();
			
			return $results;
		}
		
		static function Insert_data_objects_info_items($data_object_id, $info_item_id) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("INSERT INTO data_objects_info_items (data_object_id, info_item_id) VALUES(?,?);");
		  	$query->bindParam(1, $data_object_id);			  		 	
		  	$query->bindParam(2, $info_item_id);
		    $query->execute();		
			$con->Close();			
		}
		
		
		
	
	}
?>