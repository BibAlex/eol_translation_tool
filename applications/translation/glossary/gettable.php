<?php
	include ('../master/includes.php');
	
	include_once '../../../classes/BLL/BLL_glossary.php';
	include_once '../../../classes/DAL/DAL_glossary.php';
	
	$q = $_GET["q"];
	
	$glossary = BLL_glossary::Select_glossary_By_Letter($q);
	$response = $glossary->text;
	echo $response;
?>
