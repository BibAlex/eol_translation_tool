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
		
		
		
		
	
	}
?>