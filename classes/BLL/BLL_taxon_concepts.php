<?php



class BLL_taxon_concepts {

	static function Count_Pending_Assigned($process)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$stmt="";
		switch ($process) {
			case 2: $stmt = "SELECT COUNT(taxon_concepts.id) FROM taxon_concepts WHERE translator_assigned=1 AND taxon_status_id=2  AND translator_id>0;";break;
			case 3: $stmt = "SELECT COUNT(taxon_concepts.id) FROM taxon_concepts WHERE taxon_status_id=3  AND scientific_reviewer_id>0;";break;
			case 4: $stmt = "SELECT COUNT(taxon_concepts.id) FROM taxon_concepts WHERE taxon_status_id=4  AND linguistic_reviewer_id>0;";break;
		}		
		$query = $con->connection->prepare($stmt);
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		return  $result;
	}
	
	static function Count_Pending_Pool($process)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$stmt="";
		switch ($process) {
			case 2: $stmt = "SELECT COUNT(taxon_concepts.id) FROM taxon_concepts WHERE translator_assigned=0 AND taxon_status_id=2  AND translator_id>0;";break;
			case 5: $stmt = "SELECT COUNT(taxon_concepts.id) FROM taxon_concepts WHERE taxon_status_id=3  AND scientific_reviewer_id>0;";break;			
			
		}		
		$query = $con->connection->prepare($stmt);
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		return  $result;
	}
	
	static function All_words_count($id)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$stmt="Select SUM(words_count) as DOWC from data_objects DO inner join data_objects_taxon_concepts DOTC on DO.id=DOTC.data_object_id 
					where taxon_concept_id=$id group by taxon_concept_id";
		$query = $con->connection->prepare($stmt);
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		return  $result;
	}
	
	static function Unique_words_count($id)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$stmt="Select SUM(words_count) as DOWC from 
						data_objects DO 
					inner join data_objects_taxon_concepts DOTC on DO.id=DOTC.data_object_id
					inner join taxon_concepts TC on TC.id=DOTC.taxon_concept_id
					inner join a_data_objects ADO on ADO.translator_id=TC.translator_id and ADO.id=DO.ID					
					where TC.id=$id group by DOTC.taxon_concept_id
					and DO.id in (select data_object_id from Unique_DO where Unique_DO.data_object_id=DO.id)";
		$query = $con->connection->prepare($stmt);
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		return  $result;
	}
	
	static function Count_taxon_concepts_ForTranslation_ByTranslator($DB, $translator,$speciesID,$speciesName,$translationStatus)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT COUNT(taxon_concepts.id) FROM taxon_concepts
	  	 	WHERE
	  	  	translator_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ( (:v4=2 AND taxon_status_id=2) OR (:v4=1  AND taxon_status_id>2)) 
	  	 	;");
		$myNull = null;
	  
		$query->bindParam(':v1', $translator);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$result = $query->fetchColumn();

		$con->Close();
		return  $result;
	}
	
	static function Count_DataObjects_ByTaxonID_ByType($tid,$type)
	{
		if($type=='text')
			$type="=3"; //The only data type id with text
		else $type="<>3"; //The only data type id with text
		$con = new PDO_Connection();
		$con->Open('slave');
		
		$query = $con->connection->prepare("SELECT COUNT(*) FROM data_objects_taxon_concepts
	  	 	INNER JOIN data_objects ON (data_objects.id=data_objects_taxon_concepts.data_object_id)	  	 	
	  	 	WHERE data_objects.data_type_id".$type."	  	  	
	  	 	AND data_objects_taxon_concepts.taxon_concept_id=? 
	  	 	;");
	  
		$query->bindParam(1, $tid);		 
		$query->execute();
		$result = $query->fetchColumn();

		$con->Close();
		return  $result;
	}
	
	static function Select_taxon_concepts_ForTranslation_ByTranslator($DB, $translator,$speciesID,$speciesName,$translationStatus, $current_page, $items_per_page)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority FROM taxon_concepts
			inner join selection_batches on selection_batches.id=selection_id
			inner join priorities on priorities.id=priority_id
	  	 	WHERE 
	  	 		translator_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ( (:v4=2 AND taxon_status_id=2) OR (:v4=1  AND taxon_status_id>2)) 
	  	 	ORDER BY sort_order, scientificName
	  	 	LIMIT :v5,:v6;");
	  
		$myNull = null;
	  
		$query->bindParam(':v1', $translator);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);

		$start = ($current_page - 1)* $items_per_page;
		$query->bindParam(':v5', $start, PDO::PARAM_INT);
		$query->bindParam(':v6', $items_per_page, PDO::PARAM_INT);
		$query->execute();
			
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Select_pending_taxon_concepts_ForTranslation_ByTranslator($DB, $translator)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority FROM taxon_concepts
			inner join selection_batches on selection_batches.id=selection_id
			inner join priorities on priorities.id=priority_id	  	 	
	  	 	WHERE 
	  	 		taxon_status_id=2 
	  	 	AND translator_id=:v1
	  	 	Order by sort_order, scientificName;");
	  
		$myNull = null;
	  
		$query->bindParam(':v1', $translator);	  	
		$query->execute();
			
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Count_taxon_concepts_ForLingReview_ByUser($DB, $user,$speciesID,$speciesName,$translationStatus)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT COUNT(taxon_concepts.id) FROM taxon_concepts
	  	 	WHERE	  	  	  
	  	 		linguistic_reviewer_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ((:v4=2 AND taxon_status_id=4) OR (:v4=1  AND taxon_status_id>4)) 
	  	 	;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
			$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
			$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$result = $query->fetchColumn();

		$con->Close();
		return  $result;
	}
	
	static function Select_pending_taxon_concepts_ForLingReview_ByUser($DB, $user)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority FROM taxon_concepts
			inner join selection_batches on selection_batches.id=selection_id
			inner join priorities on priorities.id=priority_id
	  	 	WHERE	  	  	  
	  	 		(taxon_status_id>=2 and taxon_status_id <5)  
	  	 	AND linguistic_reviewer_id=:v1
	  	 	order by sort_order, scientificName;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	
		 
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Select_taxon_concepts_ForLingReview_ByUser($DB, $user,$speciesID,$speciesName,$translationStatus, $current_page, $items_per_page)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority FROM taxon_concepts
	  	 	inner join selection_batches on selection_batches.id=selection_id
			inner join priorities on priorities.id=priority_id	  	 	
			WHERE	  	  	  
	  	 		linguistic_reviewer_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ((:v4=2 AND taxon_status_id=4) OR (:v4=1  AND taxon_status_id>4)) 
	  	 	order by sort_order, scientificName;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Count_taxon_concepts_ForScienReview_ByUser($DB, $user,$speciesID,$speciesName,$translationStatus)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT COUNT(taxon_concepts.id) FROM taxon_concepts
	  	 	WHERE	  	  	  
		  	 	 scientific_reviewer_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ((:v4=2 AND taxon_status_id=3) OR (:v4=1  AND taxon_status_id>3)) 
	  	 	;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$result = $query->fetchColumn();

		$con->Close();
		return  $result;
	}
	
	static function Select_taxon_concepts_ForScienReview_ByUser($DB, $user,$speciesID,$speciesName,$translationStatus, $current_page, $items_per_page)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority 
			FROM taxon_concepts
	  	 		inner join selection_batches on selection_batches.id=selection_id
	  	 		inner join priorities on priorities.id=priority_id
			WHERE	  	  	  
	  	 	    scientific_reviewer_id=:v1
	  	 	AND (:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ((:v4=2 AND taxon_status_id=3) OR (:v4=1  AND taxon_status_id>3)) 
	  	 	order by sort_order, scientificName;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
			$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
			$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
			$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Select_pending_taxon_concepts_ForScienReview_ByUser($DB, $user)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.* priorities.label as priority
			FROM taxon_concepts, 
				inner join selection_batches.id=selection_id
				inner join priorities on priorities.id=priority_id
	  	 	WHERE	  	  	  
	  	 		(taxon_status_id>=2 and taxon_status_id <4)  
	  	 	AND scientific_reviewer_id=:v1
	  	 	;");
		$myNull = null;
	  
		$query->bindParam(':v1', $user);
	  
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Count_taxon_concepts_ForFinalEditing($DB, $speciesID,$speciesName,$translationStatus)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT COUNT(taxon_concepts.id) FROM taxon_concepts
	  	 	WHERE	  	  	  
	  	 		(:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ( (:v4=2 AND taxon_status_id=5) OR (:v4=1  AND taxon_status_id>5)) 
	  	 	;");
		$myNull = null;
	  
		//$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$result = $query->fetchColumn();

		$con->Close();
		return  $result;
	}

	static function Select_taxon_concepts_ForFinalEditing($DB, $speciesID,$speciesName,$translationStatus, $current_page, $items_per_page)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority
			FROM taxon_concepts
	  	 		inner join selection_batches on selection_batches.id=selection_id
	  	 		inner join priorities on priorities.id=priority_id
			WHERE	  	  	  
	  	 		(:v2 IS NULL OR taxon_concepts.id=:v2) 
	  	 	AND (:v3 IS NULL OR scientificName like :v3)
	  	 	AND ( (:v4=2 AND taxon_status_id=5) OR (:v4=1  AND taxon_status_id>5)) 
	  	 	order by sort_order, scientificName;");
		$myNull = null;
	  
		//$query->bindParam(':v1', $user);
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v2', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v3', $safeparam);
		}

		if($translationStatus=='0')
		$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $translationStatus);
		 
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Count_taxon_concepts_ForTranslation_FromPool($DB,$speciesID,$speciesName)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT COUNT(taxon_concepts.id) FROM taxon_concepts
	  	 	
	  	  WHERE
	  	  			taxon_status_id=2 AND translator_id=0
	  	 		AND (:v1 IS NULL OR taxon_concepts.id=:v1) 
	  	 		AND (:v2 IS NULL OR scientificName like :v2);");

		if(trim($speciesID)=='')
		$query->bindParam(':v1',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v1', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v2', $safeparam);
		}
		$query->execute();
		$records = $query->fetchColumn();
		$con->Close();
		return  $records;
	}

	static function Select_taxon_concepts_ForTranslation_FromPool($DB,$speciesID,$speciesName,$current_page,$items_per_page)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT taxon_concepts.*, priorities.label as priority FROM taxon_concepts
				Inner join selection_batches on selection_batches.id=selection_id
				Inner join priorities on priority_id=priorities.id	  		
	  		WHERE
	  	 		taxon_status_id=2 AND translator_id=0
	  	 		AND (:v1 IS NULL OR taxon_concepts.id=:v1) 
	  	 		AND (:v2 IS NULL OR scientificName like :v2)
	  	 		ORDER BY sort_order, scientificName    
	  	 		LIMIT :v3,:v4;");

		if(trim($speciesID)=='')
		$query->bindParam(':v1',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v1', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v2', $safeparam);
		}
		$start = ($current_page - 1)* $items_per_page;
		$query->bindParam(':v3', $start, PDO::PARAM_INT);
		$query->bindParam(':v4', $items_per_page, PDO::PARAM_INT);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}

	static function Update_taxon_concepts_TranslationStatus($taxon_concept_id, $translator_id, $translator_assigned)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("UPDATE taxon_concepts SET translator_id=?,  translator_assigned=? WHERE id=?;");
		$query->bindParam(1, $translator_id);
		$query->bindParam(2, $translator_assigned);
		$query->bindParam(3, $taxon_concept_id);
		$query->execute();
		$con->Close();
	}
	
	static function Update_taxon_concepts_Status($taxon_concept_id, $taxon_status_id,$userID)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$stmt = "UPDATE taxon_concepts SET ";
		switch ($taxon_status_id) {
			case 1:	$stmt = $stmt." selection_date=NOW(), "; break;
			case 2:	$stmt = $stmt." taskdistribution_date=NOW(), "; break;
			case 3:	$stmt = $stmt." translation_date=NOW(), "; break;
			case 4:	$stmt = $stmt." scientificreview_date=NOW(), "; break;
			case 5:	$stmt = $stmt." linguisticreview_date=NOW(), "; break;
			case 6:	$stmt = $stmt." finalediting_date=NOW(), final_editor_id=".$userID.", "; break;
			case 7:	$stmt = $stmt." publish_date=NOW(), "; break;
		} 		
		$query = $con->connection->prepare($stmt." taxon_status_id=? WHERE id=?;");
		$query->bindParam(1, $taxon_status_id);		
		$query->bindParam(2, $taxon_concept_id);
		$query->execute();
		$con->Close();
	}

	static function Select_taxon_concepts($DB)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT * FROM taxon_concepts;");
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}

	static function Select_taxon_concept($DB, $id)
	{
		$con = new PDO_Connection();
		$con->Open($DB);
		$query = $con->connection->prepare("SELECT * FROM taxon_concepts where id=?;");
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		if(count($records)>0)
			return  $records[0];
		else return null;
	}

	static function exists_on_slave($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("SELECT 1 FROM taxon_concepts where id=?;");
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
			
		if (count($records) > 0)
			return true;
		else
			return false;
	}

	static function get_name($taxon_concept_id, $hierarchy_id) {
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare("SELECT string AS scientificName FROM hierarchy_entries
	  											inner join names on names.id=name_id 
	  											WHERE taxon_concept_id=? and hierarchy_id=?;");	 	
		$query->bindParam(1, $taxon_concept_id);
		$query->bindParam(2, $hierarchy_id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
			
		if (count($records) > 0)
		return $records[0]->scientificName;
		else
		return '';
	}

	static function save_taxon_concept($id, $supercedure_id, $split_from, $vetted_id, $published, $selection_id, $scientificName) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("insert into taxon_concepts
	                                			(id, supercedure_id, split_from, vetted_id, published, selection_id, scientificName, selection_date, taxon_status_id)
	                            			values (?, ?, ?, ?, ?, ?,?, NOW(),1);");	 	
		$query->bindParam(1, $id);
		$query->bindParam(2, $supercedure_id);
		$query->bindParam(3, $split_from);
		$query->bindParam(4, $vetted_id);
		$query->bindParam(5, $published);
		$query->bindParam(6, $selection_id);
		$query->bindParam(7, $scientificName);
		$query->execute();
		$con->Close();
	}

	static function get_scientific_reviewer_unassigned($id) {
		return $this->get_count($id, 'scientific_reviewer_id', true);
	}

	static function get_taxons_list($id_list, $hierarchy_id) {		
		$query_str = 'select distinct he.taxon_concept_id, string as scientificName, 						
                        (select count(*) from data_objects 
                            inner join data_objects_table_of_contents 
	                            	ON data_objects_table_of_contents.data_object_id=data_objects.id
                            inner join table_of_contents
                            		ON table_of_contents.id=data_objects_table_of_contents.toc_id
                            inner join data_objects_hierarchy_entries dohe
					                ON dohe.data_object_id=data_objects.id
                           	where dohe.hierarchy_entry_id=he.id
                                and data_type_id=3 and published=1 and visibility_id=2
                                	and 
	                                	(
	                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
	                                		 or 
                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))) 
                        as total_text_objects,
                        (select count(distinct(data_objects.id)) from data_objects
	                        	Inner join top_images on data_object_id=data_objects.id 	
	                        	inner join data_objects_hierarchy_entries dohe ON dohe.data_object_id=data_objects.id                        	
	                        	where top_images.hierarchy_entry_id=he.id and published=1 and visibility_id=2) as total_image_objects,
                        (select count(*) from data_objects 
	                            inner join data_objects_hierarchy_entries dohe
					                ON dohe.data_object_id=data_objects.id
	                            where dohe.hierarchy_entry_id=he.id
	                                and (data_type_id=2 or data_type_id=4 or data_type_id=7 or data_type_id=8) and published=1 and visibility_id=2) as total_other_objects
                    from hierarchy_entries he
                    left outer join names on names.id=name_id 
                    where taxon_concept_id in ('.$id_list.') and hierarchy_id='.$hierarchy_id.' order by scientificName';			
		
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare($query_str);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();

		return $records;
	}

	static function assign_work($id, $translator_id, $linguistic_reviewer_id ,$scientific_reviewer_id) {
		$query_str = 'update taxon_concepts set taskdistribution_date=NOW() ,taxon_status_id=2 , translator_id='.strval($translator_id);
		if ($translator_id > 0)
		$query_str .= ', translator_assigned=1 ';
		else
		$query_str .= ', translator_assigned=0 ';
		$query_str .= ', linguistic_reviewer_id='.strval($linguistic_reviewer_id);
		if ($linguistic_reviewer_id > 0)
		$query_str .= ' , linguistic_assigned=1 ';
		else
		$query_str .= ' , linguistic_assigned=0 ';
		$query_str .= ', scientific_reviewer_id='.strval($scientific_reviewer_id);
		$query_str .= ' where id='.strval($id).';';

		//echo($query_str.'<br>');
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		$query->execute();
		$con->Close();
	}
	
	static function reassign_taxon($id, $translator_id, $old_translator_id, $linguistic_reviewer_id, $old_linguistic_reviewer_id, $scientific_reviewer_id, $old_scientific_reviewer_id) {
		
		$query_str = 'update taxon_concepts set translator_id='.strval($translator_id);
		if ($translator_id > 0)
		$query_str .= ', translator_assigned=1 ';
		else
		$query_str .= ', translator_assigned=0 ';
		$query_str .= ', linguistic_reviewer_id='.strval($linguistic_reviewer_id);
		if ($linguistic_reviewer_id > 0)
		$query_str .= ' , linguistic_assigned=1 ';
		else
		$query_str .= ' , linguistic_assigned=0 ';
		$query_str .= ', scientific_reviewer_id='.strval($scientific_reviewer_id);
		$query_str .= ' where id='.strval($id).';';		

		//echo($query_str.'<br>');
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		$query->execute();
		
		// update a_data_objects to release locks
		if ($translator_id != $old_translator_id) {			
			$query_str = "update a_data_objects set locked=0 where process_id=2 and user_id=".$old_translator_id." and taxon_concept_id=".strval($id).";";
			$query = $con->connection->prepare($query_str);
			$query->execute();
		}
		
		// update a_data_objects to release locks
		if ($linguistic_reviewer_id != $old_linguistic_reviewer_id) {			
			$query_str = "update a_data_objects set locked=0 where process_id=3 and user_id=".$old_linguistic_reviewer_id." and taxon_concept_id=".strval($id).";";
			$query = $con->connection->prepare($query_str);
			$query->execute();
		}
		
		// update a_data_objects to release locks
		if ($scientific_reviewer_id != $old_scientific_reviewer_id) {			
			$query_str = "update a_data_objects set locked=0 where process_id=4 and user_id=".$old_scientific_reviewer_id." and taxon_concept_id=".strval($id).";";
			$query = $con->connection->prepare($query_str);
			$query->execute();
		}
		
		$con->Close();
	}
	
	static function assign_taxon($id, $translator_id, $linguistic_reviewer_id, $scientific_reviewer_id) {
		
		$query_str = 'update taxon_concepts set taxon_status_id=2 , translator_id='.strval($translator_id);
		if ($translator_id > 0)
			$query_str .= ', translator_assigned=1 ';
		else
			$query_str .= ', translator_assigned=0 ';
		$query_str .= ', linguistic_reviewer_id='.strval($linguistic_reviewer_id);
		$query_str .= ' , linguistic_assigned=1 ';		
		$query_str .= ', scientific_reviewer_id='.strval($scientific_reviewer_id);
		$query_str .= ' where id='.strval($id).';';		
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		$query->execute();
		
		$con->Close();

		// get names
		BLL_names::download_names($id);
								   
		// get data objects						   
		$dataobjects = BLL_data_objects::Select_DataObjects_ByTaxonConceptID('master',$id);
		  	
		foreach ($dataobjects as $dataobject)	
	  	{ 	  		
	  		//Fill data_object table
	  		if(BLL_data_objects::Exist_DataObjects_ByID('slave',$dataobject->id)==0)
	  		{		
		  		$dataobject->aeol_translation=0;//Original record from woods hole not translated
				BLL_data_objects::Insert_DataObject('slave',$dataobject);
	  		}
			
			//Fill data_object_taxon_concept table
			if(BLL_data_objects_taxon_concepts::Exist_data_objects_taxon_concepts('slave',$dataobject->id,$id) ==0)
				BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave',$id,$dataobject->id);
			
			//Select the TOC of the current data_object from master
			$dobj_tocs = BLL_data_objects_table_of_contents::Select_data_objects_table_of_contents_ByDataObjectId('master', $dataobject->id);
			//Fill the data_objects_table_of_contents table 
			foreach ($dobj_tocs as $dobj_toc)		
			{		
				if(BLL_data_objects_table_of_contents::Exist_data_objects_table_of_contents('slave',$dobj_toc->data_object_id,$dobj_toc->toc_id)==0)
				{
					BLL_data_objects_table_of_contents::Insert_data_objects_table_of_contents($dobj_toc->data_object_id,$dobj_toc->toc_id);					
				}
			}
			//Select the InfoItem of the current data_object from master
			$dobj_infos = BLL_data_objects_info_items::Select_data_objects_info_items_ByDataObjectId('master', $dataobject->id);
			//Fill the data_objects_info_items table 
			foreach ($dobj_infos as $dobj_info)		
			{		
				if(BLL_data_objects_info_items::Exist_data_objects_info_items('slave',$dobj_info->data_object_id,$dobj_info->info_item_id)==0)
				{
					BLL_data_objects_info_items::Insert_data_objects_info_items($dobj_info->data_object_id,$dobj_info->info_item_id);
				}
			}		
	  	}
	  	
		// get Images						   
		$image_dataobjects = BLL_data_objects::Select_Images_ByTaxonConceptID('master',$id);
		//echo(count($image_dataobjects));  	
		foreach ($image_dataobjects as $dataobject)	
	  	{ 	  		
	  		//Fill data_object table
	  		if(BLL_data_objects::Exist_DataObjects_ByID('slave',$dataobject->id)==0)
	  		{		
		  		$dataobject->aeol_translation=0;//Original record from woods hole not translated
				BLL_data_objects::Insert_DataObject('slave',$dataobject);
	  		}
			
			//Fill data_object_taxon_concept table
			if(BLL_data_objects_taxon_concepts::Exist_data_objects_taxon_concepts('slave',$dataobject->id,$id) ==0)
				BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave',$id,$dataobject->id);
			
			//Select the TOC of the current data_object from master
			$dobj_tocs = BLL_data_objects_table_of_contents::Select_data_objects_table_of_contents_ByDataObjectId('master', $dataobject->id);
			//Fill the data_objects_table_of_contents table 
			foreach ($dobj_tocs as $dobj_toc)		
			{		
				if(BLL_data_objects_table_of_contents::Exist_data_objects_table_of_contents('slave',$dobj_toc->data_object_id,$dobj_toc->toc_id)==0)
				{
					BLL_data_objects_table_of_contents::Insert_data_objects_table_of_contents($dobj_toc->data_object_id,$dobj_toc->toc_id);
				}
			}	
			//Select the InfoItem of the current data_object from master
			$dobj_infos = BLL_data_objects_info_items::Select_data_objects_info_items_ByDataObjectId('master', $dataobject->id);
			//Fill the data_objects_info_items table 
			foreach ($dobj_infos as $dobj_info)		
			{		
				if(BLL_data_objects_info_items::Exist_data_objects_info_items('slave',$dobj_info->data_object_id,$dobj_info->info_item_id)==0)
				{
					BLL_data_objects_info_items::Insert_data_objects_info_items($dobj_info->data_object_id,$dobj_info->info_item_id);
				}
			}			
	  	}
		
	}
	
	static function get_finished_taxons() {
		$query_str = 'select * from taxon_concepts where taxon_status_id>=6';
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		
		return $records;
	}
		
	static function Update_Status($updated_taxons,$process, $userID)
	{
		foreach ($updated_taxons as  $updated_taxon)
		{
			$curtax = BLL_taxon_concepts::Select_taxon_concept('slave', $updated_taxon->taxon_concept_id);
			if($curtax!=null && $curtax->taxon_status_id==($process-1))
			{
				$number_of_en_objects = BLL_data_objects::Count_DataObjects_ByTaxonConceptID('slave',$curtax->id);
				$number_of_ar_objects = BLL_a_data_objects::Count_a_dataObjects_ByTaxonConceptID($curtax->id,$process);
				if($number_of_en_objects == $number_of_ar_objects)
				{
					BLL_taxon_concepts::Update_taxon_concepts_Status($curtax->id,$process,$userID);
					//Send email for the next step assigned person
					BLL_taxon_concepts::SendMailNotification($curtax,$process,$userID);
					//If this is taxon of hte current page
					if($GLOBALS['taxonID']==$updated_taxon->taxon_concept_id)				
					 	$GLOBALS['UpdateTaxonStatus']=1;//update the global variable defined	 	
				}
			}
		}
	}
	
	static function SendMailNotification($taxon,$process,$userID)
	{
		switch ($process) {
			case 3://if finished translation and want to go to scientific review
				Notifications::notify_scientific_review($taxon,$userID);
				break;
			
			
			case 4: //if finished linguisitic review and want to go to linguistic review
				Notifications::notify_linguistic_review($taxon,$userID);
				break;
				
			case 5: //if finished scientific review and want to go to final editing
				Notifications::notify_final_editors($taxon,$userID);				
				break;
		}
	}
	
	static function mark_as_published($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("update taxon_concepts set taxon_status_id=7, publish_date=NOW() where taxon_status_id=6 AND  id=?");	 	
		$query->bindParam(1, $id);		
		$query->execute();
		$con->Close();
	}
	
	static function get_by_id($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("select * from taxon_concepts where id=?");
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		if (count($records)>0)
			return $records[0];
		else
			return new DAL_taxon_concepts();
	}
	
	static function get_translated_data_objects($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("
				SELECT
					d2.object_title, d2.rights_statement, d2.rights_holder, d2.description, d2.location, d1.data_type_id,
				    d1.object_title as object_title_source, d1.rights_statement as rights_statement_source, d1.rights_holder as rights_holder_source, d1.description as description_source, d1.location as location_source,
					data_types.schema_value as data_type,
					mime_types.label as mime_type,
					licenses.source_url as license,
				    guid,
					d1.source_url,
					d1.object_url,
					d1.object_cache_url,
					d1.id,
					d2.translator_id,
					d2.linguistic_reviewer_id,
					d2.scientific_reviewer_id,
					d2.final_editor_id
 				FROM data_objects d1
					inner join a_data_objects d2 on d1.id=d2.id
					inner join data_types on d1.data_type_id=data_types.id
					left outer join mime_types on d1.mime_type_id=mime_types.id
					left outer join licenses on licenses.id=license_id
					inner join data_objects_taxon_concepts ON data_objects_taxon_concepts.data_object_id=d1.id and data_objects_taxon_concepts.taxon_concept_id=?;");
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_data_objects');
		$con->Close();

		return $records;
	}
	
	static function delete_taxon($id, $selection_id) {
		
		$taxon_concept = BLL_taxon_concepts::get_by_id($id);
		if (!isset($taxon_concept->id)) {
			exit();
		}		
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("delete from taxon_concepts where id=? and selection_id=?;");	 	
		$query->bindParam(1, $id);		
		$query->bindParam(2, $selection_id);
		$query->execute();
		
		$query = $con->connection->prepare("delete from data_objects_taxon_concepts where taxon_concept_id=?;");	 	
		$query->bindParam(1, $id);
		$query->execute();
		
		$query = $con->connection->prepare("delete from taxon_concept_names where taxon_concept_id=?;");	 	
		$query->bindParam(1, $id);
		$query->execute();
		
		// delete unused data objects
		$query = $con->connection->prepare("delete from data_objects where not exists (select * from data_objects_taxon_concepts where data_object_id=data_objects.id);");	 	
		$query->execute();
		
		$query = $con->connection->prepare("delete from a_data_objects where not exists (select * from data_objects where data_objects.id=a_data_objects.id);");	 	
		$query->execute();
		
		$user_id = $taxon_concept->translator_id;
		if ($taxon_concept->taxon_status_id == 3)
			$user_id = $taxon_concept->linguistic_reviewer_id;
		if ($taxon_concept->taxon_status_id == 4)
			$user_id = $taxon_concept->scientific_reviewer_id;
		
		// unlock data objects
		$query = $con->connection->prepare("update a_data_objects 
												set 
													locked=0, 
													taxon_concept_id=0
												where 
													process_id=".$taxon_concept->taxon_status_id."
													and
													user_id=".$user_id."
													and locked=1
													and taxon_concept_id=".$taxon_concept->id.";");
		
		$query->execute();
		
		// delete names with no use
		$query = $con->connection->prepare("delete from names where not exists (select * from taxon_concept_names where name_id=names.id);");	 	
		$query->execute();
		
		$query = $con->connection->prepare("delete from a_names where taxon_id=?;");	 	
		$query->bindParam(1, $id);
		$query->execute();
		
		$con->Close();
	}
	
	static function get_accepted_common_names($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("select name as string from a_names where taxon_id=? and name_status_id=".$GLOBALS['accepted_name_status_id'].";");	 	
		$query->bindParam(1, $id);	
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_names');
		$con->Close();
		return $records;
	}
	
	static function get_rejected_common_names($id) {
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("select name_id from taxon_concept_names where taxon_concept_id=? and name_status_id=".$GLOBALS['rejected_name_status_id'].";");	 	
		$query->bindParam(1, $id);	
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_names');
		$con->Close();
		return $records;
	}
	
	static function taxon_search($keyword) {
		$str_temp = '%'.$keyword.'%';
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("select taxon_concepts.*, status.label as taxon_status from taxon_concepts 
												left outer join status on status.id=taxon_status_id 
												where scientificName like ?;");
		$query->bindParam(1, $str_temp);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return $records;
	}
	
	static function taxon_concept_assign_log($taxon_concept_id, $user_id, $phase_id, $by_user_id) {
		$query_str = 'insert into taxon_concept_assign_log (taxon_concept_id,
															user_id,
															phase_id,
															by_user_id)
													values (?, ?, ?, ?);';
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		$query->bindParam(1, $taxon_concept_id);
		$query->bindParam(2, $user_id);
		$query->bindParam(3, $phase_id);
		$query->bindParam(4, $by_user_id);
		$query->execute();
		$con->Close();		
	}
	
	
	static function Search_For_taxon_concepts($speciesID,$speciesName,$selection_id,$taxon_status_id,$translator_id,$translator_assigned,$linguistic_reviewer_id,$scientific_reviewer_id,$final_editor_id, $current_page, $items_per_page, $priority_id)
	{
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("SELECT 
			taxon_concepts.*
			, FUN_CountEnglishObjects(taxon_concepts.id)   AS total_EnglishObjects
			, FUN_CountArabicObjects(taxon_concepts.id, taxon_status_id ) AS total_ArabicObjects	
			, users.email
			, priorities.label as priority
		FROM taxon_concepts 
			LEFT OUTER JOIN users on (taxon_concepts.translator_id=users.id)
			INNER JOIN selection_batches on selection_id=selection_batches.id
			INNER JOIN priorities on priorities.id=priority_id			  
		WHERE	  	 	
	  	 		(:v1 IS NULL OR taxon_concepts.id=:v1)
	  	 	AND (:v2 IS NULL OR scientificName like :v2)
	  	 	AND (:v3 IS NULL OR selection_id=:v3) 
	  	 	AND (:v4 IS NULL OR taxon_status_id=:v4)	  	 	 
	  	 	AND (:v5 IS NULL OR translator_id=:v5)
	  	 	AND (:v6 IS NULL OR translator_assigned=:v6) 
	  	 	AND (:v7 IS NULL OR linguistic_reviewer_id=:v7)
	  	 	AND (:v8 IS NULL OR scientific_reviewer_id=:v8)
	  	 	AND (:v9 IS NULL OR final_editor_id=:v9)
	  	 	AND (:v12 IS NULL OR priority_id=:v12)
	  	 	ORDER BY sort_order, scientificName    
	  	 	LIMIT :v10,:v11;");
	  
		$myNull = null;
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v1',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v1', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v2', $safeparam);
		}

		if($selection_id=='0')
			$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v3', $selection_id);
		
		if($taxon_status_id=='-1')
			$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $taxon_status_id);
		
		if($translator_id=='0')
			$query->bindParam(':v5',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v5', $translator_id);

		if($translator_assigned=='-1')
			$query->bindParam(':v6',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v6', $translator_assigned);
		
		if($linguistic_reviewer_id=='0')
			$query->bindParam(':v7',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v7', $linguistic_reviewer_id);
		
		if($scientific_reviewer_id=='0')
			$query->bindParam(':v8',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v8', $scientific_reviewer_id);
		
		if($final_editor_id=='0')
			$query->bindParam(':v9',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v9', $final_editor_id);
		
		$start = ($current_page - 1)* $items_per_page;
		$query->bindParam(':v10', $start, PDO::PARAM_INT);
		$query->bindParam(':v11', $items_per_page, PDO::PARAM_INT);
		if($priority_id=='0')
			$query->bindParam(':v12',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v12', $priority_id);
		$query->execute();
			
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function Search_Count_For_taxon_concepts($speciesID,$speciesName,$selection_id,$taxon_status_id,$translator_id,$translator_assigned,$linguistic_reviewer_id,$scientific_reviewer_id,$final_editor_id, $priority_id)
	{	
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare("SELECT 
			COUNT(*)			
		FROM taxon_concepts  
		INNER JOIN selection_batches on selection_id=selection_batches.id
		WHERE	  	 	
	  	 		(:v1 IS NULL OR taxon_concepts.id=:v1)
	  	 	AND (:v2 IS NULL OR scientificName like :v2)
	  	 	AND (:v3 IS NULL OR selection_id=:v3) 
	  	 	AND (:v4 IS NULL OR taxon_status_id=:v4)	  	 	 
	  	 	AND (:v5 IS NULL OR translator_id=:v5)
	  	 	AND (:v6 IS NULL OR translator_assigned=:v6) 
	  	 	AND (:v7 IS NULL OR linguistic_reviewer_id=:v7)
	  	 	AND (:v8 IS NULL OR scientific_reviewer_id=:v8)
	  	 	AND (:v9 IS NULL OR final_editor_id=:v9)
	  	 	AND (:v10 IS NULL OR priority_id=:v10)
	  	 	;");
	  
		$myNull = null;
	  
		if(trim($speciesID)=='')
		$query->bindParam(':v1',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v1', $speciesID);
	  
		if(trim($speciesName)=='')
		$query->bindParam(':v2',$myNull, PDO::PARAM_NULL);
		else
		{
			$safeparam =  '%'.trim($speciesName).'%';
			$query->bindParam(':v2', $safeparam);
		}

		if($selection_id=='0')
			$query->bindParam(':v3',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v3', $selection_id);
		
		if($taxon_status_id=='-1')
			$query->bindParam(':v4',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v4', $taxon_status_id);
		
		if($translator_id=='0')
			$query->bindParam(':v5',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v5', $translator_id);

		if($translator_assigned=='-1')
			$query->bindParam(':v6',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v6', $translator_assigned);
		
		if($linguistic_reviewer_id=='0')
			$query->bindParam(':v7',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v7', $linguistic_reviewer_id);
		
		if($scientific_reviewer_id=='0')
			$query->bindParam(':v8',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v8', $scientific_reviewer_id);
		
		if($final_editor_id=='0')
			$query->bindParam(':v9',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v9', $final_editor_id);
		
		if($priority_id=='0')
			$query->bindParam(':v10',$myNull, PDO::PARAM_NULL);
		else $query->bindParam(':v10', $priority_id);
				
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		return  $result;
	}
	
	static function get_pending_distribution_count() {
		$query_str = "select count(*) as Total_Pending from taxon_concepts where taxon_status_id<=1 ";
							
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		
		return $result;			
	}	
	
	static function get_finished_distribution_count($keyword) {
		$query_str = "select count(*) as Total_Pending from taxon_concepts where taxon_status_id>=2 ";
		if ($keyword != '') 
			$query_str .= " and scientificName like ?";
		
					
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		if ($keyword != '') 
			$query->bindParam(1, '%'.$keyword.'%');
		
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		
		return $result;			
	}	
	
	static function get_pending_distribution($current_page, $page_size, $sort_by) {
		$query_str = "select taxon_concepts.*, users.name as selected_by, priorities.label as priority
							from taxon_concepts 
							inner join selection_batches on selection_batches.id=taxon_concepts.selection_id
							inner join users on users.id=selection_batches.user_id
							inner join priorities on priorities.id=priority_id
							where taxon_status_id<=1 ";		
		
		if ($sort_by == 'id')
			$query_str .= ' order by taxon_concepts.id ';
		elseif ($sort_by == 'user')
			$query_str .= ' order by selected_by ';
		elseif ($sort_by == 'date')
			$query_str .= ' order by selection_date ';
		elseif ($sort_by == 'name')
			$query_str .= ' order by scientificName ';
		else
			$query_str .= ' order by sort_order ';
		
		$query_str .= Pagination::get_paging_limit($page_size, $current_page);
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function get_finished_distribution($keyword, $current_page, $page_size) {
		$query_str = "select taxon_concepts.*, status.label as taxon_status, priorities.label as priority
							from taxon_concepts 
							inner join status on status.id=taxon_concepts.taxon_status_id
							inner join selection_batches on selection_batches.id=selection_id
							inner join priorities on priorities.id=priority_id
							where taxon_status_id>=2 ";
		if ($keyword != '') 
			$query_str .= " and scientificName like ? ";
		
		$query_str .= ' order by sort_order, scientificName '; 
		
		$query_str .= Pagination::get_paging_limit($page_size, $current_page);
		
		$con = new PDO_Connection();
		$con->Open('slave');
		$query = $con->connection->prepare($query_str);
		if ($keyword != '') 
			$query->bindParam(1, '%'.$keyword.'%');
		
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
		$con->Close();
		return  $records;
	}
	
	static function get_text_count($id) {
		$query_str = 'select count(distinct data_objects.id) from data_objects 
	                            inner join data_objects_hierarchy_entries dohe
	                            	ON dohe.data_object_id=data_objects.id
	                            inner join hierarchy_entries he
	                            	ON he.id=dohe.hierarchy_entry_id
								inner join data_objects_table_of_contents 
	                            	ON data_objects_table_of_contents.data_object_id=data_objects.id
                            	inner join table_of_contents
                            		ON table_of_contents.id=data_objects_table_of_contents.toc_id
	                            where taxon_concept_id='.$id.'
	                                and data_type_id=3 and data_objects.published=1 and dohe.visibility_id=2
	                                and 
	                                	(
	                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
	                                		 or 
                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))';
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare($query_str);
				
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		
		return $result;	
	}
	
	static function get_images_count($id) {
		$query_str = "select count(distinct(data_objects.id)) from data_objects
	                        	Inner join top_images on data_object_id=data_objects.id
	                        	Inner join hierarchy_entries he on he.id=top_images.hierarchy_entry_id and taxon_concept_id=$id                       	
                        		Inner join data_objects_hierarchy_entries dohe on dohe.data_object_id=data_objects.id
	                        where data_objects.published=1 and dohe.visibility_id=2";
				
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare($query_str);
				
		$query->execute();
		$result = $query->fetchColumn();
		$con->Close();
		
		return $result;	
	}
}

?>
