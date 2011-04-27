<?php
	class BLL_templates {
		
		static function Select_templates_ByEnName($name_en) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM templates WHERE  name_en like ?;");
		  	$query->bindParam(1, $name_en);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_templates');
			$con->Close();
			if(COUNT($records)==0)
				return null;
			else
				return $records[0];
		}
	
	}
?>