<?php

class BLL_taxon_concept_assign_log {
	
	
	static function Select_assignLog($taxon_id,$phase_id, $user_id) 
	{
		$con = new PDO_Connection();
	  	$con->Open('slave');
	  	//Order by ID DESC to get the latest assigned item 		  	
	  	$query = $con->connection->prepare("SELECT * FROM taxon_concept_assign_log WHERE  taxon_concept_id=? AND phase_id=? AND user_id=? ORDER BY id DESC;");
	  	$query->bindParam(1, $taxon_id);
	  	$query->bindParam(2, $phase_id);			  		 	
	  	$query->bindParam(3, $user_id);
	    $query->execute();		
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concept_assign_log');
		$con->Close();
		
		if(COUNT($records)==0)
			return '---';
		else 
			return $records[0]->assign_date;

	}
}

?>