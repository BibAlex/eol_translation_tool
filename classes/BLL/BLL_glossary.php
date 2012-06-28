<?php
	class BLL_glossary {
		
		static function Select_glossary_By_Letter($letter){
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM glossary WHERE  letter like ?;");
		  	$query->bindParam(1, $letter);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_glossary');
			$con->Close();
			return $records[0];
		}
	}
?>
