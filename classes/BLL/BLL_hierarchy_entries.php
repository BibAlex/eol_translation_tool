<?php
class BLL_hierarchy_entries {

	static function load_siblings($h_id, $parent_id) {
		$query_str = 'select string, h1.id, h1.parent_id, (select count(*) from hierarchy_entries as h2 where h2.parent_id=h1.id) as siblings_count, h1.taxon_concept_id
                    from hierarchy_entries h1
                    left outer join names on names.id=name_id
                    where hierarchy_id=? and parent_id=? and published=1 order by string;';

		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare($query_str);
		$query->bindParam(1, $h_id);
		$query->bindParam(2, $parent_id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchy_entries');
		$con->Close();
		 
		return $records;
	}
	 
	static function get_name($id) {
		$query_str = 'select string
	                    	from hierarchy_entries h1
	                    	left outer join names on names.id=name_id
	                    	where h1.id=? and published=1';
		 
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare($query_str);
		$query->bindParam(1, $id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchy_entries');
		$con->Close();
		 
		if (count($records) >0)
		return $records[0]->string;
		else
		return '';
	}
	 
	static function search($hierarchy_id, $hierarchy_entry_id,
								$have_text, $text_curated, $vetted_text_array,
								$have_images, $images_curated, $vetted_images_array, $select_sub, $select_hotlist) {

		$rgt=0;
		$lft=0;
		// Get right
		$con = new PDO_Connection();
		$con->Open('master');
		$query = $con->connection->prepare('select rgt,lft from hierarchy_entries where id=?;');
		$query->bindParam(1, $hierarchy_entry_id);
		$query->execute();
		$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchy_entries');
			
		if (count($records) >0) {
			$rgt = $records[0]->rgt;
			$lft = $records[0]->lft;
		}

		$query_str = 'select string, he.id, he.taxon_concept_id,
	                        (select count(distinct data_objects.id) from data_objects 
	                            inner join data_objects_table_of_contents 
	                            	ON data_objects_table_of_contents.data_object_id=data_objects.id
                            	inner join table_of_contents
                            		ON table_of_contents.id=data_objects_table_of_contents.toc_id
                            	inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where dohe.hierarchy_entry_id=he.id
	                            	and data_type_id='.$GLOBALS['data_types_text'].' and data_objects.published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].'
	                                and 
	                                	(
	                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
	                                		 or 
                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))) as total_text_objects,
	                        (select count(distinct(data_objects.id)) from data_objects
	                        	Inner join top_images on data_object_id=data_objects.id 	                        	
	                        	inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where top_images.hierarchy_entry_id=he.id and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].') as total_image_objects,
                        	(select count(*) from data_objects 
	                            inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where dohe.hierarchy_entry_id=he.id
	                                and (data_type_id in ('.$GLOBALS['data_types_media'].')) and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].') as total_other_objects
	                    from hierarchy_entries he';

		$query_str .= ' left outer join names on names.id=name_id ';

		if ($select_hotlist == 1)
                      $query_str .= ' inner join hotlists_hierarchy_entries on hotlists_hierarchy_entries.hierarchy_entry_id=he.id ';

		$query_str .= ' where hierarchy_id='.strval($hierarchy_id);
		
		if ($select_sub == 1)
			$query_str .= ' and (he.id='.strval($hierarchy_entry_id).' or (he.lft>='.strval($lft).' and he.rgt<='.strval($rgt).'))';
		else
		 	$query_str .= ' and (he.id='.strval($hierarchy_entry_id).' or (he.lft='.strval($lft).' and he.rgt='.strval($rgt).'))';
		 
		if ($have_text == 0)
		$query_str .= ' and not exists (select * from data_objects 
	                            inner join data_objects_table_of_contents 
	                            	ON data_objects_table_of_contents.data_object_id=data_objects.id
                            	inner join table_of_contents
                            		ON table_of_contents.id=data_objects_table_of_contents.toc_id
	                            inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where dohe.hierarchy_entry_id=he.id
	                                and data_type_id='.$GLOBALS['data_types_text'].' and data_objects.published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].'
	                                and 
	                                	(
	                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
	                                		 or 
                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))) ';
		if ($have_text == 1)
		$query_str .= ' and exists (select * from data_objects 
	                            inner join data_objects_table_of_contents 
	                            	ON data_objects_table_of_contents.data_object_id=data_objects.id
                            	inner join table_of_contents
                            		ON table_of_contents.id=data_objects_table_of_contents.toc_id
	                            inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where dohe.hierarchy_entry_id=he.id
	                                and data_type_id='.$GLOBALS['data_types_text'].' and data_objects.published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].'
	                                and 
	                                	(
	                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
	                                		 or 
                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))) ';
		if ($have_text != 0) {
			if ($text_curated > -1 || count($vetted_text_array) != 3) {
				$query_str .= ' and exists (select * from data_objects
	                                            inner join data_objects_table_of_contents 
	                            					ON data_objects_table_of_contents.data_object_id=data_objects.id
                            					inner join table_of_contents
                            						ON table_of_contents.id=data_objects_table_of_contents.toc_id
                                                inner join data_objects_hierarchy_entries dohe
				                            		ON dohe.data_object_id=data_objects.id
					                            where dohe.hierarchy_entry_id=he.id
					                                and data_type_id='.$GLOBALS['data_types_text'].' and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].'
                                                	and dohe.hierarchy_entry_id=he.id
                                                	and 
				                                	(
				                                	toc_id in ('.$GLOBALS['TOC_included_parent_ids'].')
				                                		 or 
			                                		table_of_contents.parent_id in ('.$GLOBALS['TOC_included_parent_ids'].'))';
				if ($text_curated > -1)
				$query_str .= ' and curated='.strval($text_curated);
				if (count($vetted_text_array) != 3) {
					$query_str .= ' and (vetted_id>-1';
					for ($i=0; $i<count($vetted_text_array); $i++)
						$query_str .= ' or vetted_id='.  $vetted_text_array[$i];
					$query_str .= ')';
				}
				$query_str .= ')';
			}
		}

		if ($have_images == 0)
		$query_str .= ' and not exists (select * from data_objects
	                        	Inner join top_images on data_object_id=data_objects.id 	                        	
	                        	inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where top_images.hierarchy_entry_id=he.id and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].') ';
		if ($have_images == 1)
		$query_str .= ' and exists (select * from data_objects
	                        	Inner join top_images on data_object_id=data_objects.id 	                        	
	                        	inner join data_objects_hierarchy_entries dohe
                            		ON dohe.data_object_id=data_objects.id
	                            where top_images.hierarchy_entry_id=he.id and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].') ';
		if ($have_images != 0) {
			if ($images_curated > -1 || count($vetted_images_array) != 3) {
				$query_str .= ' and exists (select data_objects.* from data_objects
	                        						Inner join top_images on data_object_id=data_objects.id 	                        	
	                        						inner join data_objects_hierarchy_entries dohe
					                            		ON dohe.data_object_id=data_objects.id
						                            where top_images.hierarchy_entry_id=he.id and published=1 and dohe.visibility_id='.$GLOBALS['visibility_visible'].' ';
				if ($images_curated > -1)
					$query_str .= ' and curated='.strval($images_curated);
				if (count($vetted_images_array) != 3) {
					$query_str .= ' and (vetted_id>-1';
					for ($i=0; $i<count($vetted_images_array); $i++)
						$query_str .= ' or vetted_id='.  $vetted_images_array[$i];
					$query_str .= ')';
				}
				$query_str .= ')';
			}
		}

		$query_str .= ' order by string';
		 
				
		//echo($query_str);
		$query = $con->connection->prepare($query_str);
		$query->execute();
		$results = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_hierarchy_entries');
		$con->Close();
		return $results;
	}
}
?>
