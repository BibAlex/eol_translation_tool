<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_hierarchy_entries.php';
include_once '../../../classes/DAL/DAL_hierarchy_entries.php';
include_once '../../../classes/BLL/BLL_hierarchies.php';
include_once '../../../classes/DAL/DAL_hierarchies.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/SendMail.php';
include_once '../../../classes/Notifications.php';

validate_session('selection');

if (!isset($_POST['hierarchy_id']))
    header('Location: select.php');

?>
<html>
	<head>
	<title>Save Selection</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
    
<body>
<?  
$hierarchy_id = intval($_POST['hierarchy_id']);
$hierarchy_entry_id = intval($_POST['hierarchy_entry_id']);
$have_text = intval($_POST['have_text']);
$text_curated = intval($_POST['text_curated']);
$have_images = intval($_POST['have_images']);
$images_curated = intval($_POST['images_curated']);
$vetted_text = $_POST['vetted_text'];
$vetted_images = $_POST['vetted_images'];

$taxon_concept_Array = $_POST['taxon_concept'];
$comments = $_POST['comments'];

$comments = nl2br($comments);

BLL_selection_batches::save($hierarchy_id, $hierarchy_entry_id, $have_text, $text_curated,
                             $have_images, $images_curated, $vetted_text, $vetted_images, $taxon_concept_Array, $comments);

?>
<script>
	alert('Changes have been saved');
	window.location='select.php';
</script>
</body>
</html>
