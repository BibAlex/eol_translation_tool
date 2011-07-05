<?php
include_once '../../classes/PDO_Connection.php';
include_once '../../classes/BLL/BLL_data_objects.php';

include_once '../../classes/DAL/DAL_info_items.php';
include_once '../../classes/BLL/BLL_data_objects_info_items.php';

include_once '../../classes/DAL/DAL_table_of_contents.php';
include_once '../../classes/BLL/BLL_data_objects_table_of_contents.php';



$EnObj = BLL_data_objects::Select_all_data_objects('slave');
foreach ($EnObjs as $EnObj){
	/////////////////////////////////TOC///////////////////////////////////
	//Select the TOC of the current data_object from master
	$dobj_tocs = BLL_data_objects_table_of_contents::Select_data_objects_table_of_contents_ByDataObjectId('master', $EnObj->id);
	//Fill the data_objects_table_of_contents table 
	foreach ($dobj_tocs as $dobj_toc)		
	{		
		if(BLL_data_objects_table_of_contents::Exist_data_objects_table_of_contents('slave',$dobj_toc->data_object_id,$dobj_toc->toc_id)==0)
			BLL_data_objects_table_of_contents::Insert_data_objects_table_of_contents($dobj_toc->data_object_id,$dobj_toc->toc_id);
	}		
		
	/////////////////////////////////InfoItems///////////////////////////////////
	//Select the info item of the current data_object from master
	$dobj_infoitems = BLL_data_objects_info_items::Select_data_objects_info_items_ByDataObjectId('master', $EnObj->id);
	//Fill the data_objects_table_of_contents table 
	foreach ($dobj_infoitems as $dobj_infoitem)		
	{		
		if(BLL_data_objects_info_items::Exist_data_objects_table_of_contents('slave',$dobj_infoitem->data_object_id,$dobj_infoitem->info_item_id)==0)
			BLL_data_objects_info_items::Insert_data_objects_info_items($dobj_infoitem->data_object_id,$dobj_infoitem->info_item_id);
	}
}  


 ?>