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
include_once '../../../classes/Pagination.php';
include_once '../../../classes/SendMail.php';
include_once '../../../classes/Notifications.php';


validate_session('task_distribution');

if (!$_GET['selection_id'])
	header('Location: pending_species.php');

if (!is_numeric($_GET['selection_id']))
	header('Location: pending_species.php');

$selection_id = intval($_GET['selection_id']);

$selection = BLL_selection_batches::load_by_id($selection_id);

if (count($selection) == 0)
	header('Location: pending_species.php');

if (!$_GET['id'])
	header('Location: pending_species.php');

if (!is_numeric($_GET['id']))
	header('Location: pending_species.php');

$selection_page = 0;	
	
if (is_numeric($_GET['selection_page']))
	$selection_page = $_GET['selection_page'];

$id = intval($_GET['id']);


$taxon_concept = BLL_taxon_concepts::get_by_id($id);


$page='';
if (isset($_GET["page"]))
	$page=$_GET["page"];

if (!isset($taxon_concept->id))
	header('Location: pending_species.php');

if ($taxon_concept->taxon_status_id > 1)
	header('Location: pending_species.php');
	
if ($taxon_concept->selection_id != $selection_id)
	header('Location: pending_species.php');

$old_translator_id = 0;
$old_scientific_reviewer_id = 0;
$old_linguistic_reviewer_id = 0;
	
if (isset($_POST["id"])) {
	
	$taxon_concept->translator_id = $_POST["translator"];
	
	if (intval($_POST["translator"]) == 0) {
		$users = BLL_users::load_all();
		foreach ($users as $user) {
			if ($user->active == 1 && $user->translator==1 && $user->email != '') {
				$message = 'Hi '.$user->name.',<br><br>New species ready for translation ('.$taxon_concept->scientificName.')<br><br>'.
								'<a target="_blank" href="'.$AEOL_url.'/eol_translation/applications/translation/list/poollist.php?process=2&id='.$id.'">Click here</a> to pick this species';
				SendMail::send_email($user->email, 'AEOL: New species ready for translation', $message);
			}		
		}		
	} else {
		$user = BLL_users::load_by_id(intval($_POST["translator"]));
		if ($user[0]->active == 1 && $user[0]->email != '') {
			$message = 'Hi '.$user[0]->name.',<br><br>New species ready for translation ('.$taxon_concept->scientificName.')<br><br>'.
								'<a target="_blank" href="'.$AEOL_url.'/eol_translation/applications/translation/details/species.php?tid='.$id.'&trstatus=2&process=2">Click here</a> to translate this species';
			SendMail::send_email($user[0]->email, 'AEOL: New species has been assigned', $message);
		}
	}
	
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["translator"]), 
												 2, 
												 $_SESSION['user_id']);
				
	
	$taxon_concept->scientific_reviewer_id = $_POST["scientific_reviwer"];
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["scientific_reviwer"]), 
												 3, 
												 $_SESSION['user_id']);	
		
	$taxon_concept->linguistic_reviewer_id = $_POST["linguistic_reviewer"];
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["linguistic_reviewer"]), 
												 4, 
												 $_SESSION['user_id']);	
	
	BLL_taxon_concepts::assign_taxon($taxon_concept->id, 
							   $taxon_concept->translator_id,
							   $taxon_concept->linguistic_reviewer_id,
							   $taxon_concept->scientific_reviewer_id);
	
	?>
	<script type="text/javascript">
		alert("Changes have been saved");
		<?if ($selection_page == 0) {?>
			window.location="pending_species.php?page=<?=$_GET["page"]?>";
		<?} else {?>
			window.location="show_taxons.php?id=<?=$selection_id?>";
		<?}?>
	</script>
	<?
	exit;
}
	
$users = new BLL_users();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reassign taxon</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
		function validateForm(frm) {
			<?if ($taxon_concept->taxon_status_id <4) {?>
			if (frm.scientific_reviwer.value == 0) {
				alert('Missing scientific reviewer');
				frm.scientific_reviwer.focus();
				return false;
			}
			<?}?>
			<?if ($taxon_concept->taxon_status_id <5) {?>
			if (frm.linguistic_reviewer.value == 0) {
				alert('Missing linguistc reviewer');
				frm.linguistic_reviewer.focus();
				return false;
			}
			<?}?>			
		}
	</script>
</head>
<body>
<? include ('../master/top.php');?>
	
	<div style="clear:both; height:15px;"></div>
      <div class="form_table">	    
	    <div class="table_of_content">
	    	<h2>
	        	Task Distribution	          	
	        </h2>
		    <ul>
		        <?include_once 'links.php';?>        	        
		    </ul>
	    </div>    
		<div class="form">
		<h2>Assign Species</h2>
	<form name="frm" method="post" action="assign_species.php?id=<?=$id?>&selection_id=<?=$selection_id?>&page=<?=$page?>&selection_page=<?=$selection_page?>" onSubmit="return validateForm(this)">
		<input type="hidden" name="id" value="<?=$id?>" />
<div style="border:1px solid #C6C6C6; border-top:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">			
			<tr>
				<td colspan="2" class="table_head">
					<a href="<?=$eol_site_url?>/pages/<?=$taxon_concept->id?>" target="_blank">
						<?=$taxon_concept->scientificName?>
					</a>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Translator:</b> </td>
				<td class="even">					
					<select name="translator" id="translator" <?if ($taxon_concept->taxon_status_id >=3 ) echo("disabled")?>>
						<?=$users->get_translators_options($taxon_concept->translator_id)?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Scientific Reviewer:</b> </td>
				<td class="even">					
					<select name="scientific_reviwer" id="scientific_reviwer" <?if ($taxon_concept->taxon_status_id >=4 ) echo("disabled")?>>
						<?=$users->get_scientific_reviewers_options($taxon_concept->scientific_reviewer_id)?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Linguistic Reviewer:</b> </td>
				<td class="even">					
					<select name="linguistic_reviewer" id="linguistic_reviewer" <?if ($taxon_concept->taxon_status_id >=5 ) echo("disabled")?>>
						<?=$users->get_linguistic_reviewers_options($taxon_concept->linguistic_reviewer_id)?>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="table_head">
					<input type="submit" value="Submit" class="btn" />
				</td>
			</tr>
		</table>
	</div>
	</form>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
<? include ('../master/footer.php')?>
</body>
</html>
