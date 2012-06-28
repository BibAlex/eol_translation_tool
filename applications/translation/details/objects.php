<?php

	include ('../master/includes.php');
	include_once '../../../classes/BLL/BLL_data_objects.php';
	include_once '../../../classes/DAL/DAL_data_objects.php';
	
	include_once "../../../classes/modules/Simple_Diff.php";
	
	if(isset($_GET['oid'])) $objectID = $_GET['oid'];
	else  $objectID=0;
	
	//Load current Object info	 
	
	//get the q parameter from URL
	$q=$_GET["q"];
	$r=$_GET["r"];
	
	$newEnObj = BLL_data_objects::Select_DataObjects_ByID('slave',$r);
	$oldEnObj = BLL_data_objects::Select_DataObjects_ByID('slave',$newEnObj->parent_data_object_id);
	$response = '';	
//	$array = array (
//		'oldTitle' => $oldEnObj->object_title,
//		'oldLocation' => $oldEnObj->location,
//		'oldRights_statement' => $oldEnObj->rights_statement,
////			'oldRights_holder' => $oldEnObj->rights_holder,
////			'oldDescription' => $oldEnObj->description,
////	
//		'newTitle' => $newEnObj->object_title,
//		'newLocation' => $newEnObj->location,
//		'newRights_statement' => $newEnObj->rights_statement,
////			'newRights_holder' => $newEnObj->rights_holder,
////			'newDescription' => $newEnObj->description,
////			
//		'compareTitle' => Simple_Diff::htmlDiff($oldEnObj->object_title, $newEnObj->object_title),
//		'compareLocation' => Simple_Diff::htmlDiff($oldEnObj->location, $newEnObj->location),
//		'compareRights_statement' => Simple_Diff::htmlDiff($oldEnObj->rights_statement, $newEnObj->rights_statement)
////    		'compareRights_holder' => Simple_Diff::htmlDiff($oldRights_holder, $newRights_holder),
////    		'compareDescription' => Simple_Diff::htmlDiff($oldDescription, $newDescription)
//		
//	);

	if ($q == 'oldTitle'){
		if($oldEnObj->object_title != null){
			$response = $oldEnObj->object_title;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}	
	else if ($q == 'oldLocation'){
		if($oldEnObj->location != null){
			$response = $oldEnObj->location;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}
	else if ($q == 'oldRights_statement'){
		if($oldEnObj->rights_statement != null){
			$response = $oldEnObj->rights_statement;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}	
	else if ($q == 'oldRights_holder'){
		if($oldEnObj->rights_holder != null){
			$response = $oldEnObj->rights_holder;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}
	else if ($q == 'oldDescription'){
		if($oldEnObj->description != null){
			$response = $oldEnObj->description;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}	
	else if ($q == 'newTitle'){
		if($newEnObj->object_title != null){
			$response = $newEnObj->object_title;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}	
	else if ($q == 'newLocation'){
		if($newEnObj->location != null){
			$response = $newEnObj->location;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}
	else if ($q == 'newRights_statement'){
		if($newEnObj->rights_statement != null){
			$response = $newEnObj->rights_statement;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}	
	else if ($q == 'newRights_holder'){
		if($newEnObj->rights_holder != null){
			$response = $newEnObj->rights_holder;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}
	else if ($q == 'newDescription'){
		if($newEnObj->description != null){
			$response = $newEnObj->description;	
		}
		else{
			$response = "[--EMPTY--]";	
		}
	}
	else if ($q == 'compareTitle'){
		$response = Simple_Diff::htmlDiff($oldEnObj->object_title, $newEnObj->object_title);
	}	
	else if ($q == 'compareLocation'){
		$response = Simple_Diff::htmlDiff($oldEnObj->location, $newEnObj->location);
	}
	else if ($q == 'compareRights_statement'){
		$response = Simple_Diff::htmlDiff($oldEnObj->rights_statement, $newEnObj->rights_statement);
	}	
	else if ($q == 'compareRights_holder'){
		$response = Simple_Diff::htmlDiff($oldEnObj->rights_holder, $newEnObj->rights_holder);
	}
	else if ($q == 'compareDescription'){
		$response = Simple_Diff::htmlDiff($oldEnObj->description, $newEnObj->description);
	}
	
	echo $response;
			
//	while ($response = current($array)) {
//	    if (key($array) == $q) {
//	       echo $response;
//	       break;
//	    }
//	    next($array);
//	}
?>