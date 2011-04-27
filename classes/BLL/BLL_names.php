<?php

class BLL_names {
	
	static function taxon_concept_names_exists_in_slave($taxon_concept_id, $name_id) {
		$con = new PDO_Connection();
	  	$con->Open('slave');		  	
	  	$query = $con->connection->prepare("select count(*) from taxon_concept_names where taxon_concept_id=? and name_id=? and language_id=?;");
	  	$query->bindParam(1, $taxon_concept_id);		  		 	
	  	$query->bindParam(2, $name_id);
	  	$query->bindParam(3, $GLOBALS['arabic_language_id']);
	    $query->execute();		
		$results = $query->fetchColumn();
		$con->Close();   				    	
    	
		if ($results == 0)
			return false;
		else
			return true;
	}
	
	static function name_exists_in_slave($name_id) {
		$con = new PDO_Connection();
	  	$con->Open('slave');		  	
	  	$query = $con->connection->prepare("select count(*) from names where id=?;");
	  	$query->bindParam(1, $name_id);
	  	$query->execute();		
		$results = $query->fetchColumn();
		$con->Close();   				    	
    	
		if ($results == 0)
			return false;
		else
			return true;
	}
	
	static function taxon_concept_names_insert_in_slave($taxon_concept_id, $name_id, 
														$source_hierarchy_entry_id,
														$language_id, $vern, $preferred, 
														$synonym_id, $vetted_id) {
		$con = new PDO_Connection();
	  	$con->Open('slave');		  	
	  	$query = $con->connection->prepare("insert into taxon_concept_names (taxon_concept_id, name_id, 
	  																		 source_hierarchy_entry_id,
	  																		 language_id, vern, preferred,
	  																		 synonym_id, vetted_id)
  														values (?, ?, ?, ?, ?, ?, ?, ?)");
	  	$query->bindParam(1, $taxon_concept_id);
	  	$query->bindParam(2, $name_id);
	  	$query->bindParam(3, $source_hierarchy_entry_id);
	  	$query->bindParam(4, $language_id);
	  	$query->bindParam(5, $vern);
	  	$query->bindParam(6, $preferred);
	  	$query->bindParam(7, $synonym_id);
	  	$query->bindParam(8, $vetted_id);	  	
	  	
	  	$query->execute();		
		$con->Close();   																
	} 
	
	static function name_insert($id, $namebank_id, $string, $clean_name, $italicized, 
								$italicized_verified, $canonical_form_id, $canonical_verified) {
		$con = new PDO_Connection();
	  	$con->Open('slave');		  	
	  	$query = $con->connection->prepare("insert into names (id, namebank_id, string, clean_name, 
	  														   italicized, italicized_verified, 
	  														   canonical_form_id, canonical_verified)
  														values (?, ?, ?, ?, ?, ?, ?, ?);");
	  	$query->bindParam(1, $id);
	  	$query->bindParam(2, $namebank_id);
	  	$query->bindParam(3, $string);
	  	$query->bindParam(4, $clean_name);
	  	$query->bindParam(5, $italicized);
	  	$query->bindParam(6, $italicized_verified);
	  	$query->bindParam(7, $canonical_form_id);
	  	$query->bindParam(8, $canonical_verified);	  	
	  	 		  	
	  	$query->execute();		
		$con->Close();   								
	}
	
	static function select_taxons_concept_names_from_master($taxon_concept_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open('master');		  	
	  	 $query = $con->connection->prepare("
		  	 select * from taxon_concept_names where taxon_concept_id=? and language_id=?
		  	 ;");
	  	 $query->bindParam(1, $taxon_concept_id);	 	
	  	 $query->bindParam(2, $GLOBALS['arabic_language_id']);
	     $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concept_names');
		 $con->Close();    
		 return  $records;	        
	}
	
	static function select_name_from_master($name_id) 
	{
	 	 $con = new PDO_Connection();
	  	 $con->Open('master');		  	
	  	 $query = $con->connection->prepare("
		  	 select * from names where id=?
		  	 ;");
	  	 $query->bindParam(1, $name_id); 	
	  	 $query->execute();		
		 $records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_names');
		 $con->Close();    
		 if (count($records) >0)
		 	return $records[0];
	 	 else
	 		return new DAL_names();	        
	}
	
	static function download_names($taxon_concept_id) {
		
		$taxon_concept_names = BLL_names::select_taxons_concept_names_from_master($taxon_concept_id);
		foreach ($taxon_concept_names as $taxon_concept_name) {
			if (!BLL_names::taxon_concept_names_exists_in_slave($taxon_concept_name->taxon_concept_id, $taxon_concept_name->name_id)) {
				BLL_names::taxon_concept_names_insert_in_slave($taxon_concept_name->taxon_concept_id, 
																$taxon_concept_name->name_id, 
																$taxon_concept_name->source_hierarchy_entry_id, 
																$taxon_concept_name->language_id, 
																$taxon_concept_name->vern, 
																$taxon_concept_name->preferred, 
																$taxon_concept_name->synonym_id, 
																$taxon_concept_name->vetted_id);
				
				if (!BLL_names::name_exists_in_slave($taxon_concept_name->name_id))	{
					$name = BLL_names::select_name_from_master($taxon_concept_name->name_id);
					BLL_names::name_insert($name->id, 
										   $name->namebank_id, 
										   $name->string, 
										   $name->clean_name, 
										   $name->italicized, 
										   $name->italicized_verified, 
										   $name->canonical_form_id, 
										   $name->canonical_verified);				
				}															
				
			}
		}
	}
	
	
	static function Select_Names_ByTaxon_ID($taxon_id)
	{
		$con = new PDO_Connection();
		$con->Open('slave');		  	
		$query = $con->connection->prepare("SELECT names.* FROM names INNER JOIN taxon_concept_names ON (names.id=taxon_concept_names.name_id) WHERE taxon_concept_id=?;");
		$query->bindParam(1, $taxon_id);			  		 	
		  		  			  	
		$query->execute();			
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_names');
		$con->Close();    
		return  $records;
	}
														
}

?>