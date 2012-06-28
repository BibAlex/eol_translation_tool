<?php
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/SendMail.php';
include_once '../../../classes/Notifications.php';


validate_session('task_distribution');

if (!$_GET['selection_id'])
	header('Location: show_selections.php');

if (!is_numeric($_GET['selection_id']))
	header('Location: show_selections.php');

$selection_id = intval($_GET['selection_id']);

$selection = BLL_selection_batches::load_by_id($selection_id);

if (count($selection) == 0)
	header('Location: show_selections.php');

if (!$_GET['id'])
	header('Location: show_selections.php');

if (!is_numeric($_GET['id']))
	header('Location: show_selections.php');

$id = intval($_GET['id']);


$taxon_concept = BLL_taxon_concepts::get_by_id($id);

$page='';
if (isset($_GET["page"]))
	$page=$_GET["page"];

if (!isset($taxon_concept->id))
	header('Location: show_selections.php');

if ($taxon_concept->selection_id != $selection_id)
	header('Location: show_selections.php');

$old_translator_id = $taxon_concept->translator_id;
$old_scientific_reviewer_id = $taxon_concept->scientific_reviewer_id;
$old_linguistic_reviewer_id = $taxon_concept->linguistic_reviewer_id;
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reassign taxon</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
		function validateForm(frm) {
			<?if ($taxon_concept->taxon_status_id <5) {?>
			if (frm.scientific_reviwer.value == 0) {
				alert('Missing scientific reviewer');
				frm.scientific_reviwer.focus();
				return false;
			}
			<?}?>
			<?if ($taxon_concept->taxon_status_id <4) {?>
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

<?
if (isset($_POST["id"])) {
	
	if (intval($_POST["translator"]) == 0) {
		$users = BLL_users::load_all();
		foreach ($users as $user) {
			if ($user->active == 1 && $user->translator==1 && $user->email != '') {
				$message = 'New or updated data objects have been added to this species. They are now ready for translation <br><br>'.$taxon_concept->scientificName;
				SendMail::send_email($user->email, 'AEOL: Updated species ready for translation', 'Updated species ready for translation<br><br>'.$taxon_concept->scientificName);
			}		
		}		
	} else {
		$user = BLL_users::load_by_id(intval($_POST["translator"]));
		if ($user[0]->active == 1 && $user[0]->email != '') {
			$message = 'New or updated data objects have been added to this species. They are now ready for translation <br><br>'.$taxon_concept->scientificName;
			SendMail::send_email($user[0]->email, 'AEOL: Updated species have been assigned', 'Updated species have been assigned<br><br>'.$taxon_concept->scientificName);
		}
	}
	$taxon_concept->translator_id = intval($_POST["translator"]);
	$taxon_concept->scientific_reviewer_id = intval($_POST["scientific_reviwer"]);
	$taxon_concept->linguistic_reviewer_id = intval($_POST["linguistic_reviewer"]);
	
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["translator"]), 
												 2, 
												 $_SESSION['user_id']);
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["scientific_reviwer"]), 
												 3, 
												 $_SESSION['user_id']);
	BLL_taxon_concepts::taxon_concept_assign_log($id, 
												 intval($_POST["linguistic_reviewer"]), 
												 4, 
												 $_SESSION['user_id']);
	
		
	BLL_taxon_concepts::reassign_updated_taxon($taxon_concept->id, 
							   $taxon_concept->translator_id,
							   $old_translator_id, 	
							   $taxon_concept->linguistic_reviewer_id,
							   $old_linguistic_reviewer_id,
							   $taxon_concept->scientific_reviewer_id,
							   $old_scientific_reviewer_id);
	?>
	<script type="text/javascript">
		alert("Changes have been saved");
		/*window.location="show_taxons.php?id=<?=$selection_id?>";*/
	</script>
	<?
	/*exit;*/
}
	
$users = new BLL_users();

?>

	
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
		<h2>Reassign Species</h2>
	<form name="frm" method="post" action="reassign_updated_species.php?id=<?=$id?>&selection_id=<?=$selection_id?>&page=<?=$page?>" onSubmit="return validateForm(this)">
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
					<select name="translator" id="translator">
						<?=$users->get_translators_options($taxon_concept->translator_id)?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Scientific Reviewer:</b> </td>
				<td class="even">					
					<select name="scientific_reviwer" id="scientific_reviwer">
						<?=$users->get_scientific_reviewers_options($taxon_concept->scientific_reviewer_id)?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Linguistic Reviewer:</b> </td>
				<td class="even">					
					<select name="linguistic_reviewer" id="linguistic_reviewer">
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
