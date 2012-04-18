// <?php
// include_once '../../../config/constants.php';
// include_once '../../../classes/PDO_Connection.php';
// include_once '../../../classes/BLL/BLL_taxon_concepts.php';
// include_once '../../../classes/DAL/DAL_taxon_concepts.php';
// include_once '../../../classes/BLL/BLL_data_objects.php';
// include_once '../../../classes/DAL/DAL_data_objects.php';
// include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';
// include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';
// include_once '../../../classes/BLL/BLL_data_objects_table_of_contents.php';
// include_once '../../../classes/DAL/DAL_data_objects_table_of_contents.php';


 
//   	$taxons = BLL_taxon_concepts::Select_taxon_Concepts('slave');
//   	foreach ($taxons as $taxon)
//   	{
// 	  	$dataobjects = BLL_data_objects::Select_DataObjects_ByTaxonConceptID('master',$taxon->id,$TOC_included_parent_ids);
// 	  	foreach ($dataobjects as $dataobject)	
// 	  	{ 	
// 	  		//Fill data_object table
// 	  		if(BLL_data_objects::Exist_DataObjects_ByID('slave',$dataobject->id)==0)
// 	  		{		
// 		  		$dataobject->aeol_translation=0;//Original record from woods hole not translated
// 				BLL_data_objects::Insert_DataObject('slave',$dataobject);
// 	  		}
			
// 			//Fill data_object_taxon_concept table
// 			if(BLL_data_objects_taxon_concepts::Exist_data_objects_taxon_concepts('slave',$dataobject->id,$taxon->id) ==0)
// 				BLL_data_objects_taxon_concepts::Insert_data_objects_taxon_concepts('slave',$taxon->id,$dataobject->id);
			
// 			//Select the TOC of the current data_object from master
// 			$dobj_tocs = BLL_data_objects_table_of_contents::Select_data_objects_table_of_contents_ByDataObjectId('master', $dataobject->id);
// 			//Fill the data_objects_table_of_contents table 
// 			foreach ($dobj_tocs as $dobj_toc)		
// 			{		
// 				if(BLL_data_objects_table_of_contents::Exist_data_objects_table_of_contents('slave',$dobj_toc->data_object_id,$dobj_toc->toc_id)==0)
// 					BLL_data_objects_table_of_contents::Insert_data_objects_table_of_contents($dobj_toc->data_object_id,$dobj_toc->toc_id);
// 			}
			
// 	  	}
// 	}
// ?>