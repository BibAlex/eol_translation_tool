<?php


class BLL_taxon_concept_names {
	
	 static function Select_TaxonNames_ByTaxonID_AND_NameID($taxon_id,$name_id) 
	 {
	 	 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("SELECT * FROM taxon_concept_names WHERE taxon_concept_id=? AND name_id=?;");
	  	 $query->bindParam(1, $taxon_id);	 	
	  	 $query->bindParam(2, $name_id);
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concept_names');
		 $con->Close();    
		 return  $records[0];
	 }
	 
 	 static function Update_TaxonNames($taxon_id,$name_id,$status,$user_ID) 
	 {
	 	 $con = new PDO_Connection();
	  	 $con->Open('slave');		  	
	  	 $query = $con->connection->prepare("UPDATE  taxon_concept_names SET name_status_id=?, last_modified_date=Now(), last_modified_person=? WHERE taxon_concept_id=? AND name_id=?;");
	  	 $query->bindParam(1, $status);
	  	 $query->bindParam(2, $user_ID);
	  	 $query->bindParam(3, $taxon_id);	 	
	  	 $query->bindParam(4, $name_id);
	     $query->execute();		
		 $con->Close();
	 }
	 
}

?>
