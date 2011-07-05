<?php
	class BLL_a_data_objects {
		
		static function Select_a_data_objects_ByID($id) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT * FROM a_data_objects WHERE  id=?;");
		  	$query->bindParam(1, $id);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_data_objects');
			$con->Close();
			if(COUNT($records)==0)
				return null;
			else
				return $records[0];
		}
				
		
		static function Select_a_data_objects_ByTaxonID($tid) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT a_data_objects.* 
		  		FROM a_data_objects INNER JOIN data_objects_taxon_concepts
		  		ON (a_data_objects.id = data_objects_taxon_concepts.data_object_id)
		  		 WHERE data_objects_taxon_concepts.taxon_concept_id=?;");
		  	$query->bindParam(1, $tid);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_data_objects');
			$con->Close();
			return $records;
		}
						
		static function Condition_a_data_objects_ByID_Process($id, $CurProcess) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT user_id, process_id, locked FROM a_data_objects WHERE  id=?;");
		  	$query->bindParam(1, $id);		  				  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_data_objects');
			$con->Close();
			
			$ArObj = null;
			if(COUNT($records)>0)
				$ArObj = $records[0];
				
			return BLL_a_data_objects::Condition($CurProcess, $ArObj);
		}
		
		
		static function Condition($CurProcess, $ArObj)
		{				
			$process_id = -1;
			$locked = -1;
			if($ArObj!=null)
			{				
				$process_id = $ArObj->process_id;
				$locked = $ArObj->locked;
			}  
			//////////////////////////////////////////////
			//$Current Process: Is the current process that the user is on it
			//$process id:		Is the latest version process id of the object
			
			//////////////////////////
			//Species Object conditions:
			//1. If no records & In translation --> New(1)
			//2. If is new in the current process (not locked yet) --> new(1)
			//3. If same process & not finished & (locked by same user) --> Pending(2)
			//4. If same process & not finished & (locked by different user)--> locked(4)			
			//5. If higher process --> finihsed(3)
			//6. else It is not ready for this process yet --> locked(4)
			//////////////////////////
			
			if(	  /*1*/    ($process_id==-1 && $CurProcess==2)//If process is translation and not begin on it yet
				||/*2*/ ($process_id==$CurProcess && $locked==0)//If finished in the previous process
			   )
				return 1;//Return New in that process
				
			if(/*3*/$process_id==$CurProcess && $locked==1 && $ArObj->user_id==$_SESSION["user_id"])//If same process exisit and locked by same user
				return 2;//Pending in Current Process
			
			if(/*4*/$process_id==$CurProcess && $locked==1 && $ArObj->user_id!=$_SESSION["user_id"] )//If same process exisit but not finished yet by different user
				return 4;//locked pending by different user Current Process			
			
			if( /*5*/$process_id>$CurProcess)//If higher process			  
				return 3;//because it finished the current process				
				
			if(/*6*/$process_id < $CurProcess)//If not ready for this process
				return 4;//because it is locked
			
			echo 'Please, Contact your administrator to check this special case';
			return 4;//locked by default
		}
		
		static function Insert_a_data_objects(
						$id,
						$user_id,
						$process_id,
						$object_title,
						$location,
						$rights_statement,
						$rights_holder,
						$description,
						$taxon_concept_id,
						$locked					
						) 
		{	
			//echo $location;
			$con = new PDO_Connection();
		  	$con->Open('slave');
		  	$query = $con->connection->prepare("INSERT INTO a_data_objects VALUES(?,?,?,?,?,?,?,Now(),?,?,?);");
		  	$query->bindParam(1, $id);		
		  	$query->bindParam(2, $user_id);
		  	$query->bindParam(3, $process_id);	
		  	$query->bindParam(4, $object_title);
		  	$query->bindParam(5, $rights_statement);
		  	$query->bindParam(6, $rights_holder);
		  	$query->bindParam(7, $description);		  		  	
		  	$query->bindParam(8, $locked);
		  	$query->bindParam(9, $taxon_concept_id);
			$query->bindParam(10, $location);
					  	
		    $query->execute();
			$con->Close();
			BLL_archived_a_data_objects::Insert_archived_a_data_objects_ByID($id, $user_id, $process_id, $object_title, $location, $rights_statement, $rights_holder, $description, $locked, $taxon_concept_id);
		}
		
		
		static function Update_a_data_objects(
						$id,
						$user_id,
						$process_id,	
						$object_title,
						$location,
						$rights_statement,
						$rights_holder,						
						$description,
						$taxon_concept_id,
						$locked														
						) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("UPDATE a_data_objects SET
		  				user_id=?,
		  				process_id=?,		  				  						  				
						object_title=?,
						location=?,
						rights_statement=?,
						rights_holder=?,
						description=?,											
						modified_at = NOW(),
						locked=?,
						taxon_concept_id=? 						
				WHERE id=? ;");
		  	$query->bindParam(1, $user_id);
		  	$query->bindParam(2, $process_id);
		  	$query->bindParam(3, $object_title);
		  	$query->bindParam(4, $location);
		  	$query->bindParam(5, $rights_statement);
		  	$query->bindParam(6, $rights_holder);
		  	$query->bindParam(7, $description);		  			  	
		  	$query->bindParam(8, $locked);
		  	$query->bindParam(9, $taxon_concept_id);
		  	$query->bindParam(10, $id);
		    $query->execute();
			$con->Close();
			BLL_archived_a_data_objects::Insert_archived_a_data_objects_ByID($id, $user_id, $process_id, $object_title, $location, $rights_statement, $rights_holder, $description, $locked, $taxon_concept_id);
		}
		
		static function Exist_a_data_objects($id) 
		{
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("SELECT id FROM a_data_objects WHERE  id=?;");
		  	$query->bindParam(1, $id);			  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_a_data_objects');
			$con->Close();
			return COUNT($records);			
		}
				
		static function Count_a_dataObjects_ByTaxonConceptID($taxon_concept_id, $process_id) 
		{
		 	 $con = new PDO_Connection();
		  	 $con->Open('slave');
			  	
		  	 $stmt = $con->connection->prepare("SELECT COUNT(id)
		  	 						FROM a_data_objects
		                           INNER JOIN  data_objects_taxon_concepts
		                                ON (a_data_objects.id=data_object_id)	                        
		                           WHERE  data_objects_taxon_concepts.taxon_concept_id=?  AND 
		                           (	process_id>=?  );");
		 	
		    $stmt->bindParam(1, $taxon_concept_id);
		    $stmt->bindParam(2, $process_id);
			$stmt->execute();		
			$records = $stmt->fetchColumn();		
		    $con->Close();    
		    return $records;    
		}
		
		static function SubmitAction($objectID,$userID,$process, $actionType, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id)
		{
			if($actionType==1)//finish
			{
				$locked=0;
				$process =$process+1;
			}
			else
				$locked=1;//Save only in current process
				
			//if a record already exsist so update
			$exists = BLL_a_data_objects::Exist_a_data_objects($objectID); 
			if($exists>0)
				BLL_a_data_objects::Update_a_data_objects($objectID, $userID, $process, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id, $locked);
			else //insert new
				BLL_a_data_objects::Insert_a_data_objects($objectID, $userID, $process, $SP_title, $SP_location, $RS_editor, $RH_editor, $D_editor, $taxon_concept_id, $locked);

			if($actionType==1)//if finish
			{
				//Update status of all taxon concetps related to that object
				$updated_taxons = BLL_data_objects_taxon_concepts::Select_data_objects_taxon_concepts_By_DataObjectID('slave',$objectID);
				BLL_taxon_concepts::Update_Status($updated_taxons,$process,$userID);
			}
		}
		
		static function FinishAll($tid, $process, $userID)
		{	
			$locked=0;
			$arObjs = BLL_a_data_objects::Select_a_data_objects_ByTaxonID($tid);	
			foreach($arObjs as $arObj)
			{
				if($arObj->process_id == $process && ($arObj->locked==0 || $arObj->user_id==$userID))
				{
					//echo $arObj>id.'-'.$userID.'-'.($process+1).'-'.$tid.'-'.$locked;
					BLL_a_data_objects::Update_a_data_objects($arObj->id,$userID,$process+1,  $arObj->object_title,$arObj->location, $arObj->rights_statement , $arObj->rights_holder, $arObj->description, $tid, $locked);
				}
			}
			//Update status of all taxon concetps related to this taxon object
			$updated_taxons = BLL_data_objects_taxon_concepts::Select_taxons_incommon_ByTaxon_ID('slave',$tid);
			BLL_taxon_concepts::Update_Status($updated_taxons,$process+1,$userID);
		}
	}
?>