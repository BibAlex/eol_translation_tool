<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';

validate_session('selector');

if (!$_GET['id'])
	exit;

if (!is_numeric($_GET['id']))
	exit;
	
$id = intval($_GET['id']);

$selection = BLL_selection_batches::load_by_id($id);

if (!isset($selection[0]->id)) {
	?>
	<script>
		alert('Selection does not exist');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}

if ($selection[0]->total_taxon_count > 0) {
	?>
	<script>
		alert('Selection cannot be deleted. Please delete all its species before you delete this selection');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}

BLL_selection_batches::delete_batch($id);
?>

<script>
	alert('Selection has been deleted');
	window.location='show_selections.php';
</script>
