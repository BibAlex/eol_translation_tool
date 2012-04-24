<?php

include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';

include_once '../../../classes/BLL/BLL_data_objects_table_of_contents.php';
include_once '../../../classes/DAL/DAL_data_objects_table_of_contents.php';

include_once '../../../classes/BLL/BLL_data_objects_info_items.php';
include_once '../../../classes/DAL/DAL_data_objects_info_items.php';

include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/DAL/DAL_names.php';
include_once '../../../classes/DAL/DAL_taxon_concept_names.php';
include_once '../../../classes/BLL/BLL_names.php';
include_once '../../../classes/SendMail.php';
include_once '../../../classes/Notifications.php';

validate_session('task_distribution');

if (!isset($_POST['selection_id']))
	header('Location: show_selections.php');

$selection_id = intval($_POST['selection_id']);
$taxon_count = intval($_POST['species_count']);

$selection = BLL_selection_batches::load_by_id($selection_id);

if ($selection[0]->finished >0) {
	?>
	<script type="text/javascript">
		alert('Selection was already assigned.');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}

$translator_free = '';

$translator_count = 0;

for ($i=0; $i<$taxon_count; $i++) {
	BLL_taxon_concepts::assign_work(intval($_POST['taxon_concept_id'.strval($i)]), 
							   intval($_POST['translator'.strval($i)]), 	
							   intval($_POST['linguistic_reviewer'.strval($i)]),
							   intval($_POST['scientific_reviewer'.strval($i)]));

	BLL_taxon_concepts::taxon_concept_assign_log(intval($_POST['taxon_concept_id'.strval($i)]), 
															intval($_POST['translator'.strval($i)]), 
															2, 
															$_SESSION['user_id']);
	
	BLL_taxon_concepts::taxon_concept_assign_log(intval($_POST['taxon_concept_id'.strval($i)]), 
															intval($_POST['linguistic_reviewer'.strval($i)]), 
															3, 
															$_SESSION['user_id']);
	
	BLL_taxon_concepts::taxon_concept_assign_log(intval($_POST['taxon_concept_id'.strval($i)]), 
															intval($_POST['scientific_reviewer'.strval($i)]), 
															4, 
															$_SESSION['user_id']);																	
							   
	$name = BLL_taxon_concepts::get_name($_POST['taxon_concept_id'.strval($i)], $_POST["hierarchy_id"]);
	// 4 mails
	if (intval($_POST['translator'.strval($i)]) == 0) {
		$translator_free .= '<br />'.$name; 
	} else {
		if (isset($translators[$_POST['translator'.strval($i)]])) {
			$translators[$_POST['translator'.strval($i)]] .= '<br />'.$name;
		}
		else {
			$translators[$_POST['translator'.strval($i)]] = $name;
			$translator_array[$translator_count] = $_POST['translator'.strval($i)];
			$translator_count++;
		}
		
	}

	// get names
	BLL_names::download_names($_POST['taxon_concept_id'.strval($i)]);
							   
	// get data objects						   
	$dataobjects = BLL_data_objects::Select_DataObjects_ByTaxonConceptID('master',$_POST['taxon_concept_id'.strval($i)]);	
	  	
	foreach ($dataobjects as $dataobject)	
  	{ 	
  		echo $dataobject->id."  --  ";
  		BLL_taxon_concepts::Insert_data_object_and_its_relations($dataobject,$_POST['taxon_concept_id'.strval($i)]);  		
  	}
  	
	// get Images						   
	$image_dataobjects = BLL_data_objects::Select_Images_ByTaxonConceptID('master',$_POST['taxon_concept_id'.strval($i)]);
	//echo(count($image_dataobjects));  	
	foreach ($image_dataobjects as $dataobject)	
  	{ 	  		
  		BLL_taxon_concepts::Insert_data_object_and_its_relations($dataobject,$_POST['taxon_concept_id'.strval($i)]);  		
  	}
  	  	
}

BLL_selection_batches::mark_as_finished($selection_id);


for ($i=0; $i<$translator_count; $i++) {
	$user = BLL_users::load_by_id($translator_array[$i]);
	
	if ($user[0]->email != '') {
		$message = 'New species assigned for translation<br><br>'.$translators[$translator_array[$i]];
		SendMail::send_email($user[0]->email, 'AEOL: New species assigned for translation', $message);
	}
}

if ($translator_free != '') {
	$users = BLL_users::load_all();
	foreach ($users as $user) {
		if ($user->active == 1 && $user->translator==1 && $user->email != '') {
			$message = 'New species ready for translation <br><br>'.$translator_free;
			SendMail::send_email($user->email, 'AEOL: New species ready for translation', $message);
		}
	}
	
}

?>
<script type="text/javascript">
	alert('Changes have been saved.');
	window.location='show_selections.php';
</script>