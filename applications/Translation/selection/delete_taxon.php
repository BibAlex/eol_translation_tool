<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

validate_session('selector');

if (!$_GET['selection_id'])
	exit;

if (!is_numeric($_GET['selection_id']))
	exit;
	
$selection_id = intval($_GET['selection_id']);

$selection = BLL_selection_batches::load_by_id($selection_id);

if (!isset($selection[0]->id)) {
	?>
	<script>
		alert('Selection does not exist');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}


if (!$_GET['id'])
	exit;

if (!is_numeric($_GET['id']))
	exit;
	
$id = intval($_GET['id']);

$taxon_concept = BLL_taxon_concepts::get_by_id($id);

if (!isset($taxon_concept->id)) {
	?>
	<script>
		alert('Selection does not exist');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}

if ($taxon_concept->selection_id!=$selection_id) {
	?>
	<script>
		alert('Taxon doesnot belong to this selection');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}

BLL_taxon_concepts::delete_taxon($id, $selection_id);

?>

<script>
	alert('Taxon has been deleted');
	window.location='show_taxons.php?id=<?=$selection_id?>';
</script>
