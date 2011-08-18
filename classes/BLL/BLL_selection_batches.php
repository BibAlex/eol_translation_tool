<?php
	class BLL_selection_batches {
		
		static function save($hierarchy_id, $hierarchy_entry_id, $have_text, $text_curated,
	                                   $have_images, $images_curated, $vetted_text, $vetted_images, $taxon_concept_Array, $comments, $priority_id) {
	
	        $criteria = '<i>Hierarchy: </i>'.BLL_hierarchies::get_name($hierarchy_id).'<br>';
	        $criteria .= '<i>Hierarchy entry: </i>'.BLL_hierarchy_entries::get_name($hierarchy_entry_id).'<br>';
	        $criteria .= '<i>Have Text: </i>';
	        switch ($have_text) {
	            case -1:
	                $criteria .=  'All';
	                break;
	            case 0:
	                $criteria .=  'No';
	                break;
	            case 1:
	                $criteria .=  'Yes';
	                break;
	        }
	
	        $criteria .= '<br>';
	
	        if ($have_text != 0)
	        {
	            $criteria .= '- <i>Vetted: </i>';
	
	            if (strrpos($vetted_text, "0")>0)
	                $criteria .= 'Unknown &nbsp;&nbsp;&nbsp;';
	            if (strrpos($vetted_text, "4")>0)
	                $criteria .= 'Untrusted &nbsp;&nbsp;&nbsp;';
	            if (strrpos($vetted_text, "5")>0)
	                $criteria .= 'trusted';
	            $criteria .= '<br>';
	            $criteria .= '<i>Curated: </i>';
	            switch ($text_curated) {
	                case -1:
	                    $criteria .= 'All';
	                    break;
	                case 0:
	                    $criteria .= 'No';
	                    break;
	                case 1:
	                    $criteria .= 'Yes';
	                    break;
	            }
	            $criteria .= '<br>';
	        }
	
	        $criteria .= '<i>Have Images: </i>';
	        switch ($have_images) {
	            case -1:
	                $criteria .= 'All';
	                break;
	            case 0:
	                $criteria .= 'No';
	                break;
	            case 1:
	                $criteria .= 'Yes';
	                break;
	        }
	        $criteria .= '<br>';
	
	        if ($have_images != 0) {
	            $criteria .= '- <i>Vetted: </i>';
	            if (strrpos($vetted_images, "0")>0)
	                $criteria .= 'Unknown &nbsp;&nbsp;&nbsp;';
	            if (strrpos($vetted_images, "4")>0)
	                $criteria .= 'Untrusted &nbsp;&nbsp;&nbsp;';
	            if (strrpos($vetted_images, "5")>0)
	                $criteria .= 'trusted';
	            $criteria .= '<br>';
	            $criteria .= '- <i>Curated: </i>';
	            switch ($images_curated) {
	                case -1:
	                    $criteria .=  'All';
	                    break;
	                case 0:
	                    $criteria .=  'No';
	                    break;
	                case 1:
	                    $criteria .=  'Yes';
	                    break;
	            }
	            $criteria .= '<br>';
	        }
	        $criteria .= '<br><br>';
	        $criteria .= '<b><u>Species</u></b><br>';
	        for ($i=0; $i<count($taxon_concept_Array); $i++) {
	            $criteria .= BLL_taxon_concepts::get_name($taxon_concept_Array[$i], $hierarchy_id).'<br/>';
	        }
			
	        $con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare("insert into selection_batches(criteria, comments, date_selected, user_id, hierarchy_id, priority_id) values (?, ?, NOW(), ?, ?, ?);");		  		 	
		    echo $priority_id;
		    $query->bindParam(1, $criteria);
		    $query->bindParam(2, $comments);
		    $query->bindParam(3, BLL_users::get_user_id());
		    $query->bindParam(4, $hierarchy_id);
			$query->bindParam(5, $priority_id);
		  	//$query->execute();	
		  	//$id = $con->connection->lastInsertId();					  	
		  	$con->Close();
		  	
		  	$total_selected_species = 0;
		  	
            for ($i=0; $i<count($taxon_concept_Array); $i++) {
	            $master_taxon = BLL_taxon_concepts::Select_taxon_concept('master', $taxon_concept_Array[$i]);	            
	            if (isset($master_taxon->id)) {
					if (!BLL_taxon_concepts::exists_on_slave($master_taxon->id)) {
	            		BLL_taxon_concepts::save_taxon_concept($master_taxon->id, 
	                									   $master_taxon->supercedure_id, 
	                									   $master_taxon->split_from, 
	                									   $master_taxon->vetted_id, 
	                									   $master_taxon->published, 
	                									   $id,
	                									   BLL_taxon_concepts::get_name($master_taxon->id, $hierarchy_id));
						$total_selected_species = $total_selected_species + 1;
					}	            	
	            }
	        }
			if ($total_selected_species > 0) {
	        	Notifications::notify_task_distributor($id, BLL_users::get_user_id(), $total_selected_species, $criteria, $comments);
			}
	    }		
	
		static function get_pending_batches_count() {			
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare('select count(*) as total_count from selection_batches 
		  											where exists 
		  												(select * from taxon_concepts where selection_id=selection_batches.id and taxon_status_id<2)');		  		 	
		    $query->execute();	
		    $result = $query->fetchColumn();	    	
		  	$con->Close();
			
			return $result;	
		}
		
		static function get_finished_batches_count() {			
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare('select count(*) as total_count from selection_batches 
		  											where not exists 
		  												(select * from taxon_concepts where selection_id=selection_batches.id and taxon_status_id<2)');		  		 	
		    $query->execute();	
		    $result = $query->fetchColumn();	    	
		  	$con->Close();
			
			return $result;	
		}
		
		static function get_count($id, $column_name, $is_zero) {		
			$query = 'select count(*) as total_count from taxon_concepts where selection_id='.$id.' and '.$column_name;
			if ($is_zero)
				$query .= '=0;';
			else
				$query .= '>0;';
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare($query);		  		 	
		    $query->execute();	
		    $result = $query->fetchColumn();	    	
		  	$con->Close();
			
			return $result;			
		}
		
		static function get_batches_count_by_user($user_id) {			
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare('select count(*) as total_count from selection_batches where user_id='.$user_id.';');		  		 	
		    $query->execute();	
		    $result = $query->fetchColumn();	    	
		  	$con->Close();
			
			return $result;	
		}
		
		static function load_all_by_user($current_page, $items_per_page, $user_id) {
			$query_str = 'select selection_batches.*, 
						(select count(*) from taxon_concepts where 
							selection_id=selection_batches.id) 
					as total_taxon_count from selection_batches  order by date_selected desc ';		
			
			// add Pagination
			$query_str .= Pagination::get_paging_limit($items_per_page, $current_page) . ';';			
						
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_selection_batches');
			$con->Close();    
			return  $records;
		}
		
		static function get_translation_assigned($id) {
			return BLL_selection_batches::get_count($id, 'translator_id', false);
		}
		
		static function get_species_count($id) {
			$query = 'select count(*) as total_count from taxon_concepts where selection_id='.$id.';';
			$con = new PDO_Connection();
		  	$con->Open('slave');		  	
		  	$query = $con->connection->prepare($query);		  		 	
		    $query->execute();	
		    $result = $query->fetchColumn();	    	
		  	$con->Close();
			
			return $result;	
		}
		
		static function get_translation_unassigned($id) {
			return BLL_selection_batches::get_count($id, 'translator_id', true);
		}
		
		static function get_linguistic_reviewer_assigned($id) {
			return BLL_selection_batches::get_count($id, 'linguistic_reviewer_id', false);
		}
		
		static function get_linguistic_reviewer_unassigned($id) {
			return BLL_selection_batches::get_count($id, 'linguistic_reviewer_id', true);
		}
		
		static function get_scientific_reviewer_assigned($id) {
			return BLL_selection_batches::get_count($id, 'scientific_reviewer_id', false);
		}
		
		static function get_scientific_reviewer_unassigned($id) {
			return BLL_selection_batches::get_count($id, 'scientific_reviewer_id', true);
		}
		
		static function load_all($current_page, $items_per_page, $finished) {
			$query_str = 'select selection_batches.*, 
						(select count(*) from taxon_concepts where 
							selection_id=selection_batches.id) 
					as pending_taxon_count from selection_batches where ';
			
			if ($finished > 0)
				$query_str .= ' not ';
				
			$query_str .= ' exists (select * from taxon_concepts where selection_id=selection_batches.id and taxon_status_id<2)';
			 
			$query_str .= ' order by date_selected desc ';		
			
			// add Pagination
			$query_str .= Pagination::get_paging_limit($items_per_page, $current_page) . ';';			
						
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_selection_batches');
			$con->Close();    
			return  $records;
		}
		
		static function load_by_id($id) {
			$query_str = 'select selection_batches.*,
									(select count(*) from taxon_concepts where selection_id=selection_batches.id) as total_taxon_count
							 from selection_batches  where id=?;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $id);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_selection_batches');
			$con->Close();    
			return  $records;
		}
		
		 static function Select_SelectorName_ByBatchId($id) {
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare('SELECT users.* FROM selection_batches INNER JOIN users on (users.id=selection_batches.user_id)    WHERE selection_batches.id=?;');
	  	 	$query->bindParam(1, $id);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_users');
			$con->Close();
			return  $records[0];
		}
		
		static function get_selected_taxons($selection_id) {			
			$query_str = 'select * from taxon_concepts where selection_id=?;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $selection_id);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
			$con->Close();    
			return  $records;
		}	
		static function get_old_selected_taxons($selection_id) {			
			$query_str = 'select taxon_concepts.*, 
							status.label as taxon_status,
							(select count(*) from data_objects 
                            inner join data_objects_taxon_concepts 
                                ON data_objects.id=data_object_id
                            where data_objects_taxon_concepts.taxon_concept_id=taxon_concepts.id
                                and data_type_id=3 and published=1 and visibility_id=1) as total_text_objects,
                        (select count(*) from data_objects 
                            inner join data_objects_taxon_concepts 
                                ON data_objects.id=data_object_id
                            where data_objects_taxon_concepts.taxon_concept_id=taxon_concepts.id
                                and data_type_id=1 and published=1 and visibility_id=1) as total_image_objects,
                        (select count(*) from data_objects 
                            inner join data_objects_taxon_concepts 
                                ON data_objects.id=data_object_id
                            where data_objects_taxon_concepts.taxon_concept_id=taxon_concepts.id
                                and data_type_id=1 and published=1 and visibility_id=1) as total_image_objects,
                        (select count(*) from data_objects 
	                            inner join data_objects_taxon_concepts 
	                                ON data_objects.id=data_object_id
	                            where (data_type_id=2 or data_type_id=4 or data_type_id=7 or data_type_id=8) and published=1 and visibility_id=1) as total_other_objects
							from taxon_concepts left outer join status on taxon_status_id=status.id where selection_id=?;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $selection_id);	  		 	
		    $query->execute();		
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_taxon_concepts');
			$con->Close();    
			return  $records;
		}	
		
		static function mark_as_finished($id) {			
			$query_str = 'update selection_batches set finished=1, date_distributed=now() where id=?;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $id);	  		 	
		    $query->execute();
			$con->Close();			
		}
		
		static function has_published_species($id) {
			$query_str = 'select count(*) as total_species from taxon_concepts where selection_id=? and taxon_status_id=7;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $id);	
	  	 	$query->execute();
	  	 	$result = $query->fetchColumn();		    
			$con->Close();		
			
			if ($result==0)
				return false;
			else
				return true;
		}
		
		static function delete_batch($id) {
			$query_str = 'delete from selection_batches where id=?;';
			
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare($query_str);
	  	 	$query->bindParam(1, $id);	
	  	 	$query->execute();	  	 			    
			$con->Close();					
		}
		
		static function select_all_batches() {
			$con = new PDO_Connection();
	  	 	$con->Open('slave');		  	
	  	 	$query = $con->connection->prepare('SELECT * FROM selection_batches;');
	  	 	$query->execute();
	  	 	$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_selection_batches');		    
			return $records;
		}
	}
?>